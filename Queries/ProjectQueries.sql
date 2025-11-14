--Last Update by Kendrick, 10:43pm, 11/13
USE CarRentalDB;
GO

-- Subqueries
/*
Which vehicles are currently 'Available' AND
have not been booked in the last 30 days?
Business purpose: These vehicles are sitting idle, maybe relocate
them to a busier branch.
*/
SELECT V.Vehicle_ID, V.Vehicle_Make, V.Vehicle_Model, V.Vehicle_Status
FROM Vehicle V
WHERE V.Vehicle_Status = 'Available'
  AND V.Vehicle_ID NOT IN (
        SELECT Vehicle_ID
        FROM Booking
        WHERE PickUpDate >= DATEADD(DAY, -30, CAST(GETDATE() AS date))
    );
 
SELECT 
    V.Vehicle_ID,
    V.Vehicle_Make,
    V.Vehicle_Model,
    V.Vehicle_Status,
    Idle30Days =
        CASE 
            WHEN B.Vehicle_ID IS NULL THEN 'Yes - Idle 30+ Days'
            ELSE 'No - Recently Rented'
        END
FROM Vehicle V
LEFT JOIN (
    SELECT DISTINCT Vehicle_ID
    FROM Booking
    WHERE PickUpDate >= DATEADD(DAY, -30, CAST(GETDATE() AS date))
) AS B
    ON V.Vehicle_ID = B.Vehicle_ID
WHERE V.Vehicle_Status = 'Available';
-----------------------------------------------------------------------------------------------------------------------------------------------------
-- Stored Procedure
/*
Helpful if lets say customer service needs to check historical data for a customer to get like receipts they had once booked a vehicle.
Like call customer service and make sure/verify a charge on their account based on the customers request.
*/
IF OBJECT_ID('dbo.usp_GetCustomerHistory_ByName') IS NOT NULL
BEGIN
    DROP PROCEDURE dbo.usp_GetCustomerHistory;
END;
GO
 
CREATE PROCEDURE dbo.usp_GetCustomerHistory_ByName
    @FirstName NVARCHAR(50),
    @LastName  NVARCHAR(50)
AS
BEGIN
    SELECT
        c.Customer_First_Name,
        c.Customer_Last_Name,
        b.Booking_ID,
        b.PickUpDate,
        b.DropOffDate,
        v.Vehicle_Make,
        v.Vehicle_Model,
        p.Payment_Amount
    FROM Customers c
    INNER JOIN Booking b ON b.Customer_ID = c.Customer_ID
    INNER JOIN Vehicle v ON b.Vehicle_ID = v.Vehicle_ID
    INNER JOIN Payment p ON b.Payment_ID = p.Payment_ID
    WHERE c.Customer_First_Name = @FirstName
      AND c.Customer_Last_Name  = @LastName
    ORDER BY b.PickUpDate DESC;
END;
GO
 
EXEC dbo.usp_GetCustomerHistory_ByName
    @FirstName = 'John',
    @LastName = 'Smith'
-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- CTE
/*
Can be helpful in finding out the performance of each branch.
Business Purpose: Helps in decision making on where to invest more, what branch needs improvement/changes.
Helpful in tracking revenue
*/
WITH BranchPayments AS (
    SELECT B.PickUp_Branch_ID AS BranchID, SUM(P.Payment_Amount) AS TotalPayments
    FROM Booking B
    JOIN Payment P ON B.Payment_ID = P.Payment_ID
    GROUP BY B.PickUp_Branch_ID
)
SELECT Br.Branch_Name, BP.TotalPayments
FROM BranchPayments BP
JOIN Branch Br ON BP.BranchID = Br.Branch_ID
ORDER BY BP.TotalPayments DESC;
GO
----------------------------------------------------------------------------------------------------------------------------------------------------------
-- UDFs
/*
Get all bookings for a given branch in a given date range (table-valued)
Business purpose: reusable: will show like a manager the branch activity in a given date range.
*/
IF OBJECT_ID('dbo.ufn_GetBranchBookings', 'IF') IS NOT NULL
BEGIN
DROP FUNCTION dbo.ufn_GetBranchBookings;
END;
GO
 
CREATE FUNCTION dbo.ufn_GetBranchBookings
(
    @BranchID INT,
    @StartDate DATE,
    @EndDate DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT B.Booking_ID,
           B.Customer_ID,
           B.PickUpDate,
           B.DropOffDate,
           B.Vehicle_ID,
           B.PickUp_Branch_ID,
           B.DropOff_Branch_ID
    FROM Booking B
    WHERE (B.PickUp_Branch_ID = @BranchID OR B.DropOff_Branch_ID = @BranchID)
      AND B.PickUpDate  >= @StartDate
      AND B.DropOffDate <= @EndDate
);
GO
 
SELECT *
FROM dbo.ufn_GetBranchBookings(1, '2025-01-01', '2025-07-31');
-----------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cursor
/*
The business purpose of this cursor is to help managers quickly see how often each vehicle is 
being rented and identify cars that receive little or no rental activity. This information is useful 
for deciding whether certain vehicles should be moved to another branch where demand is higher, 
improving overall fleet usage and efficiency for the rental service.
*/
DECLARE @BranchName   VARCHAR(200);
DECLARE @VehicleName  VARCHAR(200);
DECLARE @TimesRented  INT;

DECLARE curBranchVehicle CURSOR FAST_FORWARD FOR
    SELECT 
        COALESCE(Br.Branch_Name, '(No Branch)') AS Branch_Name,
        COALESCE(V.Vehicle_Make + ' ' + V.Vehicle_Model, '(Unknown Vehicle)') AS VehicleName,
        SUM(CASE WHEN BK.Booking_ID IS NULL THEN 0 ELSE 1 END) AS TimesRented
    FROM Vehicle AS V
    LEFT JOIN Branch AS Br
        ON V.Vehicle_Location = Br.Branch_ID
    LEFT JOIN Booking AS BK
        ON BK.Vehicle_ID = V.Vehicle_ID          -- still allows 0 rentals
    GROUP BY 
        COALESCE(Br.Branch_Name, '(No Branch)'),
        COALESCE(V.Vehicle_Make + ' ' + V.Vehicle_Model, '(Unknown Vehicle)')
    ORDER BY
        COALESCE(Br.Branch_Name, '(No Branch)'),
        COALESCE(V.Vehicle_Make + ' ' + V.Vehicle_Model, '(Unknown Vehicle)');

OPEN curBranchVehicle;

FETCH NEXT FROM curBranchVehicle 
INTO @BranchName, @VehicleName, @TimesRented;

WHILE @@FETCH_STATUS = 0
BEGIN
    PRINT 'Branch: ' + @BranchName + ' | Vehicle: ' + @VehicleName + ' | Times Rented: ' + CAST(@TimesRented AS VARCHAR(10));

    FETCH NEXT FROM curBranchVehicle 
    INTO @BranchName, @VehicleName, @TimesRented;
END

CLOSE curBranchVehicle;
DEALLOCATE curBranchVehicle;
GO
 
-----------------------------------------------------------------------------------------------------------------------------------------------------------Pivot
-- Pivot
/*
This query gives a good breakdown of the vehicle inventory between the branches
in which the business purpose helps with determining which vehicles a branch might need more of
based on how much it currently has.
*/
USE CarRentalDB;
SELECT * FROM (
    SELECT Vehicle_Year, Vehicle_Make FROM Vehicle
) AS Source
PIVOT (
    COUNT(Vehicle_Make) FOR Vehicle_Make IN ([Toyota], [Honda], [Nissan])
) AS PivotTable;
GO

-- AFTER TRIGGER
IF OBJECT_ID('dbo.tr_PreventDamageReportDelete', 'TR') IS NOT NULL
BEGIN
DROP TRIGGER dbo.tr_PreventDamageReportDelete;
END;
GO

CREATE TRIGGER dbo.tr_PreventDamageReportDelete
ON Damage_Report
AFTER DELETE
AS
BEGIN
    -- Raise a custom error message
    RAISERROR ('Error: Deleting records from the Damage Report table is not allowed. 
    Please contact an administrator if removal is required.', 16, 1);

    -- Undo the delete
    ROLLBACK TRANSACTION;
END;
GO



DELETE FROM Damage_Report
WHERE Damage_Report_ID = 1;































-- Business Questions and SQL Queries

-- 1. Total number of customers per branch
-- Find how many customers are associated with each branch through their addresses.
SELECT 
    B.Branch_Name,
    COUNT(A.Customer_ID) AS Total_Customers
FROM Branch B
JOIN Address A ON B.Branch_ID = A.Branch_ID
GROUP BY B.Branch_Name;

-- 2. Total bookings per branch
-- See how many bookings were made per pickup branch.
SELECT 
    B.Branch_Name,
    COUNT(*) AS Total_Bookings
FROM Booking K
JOIN Branch B ON K.PickUp_Branch_ID = B.Branch_ID
GROUP BY B.Branch_Name;

-- 3. Average payment per booking
-- Measure how much customers spend on average per booking.
SELECT 
    ROUND(AVG(P.Payment_Amount), 2) AS Avg_Payment_Per_Booking
FROM Payment P;

-- 4. Bookings with drop-off at a different branch
-- Identify bookings where pickup and drop-off branches are different.
SELECT 
    Booking_ID, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID
FROM Booking
WHERE PickUp_Branch_ID <> DropOff_Branch_ID;

-- 5. Most rented vehicle make
-- Determine which vehicle brand is rented the most.
SELECT 
    V.Vehicle_Make,
    COUNT(B.Booking_ID) AS Times_Rented
FROM Booking B
JOIN Vehicle V ON B.Vehicle_ID = V.Vehicle_ID
GROUP BY V.Vehicle_Make
ORDER BY Times_Rented DESC;

-- 6. View how many members are active or inactive.
SELECT 
    Member_Status,
    COUNT(*) AS Total_Members
FROM Membership
GROUP BY Member_Status;

-- 7. Understand how many customers are under each membership type.
SELECT 
    MT.Membership_Type_Name,
    COUNT(M.Membership_ID) AS Total_Customers
FROM Membership M
JOIN Membership_Type MT ON M.Membership_Type_ID = MT.Membership_Type_ID
GROUP BY MT.Membership_Type_Name;

-- 8. Show total payments received for bookings per pickup branch.
SELECT 
    B.Branch_Name,
    SUM(P.Payment_Amount) AS Total_Revenue
FROM Booking K
JOIN Branch B ON K.PickUp_Branch_ID = B.Branch_ID
JOIN Payment P ON K.Payment_ID = P.Payment_ID
GROUP BY B.Branch_Name;

-- 9. Find which car color is most frequently rented.
SELECT 
    C.Color_Description,
    COUNT(B.Booking_ID) AS Times_Rented
FROM Booking B
JOIN Vehicle V ON B.Vehicle_ID = V.Vehicle_ID
JOIN Color C ON V.Color_ID = C.Color_ID
GROUP BY C.Color_Description
ORDER BY Times_Rented DESC;

-- 10. Identify top loyal customers based on membership points.
SELECT 
    C.Customer_First_Name + ' ' + C.Customer_Last_Name AS Customer_Name,
    M.Member_Points
FROM Customers C
JOIN Membership M ON C.Membership_ID = M.Membership_ID
ORDER BY M.Member_Points DESC;

-- 11. Evaluate the MILEAGE of different brands.
SELECT 
    Vehicle_Make,
    ROUND(AVG(Vehicle_Mileage), 0) AS Avg_Mileage
FROM Vehicle
GROUP BY Vehicle_Make;

-- 12. Total number of inspections by type
-- Track how many pre- vs post-rental inspections occurred.
SELECT 
    IT.Inspection_Type_Name,
    COUNT(I.Inspection_ID) AS Total_Inspections
FROM Inspection I
JOIN Inspection_Type IT ON I.Inspection_Type_ID = IT.Inspection_Type_ID
GROUP BY IT.Inspection_Type_Name;

-- 13. Find all bookings with a damage report.
SELECT 
    B.Booking_ID,
    C.Customer_First_Name + ' ' + C.Customer_Last_Name AS Customer_Name,
    D.Damage_Report_Description AS Reported_Damage
FROM Booking B
JOIN Customers C 
    ON B.Customer_ID = C.Customer_ID
JOIN Inspection I 
    ON B.Booking_ID = I.Booking_ID
JOIN Damage_Report D 
    ON I.Booking_ID = B.Booking_ID 
WHERE D.Damage_Report_Description IS NOT NULL;

-- 14. Average rental duration
-- Calculate the average number of rental days.
SELECT 
    ROUND(AVG(DATEDIFF(DAY, PickUpDate, DropOffDate)), 1) AS Avg_Rental_Days
FROM Booking;

-- 15. Highest paying customers
-- Rank customers by total payment made.
SELECT 
    C.Customer_First_Name + ' ' + C.Customer_Last_Name AS Customer_Name,
    SUM(P.Payment_Amount) AS Total_Payment
FROM Booking B
JOIN Customers C ON B.Customer_ID = C.Customer_ID
JOIN Payment P ON B.Payment_ID = P.Payment_ID
GROUP BY C.Customer_First_Name, C.Customer_Last_Name
ORDER BY Total_Payment DESC;

-- 16. Vehicle utilization rate
-- Check how many bookings each vehicle has had.
SELECT 
    V.Vehicle_Model,
    COUNT(B.Booking_ID) AS Total_Bookings
FROM Vehicle V
LEFT JOIN Booking B ON V.Vehicle_ID = B.Vehicle_ID
GROUP BY V.Vehicle_Model;

-- 17. Insurance popularity
-- See which insurance plans are most frequently selected.
SELECT 
    I.Insurance_Name,
    COUNT(B.Booking_ID) AS Total_Uses
FROM Booking B
JOIN Insurance I ON B.Insurance_ID = I.Insurance_ID
GROUP BY I.Insurance_Name
ORDER BY Total_Uses DESC;

-- 18. Find the number of discounts used per type.
SELECT 
CASE 
 WHEN D.Discount_Name IS NULL THEN 'No Discount'
ELSE D.Discount_Name
END AS Discount_Name,
COUNT(P.Payment_ID) AS Times_Used
FROM Payment P
LEFT JOIN Discount D 
ON P.Discount_ID = D.Discount_ID
GROUP BY CASE 
WHEN D.Discount_Name IS NULL THEN 'No Discount'
ELSE D.Discount_Name
END
ORDER BY Times_Used DESC;

-- 19. Identify memberships that will expire within 6 months.
SELECT 
    Membership_ID,
    Member_Renewal_Date
FROM Membership
WHERE Member_Renewal_Date BETWEEN GETDATE() AND DATEADD(MONTH, 6, GETDATE());

-- 20. Revenue by membership type
-- Compare total payments made by customers with different membership tiers.
SELECT 
    MT.Membership_Type_Name,
    SUM(P.Payment_Amount) AS Total_Revenue
FROM Booking B
JOIN Customers C ON B.Customer_ID = C.Customer_ID
JOIN Membership M ON C.Membership_ID = M.Membership_ID
JOIN Membership_Type MT ON M.Membership_Type_ID = MT.Membership_Type_ID
JOIN Payment P ON B.Payment_ID = P.Payment_ID
GROUP BY MT.Membership_Type_Name;

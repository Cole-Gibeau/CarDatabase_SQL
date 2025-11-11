--Last Updated by Srijan, 9:00pm, Nov 11

USE CarRentalDB;

-- Total payment per branch
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

-- Vehicles available and idle 30+ days
SELECT V.Vehicle_ID, V.Vehicle_Make, V.Vehicle_Model, V.Vehicle_Status
FROM Vehicle V
WHERE V.Vehicle_Status = 'Available'
  AND V.Vehicle_ID NOT IN (
        SELECT Vehicle_ID
        FROM Booking
        WHERE PickUpDate >= DATE_ADD(CURDATE(), INTERVAL -30 DAY)
    );

SELECT 
    V.Vehicle_ID,
    V.Vehicle_Make,
    V.Vehicle_Model,
    V.Vehicle_Status,
    CASE 
        WHEN B.Vehicle_ID IS NULL THEN 'Yes - Idle 30+ Days'
        ELSE 'No - Recently Rented'
    END AS Idle30Days
FROM Vehicle V
LEFT JOIN (
    SELECT DISTINCT Vehicle_ID
    FROM Booking
    WHERE PickUpDate >= DATE_ADD(CURDATE(), INTERVAL -30 DAY)
) AS B
    ON V.Vehicle_ID = B.Vehicle_ID
WHERE V.Vehicle_Status = 'Available';

-- Stored procedure: get customer history by name
DROP PROCEDURE IF EXISTS usp_GetCustomerHistory_ByName;
DELIMITER $$
CREATE PROCEDURE usp_GetCustomerHistory_ByName(
    IN FirstName VARCHAR(50),
    IN LastName VARCHAR(50)
)
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
    WHERE c.Customer_First_Name = FirstName
      AND c.Customer_Last_Name  = LastName
    ORDER BY b.PickUpDate DESC;
END$$
DELIMITER ;

CALL usp_GetCustomerHistory_ByName('John', 'Smith');

-- CTE: branch revenue
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

-- Cursor: normalize phone numbers
DELIMITER $$
CREATE PROCEDURE NormalizePhoneNumbers()
BEGIN
    DECLARE done INT DEFAULT 0;
    DECLARE phoneID INT;
    DECLARE cell VARCHAR(20);
    DECLARE curPhone CURSOR FOR SELECT Phone_ID, Cell_Phone FROM Phone;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
    OPEN curPhone;
    read_loop: LOOP
        FETCH curPhone INTO phoneID, cell;
        IF done THEN
            LEAVE read_loop;
        END IF;
        UPDATE Phone
        SET Cell_Phone = REPLACE(REPLACE(REPLACE(cell, '-', ''), '(', ''), ')', '')
        WHERE Phone_ID = phoneID;
    END LOOP;
    CLOSE curPhone;
END$$
DELIMITER ;
CALL NormalizePhoneNumbers();

-- Pivot: vehicle inventory overview
SELECT 
    Vehicle_Year,
    SUM(CASE WHEN Vehicle_Make = 'Toyota' THEN 1 ELSE 0 END) AS Toyota,
    SUM(CASE WHEN Vehicle_Make = 'Honda' THEN 1 ELSE 0 END) AS Honda,
    SUM(CASE WHEN Vehicle_Make = 'Nissan' THEN 1 ELSE 0 END) AS Nissan
FROM Vehicle
GROUP BY Vehicle_Year;

-- Trigger: prevent delete from damage report
DROP TRIGGER IF EXISTS tr_PreventDamageReportDelete;
DELIMITER $$
CREATE TRIGGER tr_PreventDamageReportDelete
BEFORE DELETE ON Damage_Report
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Error: Deleting records from Damage_Report is not allowed.';
END$$
DELIMITER ;
DELETE FROM Damage_Report WHERE Damage_Report_ID = 1;

-- Total customers per branch
SELECT B.Branch_Name, COUNT(A.Customer_ID) AS Total_Customers
FROM Branch B
JOIN Address A ON B.Branch_ID = A.Branch_ID
GROUP BY B.Branch_Name;

-- Total bookings per branch
SELECT B.Branch_Name, COUNT(*) AS Total_Bookings
FROM Booking K
JOIN Branch B ON K.PickUp_Branch_ID = B.Branch_ID
GROUP BY B.Branch_Name;

-- Average payment per booking
SELECT ROUND(AVG(P.Payment_Amount), 2) AS Avg_Payment_Per_Booking
FROM Payment P;

-- Bookings with different pickup and dropoff
SELECT Booking_ID, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID
FROM Booking
WHERE PickUp_Branch_ID <> DropOff_Branch_ID;

-- Most rented vehicle make
SELECT V.Vehicle_Make, COUNT(B.Booking_ID) AS Times_Rented
FROM Booking B
JOIN Vehicle V ON B.Vehicle_ID = V.Vehicle_ID
GROUP BY V.Vehicle_Make
ORDER BY Times_Rented DESC;

-- Active vs inactive members
SELECT Member_Status, COUNT(*) AS Total_Members
FROM Membership
GROUP BY Member_Status;

-- Customers by membership type
SELECT MT.Membership_Type_Name, COUNT(M.Membership_ID) AS Total_Customers
FROM Membership M
JOIN Membership_Type MT ON M.Membership_Type_ID = MT.Membership_Type_ID
GROUP BY MT.Membership_Type_Name;

-- Total payments by branch
SELECT B.Branch_Name, SUM(P.Payment_Amount) AS Total_Revenue
FROM Booking K
JOIN Branch B ON K.PickUp_Branch_ID = B.Branch_ID
JOIN Payment P ON K.Payment_ID = P.Payment_ID
GROUP BY B.Branch_Name;

-- Most rented car color
SELECT C.Color_Description, COUNT(B.Booking_ID) AS Times_Rented
FROM Booking B
JOIN Vehicle V ON B.Vehicle_ID = V.Vehicle_ID
JOIN Color C ON V.Color_ID = C.Color_ID
GROUP BY C.Color_Description
ORDER BY Times_Rented DESC;

-- Top loyal customers
SELECT CONCAT(C.Customer_First_Name, ' ', C.Customer_Last_Name) AS Customer_Name, M.Member_Points
FROM Customers C
JOIN Membership M ON C.Membership_ID = M.Membership_ID
ORDER BY M.Member_Points DESC;

-- Average mileage by make
SELECT Vehicle_Make, ROUND(AVG(Vehicle_Mileage), 0) AS Avg_Mileage
FROM Vehicle
GROUP BY Vehicle_Make;

-- Inspections by type
SELECT IT.Inspection_Type_Name, COUNT(I.Inspection_ID) AS Total_Inspections
FROM Inspection I
JOIN Inspection_Type IT ON I.Inspection_Type_ID = IT.Inspection_Type_ID
GROUP BY IT.Inspection_Type_Name;

-- Bookings with damage reports
SELECT B.Booking_ID, CONCAT(C.Customer_First_Name, ' ', C.Customer_Last_Name) AS Customer_Name, D.Damage_Report_Description
FROM Booking B
JOIN Customers C ON B.Customer_ID = C.Customer_ID
JOIN Inspection I ON B.Booking_ID = I.Booking_ID
JOIN Damage_Report D ON I.Booking_ID = B.Booking_ID
WHERE D.Damage_Report_Description IS NOT NULL;

-- Average rental duration
SELECT ROUND(AVG(DATEDIFF(DropOffDate, PickUpDate)), 1) AS Avg_Rental_Days
FROM Booking;

-- Highest paying customers
SELECT CONCAT(C.Customer_First_Name, ' ', C.Customer_Last_Name) AS Customer_Name,
       SUM(P.Payment_Amount) AS Total_Payment
FROM Booking B
JOIN Customers C ON B.Customer_ID = C.Customer_ID
JOIN Payment P ON B.Payment_ID = P.Payment_ID
GROUP BY C.Customer_First_Name, C.Customer_Last_Name
ORDER BY Total_Payment DESC;

-- Vehicle utilization rate
SELECT V.Vehicle_Model, COUNT(B.Booking_ID) AS Total_Bookings
FROM Vehicle V
LEFT JOIN Booking B ON V.Vehicle_ID = B.Vehicle_ID
GROUP BY V.Vehicle_Model;

-- Insurance popularity
SELECT I.Insurance_Name, COUNT(B.Booking_ID) AS Total_Uses
FROM Booking B
JOIN Insurance I ON B.Insurance_ID = I.Insurance_ID
GROUP BY I.Insurance_Name
ORDER BY Total_Uses DESC;

-- Discounts used per type
SELECT COALESCE(D.Discount_Name, 'No Discount') AS Discount_Name,
       COUNT(P.Payment_ID) AS Times_Used
FROM Payment P
LEFT JOIN Discount D ON P.Discount_ID = D.Discount_ID
GROUP BY COALESCE(D.Discount_Name, 'No Discount')
ORDER BY Times_Used DESC;

-- Memberships expiring within 6 months
SELECT Membership_ID, Member_Renewal_Date
FROM Membership
WHERE Member_Renewal_Date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 6 MONTH);

-- Revenue by membership type
SELECT MT.Membership_Type_Name, SUM(P.Payment_Amount) AS Total_Revenue
FROM Booking B
JOIN Customers C ON B.Customer_ID = C.Customer_ID
JOIN Membership M ON C.Membership_ID = M.Membership_ID
JOIN Membership_Type MT ON M.Membership_Type_ID = MT.Membership_Type_ID
JOIN Payment P ON B.Payment_ID = P.Payment_ID
GROUP BY MT.Membership_Type_Name;

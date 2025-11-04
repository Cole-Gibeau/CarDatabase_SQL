--Last Update by Srijan, 11:46, 10/22

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

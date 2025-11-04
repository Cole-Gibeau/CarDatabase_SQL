/*Update by Cole on Oct 27, 7 am*/

USE testing
GO
---------------------
-- 1. Branch
---------------------
INSERT INTO Branch (Branch_Name, Branch_Phone_Number, Branch_Hours, Branch_Address, Branch_City, Branch_Zip_Code, Branch_State_Abbreviation)
VALUES 
('Downtown Mankato', '507-387-1000', '8AM-8PM', '101 Main St', 'Mankato', '56001', 'MN'),
('Eagle Lake', '507-555-1111', '8AM-6PM', '24 Hilltop Dr', 'Eagle Lake', '56024', 'MN'),
('St. Peter', '507-555-2222', '9AM-7PM', '99 Sunrise Ave', 'St. Peter', '56082', 'MN');

---------------------
-- 2. Color
---------------------
INSERT INTO Color (Color_Description)
VALUES ('Black'), ('White'), ('Red'), ('Blue'), ('Gray');

---------------------
-- 3. Rental_Rate
---------------------
INSERT INTO Rental_Rate (Rental_Rate_Price)
VALUES (49.99), (59.99), (69.99), (79.99), (89.99);

---------------------
-- 4. Vehicle
---------------------
INSERT INTO Vehicle (Rental_Rate_ID, Vehicle_Model, Vehicle_Size, Vehicle_Mileage, Vehicle_Make, Vehicle_Year, Vehicle_VIN, Color_ID, Vehicle_Status)
VALUES
(1, 'RAV4', 'SUV', 32000, 'Toyota', 2022, '1HGCM82633A123451', 1,'Unavailable',1),
(2, 'Civic', 'Compact', 18000, 'Honda', 2023, '2FMDK3GC0BBB23456', 2,'Available',2),
(3, 'Camry', 'Sedan', 25000, 'Toyota', 2021, '3C6UR5DL1DG345678', 3,'Unavailable',2),
(4, 'CR-V', 'SUV', 40000, 'Honda', 2020, '5FNRL38697B456789', 4,'Available',1),
(5, 'Altima', 'Sedan', 15000, 'Nissan', 2024, '1HGEM21901L567890', 5,'Available',1);

---------------------
-- 5. Payment_Type
---------------------
INSERT INTO Payment_Type (Payment_Type_Name)
VALUES ('Credit'), ('Debit');

---------------------
-- 6. Discount
---------------------
INSERT INTO Discount (Discount_Name, Discount_Percentage)
VALUES 
('No Discount', 0),
('Student Discount', 10),
('Loyalty Discount', 15);

---------------------
-- 7. Payment
---------------------
INSERT INTO Payment (Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
VALUES
(1, 1, 59.99, GETDATE()),
(2, 2, 71.99, GETDATE()),
(1, 3, 84.99, GETDATE()),
(2, NULL, 89.99, GETDATE()),
(1, 1, 54.99, GETDATE());

---------------------
-- 8. Insurance_Type
---------------------
INSERT INTO Insurance_Type (Insurance_Type_Name, Insurance_Type_Description)
VALUES
('Basic', 'Covers minor damages'),
('Premium', 'Full coverage including theft'),
('Standard', 'Covers collision damages');

---------------------
-- 9. Insurance
---------------------
INSERT INTO Insurance (Insurance_Type_ID, Insurance_Name)
VALUES
(1, 'SafeDrive Basic'),
(2, 'SafeDrive Premium'),
(3, 'SafeDrive Standard');

---------------------
-- 10. Membership_Type
---------------------
INSERT INTO Membership_Type (Membership_Type_Name, Membership_Type_Price, Membership_Type_Description)
VALUES
('Silver', 50, 'Basic membership with small perks'),
('Gold', 100, 'Extra benefits and discounts'),
('Platinum', 200, 'All access and top-tier benefits');

---------------------
-- 11. Membership
---------------------
INSERT INTO Membership (Membership_Type_ID, Member_Renewal_Date, Member_Points, Member_Status)
VALUES
(1, '2026-01-01', 200, 'Active'),
(2, '2026-03-01', 450, 'Active'),
(3, '2026-06-01', 900, 'Active'),
(2, '2026-02-01', 300, 'Active'),
(1, '2026-04-01', 150, 'Inactive'),
(1, '2026-05-01', 250, 'Active'),
(2, '2026-05-15', 350, 'Active'),
(3, '2026-07-01', 1000, 'Active'),
(3, '2026-07-15', 800, 'Active'),
(2, '2026-08-01', 500, 'Active');

---------------------
-- 12. Customers (10)
---------------------
INSERT INTO Customers (Membership_ID, Customer_First_Name, Customer_Last_Name, Customer_Email, Customer_Phone_Number, Customer_Address, Customer_City, Customer_Zip, Customer_License_Number)
VALUES
(1, 'John', 'Smith', 'john.smith@email.com', '507-111-2222', '12 Oak St', 'Mankato', '56001', 'MN12345'),
(2, 'Emma', 'Johnson', 'emma.j@email.com', '507-111-3333', '45 Pine Ave', 'Eagle Lake', '56024', 'MN67890'),
(3, 'Noah', 'Brown', 'noah.b@email.com', '507-111-4444', '78 Elm Rd', 'Mankato', '56001', 'MN24680'),
(4, 'Olivia', 'Davis', 'olivia.d@email.com', '507-111-5555', '22 Maple Ln', 'St. Peter', '56082', 'MN13579'),
(5, 'Liam', 'Wilson', 'liam.w@email.com', '507-111-6666', '15 Birch St', 'Mankato', '56001', 'MN97531'),
(6, 'Sophia', 'Taylor', 'sophia.t@email.com', '507-111-7777', '34 Walnut Dr', 'Eagle Lake', '56024', 'MN86420'),
(7, 'Ethan', 'Thomas', 'ethan.t@email.com', '507-111-8888', '56 Cedar St', 'St. Peter', '56082', 'MN75319'),
(8, 'Ava', 'Moore', 'ava.m@email.com', '507-111-9999', '23 Spruce St', 'Mankato', '56001', 'MN64208'),
(9, 'Mason', 'Anderson', 'mason.a@email.com', '507-111-0000', '99 River Rd', 'Eagle Lake', '56024', 'MN53197'),
(10, 'Isabella', 'Clark', 'isabella.c@email.com', '507-111-1212', '40 Hill St', 'St. Peter', '56082', 'MN42086');

---------------------
-- 13. Address
---------------------
INSERT INTO Address (Street_Address, City, Zip, Customer_ID, Branch_ID)
VALUES
('12 Oak St', 'Mankato', '56001', 1, 1),
('45 Pine Ave', 'Eagle Lake', '56024', 2, 2),
('78 Elm Rd', 'Mankato', '56001', 3, 1),
('22 Maple Ln', 'St. Peter', '56082', 4, 3),
('15 Birch St', 'Mankato', '56001', 5, 1),
('34 Walnut Dr', 'Eagle Lake', '56024', 6, 2),
('56 Cedar St', 'St. Peter', '56082', 7, 3),
('23 Spruce St', 'Mankato', '56001', 8, 1),
('99 River Rd', 'Eagle Lake', '56024', 9, 2),
('40 Hill St', 'St. Peter', '56082', 10, 3);

---------------------
-- 14. Phone
---------------------
INSERT INTO Phone (Home_Phone, Cell_Phone, Business_Phone, Customer_ID, Branch_ID)
VALUES
('507-200-1000', '507-300-1000', NULL, 1, 1),
('507-200-1001', '507-300-1001', NULL, 2, 2),
('507-200-1002', '507-300-1002', NULL, 3, 1),
('507-200-1003', '507-300-1003', NULL, 4, 3),
('507-200-1004', '507-300-1004', NULL, 5, 1),
('507-200-1005', '507-300-1005', NULL, 6, 2),
('507-200-1006', '507-300-1006', NULL, 7, 3),
('507-200-1007', '507-300-1007', NULL, 8, 1),
('507-200-1008', '507-300-1008', NULL, 9, 2),
('507-200-1009', '507-300-1009', NULL, 10, 3);

---------------------
-- 15. Booking
---------------------
INSERT INTO Booking (Date_Booked, PickUpDate, DropOffDate, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID, Payment_ID, Vehicle_ID, Insurance_ID)
VALUES
(GETDATE(), '2025-10-10', '2025-10-15', 1, 1, 2, 1, 1, 1),
(GETDATE(), '2025-10-11', '2025-10-16', 2, 2, 3, 2, 2, 2),
(GETDATE(), '2025-10-12', '2025-10-17', 3, 3, 1, 3, 3, 3),
(GETDATE(), '2025-10-13', '2025-10-18', 4, 1, 1, 4, 4, 1),
(GETDATE(), '2025-10-14', '2025-10-19', 5, 2, 2, 5, 5, 2);

---------------------
-- 16. Inspection_Type
---------------------
INSERT INTO Inspection_Type (Inspection_Type_Name, Inspection_Type_Description)
VALUES
('Pre-Rental', 'Initial vehicle inspection before renting'),
('Post-Rental', 'Final vehicle inspection after return');

---------------------
-- 17. Inspection
---------------------
INSERT INTO Inspection (Booking_ID, Inspection_Type_ID, Inspection_Results)
VALUES
(1, 1, 'No damage found'),
(1, 2, 'Slight scratches'),
(2, 1, 'Clean'),
(3, 2, 'Minor dent on bumper');

---------------------
-- 18. Damage_Report
---------------------
INSERT INTO Damage_Report (Damage_Report_Description)
VALUES
('Scratch on left door'),
('Cracked windshield'),
('Flat tire'),
('Broken headlight'),
('Rear bumper dent');

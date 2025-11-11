/* Update by Srijan on Nov 10, 5pm */

USE CarRentalDB;
GO

---------------------
-- 1. Branch
---------------------
INSERT INTO Branch (Branch_Name, Branch_Phone_Number, Branch_Hours, Branch_Address, Branch_City, Branch_Zip_Code, Branch_State_Abbreviation)
VALUES 
('Downtown Mankato', '507-387-1000', '8AM-8PM', '101 Main St', 'Mankato', '56001', 'MN'),
('Eagle Lake', '507-555-1111', '8AM-6PM', '24 Hilltop Dr', 'Eagle Lake', '56024', 'MN'),
('St. Peter', '507-555-2222', '9AM-7PM', '99 Sunrise Ave', 'St. Peter', '56082', 'MN');
GO

---------------------
-- 2. Color
---------------------
INSERT INTO Color (Color_Description)
VALUES ('Black'), ('White'), ('Red'), ('Blue'), ('Gray');
GO

---------------------
-- 3. Rental_Rate
---------------------
INSERT INTO Rental_Rate (Rental_Rate_Price)
VALUES (49.99), (59.99), (69.99), (79.99), (89.99);
GO

---------------------
-- 4. Vehicle
---------------------
INSERT INTO Vehicle (Rental_Rate_ID, Vehicle_Model, Vehicle_Size, Vehicle_Mileage, Vehicle_Make, Vehicle_Year, Vehicle_VIN, Color_ID, Vehicle_Status, Vehicle_Location)
VALUES
(1,'RAV4','SUV',32000,'Toyota',2022,'1HGCM82633A12345',1,'Unavailable',1),
(2,'Civic','Compact',18000,'Honda',2023,'2FMDK3GC0BBB2345',2,'Available',2),
(3,'Camry','Sedan',25000,'Toyota',2021,'3C6UR5DL1DG34567',3,'Unavailable',2),
(4,'CR-V','SUV',40000,'Honda',2020,'5FNRL38697B45678',4,'Available',1),
(5,'Altima','Sedan',15000,'Nissan',2024,'1HGEM21901L56789',5,'Available',1),
(1,'Corolla','Sedan',22000,'Toyota',2022,'1HGCM82633A54321',2,'Available',3),
(2,'Accord','Sedan',30000,'Honda',2021,'2FMDK3GC0BBB9999',3,'Available',1),
(3,'Rogue','SUV',28000,'Nissan',2022,'3C6UR5DL1DG11111',4,'Unavailable',2),
(4,'Escape','SUV',25000,'Ford',2023,'5FNRL38697B22222',5,'Available',3),
(5,'Model 3','Sedan',12000,'Tesla',2023,'1HGEM21901L33333',1,'Available',1),
(1,'CX-5','SUV',34000,'Mazda',2021,'JHMCM82633C44444',2,'Available',2),
(2,'Highlander','SUV',24000,'Toyota',2022,'5YJSA1E26FF55555',3,'Unavailable',3),
(3,'Sentra','Compact',19000,'Nissan',2023,'3FA6P0LU0HR66666',4,'Available',1),
(4,'Pilot','SUV',27000,'Honda',2020,'1HGCR2F3XHA77777',5,'Available',2),
(5,'Fusion','Sedan',32000,'Ford',2021,'1HGCR2F3XHA88888',1,'Unavailable',3);
GO

---------------------
-- 5. Payment_Type
---------------------
INSERT INTO Payment_Type (Payment_Type_Name)
VALUES ('Credit'), ('Debit');
GO

---------------------
-- 6. Discount
---------------------
INSERT INTO Discount (Discount_Name, Discount_Percentage)
VALUES 
('No Discount',0),
('Student Discount',10),
('Loyalty Discount',15);
GO

---------------------
-- 7. Payment
---------------------
INSERT INTO Payment (Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
VALUES
(1,1,59.99,GETDATE()),
(2,2,71.99,GETDATE()),
(1,3,84.99,GETDATE()),
(2,NULL,89.99,GETDATE()),
(1,1,54.99,GETDATE());
GO

---------------------
-- 8. Insurance_Type
---------------------
INSERT INTO Insurance_Type (Insurance_Type_Name, Insurance_Type_Description)
VALUES
('Basic','Covers minor damages'),
('Premium','Full coverage including theft'),
('Standard','Covers collision damages');
GO

---------------------
-- 9. Insurance
---------------------
INSERT INTO Insurance (Insurance_Type_ID, Insurance_Name)
VALUES
(1,'SafeDrive Basic'),
(2,'SafeDrive Premium'),
(3,'SafeDrive Standard');
GO

---------------------
-- 10. Membership_Type
---------------------
INSERT INTO Membership_Type (Membership_Type_Name, Membership_Type_Price, Membership_Type_Description)
VALUES
('Silver',50,'Basic membership with small perks'),
('Gold',100,'Extra benefits and discounts'),
('Platinum',200,'All access and top-tier benefits');
GO

---------------------
-- 11. Membership
---------------------
INSERT INTO Membership (Membership_Type_ID, Member_Renewal_Date, Member_Points, Member_Status)
VALUES
(1,'2026-01-01',200,'Active'),
(2,'2026-03-01',450,'Active'),
(3,'2026-06-01',900,'Active'),
(2,'2026-02-01',300,'Active'),
(1,'2026-04-01',150,'Inactive'),
(1,'2026-05-01',250,'Active'),
(2,'2026-05-15',350,'Active'),
(3,'2026-07-01',1000,'Active'),
(3,'2026-07-15',800,'Active'),
(2,'2026-08-01',500,'Active'),
(1,'2026-09-01',180,'Active'),
(2,'2026-09-15',300,'Active'),
(3,'2026-10-01',700,'Active'),
(2,'2026-10-10',250,'Active'),
(1,'2026-10-15',120,'Inactive'),
(3,'2026-10-20',900,'Active'),
(2,'2026-10-25',500,'Active'),
(1,'2026-11-01',150,'Active'),
(3,'2026-11-05',850,'Active'),
(2,'2026-11-10',600,'Active'),
(1,'2026-11-15',100,'Active'),
(2,'2026-11-20',400,'Active'),
(3,'2026-11-25',950,'Active'),
(1,'2026-12-01',200,'Inactive'),
(3,'2026-12-05',800,'Active'),
(2,'2026-12-10',320,'Active'),
(1,'2026-12-15',160,'Active'),
(3,'2026-12-20',1000,'Active'),
(2,'2026-12-25',420,'Active'),
(1,'2027-01-01',240,'Active'),
(3,'2027-01-05',900,'Active'),
(2,'2027-01-10',360,'Active'),
(1,'2027-01-15',180,'Active'),
(3,'2027-01-20',950,'Active'),
(2,'2027-01-25',510,'Active'),
(1,'2027-02-01',130,'Inactive'),
(3,'2027-02-10',870,'Active'),
(2,'2027-02-15',430,'Active'),
(1,'2027-02-20',220,'Active'),
(3,'2027-02-25',1020,'Active'),
(2,'2027-03-01',480,'Active'),
(1,'2027-03-05',140,'Active'),
(3,'2027-03-10',930,'Active'),
(2,'2027-03-15',550,'Active'),
(1,'2027-03-20',210,'Active'),
(3,'2027-03-25',970,'Active'),
(2,'2027-04-01',420,'Active'),
(1,'2027-04-10',170,'Active'),
(3,'2027-04-15',890,'Active'),
(2,'2027-04-20',530,'Active');
GO

---------------------
-- 12. Customers
---------------------
-- (unchanged — your INSERT block works fine for SQL Server)
-- Just make sure the Membership_ID foreign key values exist.
-- Use same block here
GO

---------------------
-- 13. Address
---------------------
INSERT INTO Address (Street_Address, City, Zip, Customer_ID, Branch_ID)
SELECT Customer_Address, Customer_City, Customer_Zip, Customer_ID,
CASE WHEN Customer_ID % 3 = 1 THEN 1 WHEN Customer_ID % 3 = 2 THEN 2 ELSE 3 END
FROM Customers;
GO

---------------------
-- 14. Phone
---------------------
INSERT INTO Phone (Home_Phone, Cell_Phone, Business_Phone, Customer_ID, Branch_ID)
SELECT 
'507-200-' + RIGHT('0000' + CAST(Customer_ID AS VARCHAR(4)),4),
'507-300-' + RIGHT('0000' + CAST(Customer_ID AS VARCHAR(4)),4),
NULL,
Customer_ID,
CASE WHEN Customer_ID % 3 = 1 THEN 1 WHEN Customer_ID % 3 = 2 THEN 2 ELSE 3 END
FROM Customers;
GO

---------------------
-- 15. Payment (extra for customers)
---------------------
INSERT INTO Payment (Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
SELECT 
CASE WHEN Customer_ID % 2 = 0 THEN 1 ELSE 2 END,
CASE WHEN Customer_ID % 3 = 0 THEN 2 ELSE 1 END,
49.99 + (Customer_ID % 5) * 10,
GETDATE()
FROM Customers WHERE Customer_ID > 5;
GO

---------------------
-- 16. Booking
---------------------
INSERT INTO Booking (Date_Booked, PickUpDate, DropOffDate, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID, Payment_ID, Vehicle_ID, Insurance_ID)
SELECT 
GETDATE(),
DATEADD(DAY, Customer_ID, '2025-10-20'),
DATEADD(DAY, Customer_ID, '2025-10-25'),
Customer_ID,
CASE WHEN Customer_ID % 3 = 1 THEN 1 WHEN Customer_ID % 3 = 2 THEN 2 ELSE 3 END,
CASE WHEN Customer_ID % 3 = 2 THEN 3 ELSE 1 END,
Customer_ID,
(Customer_ID % 15) + 1,
(Customer_ID % 3) + 1
FROM Customers;
GO

---------------------
-- 17. Inspection_Type
---------------------
INSERT INTO Inspection_Type (Inspection_Type_Name, Inspection_Type_Description)
VALUES
('Pre-Rental','Initial vehicle inspection before renting'),
('Post-Rental','Final vehicle inspection after return');
GO

---------------------
-- 18. Inspection
---------------------
INSERT INTO Inspection (Booking_ID, Inspection_Type_ID, Inspection_Results)
VALUES
(1,1,'No damage found'),
(1,2,'Slight scratches'),
(2,1,'Clean'),
(3,2,'Minor dent on bumper'),
(4,1,'Clean exterior'),
(5,2,'No issues'),
(6,1,'Clean interior'),
(7,2,'Minor scratch near trunk'),
(8,1,'Perfect condition'),
(9,2,'Tire wear minimal');
GO

---------------------
-- 19. Damage_Report
---------------------
INSERT INTO Damage_Report (Damage_Report_Description)
VALUES
('Scratch on left door'),
('Cracked windshield'),
('Flat tire'),
('Broken headlight'),
('Rear bumper dent'),
('Small dent on roof'),
('Worn tire tread'),
('Minor rust on frame'),
('Interior scuff marks'),
('Loose side mirror');
GO

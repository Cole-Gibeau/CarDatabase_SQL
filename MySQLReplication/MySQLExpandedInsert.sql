/*Update by Cole on Oct 27, 7 am*/

USE CarRentalDB;

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
('No Discount',0),
('Student Discount',10),
('Loyalty Discount',15);

---------------------
-- 7. Payment
---------------------
INSERT INTO Payment (Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
VALUES
(1,1,59.99,CURDATE()),
(2,2,71.99,CURDATE()),
(1,3,84.99,CURDATE()),
(2,NULL,89.99,CURDATE()),
(1,1,54.99,CURDATE());

---------------------
-- 8. Insurance_Type
---------------------
INSERT INTO Insurance_Type (Insurance_Type_Name, Insurance_Type_Description)
VALUES
('Basic','Covers minor damages'),
('Premium','Full coverage including theft'),
('Standard','Covers collision damages');

---------------------
-- 9. Insurance
---------------------
INSERT INTO Insurance (Insurance_Type_ID, Insurance_Name)
VALUES
(1,'SafeDrive Basic'),
(2,'SafeDrive Premium'),
(3,'SafeDrive Standard');

---------------------
-- 10. Membership_Type
---------------------
INSERT INTO Membership_Type (Membership_Type_Name, Membership_Type_Price, Membership_Type_Description)
VALUES
('Silver',50,'Basic membership with small perks'),
('Gold',100,'Extra benefits and discounts'),
('Platinum',200,'All access and top-tier benefits');

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

---------------------
-- 12. Customers (50)
---------------------
INSERT INTO Customers (Membership_ID, Customer_First_Name, Customer_Last_Name, Customer_Email, Customer_Phone_Number, Customer_Address, Customer_City, Customer_Zip, Customer_License_Number)
VALUES
(1,'John','Smith','john.smith@email.com','507-111-2222','12 Oak St','Mankato','56001','MN12345'),
(2,'Emma','Johnson','emma.j@email.com','507-111-3333','45 Pine Ave','Eagle Lake','56024','MN67890'),
(3,'Noah','Brown','noah.b@email.com','507-111-4444','78 Elm Rd','Mankato','56001','MN24680'),
(4,'Olivia','Davis','olivia.d@email.com','507-111-5555','22 Maple Ln','St. Peter','56082','MN13579'),
(5,'Liam','Wilson','liam.w@email.com','507-111-6666','15 Birch St','Mankato','56001','MN97531'),
(6,'Sophia','Taylor','sophia.t@email.com','507-111-7777','34 Walnut Dr','Eagle Lake','56024','MN86420'),
(7,'Ethan','Thomas','ethan.t@email.com','507-111-8888','56 Cedar St','St. Peter','56082','MN75319'),
(8,'Ava','Moore','ava.m@email.com','507-111-9999','23 Spruce St','Mankato','56001','MN64208'),
(9,'Mason','Anderson','mason.a@email.com','507-111-0000','99 River Rd','Eagle Lake','56024','MN53197'),
(10,'Isabella','Clark','isabella.c@email.com','507-111-1212','40 Hill St','St. Peter','56082','MN42086'),
(11,'James','Hall','james.h@email.com','507-112-1111','10 Oak St','Mankato','56001','MN10011'),
(12,'Mia','Allen','mia.a@email.com','507-112-2222','22 Pine Ave','Eagle Lake','56024','MN10012'),
(13,'Lucas','Young','lucas.y@email.com','507-112-3333','33 Elm Rd','St. Peter','56082','MN10013'),
(14,'Amelia','King','amelia.k@email.com','507-112-4444','44 Maple Ln','Mankato','56001','MN10014'),
(15,'Benjamin','Wright','ben.w@email.com','507-112-5555','55 Birch St','Eagle Lake','56024','MN10015'),
(16,'Charlotte','Scott','charlotte.s@email.com','507-112-6666','66 Walnut Dr','St. Peter','56082','MN10016'),
(17,'Henry','Green','henry.g@email.com','507-112-7777','77 Cedar St','Mankato','56001','MN10017'),
(18,'Harper','Adams','harper.a@email.com','507-112-8888','88 Spruce St','Eagle Lake','56024','MN10018'),
(19,'Alexander','Baker','alex.b@email.com','507-112-9999','99 River Rd','St. Peter','56082','MN10019'),
(20,'Ella','Nelson','ella.n@email.com','507-113-0000','100 Hill St','Mankato','56001','MN10020'),
(21,'Sebastian','Carter','seb.c@email.com','507-113-0101','101 Oak St','Eagle Lake','56024','MN10021'),
(22,'Grace','Mitchell','grace.m@email.com','507-113-0202','102 Pine Ave','St. Peter','56082','MN10022'),
(23,'Jack','Perez','jack.p@email.com','507-113-0303','103 Elm Rd','Mankato','56001','MN10023'),
(24,'Luna','Roberts','luna.r@email.com','507-113-0404','104 Maple Ln','Eagle Lake','56024','MN10024'),
(25,'William','Turner','will.t@email.com','507-113-0505','105 Birch St','St. Peter','56082','MN10025'),
(26,'Evelyn','Phillips','evelyn.p@email.com','507-113-0606','106 Walnut Dr','Mankato','56001','MN10026'),
(27,'Logan','Campbell','logan.c@email.com','507-113-0707','107 Cedar St','Eagle Lake','56024','MN10027'),
(28,'Avery','Parker','avery.p@email.com','507-113-0808','108 Spruce St','St. Peter','56082','MN10028'),
(29,'Daniel','Evans','daniel.e@email.com','507-113-0909','109 River Rd','Mankato','56001','MN10029'),
(30,'Scarlett','Edwards','scarlett.e@email.com','507-113-1010','110 Hill St','Eagle Lake','56024','MN10030'),
(31,'Matthew','Collins','matthew.c@email.com','507-113-1111','111 Oak St','Mankato','56001','MN10031'),
(32,'Victoria','Stewart','victoria.s@email.com','507-113-1212','112 Pine Ave','Eagle Lake','56024','MN10032'),
(33,'David','Morris','david.m@email.com','507-113-1313','113 Elm Rd','St. Peter','56082','MN10033'),
(34,'Chloe','Murphy','chloe.m@email.com','507-113-1414','114 Maple Ln','Mankato','56001','MN10034'),
(35,'Joseph','Cook','joseph.c@email.com','507-113-1515','115 Birch St','Eagle Lake','56024','MN10035'),
(36,'Penelope','Rogers','penelope.r@email.com','507-113-1616','116 Walnut Dr','St. Peter','56082','MN10036'),
(37,'Samuel','Reed','samuel.r@email.com','507-113-1717','117 Cedar St','Mankato','56001','MN10037'),
(38,'Hannah','Morgan','hannah.m@email.com','507-113-1818','118 Spruce St','Eagle Lake','56024','MN10038'),
(39,'Owen','Bell','owen.b@email.com','507-113-1919','119 River Rd','St. Peter','56082','MN10039'),
(40,'Lily','Bailey','lily.b@email.com','507-113-2020','120 Hill St','Mankato','56001','MN10040'),
(41,'Isaac','Rivera','isaac.r@email.com','507-113-2121','121 Oak St','Eagle Lake','56024','MN10041'),
(42,'Sofia','Cooper','sofia.c@email.com','507-113-2222','122 Pine Ave','St. Peter','56082','MN10042'),
(43,'Jacob','Richardson','jacob.r@email.com','507-113-2323','123 Elm Rd','Mankato','56001','MN10043'),
(44,'Zoey','Howard','zoey.h@email.com','507-113-2424','124 Maple Ln','Eagle Lake','56024','MN10044'),
(45,'Luke','Ward','luke.w@email.com','507-113-2525','125 Birch St','St. Peter','56082','MN10045'),
(46,'Aria','Torres','aria.t@email.com','507-113-2626','126 Walnut Dr','Mankato','56001','MN10046'),
(47,'Levi','Peterson','levi.p@email.com','507-113-2727','127 Cedar St','Eagle Lake','56024','MN10047'),
(48,'Nora','Gray','nora.g@email.com','507-113-2828','128 Spruce St','St. Peter','56082','MN10048'),
(49,'Elijah','Ramirez','elijah.r@email.com','507-113-2929','129 River Rd','Mankato','56001','MN10049'),
(50,'Layla','James','layla.j@email.com','507-113-3030','130 Hill St','Eagle Lake','56024','MN10050');

---------------------
-- 13. Address
---------------------
INSERT INTO Address (Street_Address, City, Zip, Customer_ID, Branch_ID)
SELECT Customer_Address, Customer_City, Customer_Zip, Customer_ID,
CASE WHEN Customer_ID % 3 = 1 THEN 1 WHEN Customer_ID % 3 = 2 THEN 2 ELSE 3 END
FROM Customers;

---------------------
-- 14. Phone
---------------------
INSERT INTO Phone (Home_Phone, Cell_Phone, Business_Phone, Customer_ID, Branch_ID)
SELECT 
CONCAT('507-200-',LPAD(Customer_ID,4,'0')),
CONCAT('507-300-',LPAD(Customer_ID,4,'0')),
NULL,
Customer_ID,
CASE WHEN Customer_ID % 3 = 1 THEN 1 WHEN Customer_ID % 3 = 2 THEN 2 ELSE 3 END
FROM Customers;

---------------------
-- 15. Payment (extra for customers)
---------------------
INSERT INTO Payment (Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
SELECT 
CASE WHEN Customer_ID % 2 = 0 THEN 1 ELSE 2 END,
CASE WHEN Customer_ID % 3 = 0 THEN 2 ELSE 1 END,
49.99 + (Customer_ID % 5) * 10,
CURDATE()
FROM Customers WHERE Customer_ID > 5;

---------------------
-- 16. Booking
---------------------
INSERT INTO Booking (Date_Booked, PickUpDate, DropOffDate, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID, Payment_ID, Vehicle_ID, Insurance_ID)
SELECT 
CURDATE(),
DATE_ADD('2025-10-20', INTERVAL Customer_ID DAY),
DATE_ADD('2025-10-25', INTERVAL Customer_ID DAY),
Customer_ID,
CASE WHEN Customer_ID % 3 = 1 THEN 1 WHEN Customer_ID % 3 = 2 THEN 2 ELSE 3 END,
CASE WHEN Customer_ID % 3 = 2 THEN 3 ELSE 1 END,
Customer_ID,
(Customer_ID % 15) + 1,
(Customer_ID % 3) + 1
FROM Customers;

---------------------
-- 17. Inspection_Type
---------------------
INSERT INTO Inspection_Type (Inspection_Type_Name, Inspection_Type_Description)
VALUES
('Pre-Rental','Initial vehicle inspection before renting'),
('Post-Rental','Final vehicle inspection after return');

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

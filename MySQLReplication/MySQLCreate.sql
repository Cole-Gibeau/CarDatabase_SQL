--Last Updated by Srijan, 9:45, Nov11. Added Non-Clustered index at the bottom.

DROP DATABASE IF EXISTS CarRentalDB;
CREATE DATABASE CarRentalDB;
USE CarRentalDB;

-- ------------------------------------------------------------
-- STEP 2: CREATE TABLES (NO FOREIGN KEYS)
-- ------------------------------------------------------------

CREATE TABLE Branch (
    Branch_ID INT AUTO_INCREMENT PRIMARY KEY,
    Branch_Name VARCHAR(100) NOT NULL,
    Branch_Phone_Number VARCHAR(20) NOT NULL,
    Branch_Hours VARCHAR(50) NOT NULL,
    Branch_Address VARCHAR(100) NOT NULL,
    Branch_City VARCHAR(50) NOT NULL,
    Branch_Zip_Code CHAR(5) NOT NULL,
    Branch_State_Abbreviation CHAR(2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Color (
    Color_ID INT AUTO_INCREMENT PRIMARY KEY,
    Color_Description VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Rental_Rate (
    Rental_Rate_ID INT AUTO_INCREMENT PRIMARY KEY,
    Rental_Rate_Price DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Payment_Type (
    Payment_Type_ID INT AUTO_INCREMENT PRIMARY KEY,
    Payment_Type_Name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Discount (
    Discount_ID INT AUTO_INCREMENT PRIMARY KEY,
    Discount_Name VARCHAR(50) NOT NULL,
    Discount_Percentage DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Insurance_Type (
    Insurance_Type_ID INT AUTO_INCREMENT PRIMARY KEY,
    Insurance_Type_Name VARCHAR(100) NOT NULL,
    Insurance_Type_Description VARCHAR(200) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Membership_Type (
    Membership_Type_ID INT AUTO_INCREMENT PRIMARY KEY,
    Membership_Type_Name VARCHAR(20) NOT NULL,
    Membership_Type_Price INT NOT NULL,
    Membership_Type_Description VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Membership (
    Membership_ID INT AUTO_INCREMENT PRIMARY KEY,
    Membership_Type_ID INT NOT NULL,
    Member_Renewal_Date DATE NOT NULL,
    Member_Points INT DEFAULT 0,
    Member_Status VARCHAR(20) DEFAULT 'Active'
) ENGINE=InnoDB;

CREATE TABLE Vehicle (
    Vehicle_ID INT AUTO_INCREMENT PRIMARY KEY,
    Rental_Rate_ID INT NOT NULL,
    Vehicle_Model VARCHAR(50) NOT NULL,
    Vehicle_Size VARCHAR(20) NOT NULL,
    Vehicle_Mileage INT NOT NULL,
    Vehicle_Make VARCHAR(50) NOT NULL,
    Vehicle_Year INT NOT NULL,
    Vehicle_VIN CHAR(17) NOT NULL,
    Color_ID INT NOT NULL,
    Vehicle_Status VARCHAR(11) NOT NULL,
    Vehicle_Location INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Payment (
    Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Payment_Type_ID INT NOT NULL,
    Discount_ID INT NULL,
    Payment_Amount DECIMAL(10,2) NOT NULL,
    Payment_Date DATE DEFAULT (CURRENT_DATE)
) ENGINE=InnoDB;

CREATE TABLE Insurance (
    Insurance_ID INT AUTO_INCREMENT PRIMARY KEY,
    Insurance_Type_ID INT NOT NULL,
    Insurance_Name VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Customers (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Membership_ID INT NOT NULL,
    Customer_First_Name VARCHAR(20) NOT NULL,
    Customer_Last_Name VARCHAR(20) NOT NULL,
    Customer_Email VARCHAR(50) NOT NULL,
    Customer_Phone_Number VARCHAR(20) NOT NULL,
    Customer_Address VARCHAR(100) NOT NULL,
    Customer_City VARCHAR(50) NOT NULL,
    Customer_Zip VARCHAR(5) NOT NULL,
    Customer_License_Number VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Address (
    Address_ID INT AUTO_INCREMENT PRIMARY KEY,
    Street_Address VARCHAR(100) NULL,
    City VARCHAR(50) NULL,
    Zip VARCHAR(5) NULL,
    Customer_ID INT NOT NULL,
    Branch_ID INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Phone (
    Phone_ID INT AUTO_INCREMENT PRIMARY KEY,
    Home_Phone VARCHAR(20) NULL,
    Cell_Phone VARCHAR(20) NULL,
    Business_Phone VARCHAR(20) NULL,
    Customer_ID INT NOT NULL,
    Branch_ID INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Booking (
    Booking_ID INT AUTO_INCREMENT PRIMARY KEY,
    Date_Booked DATE NOT NULL,
    PickUpDate DATE NOT NULL,
    DropOffDate DATE NOT NULL,
    Customer_ID INT NOT NULL,
    PickUp_Branch_ID INT NOT NULL,
    DropOff_Branch_ID INT NOT NULL,
    Payment_ID INT NOT NULL,
    Vehicle_ID INT NOT NULL,
    Insurance_ID INT NULL
) ENGINE=InnoDB;

CREATE TABLE Inspection_Type (
    Inspection_Type_ID INT AUTO_INCREMENT PRIMARY KEY,
    Inspection_Type_Name VARCHAR(20) NOT NULL,
    Inspection_Type_Description VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Inspection (
    Inspection_ID INT AUTO_INCREMENT PRIMARY KEY,
    Booking_ID INT NOT NULL,
    Inspection_Type_ID INT NOT NULL,
    Inspection_Results VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Damage_Report (
    Damage_Report_ID INT AUTO_INCREMENT PRIMARY KEY,
    Damage_Report_Description VARCHAR(250) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE webapppermissions (
    User_ID       INT          PRIMARY KEY,
    Username      VARCHAR(50)  NOT NULL,
    Password_Hash VARCHAR(225) NOT NULL,
    Role          VARCHAR(30)  NOT NULL
)ENGINE=InnoDB;


-- ------------------------------------------------------------
-- STEP 3: ADD FOREIGN KEYS
-- ------------------------------------------------------------

ALTER TABLE Membership
ADD CONSTRAINT FK_Membership_MembershipType
FOREIGN KEY (Membership_Type_ID)
REFERENCES Membership_Type(Membership_Type_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Vehicle
ADD CONSTRAINT FK_Vehicle_RentalRate
FOREIGN KEY (Rental_Rate_ID)
REFERENCES Rental_Rate(Rental_Rate_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Vehicle
ADD CONSTRAINT FK_Vehicle_Color
FOREIGN KEY (Color_ID)
REFERENCES Color(Color_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Vehicle
ADD CONSTRAINT FK_Vehicle_Branch_Location
FOREIGN KEY (Vehicle_Location)
REFERENCES Branch(Branch_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Payment
ADD CONSTRAINT FK_Payment_PaymentType
FOREIGN KEY (Payment_Type_ID)
REFERENCES Payment_Type(Payment_Type_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Payment
ADD CONSTRAINT FK_Payment_Discount
FOREIGN KEY (Discount_ID)
REFERENCES Discount(Discount_ID)
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE Insurance
ADD CONSTRAINT FK_Insurance_InsuranceType
FOREIGN KEY (Insurance_Type_ID)
REFERENCES Insurance_Type(Insurance_Type_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Customers
ADD CONSTRAINT FK_Customers_Membership
FOREIGN KEY (Membership_ID)
REFERENCES Membership(Membership_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Address
ADD CONSTRAINT FK_Address_Customer
FOREIGN KEY (Customer_ID)
REFERENCES Customers(Customer_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Address
ADD CONSTRAINT FK_Address_Branch
FOREIGN KEY (Branch_ID)
REFERENCES Branch(Branch_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Phone
ADD CONSTRAINT FK_Phone_Customer
FOREIGN KEY (Customer_ID)
REFERENCES Customers(Customer_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Phone
ADD CONSTRAINT FK_Phone_Branch
FOREIGN KEY (Branch_ID)
REFERENCES Branch(Branch_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_Customer
FOREIGN KEY (Customer_ID)
REFERENCES Customers(Customer_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_PickUpBranch
FOREIGN KEY (PickUp_Branch_ID)
REFERENCES Branch(Branch_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_DropOffBranch
FOREIGN KEY (DropOff_Branch_ID)
REFERENCES Branch(Branch_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_Payment
FOREIGN KEY (Payment_ID)
REFERENCES Payment(Payment_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_Vehicle
FOREIGN KEY (Vehicle_ID)
REFERENCES Vehicle(Vehicle_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_Insurance
FOREIGN KEY (Insurance_ID)
REFERENCES Insurance(Insurance_ID)
ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE Inspection
ADD CONSTRAINT FK_Inspection_Booking
FOREIGN KEY (Booking_ID)
REFERENCES Booking(Booking_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Inspection
ADD CONSTRAINT FK_Inspection_Type
FOREIGN KEY (Inspection_Type_ID)
REFERENCES Inspection_Type(Inspection_Type_ID)
ON DELETE CASCADE ON UPDATE CASCADE;

USE CarRentalDB;

-- Branch lookups by name or city
CREATE INDEX idx_branch_name_city
ON Branch (Branch_Name, Branch_City);

-- Vehicle lookups and joins
CREATE UNIQUE INDEX idx_vehicle_vin
ON Vehicle (Vehicle_VIN);

CREATE INDEX idx_vehicle_make_model
ON Vehicle (Vehicle_Make, Vehicle_Model);

CREATE INDEX idx_vehicle_status
ON Vehicle (Vehicle_Status);

CREATE INDEX idx_vehicle_color
ON Vehicle (Color_ID);

-- Customer search optimization
CREATE INDEX idx_customer_name
ON Customers (Customer_First_Name, Customer_Last_Name);

CREATE INDEX idx_customer_email
ON Customers (Customer_Email);

CREATE INDEX idx_customer_city_zip
ON Customers (Customer_City, Customer_Zip);

CREATE INDEX idx_customer_membership
ON Customers (Membership_ID);

-- Membership performance optimization
CREATE INDEX idx_membership_type
ON Membership (Membership_Type_ID);

CREATE INDEX idx_membership_status
ON Membership (Member_Status);

-- Payment optimization
CREATE INDEX idx_payment_type_discount
ON Payment (Payment_Type_ID, Discount_ID);

CREATE INDEX idx_payment_date
ON Payment (Payment_Date);

-- Booking performance
CREATE INDEX idx_booking_dates
ON Booking (PickUpDate, DropOffDate);

CREATE INDEX idx_booking_customer
ON Booking (Customer_ID);

CREATE INDEX idx_booking_vehicle
ON Booking (Vehicle_ID);

CREATE INDEX idx_booking_payment
ON Booking (Payment_ID);

CREATE INDEX idx_booking_branches
ON Booking (PickUp_Branch_ID, DropOff_Branch_ID);

-- Insurance lookups
CREATE INDEX idx_insurance_type
ON Insurance (Insurance_Type_ID);

CREATE INDEX idx_insurance_name
ON Insurance (Insurance_Name);

-- Inspection performance
CREATE INDEX idx_inspection_booking_type
ON Inspection (Booking_ID, Inspection_Type_ID);

-- Address and Phone optimization
CREATE INDEX idx_address_customer
ON Address (Customer_ID);

CREATE INDEX idx_address_branch
ON Address (Branch_ID);

CREATE INDEX idx_phone_customer
ON Phone (Customer_ID);

CREATE INDEX idx_phone_branch
ON Phone (Branch_ID);


-- ------------------------------------------------------------
-- END OF SCHEMA
-- ------------------------------------------------------------

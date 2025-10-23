
-- Last Updated By: COLE 10/22/2025 2PM


------------------------------------------------------------
-- STEP 1: CREATE TABLES (NO FOREIGN KEYS)
------------------------------------------------------------

IF DB_ID('CarRentalDB') IS NOT NULL
    DROP DATABASE CarRentalDB;
GO

CREATE DATABASE CarRentalDB;
GO

USE CarRentalDB;
GO

CREATE TABLE Branch (
    Branch_ID                 INT IDENTITY(1,1) PRIMARY KEY,
    Branch_Name               VARCHAR(100)      NOT NULL,
    Branch_Phone_Number       VARCHAR(20)       NOT NULL,
    Branch_Hours              VARCHAR(50)       NOT NULL,
    Branch_Address            VARCHAR(100)      NOT NULL,
    Branch_City               VARCHAR(50)       NOT NULL,
    Branch_Zip_Code           CHAR(5)           NOT NULL,
    Branch_State_Abbreviation CHAR(2)           NOT NULL,

    CONSTRAINT Check_Branch_Zip_Code 
        CHECK (Branch_Zip_Code NOT LIKE '%[^0-9]%'),

    CONSTRAINT Check_Branch_State_Abbreviation
        CHECK (Branch_State_Abbreviation LIKE '[A-Z][A-Z]')

);

CREATE TABLE Color (
    Color_ID          INT IDENTITY(1,1)  PRIMARY KEY,
    Color_Description VARCHAR(20)        NOT NULL
);

CREATE TABLE Rental_Rate (
    Rental_Rate_ID      INT IDENTITY(1,1)  PRIMARY KEY,
    Rental_Rate_Price   DECIMAL(10,2)      NOT NULL,

    CONSTRAINT Rental_Rate_Price 
        CHECK (Rental_Rate_Price >= 0)
);

CREATE TABLE Payment_Type (
    Payment_Type_ID     INT IDENTITY(1,1)   PRIMARY KEY,
    Payment_Type_Name   VARCHAR(20)         NOT NULL, 

    CONSTRAINT Payment_Type_Name 
        CHECK (Payment_Type_Name IN ('Credit','Debit'))
);

CREATE TABLE Discount (
    Discount_ID           INT IDENTITY(1,1)  PRIMARY KEY,
    Discount_Name         VARCHAR(50)        NOT NULL,
    Discount_Percentage   DECIMAL(10,2)      NOT NULL,
    
    CONSTRAINT Check_Discount_Percentage
        CHECK (Discount_Percentage BETWEEN 0 AND 100)
);

CREATE TABLE Insurance_Type (
    Insurance_Type_ID          INT IDENTITY(1,1) PRIMARY KEY,
    Insurance_Type_Name        VARCHAR(100)      NOT NULL,
    Insurance_Type_Description VARCHAR(200)      NOT NULL
);

CREATE TABLE Membership_Type (
    Membership_Type_ID          INT IDENTITY(1,1) PRIMARY KEY,
    Membership_Type_Name        VARCHAR(20)       NOT NULL,
    Membership_Type_Price       INT               NOT NULL,
    Membership_Type_Description VARCHAR(100)      NOT NULL,

    CONSTRAINT Check_Membership_Type_Price
        CHECK (Membership_Type_Price >= 0)
);

CREATE TABLE Membership (
    Membership_ID        INT IDENTITY(1,1) PRIMARY KEY,
    Membership_Type_ID   INT               NOT NULL,
    Member_Renewal_Date  DATE              NOT NULL,
    Member_Points        INT               DEFAULT (0),
    Member_Status        VARCHAR(20)       DEFAULT ('Active'),

    CONSTRAINT Check_Member_Points
        CHECK (Member_Points IS NULL OR Member_Points >= 0),

    CONSTRAINT Check_Member_Status
        CHECK (Member_Status IN ('Active','Inactive'))     
);

CREATE TABLE Vehicle (
    Vehicle_ID        INT IDENTITY(1,1) PRIMARY KEY,
    Rental_Rate_ID    INT               NOT NULL,
    Vehicle_Model     VARCHAR(50)       NOT NULL,
    Vehicle_Size      VARCHAR(20)       NOT NULL,
    Vehicle_Mileage   INT               NOT NULL,
    Vehicle_Make      VARCHAR(50)       NOT NULL,
    Vehicle_Year      INT               NOT NULL,
    Vehicle_VIN       CHAR(17)          NOT NULL,
    Color_ID          INT               NOT NULL,

    CONSTRAINT Check_Vehicle_Mileage
        CHECK (Vehicle_Mileage >= 0),

    CONSTRAINT Check_Vehicle_Year
        CHECK (Vehicle_Year BETWEEN 1980 AND YEAR(GETDATE()) + 1)
);

CREATE TABLE Payment (
    Payment_ID       INT IDENTITY(1,1) PRIMARY KEY,
    Payment_Type_ID  INT               NOT NULL,
    Discount_ID      INT               NULL,
    Payment_Amount   DECIMAL(10,2)     NOT NULL,
    Payment_Date     DATE              DEFAULT (CAST(GETDATE() AS date)),

    CONSTRAINT Check_Payment_Amount
        CHECK (Payment_Amount >= 0)
);

CREATE TABLE Insurance (
    Insurance_ID        INT IDENTITY(1,1) PRIMARY KEY,
    Insurance_Type_ID   INT               NOT NULL,
    Insurance_Name      VARCHAR(20)       NOT NULL
);

CREATE TABLE Customers (
    Customer_ID             INT IDENTITY(1,1) PRIMARY KEY,
    Membership_ID           INT               NOT NULL,
    Customer_First_Name     VARCHAR(20)       NOT NULL,
    Customer_Last_Name      VARCHAR(20)       NOT NULL,
    Customer_Email          VARCHAR(50)       NOT NULL,
    Customer_Phone_Number   VARCHAR(20)       NOT NULL,
    Customer_Address        VARCHAR(100)      NOT NULL,
    Customer_City           VARCHAR(50)       NOT NULL,
    Customer_Zip            VARCHAR(5)        NOT NULL,
    Customer_License_Number VARCHAR(20)       NOT NULL,

    CONSTRAINT Check_Customer_Zip
        CHECK (LEN(Customer_Zip) = 5 AND Customer_Zip NOT LIKE '%[^0-9]%')
);

CREATE TABLE Address (
    Address_ID       INT IDENTITY(1,1) PRIMARY KEY,
    Street_Address   VARCHAR(100)      NULL,
    City             VARCHAR(50)       NULL,
    Zip              VARCHAR(5)        NULL,
    Customer_ID      INT               NOT NULL,
    Branch_ID        INT               NOT NULL,

    CONSTRAINT Check_Zip
        CHECK (Zip IS NULL OR (LEN(Zip) = 5 AND Zip NOT LIKE '%[^0-9]%'))
);

CREATE TABLE Phone (
    Phone_ID         INT IDENTITY(1,1) PRIMARY KEY,
    Home_Phone       VARCHAR(20)       NULL,
    Cell_Phone       VARCHAR(20)       NULL,
    Business_Phone   VARCHAR(20)       NULL,
    Customer_ID      INT               NOT NULL,
    Branch_ID        INT               NOT NULL
);

CREATE TABLE Booking (
    Booking_ID          INT IDENTITY(1,1) PRIMARY KEY,
    Date_Booked         DATE              NOT NULL,
    PickUpDate          DATE              NOT NULL,
    DropOffDate         DATE              NOT NULL,
    Customer_ID         INT               NOT NULL,
    PickUp_Branch_ID    INT               NOT NULL,
    DropOff_Branch_ID   INT               NOT NULL,
    Payment_ID          INT               NOT NULL,
    Vehicle_ID          INT               NOT NULL,
    Insurance_ID        INT               NULL,

    CONSTRAINT Check_Valid_Drop_Off_Date
        CHECK (PickUpDate <= DropOffDate)
);

CREATE TABLE Inspection_Type (
    Inspection_Type_ID            INT IDENTITY(1,1) PRIMARY KEY,
    Inspection_Type_Name          VARCHAR(20)       NOT NULL,
    Inspection_Type_Description   VARCHAR(50)       NOT NULL
);

CREATE TABLE Inspection (
    Inspection_ID        INT IDENTITY(1,1) PRIMARY KEY,
    Booking_ID           INT               NOT NULL,
    Inspection_Type_ID   INT               NOT NULL,
    Inspection_Results   VARCHAR(100)      NOT NULL
);

CREATE TABLE Damage_Report (
    Damage_Report_ID            INT IDENTITY(1,1) PRIMARY KEY,
    Damage_Report_Description   VARCHAR(250)      NOT NULL
);

------------------------------------------------------------
-- STEP 2: ADD FOREIGN KEYS USING ALTER TABLE
------------------------------------------------------------

ALTER TABLE Membership
ADD CONSTRAINT FK_Membership_MembershipType
FOREIGN KEY (Membership_Type_ID)
REFERENCES Membership_Type(Membership_Type_ID);

ALTER TABLE Vehicle
ADD CONSTRAINT FK_Vehicle_RentalRate
FOREIGN KEY (Rental_Rate_ID)
REFERENCES Rental_Rate(Rental_Rate_ID);

ALTER TABLE Vehicle
ADD CONSTRAINT FK_Vehicle_Color
FOREIGN KEY (Color_ID)
REFERENCES Color(Color_ID);

ALTER TABLE Payment
ADD CONSTRAINT FK_Payment_PaymentType
FOREIGN KEY (Payment_Type_ID)
REFERENCES Payment_Type(Payment_Type_ID);

ALTER TABLE Payment
ADD CONSTRAINT FK_Payment_Discount
FOREIGN KEY (Discount_ID)
REFERENCES Discount(Discount_ID);

ALTER TABLE Insurance
ADD CONSTRAINT FK_Insurance_InsuranceType
FOREIGN KEY (Insurance_Type_ID)
REFERENCES Insurance_Type(Insurance_Type_ID);

ALTER TABLE Customers
ADD CONSTRAINT FK_Customers_Membership
FOREIGN KEY (Membership_ID)
REFERENCES Membership(Membership_ID);

ALTER TABLE Address
ADD CONSTRAINT FK_Address_Customer
FOREIGN KEY (Customer_ID)
REFERENCES Customers(Customer_ID);

ALTER TABLE Address
ADD CONSTRAINT FK_Address_Branch
FOREIGN KEY (Branch_ID)
REFERENCES Branch(Branch_ID);

ALTER TABLE Phone
ADD CONSTRAINT FK_Phone_Customer
FOREIGN KEY (Customer_ID)
REFERENCES Customers(Customer_ID);

ALTER TABLE Phone
ADD CONSTRAINT FK_Phone_Branch
FOREIGN KEY (Branch_ID)
REFERENCES Branch(Branch_ID);

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_Customer
FOREIGN KEY (Customer_ID)
REFERENCES Customers(Customer_ID);

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_PickUpBranch
FOREIGN KEY (PickUp_Branch_ID)
REFERENCES Branch(Branch_ID);

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_DropOffBranch
FOREIGN KEY (DropOff_Branch_ID)
REFERENCES Branch(Branch_ID);

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_Payment
FOREIGN KEY (Payment_ID)
REFERENCES Payment(Payment_ID);

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_Vehicle
FOREIGN KEY (Vehicle_ID)
REFERENCES Vehicle(Vehicle_ID);

ALTER TABLE Booking
ADD CONSTRAINT FK_Booking_Insurance
FOREIGN KEY (Insurance_ID)
REFERENCES Insurance(Insurance_ID);

ALTER TABLE Inspection
ADD CONSTRAINT FK_Inspection_Booking
FOREIGN KEY (Booking_ID)
REFERENCES Booking(Booking_ID);

ALTER TABLE Inspection
ADD CONSTRAINT FK_Inspection_Type
FOREIGN KEY (Inspection_Type_ID)
REFERENCES Inspection_Type(Inspection_Type_ID);



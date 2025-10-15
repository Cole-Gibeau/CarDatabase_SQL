-- Last Updated By: Srijan 10/15/2025 10 pm
/*
---------------------------
-- Create Customers table
---------------------------
CREATE TABLE Customers
( 
	Customer_ID                 INT IDENTITY(1,1) PRIMARY KEY,
	Membership_ID               INT               NOT NULL,
	Customer_First_Name         VARCHAR(20)       NOT NULL,
	Customer_Last_Name          VARCHAR(20)       NOT NULL,
	Customer_Email              VARCHAR(50)       NOT NULL,
	Customer_Phone_Number       VARCHAR(20)       NOT NULL,
	Customer_Address            VARCHAR(100)      NOT NULL,
	Customer_City               VARCHAR(50)       NOT NULL,
	Customer_Zip                VARCHAR(5)        NOT NULL CHECK (LEN(Customer_Zip) = 5 AND Customer_Zip NOT LIKE '%[^0-9]%'),
	Customer_License_Number     VARCHAR(20)       NOT NULL,

	CONSTRAINT FK_CUSTOMERS_MEMBERSHIP
		FOREIGN KEY (Membership_ID)
		REFERENCES Membership(Membership_ID)
);

-------------------------
-- Create Address table
-------------------------
CREATE TABLE Address
(
	Address_ID                  INT IDENTITY(1,1) PRIMARY KEY,
	Street_Address              VARCHAR(100)      NULL,
	City                        VARCHAR(50)       NULL,
	Zip                         VARCHAR(5)        NULL CHECK (Zip IS NULL OR (LEN(Zip) = 5 AND Zip NOT LIKE '%[^0-9]%')),
	Customer_ID                 INT               NOT NULL,
	Branch_ID                   INT               NOT NULL,

	CONSTRAINT FK_Address_Customer FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
	CONSTRAINT FK_Address_Branch   FOREIGN KEY (Branch_ID)   REFERENCES Branch(Branch_ID)
);

-----------------------
-- Create Phone table
-----------------------
CREATE TABLE Phone
(
	Phone_ID                    INT IDENTITY(1,1) PRIMARY KEY,
	Home_Phone                  VARCHAR(20)       NULL,
	Cell_Phone                  VARCHAR(20)       NULL,
	Business_Phone              VARCHAR(20)       NULL,
	Customer_ID                 INT               NOT NULL,
	Branch_ID                   INT               NOT NULL,

	CONSTRAINT FK_Phone_Customer FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
	CONSTRAINT FK_Phone_Branch   FOREIGN KEY (Branch_ID)   REFERENCES Branch(Branch_ID)
);

------------------------
-- Create Branch table
------------------------
CREATE TABLE Branch
(
	Branch_ID                   INT IDENTITY(1,1) PRIMARY KEY,
	Branch_Name                 VARCHAR(100)      NOT NULL,
	Branch_Phone_Number         VARCHAR(20)       NOT NULL,
	Branch_Hours                VARCHAR(50)       NOT NULL,
	Branch_Address              VARCHAR(100)      NOT NULL,
	Branch_City                 VARCHAR(50)       NOT NULL,
	Branch_Zip_Code             CHAR(5)           NOT NULL CHECK (Branch_Zip_Code NOT LIKE '%[^0-9]%'),
	Branch_State_Abbreviation   CHAR(2)           NOT NULL CHECK (Branch_State_Abbreviation LIKE '[A-Z][A-Z]')
);

-------------------------
-- Create Booking table
-------------------------
CREATE TABLE Booking
(
	Booking_ID                  INT IDENTITY(1,1) PRIMARY KEY,
	Date_Booked                 DATE              NOT NULL,
	PickUpDate                  DATE              NOT NULL,
	DropOffDate                 DATE              NOT NULL,
	Customer_ID                 INT               NOT NULL,
	PickUp_Branch_ID            INT               NOT NULL,
	DropOff_Branch_ID           INT               NOT NULL,
	Payment_ID                  INT               NOT NULL,
	Vehicle_ID                  INT               NOT NULL,
	Insurance_ID                INT               NULL,
	CHECK (PickUpDate <= DropOffDate),

	CONSTRAINT FK_BOOKING_CUSTOMER
		FOREIGN KEY (Customer_ID)
		REFERENCES CUSTOMER(Customer_ID),

	CONSTRAINT FK_BOOKING_PICKUP_BRANCH
		FOREIGN KEY (PickUp_Branch_ID)
		REFERENCES Branch(Branch_ID),
		
	CONSTRAINT FK_BOOKING_DROPOFF_BRANCH
		FOREIGN KEY (DropOff_Branch_ID)
		REFERENCES Branch(Branch_ID),

	CONSTRAINT FK_BOOKING_PAYMENT
		FOREIGN KEY (Payment_ID)
		REFERENCES Payment(Payment_ID),

	CONSTRAINT FK_BOOKING_VEHICLE
		FOREIGN KEY (Vehicle_ID)
		REFERENCES Vehicle(Vehicle_ID),

	CONSTRAINT FK_BOOKING_INSURANCE
		FOREIGN KEY (Insurance_ID)
		REFERENCES Insurance(Insurance_ID)
);

---------------------------
-- Create Insurance table
---------------------------
CREATE TABLE Insurance
(
	Insurance_ID                INT IDENTITY(1,1) PRIMARY KEY,
	Insurance_Type_ID           INT               NOT NULL,
	Insurance_Name              VARCHAR(20)       NOT NULL,

	CONSTRAINT FK_INSURANCE_INSURANCE_TYPE
		FOREIGN KEY (Insurance_Type_ID)
		REFERENCES Insurance_Type(Insurance_Type_ID)
);

--------------------------------
-- Create Insurance Type table
--------------------------------
CREATE TABLE Insurance_Type
(
	Insurance_Type_ID           INT IDENTITY(1,1) PRIMARY KEY,
	Insurance_Type_Name         VARCHAR(100)      NOT NULL,
	Insurance_Type_Description  VARCHAR(200)      NOT NULL
);

-------------------------
-- Create Vehicle table
-------------------------
CREATE TABLE Vehicle
(
	Vehicle_ID                  INT IDENTITY(1,1) PRIMARY KEY,
	Rental_Rate_ID              INT               NOT NULL,
	Vehicle_Model               VARCHAR(50)       NOT NULL,
	Vehicle_Size                VARCHAR(20)       NOT NULL,
	Vehicle_Mileage             INT               NOT NULL CHECK (Vehicle_Mileage >= 0),
	Vehicle_Make                VARCHAR(50)       NOT NULL,
	Vehicle_Year                INT               NOT NULL CHECK (Vehicle_Year BETWEEN 1980 AND YEAR(GETDATE()) + 1),
	Vehicle_VIN                 CHAR(17)          NOT NULL,
	Color_ID                    INT               NOT NULL,

	CONSTRAINT FK_VEHICLE_RENTAL_RATE
		FOREIGN KEY (Rental_Rate_ID)
		REFERENCES Rental_Rate(Rental_Rate_ID),

	CONSTRAINT FK_VEHICLE_COLOR
		FOREIGN KEY(Color_ID)
		REFERENCES Color(Color_ID)
);

-----------------------
-- Create Color table
-----------------------
CREATE TABLE Color
(
	Color_ID                    INT IDENTITY(1,1) PRIMARY KEY,
	Color_Description           VARCHAR(20)       NOT NULL
);

-------------------------
-- Create Payment table
-------------------------
CREATE TABLE Payment
(
	Payment_ID                  INT IDENTITY(1,1) PRIMARY KEY,
	Payment_Type_ID             INT               NOT NULL,
	Discount_ID                 INT               NULL,
	Payment_Amount              DECIMAL(10,2)     NOT NULL CHECK (Payment_Amount >= 0),
	Payment_Date                DATE              NOT NULL CHECK (Payment_Date <= DATEADD(year, 1, CAST(GETDATE() AS date))) DEFAULT (CAST(GETDATE() AS date)),

	CONSTRAINT FK_PAYMENT_PAYMENT_TYPE
		FOREIGN KEY (Payment_Type_ID)
		REFERENCES Payment_Type(Payment_Type_ID),

	CONSTRAINT FK_Payment_Discount FOREIGN KEY (Discount_ID) REFERENCES Discount(Discount_ID)
);

------------------------------
-- Create Payment Type table
------------------------------
CREATE TABLE Payment_Type
(
	Payment_Type_ID             INT IDENTITY(1,1) PRIMARY KEY,
	Payment_Type_Name           VARCHAR(20)       NOT NULL CHECK (Payment_Type_Name IN ('Credit','Debit'))
);

------------------------------
-- Create Discount table
------------------------------
CREATE TABLE Discount
(
	Discount_ID                 INT IDENTITY(1,1) PRIMARY KEY,
	Discount_Name               VARCHAR(50)       NOT NULL,
	Discount_Percentage         DECIMAL(10,2)     NOT NULL CHECK (Discount_Percentage BETWEEN 0 AND 100)
);

-----------------------------
-- Create Rental Rate table
-----------------------------
CREATE TABLE Rental_Rate
(
	Rental_Rate_ID              INT IDENTITY(1,1) PRIMARY KEY,
	Rental_Rate_Price           DECIMAL(10,2)     NOT NULL CHECK (Rental_Rate_Price >= 0)
);

----------------------------
-- Create Inspection table
----------------------------
CREATE TABLE Inspection
(
	Inspection_ID               INT IDENTITY(1,1) PRIMARY KEY,
	Booking_ID                  INT               NOT NULL,
	Inspection_Type_ID          INT               NOT NULL,
	Inspection_Results          VARCHAR(100)      NOT NULL,

	CONSTRAINT FK_INSPECTION_BOOKING
		FOREIGN KEY (Booking_ID)
		REFERENCES Booking(Booking_ID),

	CONSTRAINT FK_INSPECTION_INSPECTION_TYPE
		FOREIGN KEY (Inspection_Type_ID)
		REFERENCES Inspection_Type(Inspection_Type_ID)
);

---------------------------------
-- Create Inspection Type table
---------------------------------
CREATE TABLE Inspection_Type
(
	Inspection_Type_ID          INT IDENTITY(1,1) PRIMARY KEY,
	Inspection_Type_Name        VARCHAR(20)       NOT NULL,
	Inspection_Type_Description VARCHAR(50)       NOT NULL
);

-------------------------------
-- Create Damage Report table
-------------------------------
CREATE TABLE Damage_Report
(
	Damage_Report_ID            INT IDENTITY(1,1) PRIMARY KEY,
	Damage_Report_Description   VARCHAR(250)      NOT NULL
);

----------------------------
-- Create Membership table
----------------------------
CREATE TABLE Membership
(
	Membership_ID               INT IDENTITY(1,1) PRIMARY KEY,
	Membership_Type_ID          INT               NOT NULL,
	Member_Renewal_Date         DATE              NOT NULL,
	Member_Points               INT               NULL CHECK (Member_Points IS NULL OR Member_Points >= 0) DEFAULT (0),
	Member_Status               VARCHAR(20)       NOT NULL CHECK (Member_Status IN ('Active','Inactive')) DEFAULT ('Active'),

	CONSTRAINT FK_Membership_MemberShip_type
		FOREIGN KEY (Membership_Type_ID)
		REFERENCES Membership_Type(Membership_Type_ID)
);

---------------------------------
-- Create Membership Type table
---------------------------------
CREATE TABLE Membership_Type
(
	Membership_Type_ID          INT IDENTITY(1,1) PRIMARY KEY,
	Membership_Type_Name        VARCHAR(20)       NOT NULL,
	Membership_Type_Price       INT               NOT NULL CHECK (Membership_Type_Price >= 0),
	Membership_Type_Description VARCHAR(100)      NOT NULL
);
*/

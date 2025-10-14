--Cole Testing Edits With Git

/*
---------------------------
-- Create Customers table
---------------------------
CREATE TABLE Customers
( 
	Customer_ID				int		 NOT NULL,
	Membership_ID				int		 NOT NULL,
	Customer_First_Name			Varchar(20)	 NOT NULL,
	Customer_Last_Name			Varchar(20)	 NOT NULL,
	Customer_Email				Varchar(50)	 NOT NULL,
	Customer_Phone_Number			Varchar(20)	 NOT NULL,
	Customer_Address			Varchar(100) 	 NOT NULL,
	Customer_City				Varchar(50)	 NOT NULL,
	Customer_Zip				int		 NOT NULL,
	Customer_License_Number			Varchar(20)  	 NOT NULL,
);

-------------------------
-- Create Address table
-------------------------
CREATE TABLE Address
(
	Address_ID				int		 NOT NULL,
	Street_Address				Varchar(100) 	 NOT NULL,
	City					Varchar(50)	 NOT NULL,
	Zip					int		 NOT NULL,
	Customer_ID				int		 NOT NULL,
	Branch_ID				int		 NOT NULL,
);

-----------------------
-- Create Phone table
-----------------------
CREATE TABLE Phone
(
	Phone_ID				int		 NOT NULL,
	Home_Phone				Varchar(20)  	 NOT NULL,
	Cell_Phone				Varchar(20)  	 NOT NULL,
	Business_Phone				Varchar(20)  	 NOT NULL,
	Customer_ID				int		 NOT NULL,
	Branch_ID				int		 NOT NULL,
);

------------------------
-- Create Branch table
------------------------
CREATE TABLE Branch
(
	Branch_ID				int		 NOT NULL,
	Branch_Name				Varchar(100) 	 NOT NULL,
	Branch_Phone_Number			Varchar(20)  	 NOT NULL,
	Branch_Hours				Varchar		 NOT NULL,
	Branch_Address				Varchar(100) 	 NOT NULL,
	Branch_City				Varchar(50) 	 NOT NULL,
	Branch_Zip_Code				int		 NOT NULL,
	Branch_State_Abbreviation		Char(2)		 NOT NULL,
);

-------------------------
-- Create Booking table
-------------------------
CREATE TABLE Booking
(
	Booking_ID				int		 NOT NULL,
	Date_Booked				Date		 NOT NULL,
	PickUpDate				Date		 NOT NULL,
	DropOffDate				Date		 NOT NULL,
	Customer_ID				int		 NOT NULL,
	PickUp_Branch_ID			int		 NOT NULL,
	DropOff_Branch_ID			int		 NOT NULL,
	Payment_ID				int		 NOT NULL,
	Vehicle_ID				int		 NOT NULL,
	Insurance_ID				int		 NOT NULL,
);

---------------------------
-- Create Insurance table
---------------------------
CREATE TABLE Insurance
(
	Insurance_ID				int		 NOT NULL,
	Insurance_Type_ID			int		 NOT NULL,
	Insurance_Name				Varchar(20)  	 NOT NULL,
);

--------------------------------
-- Create Insurance Type table
--------------------------------
CREATE TABLE Insurance_Type
(
	Insurance_Type_ID			int		 NOT NULL,
	Insurance_Type_Name			Varchar(100) 	 NOT NULL,
	Insurance_Type_Description		Varchar(200) 	 NOT NULL,
);

-------------------------
-- Create Vehicle table
-------------------------
CREATE TABLE Vehicle
(
	Vehicle_ID				int		 NOT NULL,
	Rental_Rate_ID				int		 NOT NULL,
	Vehicle_Model				Varchar(50)  	 NOT NULL,
	Vehicle_Size				Varchar(20)  	 NOT NULL,
	Vehicle_Mileage				Varchar(20)  	 NOT NULL,
	Vehicle_Make				Varchar(50)  	 NOT NULL,
	Vehicle_Year				Year		 NOT NULL,
	Vehicle_VIN				int		 NOT NULL,
	Color_ID				int		 NOT NULL,
);

-----------------------
-- Create Color table
-----------------------
CREATE TABLE Color
(
	Color_ID				int		 NOT NULL,
	Color_Description			Varchar(20)  	 NOT NULL,
);

-------------------------
-- Create Payment table
-------------------------
CREATE TABLE Payment
(
	Payment_ID				int		 NOT NULL,
	Payment_Type_ID				int		 NOT NULL,
	Discount_ID				int		 NOT NULL,
	Payment_Amount				int		 NOT NULL,
	Payment_Date				Date		 NOT NULL,
);

------------------------------
-- Create Payment Type table
------------------------------
CREATE TABLE Payment_Type
(
	Payment_Type_ID				int		 NOT NULL,
	Payment_Type_Name			Varchar		 NOT NULL,
);

------------------------------
-- Create Discount table
------------------------------
CREATE TABLE Discount
(
	Discount_ID				int		 NOT NULL,
	Discount_Name				Varchar		 NOT NULL,
	Discount_Percentage			Decimal		 NOT NULL,
);

-----------------------------
-- Create Rental Rate table
-----------------------------
CREATE TABLE Rental_Rate
(
	Rental_Rate_ID				int		 NOT NULL,
	Rental_Rate_Price			Varchar(20)      NOT NULL,
);

----------------------------
-- Create Inspection table
----------------------------
CREATE TABLE Inspection
(
	Inspection_ID				int		 NOT NULL,
	Booking_ID				int		 NOT NULL,
	Inspection_Type_ID			int		 NOT NULL,
	Inspection_Results			Varchar(100) 	 NOT NULL,
);

---------------------------------
-- Create Inspection Type table
---------------------------------
CREATE TABLE Inspection_Type
(
	Inspection_Type_ID			int		 NOT NULL,
	Inspection_Type_Name			Varchar(20)	 NOT NULL,
	Inspection_Type_Description 		Varchar(50)  	 NOT NULL,
);

-------------------------------
-- Create Damage Report table
-------------------------------
CREATE TABLE Damage_Report
(
	Damage_Report_ID			int		 NOT NULL,
	Damage_Report_Description   		Varchar(250) 	 NOT NULL,
);

----------------------------
-- Create Membership table
----------------------------
CREATE TABLE Membership
(
	Membership_ID				int		 NOT NULL,
	Membership_Type_ID			int		 NOT NULL,
	Member_Renewal_Date			Date	     	 NOT NULL,
	Member_Points				int		 NOT NULL,
	Member_Status				Varchar		 NOT NULL,
);

---------------------------------
-- Create Membership Type table
---------------------------------
CREATE TABLE Membership_Type
(
	Membership_Type_ID			int		 NOT NULL,
	Membership_Type_Name			Varchar(20)   	 NOT NULL,
	Membership_Type_Price			int		 NOT NULL,
	Membership_Type_Description 		Varchar		 NOT NULL,
);

*/
/*
---------------------------
-- Populate Customers table
---------------------------
INSERT INTO Customers(Membership_ID, Customer_First_Name, Customer_Last_Name, Customer_Email, Customer_Phone_Number, Customer_Address, Customer_City, Customer_City, Customer_Zip, Customer_License_Number)
VALUES('','','','','','','','','');
INSERT INTO Customers(Membership_ID, Customer_First_Name, Customer_Last_Name, Customer_Email, Customer_Phone_Number, Customer_Address, Customer_City, Customer_City, Customer_Zip, Customer_License_Number)
VALUES('','','','','','','','','');
INSERT INTO Customers(Membership_ID, Customer_First_Name, Customer_Last_Name, Customer_Email, Customer_Phone_Number, Customer_Address, Customer_City, Customer_City, Customer_Zip, Customer_License_Number)
VALUES('','','','','','','','','');
INSERT INTO Customers(Membership_ID, Customer_First_Name, Customer_Last_Name, Customer_Email, Customer_Phone_Number, Customer_Address, Customer_City, Customer_City, Customer_Zip, Customer_License_Number)
VALUES('','','','','','','','','');
INSERT INTO Customers(Membership_ID, Customer_First_Name, Customer_Last_Name, Customer_Email, Customer_Phone_Number, Customer_Address, Customer_City, Customer_City, Customer_Zip, Customer_License_Number)
VALUES('','','','','','','','','');
INSERT INTO Customers(Membership_ID, Customer_First_Name, Customer_Last_Name, Customer_Email, Customer_Phone_Number, Customer_Address, Customer_City, Customer_City, Customer_Zip, Customer_License_Number)
VALUES('','','','','','','','','');
INSERT INTO Customers(Membership_ID, Customer_First_Name, Customer_Last_Name, Customer_Email, Customer_Phone_Number, Customer_Address, Customer_City, Customer_City, Customer_Zip, Customer_License_Number)
VALUES('','','','','','','','','');
INSERT INTO Customers(Membership_ID, Customer_First_Name, Customer_Last_Name, Customer_Email, Customer_Phone_Number, Customer_Address, Customer_City, Customer_City, Customer_Zip, Customer_License_Number)
VALUES('','','','','','','','','');
INSERT INTO Customers(Membership_ID, Customer_First_Name, Customer_Last_Name, Customer_Email, Customer_Phone_Number, Customer_Address, Customer_City, Customer_City, Customer_Zip, Customer_License_Number)
VALUES('','','','','','','','','');
INSERT INTO Customers(Membership_ID, Customer_First_Name, Customer_Last_Name, Customer_Email, Customer_Phone_Number, Customer_Address, Customer_City, Customer_City, Customer_Zip, Customer_License_Number)
VALUES('','','','','','','','','');

-------------------------
-- Populate Address table
-------------------------
INSERT INTO Address(Street_Address, City, Zip, Customer_ID, Branch_Id)
VALUES('','','','','');
INSERT INTO Address(Street_Address, City, Zip, Customer_ID, Branch_Id)
VALUES('','','','','');
INSERT INTO Address(Street_Address, City, Zip, Customer_ID, Branch_Id)
VALUES('','','','','');
INSERT INTO Address(Street_Address, City, Zip, Customer_ID, Branch_Id)
VALUES('','','','','');
INSERT INTO Address(Street_Address, City, Zip, Customer_ID, Branch_Id)
VALUES('','','','','');
INSERT INTO Address(Street_Address, City, Zip, Customer_ID, Branch_Id)
VALUES('','','','','');
INSERT INTO Address(Street_Address, City, Zip, Customer_ID, Branch_Id)
VALUES('','','','','');
INSERT INTO Address(Street_Address, City, Zip, Customer_ID, Branch_Id)
VALUES('','','','','');
INSERT INTO Address(Street_Address, City, Zip, Customer_ID, Branch_Id)
VALUES('','','','','');
INSERT INTO Address(Street_Address, City, Zip, Customer_ID, Branch_Id)
VALUES('','','','','');


-----------------------
-- Populate Phone table
-----------------------
INSERT INTO Phone(Home_Phone, Cell_Phone, Business_Phone, Customer_ID, Branch_ID)
VALUES('','','','','');
INSERT INTO Phone(Home_Phone, Cell_Phone, Business_Phone, Customer_ID, Branch_ID)
VALUES('','','','','');
INSERT INTO Phone(Home_Phone, Cell_Phone, Business_Phone, Customer_ID, Branch_ID)
VALUES('','','','','');
INSERT INTO Phone(Home_Phone, Cell_Phone, Business_Phone, Customer_ID, Branch_ID)
VALUES('','','','','');
INSERT INTO Phone(Home_Phone, Cell_Phone, Business_Phone, Customer_ID, Branch_ID)
VALUES('','','','','');
INSERT INTO Phone(Home_Phone, Cell_Phone, Business_Phone, Customer_ID, Branch_ID)
VALUES('','','','','');
INSERT INTO Phone(Home_Phone, Cell_Phone, Business_Phone, Customer_ID, Branch_ID)
VALUES('','','','','');
INSERT INTO Phone(Home_Phone, Cell_Phone, Business_Phone, Customer_ID, Branch_ID)
VALUES('','','','','');
INSERT INTO Phone(Home_Phone, Cell_Phone, Business_Phone, Customer_ID, Branch_ID)
VALUES('','','','','');
INSERT INTO Phone(Home_Phone, Cell_Phone, Business_Phone, Customer_ID, Branch_ID)
VALUES('','','','','');


------------------------
-- Populate Branch table
------------------------
INSERT INTO Branch(Branch_Name, Branch_Phone_Number, Branch_Hours, Branch_Address, Branch_City, Branch_Zip_Code, Branch_State_Abbreviation)
VALUES('','','','','','','');
INSERT INTO Branch(Branch_Name, Branch_Phone_Number, Branch_Hours, Branch_Address, Branch_City, Branch_Zip_Code, Branch_State_Abbreviation)
VALUES('','','','','','','');
INSERT INTO Branch(Branch_Name, Branch_Phone_Number, Branch_Hours, Branch_Address, Branch_City, Branch_Zip_Code, Branch_State_Abbreviation)
VALUES('','','','','','','');
INSERT INTO Branch(Branch_Name, Branch_Phone_Number, Branch_Hours, Branch_Address, Branch_City, Branch_Zip_Code, Branch_State_Abbreviation)
VALUES('','','','','','','');
INSERT INTO Branch(Branch_Name, Branch_Phone_Number, Branch_Hours, Branch_Address, Branch_City, Branch_Zip_Code, Branch_State_Abbreviation)
VALUES('','','','','','','');
INSERT INTO Branch(Branch_Name, Branch_Phone_Number, Branch_Hours, Branch_Address, Branch_City, Branch_Zip_Code, Branch_State_Abbreviation)
VALUES('','','','','','','');
INSERT INTO Branch(Branch_Name, Branch_Phone_Number, Branch_Hours, Branch_Address, Branch_City, Branch_Zip_Code, Branch_State_Abbreviation)
VALUES('','','','','','','');
INSERT INTO Branch(Branch_Name, Branch_Phone_Number, Branch_Hours, Branch_Address, Branch_City, Branch_Zip_Code, Branch_State_Abbreviation)
VALUES('','','','','','','');
INSERT INTO Branch(Branch_Name, Branch_Phone_Number, Branch_Hours, Branch_Address, Branch_City, Branch_Zip_Code, Branch_State_Abbreviation)
VALUES('','','','','','','');
INSERT INTO Branch(Branch_Name, Branch_Phone_Number, Branch_Hours, Branch_Address, Branch_City, Branch_Zip_Code, Branch_State_Abbreviation)
VALUES('','','','','','','');

-------------------------
-- Populate Booking table
-------------------------
INSERT INTO Booking(Date_Booked, PickUpDate, DropOffDate, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID, Payment_ID, Vehicle_ID, Insurance_ID)
VALUES('','','','','','','','','');
INSERT INTO Booking(Date_Booked, PickUpDate, DropOffDate, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID, Payment_ID, Vehicle_ID, Insurance_ID)
VALUES('','','','','','','','','');
INSERT INTO Booking(Date_Booked, PickUpDate, DropOffDate, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID, Payment_ID, Vehicle_ID, Insurance_ID)
VALUES('','','','','','','','','');
INSERT INTO Booking(Date_Booked, PickUpDate, DropOffDate, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID, Payment_ID, Vehicle_ID, Insurance_ID)
VALUES('','','','','','','','','');
INSERT INTO Booking(Date_Booked, PickUpDate, DropOffDate, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID, Payment_ID, Vehicle_ID, Insurance_ID)
VALUES('','','','','','','','','');
INSERT INTO Booking(Date_Booked, PickUpDate, DropOffDate, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID, Payment_ID, Vehicle_ID, Insurance_ID)
VALUES('','','','','','','','','');
INSERT INTO Booking(Date_Booked, PickUpDate, DropOffDate, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID, Payment_ID, Vehicle_ID, Insurance_ID)
VALUES('','','','','','','','','');
INSERT INTO Booking(Date_Booked, PickUpDate, DropOffDate, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID, Payment_ID, Vehicle_ID, Insurance_ID)
VALUES('','','','','','','','','');
INSERT INTO Booking(Date_Booked, PickUpDate, DropOffDate, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID, Payment_ID, Vehicle_ID, Insurance_ID)
VALUES('','','','','','','','','');
INSERT INTO Booking(Date_Booked, PickUpDate, DropOffDate, Customer_ID, PickUp_Branch_ID, DropOff_Branch_ID, Payment_ID, Vehicle_ID, Insurance_ID)
VALUES('','','','','','','','','');

---------------------------
-- Populate Insurance table
---------------------------
INSERT INTO Insurance(Insurance_Type_ID, Insurance_Name)
VALUES('','');
INSERT INTO Insurance(Insurance_Type_ID, Insurance_Name)
VALUES('','');
INSERT INTO Insurance(Insurance_Type_ID, Insurance_Name)
VALUES('','');
INSERT INTO Insurance(Insurance_Type_ID, Insurance_Name)
VALUES('','');
INSERT INTO Insurance(Insurance_Type_ID, Insurance_Name)
VALUES('','');
INSERT INTO Insurance(Insurance_Type_ID, Insurance_Name)
VALUES('','');
INSERT INTO Insurance(Insurance_Type_ID, Insurance_Name)
VALUES('','');
INSERT INTO Insurance(Insurance_Type_ID, Insurance_Name)
VALUES('','');
INSERT INTO Insurance(Insurance_Type_ID, Insurance_Name)
VALUES('','');
INSERT INTO Insurance(Insurance_Type_ID, Insurance_Name)
VALUES('','');

--------------------------------
-- Populate Insurance Type table
--------------------------------
INSERT INTO Insurance_Type(Insurance_Type_Name, Insurance_Type_Description)
VALUES('','');
INSERT INTO Insurance_Type(Insurance_Type_Name, Insurance_Type_Description)
VALUES('','');
INSERT INTO Insurance_Type(Insurance_Type_Name, Insurance_Type_Description)
VALUES('','');
INSERT INTO Insurance_Type(Insurance_Type_Name, Insurance_Type_Description)
VALUES('','');
INSERT INTO Insurance_Type(Insurance_Type_Name, Insurance_Type_Description)
VALUES('','');
INSERT INTO Insurance_Type(Insurance_Type_Name, Insurance_Type_Description)
VALUES('','');
INSERT INTO Insurance_Type(Insurance_Type_Name, Insurance_Type_Description)
VALUES('','');
INSERT INTO Insurance_Type(Insurance_Type_Name, Insurance_Type_Description)
VALUES('','');
INSERT INTO Insurance_Type(Insurance_Type_Name, Insurance_Type_Description)
VALUES('','');
INSERT INTO Insurance_Type(Insurance_Type_Name, Insurance_Type_Description)
VALUES('','');

-------------------------
-- Populate Vehicle table
-------------------------
INSERT INTO Vehicle(Rental_Rate_ID, Vehicle_Model, Vehicle_Size, Vehicle_Mileage, Vehicle_Make, Vehicle_Year, Vehicle_VIN, Color_ID)
VALUES('','','','','','','','');
INSERT INTO Vehicle(Rental_Rate_ID, Vehicle_Model, Vehicle_Size, Vehicle_Mileage, Vehicle_Make, Vehicle_Year, Vehicle_VIN, Color_ID)
VALUES('','','','','','','','');
INSERT INTO Vehicle(Rental_Rate_ID, Vehicle_Model, Vehicle_Size, Vehicle_Mileage, Vehicle_Make, Vehicle_Year, Vehicle_VIN, Color_ID)
VALUES('','','','','','','','');
INSERT INTO Vehicle(Rental_Rate_ID, Vehicle_Model, Vehicle_Size, Vehicle_Mileage, Vehicle_Make, Vehicle_Year, Vehicle_VIN, Color_ID)
VALUES('','','','','','','','');
INSERT INTO Vehicle(Rental_Rate_ID, Vehicle_Model, Vehicle_Size, Vehicle_Mileage, Vehicle_Make, Vehicle_Year, Vehicle_VIN, Color_ID)
VALUES('','','','','','','','');
INSERT INTO Vehicle(Rental_Rate_ID, Vehicle_Model, Vehicle_Size, Vehicle_Mileage, Vehicle_Make, Vehicle_Year, Vehicle_VIN, Color_ID)
VALUES('','','','','','','','');
INSERT INTO Vehicle(Rental_Rate_ID, Vehicle_Model, Vehicle_Size, Vehicle_Mileage, Vehicle_Make, Vehicle_Year, Vehicle_VIN, Color_ID)
VALUES('','','','','','','','');
INSERT INTO Vehicle(Rental_Rate_ID, Vehicle_Model, Vehicle_Size, Vehicle_Mileage, Vehicle_Make, Vehicle_Year, Vehicle_VIN, Color_ID)
VALUES('','','','','','','','');
INSERT INTO Vehicle(Rental_Rate_ID, Vehicle_Model, Vehicle_Size, Vehicle_Mileage, Vehicle_Make, Vehicle_Year, Vehicle_VIN, Color_ID)
VALUES('','','','','','','','');
INSERT INTO Vehicle(Rental_Rate_ID, Vehicle_Model, Vehicle_Size, Vehicle_Mileage, Vehicle_Make, Vehicle_Year, Vehicle_VIN, Color_ID)
VALUES('','','','','','','','');

-----------------------
-- Populate Color table
-----------------------
INSERT INTO Color(Color_Description)
VALUES('');
INSERT INTO Color(Color_Description)
VALUES('');
INSERT INTO Color(Color_Description)
VALUES('');
INSERT INTO Color(Color_Description)
VALUES('');
INSERT INTO Color(Color_Description)
VALUES('');
INSERT INTO Color(Color_Description)
VALUES('');
INSERT INTO Color(Color_Description)
VALUES('');
INSERT INTO Color(Color_Description)
VALUES('');
INSERT INTO Color(Color_Description)
VALUES('');
INSERT INTO Color(Color_Description)
VALUES('');

-------------------------
-- Populate Payment table
-------------------------
INSERT INTO Payment(Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
VALUES('','','','');
INSERT INTO Payment(Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
VALUES('','','','');
INSERT INTO Payment(Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
VALUES('','','','');
INSERT INTO Payment(Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
VALUES('','','','');
INSERT INTO Payment(Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
VALUES('','','','');
INSERT INTO Payment(Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
VALUES('','','','');
INSERT INTO Payment(Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
VALUES('','','','');
INSERT INTO Payment(Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
VALUES('','','','');
INSERT INTO Payment(Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
VALUES('','','','');
INSERT INTO Payment(Payment_Type_ID, Discount_ID, Payment_Amount, Payment_Date)
VALUES('','','','');


------------------------------
-- Populate Payment Type table
------------------------------
INSERT INTO Payment_Type(Payment_Type_Name)
VALUES('');
INSERT INTO Payment_Type(Payment_Type_Name)
VALUES('');
INSERT INTO Payment_Type(Payment_Type_Name)
VALUES('');
INSERT INTO Payment_Type(Payment_Type_Name)
VALUES('');
INSERT INTO Payment_Type(Payment_Type_Name)
VALUES('');
INSERT INTO Payment_Type(Payment_Type_Name)
VALUES('');
INSERT INTO Payment_Type(Payment_Type_Name)
VALUES('');
INSERT INTO Payment_Type(Payment_Type_Name)
VALUES('');
INSERT INTO Payment_Type(Payment_Type_Name)
VALUES('');
INSERT INTO Payment_Type(Payment_Type_Name)
VALUES('');

------------------------------
-- Populate Discount table
------------------------------
INSERT INTO Discount(Discount_Name, Discount_Percentage)
VALUES('','');
INSERT INTO Discount(Discount_Name, Discount_Percentage)
VALUES('','');
INSERT INTO Discount(Discount_Name, Discount_Percentage)
VALUES('','');
INSERT INTO Discount(Discount_Name, Discount_Percentage)
VALUES('','');
INSERT INTO Discount(Discount_Name, Discount_Percentage)
VALUES('','');
INSERT INTO Discount(Discount_Name, Discount_Percentage)
VALUES('','');
INSERT INTO Discount(Discount_Name, Discount_Percentage)
VALUES('','');
INSERT INTO Discount(Discount_Name, Discount_Percentage)
VALUES('','');
INSERT INTO Discount(Discount_Name, Discount_Percentage)
VALUES('','');
INSERT INTO Discount(Discount_Name, Discount_Percentage)
VALUES('','');

-----------------------------
-- Populate Rental Rate table
-----------------------------
INSERT INTO Rental_Rate(Rental_Rate_Price)
VALUES('');
INSERT INTO Rental_Rate(Rental_Rate_Price)
VALUES('');
INSERT INTO Rental_Rate(Rental_Rate_Price)
VALUES('');
INSERT INTO Rental_Rate(Rental_Rate_Price)
VALUES('');
INSERT INTO Rental_Rate(Rental_Rate_Price)
VALUES('');
INSERT INTO Rental_Rate(Rental_Rate_Price)
VALUES('');
INSERT INTO Rental_Rate(Rental_Rate_Price)
VALUES('');
INSERT INTO Rental_Rate(Rental_Rate_Price)
VALUES('');
INSERT INTO Rental_Rate(Rental_Rate_Price)
VALUES('');
INSERT INTO Rental_Rate(Rental_Rate_Price)
VALUES('');

----------------------------
-- Populate Inspection table
----------------------------
INSERT INTO Inspection(Booking_ID, Inspection_Type_ID, Inspection_Results)
VALUES('','','')
INSERT INTO Inspection(Booking_ID, Inspection_Type_ID, Inspection_Results)
VALUES('','','')
INSERT INTO Inspection(Booking_ID, Inspection_Type_ID, Inspection_Results)
VALUES('','','')
INSERT INTO Inspection(Booking_ID, Inspection_Type_ID, Inspection_Results)
VALUES('','','')
INSERT INTO Inspection(Booking_ID, Inspection_Type_ID, Inspection_Results)
VALUES('','','')
INSERT INTO Inspection(Booking_ID, Inspection_Type_ID, Inspection_Results)
VALUES('','','')
INSERT INTO Inspection(Booking_ID, Inspection_Type_ID, Inspection_Results)
VALUES('','','')
INSERT INTO Inspection(Booking_ID, Inspection_Type_ID, Inspection_Results)
VALUES('','','')
INSERT INTO Inspection(Booking_ID, Inspection_Type_ID, Inspection_Results)
VALUES('','','')
INSERT INTO Inspection(Booking_ID, Inspection_Type_ID, Inspection_Results)
VALUES('','','')

---------------------------------
-- Populate Inspection Type table
---------------------------------
INSERT INTO Inspection_Type(Inspection_Type_Name, Inspection_Type_Description)
VALUES('','');
INSERT INTO Inspection_Type(Inspection_Type_Name, Inspection_Type_Description)
VALUES('','');
INSERT INTO Inspection_Type(Inspection_Type_Name, Inspection_Type_Description)
VALUES('','');
INSERT INTO Inspection_Type(Inspection_Type_Name, Inspection_Type_Description)
VALUES('','');
INSERT INTO Inspection_Type(Inspection_Type_Name, Inspection_Type_Description)
VALUES('','');
INSERT INTO Inspection_Type(Inspection_Type_Name, Inspection_Type_Description)
VALUES('','');
INSERT INTO Inspection_Type(Inspection_Type_Name, Inspection_Type_Description)
VALUES('','');
INSERT INTO Inspection_Type(Inspection_Type_Name, Inspection_Type_Description)
VALUES('','');
INSERT INTO Inspection_Type(Inspection_Type_Name, Inspection_Type_Description)
VALUES('','');
INSERT INTO Inspection_Type(Inspection_Type_Name, Inspection_Type_Description)
VALUES('','');


-------------------------------
-- Populate Damage Report table
-------------------------------
INSERT INTO Damage_Report(Damage_Report_Description)
VALUES('');
INSERT INTO Damage_Report(Damage_Report_Description)
VALUES('');
INSERT INTO Damage_Report(Damage_Report_Description)
VALUES('');
INSERT INTO Damage_Report(Damage_Report_Description)
VALUES('');
INSERT INTO Damage_Report(Damage_Report_Description)
VALUES('');
INSERT INTO Damage_Report(Damage_Report_Description)
VALUES('');
INSERT INTO Damage_Report(Damage_Report_Description)
VALUES('');
INSERT INTO Damage_Report(Damage_Report_Description)
VALUES('');
INSERT INTO Damage_Report(Damage_Report_Description)
VALUES('');
INSERT INTO Damage_Report(Damage_Report_Description)
VALUES('');

----------------------------
-- Populate Membership table
----------------------------
INSERT INTO Membership(Membership_Type_ID, Member_Renewal_Date, Member_Points, Member_Status)
VALUES('','','','');
INSERT INTO Membership(Membership_Type_ID, Member_Renewal_Date, Member_Points, Member_Status)
VALUES('','','','');
INSERT INTO Membership(Membership_Type_ID, Member_Renewal_Date, Member_Points, Member_Status)
VALUES('','','','');
INSERT INTO Membership(Membership_Type_ID, Member_Renewal_Date, Member_Points, Member_Status)
VALUES('','','','');
INSERT INTO Membership(Membership_Type_ID, Member_Renewal_Date, Member_Points, Member_Status)
VALUES('','','','');
INSERT INTO Membership(Membership_Type_ID, Member_Renewal_Date, Member_Points, Member_Status)
VALUES('','','','');
INSERT INTO Membership(Membership_Type_ID, Member_Renewal_Date, Member_Points, Member_Status)
VALUES('','','','');
INSERT INTO Membership(Membership_Type_ID, Member_Renewal_Date, Member_Points, Member_Status)
VALUES('','','','');
INSERT INTO Membership(Membership_Type_ID, Member_Renewal_Date, Member_Points, Member_Status)
VALUES('','','','');
INSERT INTO Membership(Membership_Type_ID, Member_Renewal_Date, Member_Points, Member_Status)
VALUES('','','','');


---------------------------------
-- Populate Membership Type table
---------------------------------
INSERT INTO Membership_Type(Membership_Type_Name, Membership_Type_Price, Membership_Type_Description)
VALUES('','','');
INSERT INTO Membership_Type(Membership_Type_Name, Membership_Type_Price, Membership_Type_Description)
VALUES('','','');
INSERT INTO Membership_Type(Membership_Type_Name, Membership_Type_Price, Membership_Type_Description)
VALUES('','','');
INSERT INTO Membership_Type(Membership_Type_Name, Membership_Type_Price, Membership_Type_Description)
VALUES('','','');
INSERT INTO Membership_Type(Membership_Type_Name, Membership_Type_Price, Membership_Type_Description)
VALUES('','','');
INSERT INTO Membership_Type(Membership_Type_Name, Membership_Type_Price, Membership_Type_Description)
VALUES('','','');
INSERT INTO Membership_Type(Membership_Type_Name, Membership_Type_Price, Membership_Type_Description)
VALUES('','','');
INSERT INTO Membership_Type(Membership_Type_Name, Membership_Type_Price, Membership_Type_Description)
VALUES('','','');
INSERT INTO Membership_Type(Membership_Type_Name, Membership_Type_Price, Membership_Type_Description)
VALUES('','','');
INSERT INTO Membership_Type(Membership_Type_Name, Membership_Type_Price, Membership_Type_Description)
VALUES('','','');

*/
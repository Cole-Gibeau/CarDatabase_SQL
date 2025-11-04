--Edited by Ethan Klein 1:30PM 11/4/2025--

--db_datareader login--
--Username: GroupProjectDatareaderLogin--
--Password: CIS440GP#1--

--SELECT Statement to prove read permission is granted--
SELECT TOP 10 *
FROM Address;

--INSERT statement, should write permission--
INSERT INTO Branch (Branch_Name)
VALUES
('Minneapolis');

--DELETE statement, should deny DELETE permission--
DELETE
FROM Address;
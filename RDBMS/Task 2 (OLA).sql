create database ola;
use ola;
create table drivers(Driverid int	auto_increment	 primary key ,FirstName text,LastName text, Phone varchar(13) , City text, VehicleType enum( 'Sedan', 'Hatchback', 'SUV') , Rating varchar(5));
INSERT INTO drivers (FirstName, LastName, Phone, City, VehicleType, Rating)
VALUES ('Rajesh', 'Kumar', '9876543210', 'Delhi', 'Sedan', '4.5');

INSERT INTO drivers (FirstName, LastName, Phone, City, VehicleType, Rating)
VALUES ('Amit', 'Verma', '9123456789', 'Mumbai', 'SUV', '4.2');

INSERT INTO drivers (FirstName, LastName, Phone, City, VehicleType, Rating)
VALUES ('Suresh', 'Yadav', '9812345678', 'Bangalore', 'Hatchback', '4.8');

INSERT INTO drivers (FirstName, LastName, Phone, City, VehicleType, Rating)
VALUES ('Ravi', 'Singh', '9900123456', 'Chennai', 'Sedan', '4.3');

INSERT INTO drivers (FirstName, LastName, Phone, City, VehicleType, Rating)
VALUES ('Manoj', 'Sharma', '9988776655', 'Hyderabad', 'SUV', '4.7');

INSERT INTO drivers (FirstName, LastName, Phone, City, VehicleType, Rating)
VALUES ('Pankaj', 'Mishra', '9876012345', 'Pune', 'Hatchback', '4.1');

INSERT INTO drivers (FirstName, LastName, Phone, City, VehicleType, Rating)
VALUES ('Vikram', 'Joshi', '9765432109', 'Ahmedabad', 'Sedan', '4.6');

INSERT INTO drivers (FirstName, LastName, Phone, City, VehicleType, Rating)
VALUES ('Sunil', 'Patel', '9654321098', 'Jaipur', 'SUV', '4.4');

INSERT INTO drivers (FirstName, LastName, Phone, City, VehicleType, Rating)
VALUES ('Anil', 'Mehra', '9543210987', 'Kolkata', 'Hatchback', '4.0');

INSERT INTO drivers (FirstName, LastName, Phone, City, VehicleType, Rating)
VALUES ('Deepak', 'Rana', '9432109876', 'Lucknow', 'Sedan', '4.9');

select * from drivers;

create table Riders(RiderID int auto_increment primary key,FirstName text,LastName text, Phone varchar(13) , City text, JoinDate datetime default current_timestamp);

INSERT INTO Riders (FirstName, LastName, Phone, City)
VALUES ('Priya', 'Sharma', '9876543201', 'Delhi');

INSERT INTO Riders (FirstName, LastName, Phone, City)
VALUES ('Rohit', 'Verma', '9123456790', 'Mumbai');

INSERT INTO Riders (FirstName, LastName, Phone, City)
VALUES ('Sneha', 'Patil', '9812345671', 'Pune');

INSERT INTO Riders (FirstName, LastName, Phone, City)
VALUES ('Aakash', 'Gupta', '9900123400', 'Bangalore');

INSERT INTO Riders (FirstName, LastName, Phone, City)
VALUES ('Neha', 'Reddy', '9988776611', 'Hyderabad');

INSERT INTO Riders (FirstName, LastName, Phone, City)
VALUES ('Karan', 'Malhotra', '9876012399', 'Chennai');

INSERT INTO Riders (FirstName, LastName, Phone, City)
VALUES ('Divya', 'Jain', '9765432188', 'Ahmedabad');

INSERT INTO Riders (FirstName, LastName, Phone, City)
VALUES ('Aman', 'Kapoor', '9654321077', 'Kolkata');

INSERT INTO Riders (FirstName, LastName, Phone, City)
VALUES ('Isha', 'Mehta', '9543210996', 'Jaipur');

INSERT INTO Riders (FirstName, LastName, Phone, City)
VALUES ('Varun', 'Thakur', '9432109875', 'Lucknow');

select * from Riders;

create table Rides(RideID	int auto_increment primary key	 ,RiderID int,DriverID int,RideDate datetime default current_timestamp,PickupLocation  varchar(50),DropLocation varchar(50) ,	distance decimal(5,2), Fare   decimal(7,2),RideStatus enum (  'Completed', 'Cancelled', 'Ongoing') , FOREIGN KEY (RiderID) REFERENCES Riders(RiderID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID));
    
    INSERT INTO Rides (RiderID, DriverID, PickupLocation, DropLocation, Distance, Fare, RideStatus)
VALUES (1, 1, 'Vijay Nagar', 'Rajwada', 8.2, 160.00, 'Completed');

INSERT INTO Rides (RiderID, DriverID, PickupLocation, DropLocation, Distance, Fare, RideStatus)
VALUES (2, 2, 'Palasia', 'Bhawarkuan', 6.5, 130.00, 'Completed');

INSERT INTO Rides (RiderID, DriverID, PickupLocation, DropLocation, Distance, Fare, RideStatus)
VALUES (3, 3, 'Khajrana', 'MG Road', 9.1, 185.00, 'Completed');

INSERT INTO Rides (RiderID, DriverID, PickupLocation, DropLocation, Distance, Fare, RideStatus)
VALUES (4, 4, 'Bengali Square', 'Chhoti Gwaltoli', 7.8, 150.00, 'Ongoing');

INSERT INTO Rides (RiderID, DriverID, PickupLocation, DropLocation, Distance, Fare, RideStatus)
VALUES (5, 5, 'Scheme No. 54', 'Indore Junction', 5.4, 105.00, 'Completed');

INSERT INTO Rides (RiderID, DriverID, PickupLocation, DropLocation, Distance, Fare, RideStatus)
VALUES (6, 6, 'Sudama Nagar', 'Annapurna Road', 4.7, 95.00, 'Cancelled');

INSERT INTO Rides (RiderID, DriverID, PickupLocation, DropLocation, Distance, Fare, RideStatus)
VALUES (7, 7, 'Tilak Nagar', 'Pardeshipura', 6.9, 140.00, 'Completed');

INSERT INTO Rides (RiderID, DriverID, PickupLocation, DropLocation, Distance, Fare, RideStatus)
VALUES (8, 8, 'MR 10 Road', 'Bhanwarkuan', 10.3, 200.00, 'Completed');

INSERT INTO Rides (RiderID, DriverID, PickupLocation, DropLocation, Distance, Fare, RideStatus)
VALUES (9, 9, 'Kanadia Road', 'Rajendra Nagar', 9.6, 190.00, 'Completed');

INSERT INTO Rides (RiderID, DriverID, PickupLocation, DropLocation, Distance, Fare, RideStatus)
VALUES (10, 10, 'LIG Colony', 'Airport Road', 11.2, 220.00, 'Completed');

select * from Rides;
 
 
 create table Payment(PaymentID int auto_increment primary key , RideID int , Payment enum(  'Card', 'Cash', 'Wallet'), Amount decimal(5,2), PaymentDate  datetime default current_timestamp, foreign key (RideID) references Rides(RideID));
 
INSERT INTO Payment (RideID, Payment, Amount)
VALUES (1, 'Cash', 160.00);

INSERT INTO Payment (RideID, Payment, Amount)
VALUES (2, 'Card', 130.00);

INSERT INTO Payment (RideID, Payment, Amount)
VALUES (3, 'Wallet', 185.00);

INSERT INTO Payment (RideID, Payment, Amount)
VALUES (4, 'Cash', 150.00);

INSERT INTO Payment (RideID, Payment, Amount)
VALUES (5, 'Wallet', 105.00);

INSERT INTO Payment (RideID, Payment, Amount)
VALUES (6, 'Card', 95.00);

INSERT INTO Payment (RideID, Payment, Amount)
VALUES (7, 'Cash', 140.00);

INSERT INTO Payment (RideID, Payment, Amount)
VALUES (8, 'Card', 200.00);

INSERT INTO Payment (RideID, Payment, Amount)
VALUES (9, 'Wallet', 190.00);

INSERT INTO Payment (RideID, Payment, Amount)
VALUES (10, 'Cash', 220.00);

select * from Payment;


SELECT FirstName, LastName, Phone, City, Rating
FROM drivers
where Rating >=4.5;


select RideID	,FirstName	
 from Rides
 inner join Drivers 
 where RideStatus= 'Completed'; 

SELECT 
    Riders.RiderID,
    Riders.FirstName,
    Riders.LastName,
    Riders.Phone,
    Riders.City
FROM 
    Riders
LEFT JOIN 
    Rides ON Riders.RiderID = Rides.RiderID
WHERE 
    Rides.RideID IS NULL;



SELECT 
    Drivers.DriverID,
    Drivers.FirstName,
    Drivers.LastName,
    SUM(Rides.Fare) AS TotalEarnings
FROM 
    Drivers
JOIN 
    Rides ON Drivers.DriverID = Rides.DriverID
WHERE 
    Rides.RideStatus = 'Completed'
GROUP BY 
    Drivers.DriverID, Drivers.FirstName, Drivers.LastName;

SELECT 
    Rides.RideID,
    Rides.RiderID,
    Rides.DriverID,
    Rides.RideDate,
    Rides.PickupLocation,
    Rides.DropLocation,
    Rides.Distance,
    Rides.Fare,
    Rides.RideStatus
FROM 
    Rides
JOIN (
    SELECT 
        RiderID,
        MAX(RideDate) AS LatestRide
    FROM 
        Rides
    GROUP BY 
        RiderID
) AS LatestRides
ON 
    Rides.RiderID = LatestRides.RiderID 
    AND Rides.RideDate = LatestRides.LatestRide;


SELECT 
    PickupLocation AS City,
    COUNT(*) AS TotalRides
FROM 
    Rides
GROUP BY 
    PickupLocation;
    
    SELECT 
    RideID,
    RiderID,
    DriverID,
    RideDate,
    PickupLocation,
    DropLocation,
    Distance,
    Fare,
    RideStatus
FROM 
    Rides
WHERE 
    Distance>= 20;
    
    SELECT 
    Payment,
    COUNT(*) AS UsageCount
FROM 
    Payment
GROUP BY 
    Payment
ORDER BY 
    UsageCount DESC
LIMIT 1;

SELECT 
    Drivers.DriverID,
    Drivers.FirstName,
    Drivers.LastName,
    SUM(Rides.Fare) AS TotalEarnings
FROM 
    Drivers
JOIN 
    Rides ON Drivers.DriverID = Rides.DriverID
WHERE 
    Rides.RideStatus = 'Completed'
GROUP BY 
    Drivers.DriverID,
    Drivers.FirstName,
    Drivers.LastName
ORDER BY 
    TotalEarnings DESC
LIMIT 3;



SELECT 
    Rides.RideID,
    Rides.RideDate,
    Rides.PickupLocation,
    Rides.DropLocation,
    Rides.Distance,
    Rides.Fare,
    Rides.RideStatus,
    
    Riders.FirstName AS RiderFirstName,
    Riders.LastName AS RiderLastName,
    
    Drivers.FirstName AS DriverFirstName,
    Drivers.LastName AS DriverLastName

FROM 
    Rides
JOIN 
    Riders ON Rides.RiderID = Riders.RiderID
JOIN 
    Drivers ON Rides.DriverID = Drivers.DriverID
WHERE 
    Rides.RideStatus = 'Cancelled';



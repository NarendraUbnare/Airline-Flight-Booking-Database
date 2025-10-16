CREATE DATABASE AirlineDB;
USE AirlineDB;

-- Airlines
CREATE TABLE Airlines (
    airline_id INT PRIMARY KEY,
    airline_name VARCHAR(100),
    country VARCHAR(100),
    iata_code VARCHAR(10)
);
-- Airports
CREATE TABLE Airports (
    airport_id INT PRIMARY KEY,
    airport_name VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100)
);

-- Flights
CREATE TABLE Flights (
    flight_id INT PRIMARY KEY,
    airline_id INT,
    flight_number VARCHAR(20) UNIQUE,
    departure_airport_id INT,
    arrival_airport_id INT,
    departure_time DATETIME,
    arrival_time DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id),
    FOREIGN KEY (departure_airport_id) REFERENCES Airports(airport_id),
    FOREIGN KEY (arrival_airport_id) REFERENCES Airports(airport_id)
);

-- Passengers
CREATE TABLE Passengers (
    passenger_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Bookings
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    flight_id INT,
    passenger_id INT,
    booking_date DATETIME,
    seat_class VARCHAR(20),
    status VARCHAR(20),
    FOREIGN KEY (flight_id) REFERENCES Flights(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);

-- Payments
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    payment_date DATETIME,
    amount DECIMAL(10,2),
    payment_method VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);


INSERT INTO Airlines (airline_id, airline_name, country, iata_code) VALUES
(1,'Air India','India','AI'),
(2,'Delta Airlines','USA','DL'),
(3,'Emirates','UAE','EK'),
(4,'British Airways','UK','BA'),
(5,'Singapore Airlines','Singapore','SQ'),
(6,'Qatar Airways','Qatar','QR'),
(7,'Lufthansa','Germany','LH'),
(8,'United Airlines','USA','UA'),
(9,'IndiGo','India','6E'),
(10,'SpiceJet','India','SG'),
(11,'Air France','France','AF'),
(12,'Turkish Airlines','Turkey','TK'),
(13,'Etihad Airways','UAE','EY'),
(14,'Japan Airlines','Japan','JL'),
(15,'Korean Air','South Korea','KE'),
(16,'American Airlines','USA','AA'),
(17,'Swiss Air','Switzerland','LX'),
(18,'Thai Airways','Thailand','TG'),
(19,'Malaysia Airlines','Malaysia','MH'),
(20,'Virgin Atlantic','UK','VS');

INSERT INTO Airports (airport_id, airport_name, city, country) VALUES
(1,'Indira Gandhi Intl','Delhi','India'),
(2,'Chhatrapati Shivaji Intl','Mumbai','India'),
(3,'John F. Kennedy Intl','New York','USA'),
(4,'Los Angeles Intl','Los Angeles','USA'),
(5,'Heathrow','London','UK'),
(6,'Dubai Intl','Dubai','UAE'),
(7,'Changi','Singapore','Singapore'),
(8,'Doha Hamad Intl','Doha','Qatar'),
(9,'Frankfurt Intl','Frankfurt','Germany'),
(10,'Paris Charles de Gaulle','Paris','France'),
(11,'Tokyo Haneda','Tokyo','Japan'),
(12,'Istanbul Airport','Istanbul','Turkey'),
(13,'Bangkok Suvarnabhumi','Bangkok','Thailand'),
(14,'Kuala Lumpur Intl','Kuala Lumpur','Malaysia'),
(15,'Zurich Airport','Zurich','Switzerland'),
(16,'Chicago O’Hare','Chicago','USA'),
(17,'Sydney Kingsford Smith','Sydney','Australia'),
(18,'Moscow Sheremetyevo','Moscow','Russia'),
(19,'Madrid Barajas','Madrid','Spain'),
(20,'Cape Town Intl','Cape Town','South Africa');

INSERT INTO Flights (flight_id, airline_id, flight_number, departure_airport_id, arrival_airport_id, departure_time, arrival_time, status) VALUES
(1,1,'AI202',1,3,'2024-06-01 08:00:00','2024-06-01 16:00:00','Scheduled'),
(2,2,'DL101',3,4,'2024-06-02 10:00:00','2024-06-02 14:00:00','Delayed'),
(3,3,'EK303',6,7,'2024-06-05 22:00:00','2024-06-06 06:00:00','Scheduled'),
(4,4,'BA404',5,3,'2024-06-07 09:00:00','2024-06-07 17:00:00','Scheduled'),
(5,5,'SQ505',7,10,'2024-06-10 13:00:00','2024-06-10 20:00:00','Cancelled'),
(6,6,'QR606',8,9,'2024-06-11 18:00:00','2024-06-11 22:00:00','Scheduled'),
(7,7,'LH707',9,10,'2024-06-12 06:00:00','2024-06-12 08:00:00','Scheduled'),
(8,8,'UA808',3,16,'2024-06-15 15:00:00','2024-06-15 19:00:00','Scheduled'),
(9,9,'6E909',1,2,'2024-06-20 07:00:00','2024-06-20 09:00:00','Scheduled'),
(10,10,'SG010',2,6,'2024-06-22 11:00:00','2024-06-22 15:00:00','Scheduled'),
(11,11,'AF111',10,5,'2024-06-25 14:00:00','2024-06-25 16:00:00','Scheduled'),
(12,12,'TK212',12,11,'2024-06-26 12:00:00','2024-06-26 20:00:00','Delayed'),
(13,13,'EY313',6,7,'2024-06-28 17:00:00','2024-06-28 23:00:00','Cancelled'),
(14,14,'JL414',11,3,'2024-07-01 09:00:00','2024-07-01 17:00:00','Scheduled'),
(15,15,'KE515',15,11,'2024-07-02 10:00:00','2024-07-02 16:00:00','Scheduled'),
(16,16,'AA616',16,3,'2024-07-05 08:00:00','2024-07-05 12:00:00','Scheduled'),
(17,17,'LX717',15,19,'2024-07-07 14:00:00','2024-07-07 19:00:00','Scheduled'),
(18,18,'TG818',13,14,'2024-07-09 22:00:00','2024-07-10 03:00:00','Scheduled'),
(19,19,'MH919',14,20,'2024-07-11 09:00:00','2024-07-11 16:00:00','Cancelled'),
(20,20,'VS020',5,17,'2024-07-15 07:00:00','2024-07-15 19:00:00','Scheduled');


INSERT INTO Passengers (passenger_id, first_name, last_name, email, phone) VALUES
(1,'John','Doe','john.doe@email.com','9000000001'),
(2,'Alice','Smith','alice.smith@email.com','9000000002'),
(3,'Robert','Brown','robert.brown@email.com','9000000003'),
(4,'Emma','Wilson','emma.wilson@email.com','9000000004'),
(5,'Liam','Taylor','liam.taylor@email.com','9000000005'),
(6,'Sophia','Davis','sophia.davis@email.com','9000000006'),
(7,'James','Miller','james.miller@email.com','9000000007'),
(8,'Olivia','Moore','olivia.moore@email.com','9000000008'),
(9,'William','Anderson','william.anderson@email.com','9000000009'),
(10,'Ava','Thomas','ava.thomas@email.com','9000000010'),
(11,'Ethan','Jackson','ethan.jackson@email.com','9000000011'),
(12,'Mia','White','mia.white@email.com','9000000012'),
(13,'Benjamin','Harris','benjamin.harris@email.com','9000000013'),
(14,'Charlotte','Martin','charlotte.martin@email.com','9000000014'),
(15,'Lucas','Garcia','lucas.garcia@email.com','9000000015'),
(16,'Amelia','Martinez','amelia.martinez@email.com','9000000016'),
(17,'Henry','Lee','henry.lee@email.com','9000000017'),
(18,'Isabella','Clark','isabella.clark@email.com','9000000018'),
(19,'Michael','Lewis','michael.lewis@email.com','9000000019'),
(20,'Evelyn','Walker','evelyn.walker@email.com','9000000020');

INSERT INTO Bookings (booking_id, flight_id, passenger_id, booking_date, seat_class, status) VALUES
(1,1,1,'2024-05-01 10:00:00','Economy','Confirmed'),
(2,1,2,'2024-05-02 11:00:00','Business','Confirmed'),
(3,2,3,'2024-05-03 12:00:00','Economy','Cancelled'),
(4,3,4,'2024-05-04 13:00:00','Business','Confirmed'),
(5,4,5,'2024-05-05 14:00:00','Economy','Confirmed'),
(6,5,6,'2024-05-06 15:00:00','Economy','Cancelled'),
(7,6,7,'2024-05-07 16:00:00','Business','Confirmed'),
(8,7,8,'2024-05-08 17:00:00','Economy','Confirmed'),
(9,8,9,'2024-05-09 18:00:00','Economy','Pending'),
(10,9,10,'2024-05-10 19:00:00','Economy','Confirmed'),
(11,10,11,'2024-05-11 20:00:00','Business','Confirmed'),
(12,11,12,'2024-05-12 21:00:00','Economy','Confirmed'),
(13,12,13,'2024-05-13 22:00:00','Business','Cancelled'),
(14,13,14,'2024-05-14 23:00:00','Economy','Confirmed'),
(15,14,15,'2024-05-15 09:00:00','Economy','Confirmed'),
(16,15,16,'2024-05-16 10:00:00','Business','Confirmed'),
(17,16,17,'2024-05-17 11:00:00','Economy','Pending'),
(18,17,18,'2024-05-18 12:00:00','Business','Confirmed'),
(19,18,19,'2024-05-19 13:00:00','Economy','Confirmed'),
(20,19,20,'2024-05-20 14:00:00','Business','Cancelled');

INSERT INTO Payments (payment_id, booking_id, payment_date, amount, payment_method) VALUES
(1,1,'2024-05-01 11:00:00',500.00,'Credit Card'),
(2,2,'2024-05-02 12:00:00',1200.00,'PayPal'),
(3,4,'2024-05-04 14:00:00',1500.00,'Credit Card'),
(4,5,'2024-05-05 15:00:00',400.00,'Cash'),
(5,7,'2024-05-07 17:00:00',1800.00,'Credit Card'),
(6,8,'2024-05-08 18:00:00',600.00,'PayPal'),
(7,10,'2024-05-10 20:00:00',700.00,'Credit Card'),
(8,11,'2024-05-11 21:00:00',2000.00,'Credit Card'),
(9,12,'2024-05-12 22:00:00',450.00,'Cash'),
(10,14,'2024-05-14 23:30:00',550.00,'PayPal'),
(11,15,'2024-05-15 10:30:00',1200.00,'Credit Card'),
(12,16,'2024-05-16 11:30:00',2500.00,'Credit Card'),
(13,18,'2024-05-18 12:30:00',1900.00,'Cash'),
(14,19,'2024-05-19 13:30:00',800.00,'PayPal'),
(15,6,'2024-05-06 16:30:00',0.00,'Cash'),
(16,3,'2024-05-03 13:30:00',0.00,'PayPal'),
(17,9,'2024-05-09 19:30:00',0.00,'Credit Card'),
(18,13,'2024-05-13 22:30:00',0.00,'PayPal'),
(19,20,'2024-05-20 15:00:00',0.00,'Cash'),
(20,17,'2024-05-17 12:30:00',0.00,'Credit Card');

-- Question 1. Find the Total Number of Bookings for Each Flight.
SELECT f.flight_number, COUNT(b.booking_id) AS total_bookings
FROM Flights f
LEFT JOIN Bookings b ON f.flight_id = b.flight_id
GROUP BY f.flight_number;

-- Question 2. List All Passengers Who Have Booked a Specific Flight Number 'AI202'.
SELECT p.first_name, p.last_name
FROM Passengers p
JOIN Bookings b ON p.passenger_id = b.passenger_id
JOIN Flights f ON b.flight_id = f.flight_id
WHERE f.flight_number = 'AI202';
 
-- Question 3. Find the Total Number of Flights Departing from a Specific Airport 'JFK'.
SELECT COUNT(*) AS total_flights
FROM Flights f
JOIN Airports a ON f.departure_airport_id = a.airport_id
WHERE a.airport_name = 'John F. Kennedy Intl';

-- Question 4. Find the Flight with the Most Passengers Booked (Most Popular Flight).
SELECT f.flight_number, COUNT(b.booking_id) AS passenger_count
FROM Flights f
JOIN Bookings b ON f.flight_id = b.flight_id
GROUP BY f.flight_number
ORDER BY passenger_count DESC
LIMIT 1;

-- Question 5. Get the Total Payment Amount for All Confirmed Bookings
SELECT SUM (p.amount) AS total_payments
FROM Payments p
JOIN Bookings b ON p.booking_id = b.booking_id
WHERE b.status = 'Confirmed';
 
-- Question 6. List All Flights Departing After a Specific Date and Time'2024-06-01 10:00:00'
SELECT flight_number, departure_time
FROM Flights
WHERE departure_time > '2024-06-01 10:00:00';

-- Question 7. Find the Number of Bookings Made in Each Seat Class.
SELECT seat_class, COUNT(*) AS total_bookings
FROM Bookings
GROUP BY seat_class;

-- Question 8. List All Flights That Have Been Cancelled.
SELECT flight_number, status
FROM Flights
WHERE status = 'Cancelled';

-- Question 9. Find the Average Payment Amount for Confirmed Bookings 
SELECT AVG(p.amount) AS avg_payment
FROM Payments p
JOIN Bookings b ON p.booking_id = b.booking_id
WHERE b.status = 'Confirmed';

-- Question 10. Get the Total Number of Bookings and Total Payment Amount for Each Passenger
SELECT p.passenger_id, p.first_name, p.last_name,
       COUNT(b.booking_id) AS total_bookings,
       SUM(pay.amount) AS total_payments
FROM Passengers p
LEFT JOIN Bookings b ON p.passenger_id = b.passenger_id
LEFT JOIN Payments pay ON b.booking_id = pay.booking_id
GROUP BY p.passenger_id, p.first_name, p.last_name;



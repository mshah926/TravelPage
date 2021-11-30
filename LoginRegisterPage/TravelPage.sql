create database if not exists TravelPage; 
use TravelPage;

--
-- Create table for airline company
--

CREATE TABLE IF NOT EXISTS airline_company (
    airlineID CHAR(2) NOT NULL,
    PRIMARY KEY (airlineID)
);

--
-- Create table for flight
--

create table if not exists flight (
	flightNumber int not null,
    type varchar(15) not null,
    waitingList varchar(150),
    availableSeats int not null,
    departureTime time,
    arrivalTime time,
    flightDate date,
    primary key (flightNumber)
);
--
-- Create table for airport
--

create table if not exists airport (
	airportID char(3),
    primary key (airportID)
);
--
-- Create table for customer
--

create table if not exists customer (
	SSN char(11),
    flightHistory varchar(300),
    passengerName_first varchar(30),
    passengerName_last varchar(30),
    primary key (SSN)
);
--
-- Create table for operated by
--

create table if not exists operated_by (
	airlineID char(2) not null,
    flightNumber int not null,
    primary key (airlineID, flightNumber),
    foreign key (airlineID) references airline_company(airlineID),
    foreign key (flightNumber) references flight(flightNumber)
);

--
-- Create table for buy flight ticket
--

create table if not exists buy_flight_ticket (
	IDNumber int,
    bookingFee double,
    totalFate double,
    class varchar(8),
    classFee double,
    seatNum varchar(3),
    purchaseTime time,
    purchaseDate date,
    SSN char(11),
    primary key (IDNumber),
    foreign key (SSN) references customer(SSN)
);

--
-- Create table for refers
--

create table if not exists refers (
	flightNumber int,
    IDNumber int,
    primary key (flightNumber, IDNumber),
    foreign key (flightNumber) references flight(flightNumber),
    foreign key (IDNumber) references buy_flight_ticket(IDNumber)
);
--
-- Create table for depart
--

create table if not exists depart (
	airportID char(3),
    flightNumber int,
    primary key (flightNumber),
    foreign key (flightNumber) references flight(flightNumber),
    foreign key (airportID) references airport(airportID)
);
--
-- Create table for arrive
--

create table if not exists arrive (
	airportID char(3),
    flightNumber int,
    primary key (flightNumber),
    foreign key (flightNumber) references flight(flightNumber),
    foreign key (airportID) references airport(airportID)
);
--
-- Create table for associated
--

create table if not exists associated (
	airlineID char(2),
    airportID char(3),
    primary key (airlineID, airportID),
    foreign key (airlineID) references airline_company(airlineID),
    foreign key (airportID) references airport(airportID)
);
--
-- Create table for aircraft owns
--

create table if not exists aircraft_owns (
	aircraftID int,
    numSeats int, 
	operationDays varchar(50),
    airlineID char(2),
    primary key (aircraftID)
);

--
-- Create table for users
--

create table if not exists users (
username varchar(50),
password varchar(50),
primary key (username)
);

insert into users values ("admin_user", "admin_password") on duplicate key update username = "admin_user", password = "admin_password";
insert into users values ("customer_rep1", "customer_rep1_password") on duplicate key update username = "customer_rep1", password = "customer_rep1_password";
insert into users values ("customer_rep2", "customer_rep2_password") on duplicate key update username = "customer_rep2", password = "customer_rep2_password";
insert into users values ("customer_rep3", "customer_rep3_password") on duplicate key update username = "customer_rep3", password = "customer_rep3_password";
insert into users values ("customer_rep4", "customer_rep4_password") on duplicate key update username = "customer_rep4", password = "customer_rep4_password";
insert into users values ("customer_rep5", "customer_rep5_password") on duplicate key update username = "customer_rep5", password = "customer_rep5_password";

select * from users;


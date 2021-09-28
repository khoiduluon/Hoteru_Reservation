create database Booking

use Booking

create table Customer(
	username nvarchar(50) primary key,
	password nvarchar(50) not null,
	fullname nvarchar(150) not null,
	phone nvarchar(12) not null,
	address nvarchar(100) not null,
	email nvarchar(100) not null,
	isAdmin bit not null
)

create table Comment(
	id int identity(1,1) primary key,
	username nvarchar(50) not null,
	room_id int not null,
	description nvarchar(max) not null
)

create table Bed(
	code varchar(5) primary key,
	name nvarchar(50) not null,
)

create table Room_Type(
	id int identity(1,1) primary key,
	name nvarchar(150) not null,
	price float not null,
	size float not null,
	capacity int not null,
	bed_code varchar(5) not null
)

create table Room(
	id int identity(1,1) primary key,
	roomtype_id int not null,
	thumbnail nvarchar(100) not null,
	image1 nvarchar(100) not null,
	image2 nvarchar(100) not null,
	image3 nvarchar(100) not null,
	image4 nvarchar(100) not null,
	description nvarchar(max) not null
)

create table Service(
	id int identity(1,1) primary key,
	name nvarchar(50) not null,
	price float not null,
	description nvarchar(max) not null
)

create table Room_Service(
	id int identity(1,1) primary key,
	room_id int not null,
	service_id int not null
)

create table Food(
	id int identity(1,1) primary key,
	name nvarchar(50) not null, 
	price float not null,
	description nvarchar(max) not null
)

create table Room_Food(
	id int identity(1,1) primary key,
	room_id int not null,
	food_id int not null
)

create table Booking(
	id int identity(1,1) primary key,
	username nvarchar(50) not null,
	room_id int not null,
	inDate date not null,
	outDate date not null,
	total float not null
)

ALTER TABLE Room_Type
ADD CONSTRAINT FK_RT_BED
FOREIGN KEY (bed_code)
REFERENCES Bed (code);

ALTER TABLE Room
ADD CONSTRAINT FK_ROOM_RT
FOREIGN KEY (roomtype_id)
REFERENCES Room_Type (id);

ALTER TABLE Comment
ADD CONSTRAINT FK_CMT_ROOM
FOREIGN KEY (room_id)
REFERENCES Room (id);

ALTER TABLE Booking
ADD CONSTRAINT FK_BOOK_ROOM
FOREIGN KEY (room_id)
REFERENCES Room (id);

ALTER TABLE Booking
ADD CONSTRAINT FK_BOOK_CUS
FOREIGN KEY (username)
REFERENCES Customer (username);

ALTER TABLE Comment
ADD CONSTRAINT FK_CMT_CUS
FOREIGN KEY (username)
REFERENCES Customer (username);

ALTER TABLE Room_Service
ADD CONSTRAINT FK_RS_ROOM
FOREIGN KEY (room_id)
REFERENCES Room (id);

ALTER TABLE Room_Service
ADD CONSTRAINT FK_RS_SERVICE
FOREIGN KEY (service_id)
REFERENCES Service (id);

ALTER TABLE Room_Food
ADD CONSTRAINT FK_RF_ROOM
FOREIGN KEY (room_id)
REFERENCES Room (id);

ALTER TABLE Room_Food
ADD CONSTRAINT FK_RF_FOOD
FOREIGN KEY (food_id)
REFERENCES Food (id);
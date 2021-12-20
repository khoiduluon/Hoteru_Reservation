create database Booking

use Booking

go
create table Customer(
	username nvarchar(50) primary key,
	password nvarchar(50) not null,
	fullname nvarchar(150) not null,
	phone nvarchar(12) not null,
	address nvarchar(100) null,
	email nvarchar(100) null,
	image nvarchar(100) null,
	role varchar(20) not null
)
go
create table Comment(
	id int identity(1,1) primary key,
	username nvarchar(50) not null,
	room_id varchar(20) not null,
	description nvarchar(max) not null
)
go
create table Bed(
	code varchar(5) primary key,
	name nvarchar(50) not null,
)
go
create table Room_Type(
	id varchar(20) primary key,
	name nvarchar(150) not null,
	price float not null,
	size float not null,
	capacity int not null,
	bed_code varchar(5) not null
)
go
create table Room(
	id varchar(20) primary key,
	name nvarchar(150) not null,
	roomtype_id varchar(20) not null,
	image1 nvarchar(100) null,
	image2 nvarchar(100) null,
	image3 nvarchar(100) null,
	image4 nvarchar(100) null,
	description nvarchar(max) not null
)
go
create table Service(
	id int identity(1,1) primary key,
	name nvarchar(50) not null,
	price float not null,
	description nvarchar(max) not null
)
go
create table Booking_Service(
	id int identity(1,1) primary key,
	booking_id int not null,
	service_id int not null
)
go
create table Food(
	id int identity(1,1) primary key,
	name nvarchar(50) not null, 
	price float not null,
	description nvarchar(max) not null
)
go
create table Booking_Food(
	id int identity(1,1) primary key,
	booking_id int not null,
	food_id int not null
)
go
create table Booking(
	id int identity(1,1) primary key,
	book_Date date not null,
	username nvarchar(50) not null,
	room_id varchar(20) not null,
	in_Date date not null,
	out_Date date not null,
	total float not null,
	fullname nvarchar(150) not null,
	phone nvarchar(12) not null,
	status nvarchar(30) not null
)
go
ALTER TABLE Room_Type
ADD CONSTRAINT FK_RT_BED
FOREIGN KEY (bed_code)
REFERENCES Bed (code);
go
ALTER TABLE Room
ADD CONSTRAINT FK_ROOM_RT
FOREIGN KEY (roomtype_id)
REFERENCES Room_Type (id);
go
ALTER TABLE Comment
ADD CONSTRAINT FK_CMT_ROOM
FOREIGN KEY (room_id)
REFERENCES Room (id);
go
ALTER TABLE Booking
ADD CONSTRAINT FK_BOOK_ROOM
FOREIGN KEY (room_id)
REFERENCES Room (id);
go
ALTER TABLE Booking
ADD CONSTRAINT FK_BOOK_CUS
FOREIGN KEY (username)
REFERENCES Customer (username);
go
ALTER TABLE Comment
ADD CONSTRAINT FK_CMT_CUS
FOREIGN KEY (username)
REFERENCES Customer (username);
go
ALTER TABLE Booking_Service
ADD CONSTRAINT FK_BS_BOOK
FOREIGN KEY (booking_id)
REFERENCES Booking (id);
go
ALTER TABLE Booking_Service
ADD CONSTRAINT FK_BS_SERVICE
FOREIGN KEY (service_id)
REFERENCES Service (id);
go
ALTER TABLE Booking_Food
ADD CONSTRAINT FK_BF_BOOK
FOREIGN KEY (booking_id)
REFERENCES Booking (id);
go
ALTER TABLE Booking_Food
ADD CONSTRAINT FK_BF_FOOD
FOREIGN KEY (food_id)
REFERENCES Food (id);

-----Insert data
GO
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [image], [role]) VALUES (N'admin', N'123', N'admin', N'0123456778', N'tổ 17 Đinh Tiên Hoàng', N'admin@gmail.com', N'default.png', N'Admin')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [image], [role]) VALUES (N'bichbtt', N'123', N'Bùi Thị Thu Bích', N'090486547', N'Tân An, Long An', N'bich@gmail.com', N'default.png', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [image], [role]) VALUES (N'Bne', N'123', N'Nguyễn Văn B', N'9999788789', N'TP Hồ Chí Minh', N'nguyenvanB@gmail.com', N'default.png', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [image], [role]) VALUES (N'daotn', N'123', N'Trần Ngọc Đào', N'88888456789', N'TP Hồ Chí Minh', N'daotn@gmail.com', N'default.png', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [image], [role]) VALUES (N'ngandhl', N'161200', N'Đoàn Huỳnh Long Ngân', N'4564564564', N'ngan@gmail.com', N'ngan@gmail.com', N'default.png', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [image], [role]) VALUES (N'nguyenvana', N'123', N'Nguyễn Văn A', N'123456789', N'TP Hồ Chí Minh', N'nguyenvanA@gmail.com', N'default.png', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [image], [role]) VALUES (N'phutn', N'123', N'Trần Ngọc Phú', N'034569770', N'Trảng Bom, Đồng Nai', N'phu@gmail.com', N'default.png', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [image], [role]) VALUES (N'thaontp', N'123', N'Nguyễn Thị Phương Thảo', N'45645645654', N'TP Hồ Chí Minh', N'thao@gmail.com', N'default.png', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [image], [role]) VALUES (N'trungth', N'123', N'Trần Hiếu Trung', N'0456654789', N'Bình Tân, TP Hồ Chí Minh', N'trung@gmail.com', N'default.png', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [image], [role]) VALUES (N'user', N'123', N'user', N'0123456778', N'tổ 14 Bùi Thị Xuân', N'user@gmail.com', N'default.png', N'Customer')
GO
INSERT [dbo].[Bed] ([code], [name]) VALUES (N'DB', N'Double Bed')
INSERT [dbo].[Bed] ([code], [name]) VALUES (N'EXB', N'Extra Bed')
INSERT [dbo].[Bed] ([code], [name]) VALUES (N'KSB', N'King size Bed')
INSERT [dbo].[Bed] ([code], [name]) VALUES (N'QSB', N'Queen size Bed')
INSERT [dbo].[Bed] ([code], [name]) VALUES (N'SB', N'Single Bed')
INSERT [dbo].[Bed] ([code], [name]) VALUES (N'SKSB', N'Super King size Bed')
GO
INSERT [dbo].[Room_Type] ([id], [name], [price], [size], [capacity], [bed_code]) VALUES (N'DLX', N'Deluxe Room', 790000, 30, 6, N'KSB')
INSERT [dbo].[Room_Type] ([id], [name], [price], [size], [capacity], [bed_code]) VALUES (N'STD', N'Standard Room', 500000, 18, 2, N'SB')
INSERT [dbo].[Room_Type] ([id], [name], [price], [size], [capacity], [bed_code]) VALUES (N'SUP', N'Superior Room', 735000, 22, 6, N'QSB')
INSERT [dbo].[Room_Type] ([id], [name], [price], [size], [capacity], [bed_code]) VALUES (N'SUT', N'Suite Room', 1260000, 80, 10, N'SKSB')
GO
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P001', N'ROOM 001 - FLOOR 1', N'DLX', N'room-2.jpg', N'room-4.jpg', N'room-img-28.jpg', N'room-img-32.jpg', N'Deluxe room is delicately designed, luxuriously furnished, fully furnished with modern amenities, wide glass windows covering the whole city, giving you a peaceful and pleasant space will be the choice for business people. and tourists.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P002', N'ROOM 002 - FLOOR 1', N'SUP', N'room-img-6.jpg', N'room-img-33.jpg', N'room-img-34.jpg', N'room-img-15.jpg', N'Superior Double or Twin rooms are luxuriously designed, cozy, luxurious and fully equipped, with a clear view to make you feel comfortable and at home.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P003', N'ROOM 003 - FLOOR 1', N'SUT', N'room-img-20.jpg', N'room-img-39.jpg', N'room-img-28.jpg', N'room-img-9.jpg', N'The Suite room is elegantly designed, fully furnished with modern amenities, with a beautiful view of West Lake, Red River and the city. The harmonious combination between the peaceful and airy space of the River and Lake and the luxurious rooms with dedicated and attentive hospitality will be the choice for business people and tourists.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P004', N'ROOM 004 - FLOOR 1', N'SUT', N'room-img-8.jpg', N'room-img-41.jpg', N'room-img-42.jpg', N'room-img-44.jpg', N'The most advanced room, the highest floor, equipped with special services, usually includes 1 living room, 1 bedroom, 2 wc, balcony with the best view.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P005', N'ROOM 005 - FLOOR 1', N'SUT', N'room-img-10.jpg', N'room-img-28.jpg', N'room-img-1.jpg', N'room-img-36.jpg', N'Royal Suit room.Royal bedroom, spacious bathroom, bathtub or shower corner, sleek shower.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P006', N'ROOM 006 - FLOOR 2', N'SUT', N'room-img-11.jpg', N'room-img-22.jpg', N'room-img-34.jpg', N'room-img-24.jpg', N' President Suite/Presidential Suite: The most expensive room in the hotel. Each hotel has only one presidential suite. Rooms with one or more bedrooms and living spaces that emphasize décor, premium amenities, and private services (for example, a butler for the duration of your stay). President Suite room area is usually in the range of 80 - 350 m2.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P007', N'ROOM 007 - FLOOR 2', N'DLX', N'room-img-12.jpg', N'room-img-26.jpg', N'room-img-27.jpg', N'room-img-28.jpg', N'Equipped with 2 single beds placed side by side, for 2 people. The desk in the room is also designed with business guests in mind. The area of ​​the Hollywood Twin Room is usually in the range of 32 - 40 m2.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P008', N'ROOM 008 - FLOOR 2', N'SUT', N'room-img-13.jpg', N'room-img-44.jpg', N'room-img-39.jpg', N'room-img-7.jpg', N'Mini Suite/Junior Suite: A single room with one bed and seating area. Sometimes the bedroom is separate from the living area. The area of ​​​​Junior Suite rooms is usually in the range of 60 - 80 m2.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P009', N'ROOM 009 - FLOOR 2', N'STD', N'room-img-16.jpg', N'room-img-34.jpg', N'room-img-35.jpg', N'room-img-36.jpg', N'Room for one person, equipped with a single bed. Single area is usually in the range of 37 - 45 m2.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P010', N'ROOM 010 - FLOOR 2', N'STD', N'room-img-18.jpg', N'room-img-38.jpg', N'room-img-39.jpg', N'room-img-43.jpg', N'Room for 2 people, equipped with a double bed, is called a queen size bed. Double room area is usually in the range of 40-45 m2.')
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (1, CAST(N'1970-01-01' AS Date), N'ngandhl', N'P002', CAST(N'2021-11-15' AS Date), CAST(N'2021-11-16' AS Date), 1938000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'CANCEL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (2, CAST(N'1970-01-01' AS Date), N'ngandhl', N'P010', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-24' AS Date), 740000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (3, CAST(N'1970-01-01' AS Date), N'ngandhl', N'P005', CAST(N'2021-11-17' AS Date), CAST(N'2021-11-17' AS Date), 3005000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (4, CAST(N'2021-11-15' AS Date), N'ngandhl', N'P008', CAST(N'2021-12-15' AS Date), CAST(N'2021-12-18' AS Date), 5370000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'PENDING')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (5, CAST(N'2021-11-15' AS Date), N'ngandhl', N'P001', CAST(N'2021-11-15' AS Date), CAST(N'2021-11-15' AS Date), 910000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (6, CAST(N'2021-11-17' AS Date), N'ngandhl', N'P006', CAST(N'2021-11-30' AS Date), CAST(N'2021-12-02' AS Date), 1729000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (7, CAST(N'2021-11-20' AS Date), N'ngandhl', N'P003', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 4664000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (8, CAST(N'2021-11-20' AS Date), N'ngandhl', N'P008', CAST(N'2021-12-20' AS Date), CAST(N'2021-12-20' AS Date), 5489000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'PENDING')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (9, CAST(N'2021-11-20' AS Date), N'phutn', N'P005', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 3640000, N'Trần Ngọc Phú', N'034569770', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (10, CAST(N'2021-11-20' AS Date), N'phutn', N'P002', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 2340000, N'Trần Ngọc Phú', N'034569770', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (11, CAST(N'2021-11-20' AS Date), N'trungth', N'P005', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 3615000, N'Trần Hiếu Trung', N'0456654789', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (12, CAST(N'2021-11-20' AS Date), N'trungth', N'P008', CAST(N'2021-12-25' AS Date), CAST(N'2021-12-28' AS Date), 3169000, N'Trần Hiếu Trung', N'0456654789', N'PENDING')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (13, CAST(N'2021-11-20' AS Date), N'trungth', N'P001', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 3350000, N'Trần Hiếu Trung', N'0456654789', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (14, CAST(N'2021-11-20' AS Date), N'bichbtt', N'P008', CAST(N'2021-12-10' AS Date), CAST(N'2021-12-14' AS Date), 5396000, N'Bùi Thị Thu Bích', N'090486547', N'PENDING')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (15, CAST(N'2021-11-20' AS Date), N'bichbtt', N'P004', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 3177000, N'Bùi Thị Thu Bích', N'090486547', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (16, CAST(N'2021-11-20' AS Date), N'thaontp', N'P008', CAST(N'2022-01-15' AS Date), CAST(N'2022-01-20' AS Date), 3575000, N'Nguyễn Thị Phương Thảo', N'45645645654', N'PENDING')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (17, CAST(N'2021-11-20' AS Date), N'thaontp', N'P001', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 3487000, N'Nguyễn Thị Phương Thảo', N'45645645654', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (18, CAST(N'2021-11-20' AS Date), N'daotn', N'P004', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 2918000, N'Trần Ngọc Đào', N'88888456789', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (19, CAST(N'2021-11-20' AS Date), N'nguyenvana', N'P010', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 950000, N'Nguyễn Văn A', N'123456789', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (20, CAST(N'2021-11-20' AS Date), N'Bne', N'P009', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 500000, N'Nguyễn Văn B', N'9999788789', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (21, CAST(N'2021-11-20' AS Date), N'Bne', N'P001', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 1219000, N'Nguyễn Văn B', N'9999788789', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (22, CAST(N'2021-01-26' AS Date), N'phutn', N'P001', CAST(N'2021-11-26' AS Date), CAST(N'2021-11-26' AS Date), 3648000, N'Trần Ngọc Phú', N'034569770', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (23, CAST(N'2021-06-26' AS Date), N'phutn', N'P005', CAST(N'2021-11-26' AS Date), CAST(N'2021-11-26' AS Date), 3266000, N'Trần Ngọc Phú', N'034569770', N'COMPLETED')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (25, CAST(N'2021-12-15' AS Date), N'ngandhl', N'P008', CAST(N'2022-02-03' AS Date), CAST(N'2022-02-09' AS Date), 8725000, N'Đoàn Huỳnh Long Ngân', N'4564564564', N'PENDING')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (26, CAST(N'2021-12-15' AS Date), N'ngandhl', N'P008', CAST(N'2022-02-23' AS Date), CAST(N'2022-02-28' AS Date), 7615000, N'Đoàn Huỳnh Long Ngân', N'4564564564', N'PENDING')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (27, CAST(N'2021-12-15' AS Date), N'ngandhl', N'P008', CAST(N'2021-12-22' AS Date), CAST(N'2021-12-24' AS Date), 2520000, N'Đoàn Huỳnh Long Ngân', N'4564564564', N'PENDING')
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [username], [room_id], [description]) VALUES (1, N'ngandhl', N'P001', N'The room is quite airy, fully equipped and the bed is also soft. Room with sea view')
INSERT [dbo].[Comment] ([id], [username], [room_id], [description]) VALUES (2, N'trungth', N'P001', N'The room is clean, comfortable and airy, the facilities are quite good')
INSERT [dbo].[Comment] ([id], [username], [room_id], [description]) VALUES (3, N'phutn', N'P001', N'The room is large, the double bed is quite comfortable for 2 people to sleep, I quite like the room because it has a balcony')
INSERT [dbo].[Comment] ([id], [username], [room_id], [description]) VALUES (4, N'ngandhl', N'P002', N'I feel quite good because the room is spacious, clean, the refrigerator has soft drinks')
INSERT [dbo].[Comment] ([id], [username], [room_id], [description]) VALUES (5, N'trungth', N'P002', N'The room is near the stairs, it is quite annoying when someone takes the stairs because they talk and make noise, the soundproofing is quite poor')
INSERT [dbo].[Comment] ([id], [username], [room_id], [description]) VALUES (6, N'phutn', N'P002', N'The door of the room was broken, I asked the milkman to make an appointment but when I went, it still hadn''t been fixed, I was quite upset about this')
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (1, N'Laundry', 50000, N'This is a service created to meet customers default and personal hygiene needs.')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (2, N'Airport shuttle', 100000, N'Airport shuttleservice main things is meet the increasing travel demand and desire to create the most comfortable experience for customers.')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (3, N'Self-drive motorbike rental', 150000, N'Meet the needs of free travel for customers, without time restrictions')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (4, N'Babysitting', 150000, N'Meet as young child care needs when customers can rest assured')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (5, N'Swimming for 4 seasons', 100000, N'The 4-season swimming pool can be used at all times according to customer needs')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (6, N'Karaoke', 150000, N'Karaoke room meets the singing needs of customers')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (7, N'Foreign currency exchange', 5000, N'Service to meet the needs of using and exchanging foreign currency customers')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (8, N'Meetings, offices', 1000000, N'Service of meeting rooms, halls to organize events such as birthdays, weddings, corporate events, seminars... The meeting rooms, accompanying events in the hotel range in size from a few dozen people to several hundred. people. In addition, here are also equipped with tables and chairs, sound and light to ensure the event goes well.')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (9, N'Bar Center', 500000, N'Meeting room services, halls to organize the bar serves drinks, music,... Meet the entertainment and relaxation needs of visitors.')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (10, N'Spa & massage', 500000, N'To meet the beauty needs of women, spa services have been opened more in recent years. These include: sauna, acne peeling, shampooing ...')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (11, N'Fitness center', 500000, N'Multi-purpose gyms or gyms are always places of interest to visitors. When traveling for work or travel, many people still want to ensure the progress of their workouts.')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Booking_Service] ON 

INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (1, 1, 7)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (2, 1, 8)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (3, 2, 1)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (4, 2, 2)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (5, 3, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (6, 3, 4)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (7, 4, 8)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (8, 4, 9)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (9, 5, 1)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (10, 6, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (11, 6, 4)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (12, 7, 1)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (13, 7, 2)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (14, 7, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (15, 7, 4)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (16, 7, 5)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (17, 7, 6)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (18, 7, 7)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (19, 7, 8)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (20, 7, 9)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (21, 8, 1)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (22, 8, 2)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (23, 8, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (24, 8, 4)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (25, 8, 8)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (26, 8, 9)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (27, 8, 10)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (28, 8, 11)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (29, 9, 2)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (30, 9, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (31, 9, 5)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (32, 9, 8)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (33, 9, 9)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (34, 10, 6)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (35, 10, 7)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (36, 10, 8)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (37, 11, 2)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (38, 11, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (39, 11, 8)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (40, 11, 10)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (41, 12, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (42, 12, 4)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (43, 12, 5)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (44, 12, 6)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (45, 12, 7)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (46, 12, 9)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (47, 13, 1)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (48, 13, 2)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (49, 13, 6)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (50, 13, 7)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (51, 13, 8)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (52, 13, 10)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (53, 14, 1)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (54, 14, 2)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (55, 14, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (56, 14, 4)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (57, 14, 5)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (58, 14, 6)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (59, 14, 7)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (60, 14, 8)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (61, 14, 9)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (62, 14, 10)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (63, 14, 11)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (64, 15, 2)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (65, 15, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (66, 15, 4)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (67, 15, 5)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (68, 15, 6)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (69, 15, 9)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (70, 15, 11)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (71, 16, 5)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (72, 16, 6)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (73, 16, 7)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (74, 16, 8)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (75, 16, 9)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (76, 17, 1)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (77, 17, 2)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (78, 17, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (79, 17, 6)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (80, 17, 7)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (81, 17, 8)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (82, 17, 10)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (83, 18, 1)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (84, 18, 2)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (85, 18, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (86, 18, 4)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (87, 18, 5)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (88, 18, 11)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (89, 19, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (90, 19, 4)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (91, 21, 1)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (92, 21, 2)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (93, 22, 1)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (94, 22, 2)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (95, 22, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (96, 22, 5)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (97, 22, 6)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (98, 22, 7)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (99, 22, 8)
GO
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (100, 22, 9)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (101, 23, 2)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (102, 23, 3)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (103, 23, 4)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (104, 23, 5)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (105, 23, 6)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (106, 23, 7)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (107, 23, 8)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (108, 25, 7)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (109, 25, 8)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (110, 26, 1)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (111, 26, 10)
INSERT [dbo].[Booking_Service] ([id], [booking_id], [service_id]) VALUES (112, 26, 11)
SET IDENTITY_INSERT [dbo].[Booking_Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (1, N'California Roll', 70000, N'California-style rice rolls')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (2, N'Eel Rice Roll', 90000, N'Eel Rice is a beloved Japanese dish consists of steamed rice topped with grilled eels that are glazed with a sweetened soy-based sauce (called tare) and caramelized, preferably over a charcoal fire.')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (3, N'Organic Salad W.Grilled Chicken Breast', 70000, N'Organic Sweet Gem Salad with Grilled Jidori Chicken Breast at Sapphire, Cellar. Craft. Cook. in Laguna Beach')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (4, N'Korean Beef Rice Roll', 80000, N'Korean seaweed rice rolls that are filled with Bulgogi (Korean marinated BBQ beef) and other vegetable fillings.')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (5, N'Korean Tuna Rice Roll', 70000, N'Spicy Tuna Kimbap. This popular tasty Korean nori wrapped roll contains spicy tuna, spinach, egg, carrots and seasoned rice')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (6, N'Club Sandwich', 90000, N'A club sandwich, also called a clubhouse sandwich, is a sandwich of bread (traditionally toasted), sliced cooked poultry, ham or fried bacon, lettuce, ...')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (7, N'Braised Chicken Feet With Abalone Sauce', 98000, N'Heat the pan with medium heat, add a little oil, add ginger, and garlic to saute. Add chicken feet and saute. Add oyster sauce, abalone sauce, soy sauce, soy sauce, rock sugar and 1000 ml of water to boil over medium to high heat. Add peanuts, cover the lid, and turn to medium and small heat for 1.5 hours.')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (8, N'Spinach Dumpling With Shrimp', 82000, N'A Chinese dim sum favorite of spinach and shrimp steamed in a wheat starch dumpling.')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (9, N'Prawn Dumpling', 99000, N'Har Gow is also known as Chinese Prawn Crystal Dumpling')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (10, N'Baked Bun With BBQ Pork', 70000, N'Brush with egg wash, sprinkle with sesame seeds (if using)')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (11, N'California Roll ver 2', 96000, N'California-style rice rolls but it special')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (12, N'Pork Dumling With Shrimp', 99000, N'In a large bowl set in a larger bowl of ice, combine the pork, shrimp, scallions, ginger, soy sauce and sesame oil. Season generously with salt and pepper.')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (13, N'Beancurd Skinroll With Shrimp', 86000, N'For this delicious, mouth watering - Steamed combination minced shrimp and ground pork roll in bean curd ...')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (14, N'Vegetable Fried Rice', 99000, N'Fried rice is a dish of cooked rice that has been stir-fried in a wok or a frying pan and is usually mixed with other ingredients such as eggs, vegetables, seafood, or meat. It is often eaten by itself or as an accompaniment to another dish.')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (15, N'Mango Pomelo Sago', 96000, N'The Chinese name of "mango pomelo sago"  comes from the concept of dropping manna from a willow branch which makes people feel refreshed when they taste it. It was also the secret tool of the Guanyin according to the traditional Chinese mythology Journey to the West.')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (16, N'California Roll ver 3', 70000, N'The main wrapped ingredients are the avocado and crab meat, or imitation crab (surimi crab), and the optional mayonnaise; these are all typically wrapped with seaweed, although soy paper can be used. The cucumber may have been used since the beginning, or added later, depending on the account. The inside-out roll may be sprinkled on the outside with sesame seeds; tobiko (flying fish roe), or masago (capelin roe) may be used.')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (17, N'Cantonse Chili Pork Wontons', 70000, N'This wonton recipe for Chinese New Year is a great representation of the mix of Chinese regional cuisine. Cantonese-Style pork and shrimp filling.')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (18, N'Steamed Minced Pork With Mushroom', 80000, N'Also known yuhk béng, steamed pork patty is one of the staples of traditional Cantonese home cooking')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (19, N'Steamed BBQ Pork Bun', 99000, N'Place each bun on a parchment paper square, and steam. I steamed the buns in two separate batches using a bamboo steamer.')
SET IDENTITY_INSERT [dbo].[Food] OFF
GO
SET IDENTITY_INSERT [dbo].[Booking_Food] ON 

INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (1, 1, 12)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (2, 1, 14)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (3, 2, 6)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (4, 3, 12)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (5, 3, 13)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (6, 4, 2)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (7, 5, 1)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (8, 6, 9)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (9, 6, 10)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (10, 7, 2)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (11, 7, 3)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (12, 7, 4)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (13, 7, 5)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (14, 7, 6)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (15, 7, 7)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (16, 7, 8)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (17, 7, 9)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (18, 7, 10)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (19, 7, 13)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (20, 7, 14)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (21, 7, 15)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (22, 7, 16)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (23, 7, 19)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (24, 8, 1)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (25, 8, 2)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (26, 8, 3)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (27, 8, 4)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (28, 8, 6)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (29, 8, 7)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (30, 8, 8)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (31, 8, 12)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (32, 8, 13)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (33, 8, 14)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (34, 8, 15)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (35, 8, 16)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (36, 8, 17)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (37, 8, 18)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (38, 8, 19)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (39, 9, 5)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (40, 9, 9)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (41, 9, 10)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (42, 9, 11)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (43, 9, 14)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (44, 9, 15)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (45, 10, 9)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (46, 10, 10)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (47, 10, 11)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (48, 10, 12)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (49, 10, 13)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (50, 11, 2)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (51, 11, 3)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (52, 11, 7)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (53, 11, 8)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (54, 11, 12)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (55, 11, 13)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (56, 11, 18)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (57, 12, 3)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (58, 12, 7)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (59, 12, 10)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (60, 12, 11)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (61, 12, 12)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (62, 12, 13)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (63, 12, 14)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (64, 12, 15)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (65, 12, 16)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (66, 12, 17)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (67, 13, 1)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (68, 13, 3)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (69, 13, 4)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (70, 13, 7)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (71, 13, 9)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (72, 13, 12)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (73, 13, 16)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (74, 13, 17)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (75, 13, 19)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (76, 14, 2)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (77, 14, 3)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (78, 14, 4)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (79, 14, 5)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (80, 14, 6)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (81, 14, 7)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (82, 14, 8)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (83, 14, 11)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (84, 14, 12)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (85, 14, 13)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (86, 14, 17)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (87, 15, 7)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (88, 15, 9)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (89, 15, 10)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (90, 16, 7)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (91, 16, 8)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (92, 16, 9)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (93, 16, 13)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (94, 16, 14)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (95, 16, 15)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (96, 17, 3)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (97, 17, 4)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (98, 17, 7)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (99, 17, 8)
GO
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (100, 17, 10)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (101, 17, 11)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (102, 17, 15)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (103, 17, 16)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (104, 17, 18)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (105, 18, 3)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (106, 18, 4)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (107, 18, 7)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (108, 18, 8)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (109, 18, 9)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (110, 18, 12)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (111, 18, 18)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (112, 19, 4)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (113, 19, 5)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (114, 21, 7)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (115, 21, 8)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (116, 21, 9)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (117, 22, 3)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (118, 22, 4)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (119, 22, 7)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (120, 22, 8)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (121, 22, 9)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (122, 22, 12)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (123, 22, 14)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (124, 22, 15)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (125, 22, 18)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (126, 23, 10)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (127, 23, 11)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (128, 23, 12)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (129, 23, 13)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (130, 25, 2)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (131, 25, 3)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (132, 26, 1)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (133, 26, 12)
INSERT [dbo].[Booking_Food] ([id], [booking_id], [food_id]) VALUES (134, 26, 15)
SET IDENTITY_INSERT [dbo].[Booking_Food] OFF
GO

create database Booking

use Booking

go
create table Customer(
	username nvarchar(50) primary key,
	password nvarchar(50) not null,
	fullname nvarchar(150) not null,
	phone nvarchar(12) not null,
	address nvarchar(100) not null,
	email nvarchar(100) not null,
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
	image1 nvarchar(100) not null,
	image2 nvarchar(100) not null,
	image3 nvarchar(100) not null,
	image4 nvarchar(100) not null,
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
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [role]) VALUES (N'admin', N'123', N'admin', N'0123456778', N'tổ 17 Đinh Tiên Hoàng', N'admin@gmail.com', N'Admin')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [role]) VALUES (N'bichbtt', N'123', N'Bùi Thị Thu Bích', N'090486547', N'Tân An, Long An', N'bich@gmail.com', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [role]) VALUES (N'Bne', N'123', N'Nguyễn Văn B', N'9999788789', N'TP Hồ Chí Minh', N'nguyenvanB@gmail.com', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [role]) VALUES (N'daotn', N'123', N'Trần Ngọc Đào', N'88888456789', N'TP Hồ Chí Minh', N'daotn@gmail.com', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [role]) VALUES (N'ngandhl', N'123', N'Đoàn Huỳnh Long Ngân', N'0998894560', N'Quận 12, TP Hồ Chí Minh', N'ngan@gmail.com', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [role]) VALUES (N'nguyenvana', N'123', N'Nguyễn Văn A', N'123456789', N'TP Hồ Chí Minh', N'nguyenvanA@gmail.com', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [role]) VALUES (N'phutn', N'123', N'Trần Ngọc Phú', N'034569770', N'Trảng Bom, Đồng Nai', N'phu@gmail.com', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [role]) VALUES (N'thaontp', N'123', N'Nguyễn Thị Phương Thảo', N'45645645654', N'TP Hồ Chí Minh', N'thao@gmail.com', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [role]) VALUES (N'trungth', N'123', N'Trần Hiếu Trung', N'0456654789', N'Bình Tân, TP Hồ Chí Minh', N'trung@gmail.com', N'Customer')
INSERT [dbo].[Customer] ([username], [password], [fullname], [phone], [address], [email], [role]) VALUES (N'user', N'123', N'user', N'0123456778', N'tổ 14 Bùi Thị Xuân', N'user@gmail.com', N'Customer')
GO
INSERT [dbo].[Bed] ([code], [name]) VALUES (N'DB', N'Double Bed')
INSERT [dbo].[Bed] ([code], [name]) VALUES (N'EXB', N'Extra Bed')
INSERT [dbo].[Bed] ([code], [name]) VALUES (N'KSB', N'King size Bed')
INSERT [dbo].[Bed] ([code], [name]) VALUES (N'QSB', N'Queen size Bed')
INSERT [dbo].[Bed] ([code], [name]) VALUES (N'SB', N'Single Bed')
INSERT [dbo].[Bed] ([code], [name]) VALUES (N'SKSB', N'Super King size Bed')
GO
INSERT [dbo].[Room_Type] ([id], [name], [price], [size], [capacity], [bed_code]) VALUES (N'DLX', N'Phòng deluxe', 790000, 30, 6, N'KSB')
INSERT [dbo].[Room_Type] ([id], [name], [price], [size], [capacity], [bed_code]) VALUES (N'STD', N'Phòng standard', 500000, 18, 2, N'SB')
INSERT [dbo].[Room_Type] ([id], [name], [price], [size], [capacity], [bed_code]) VALUES (N'SUP', N'Phòng superior', 735000, 22, 6, N'QSB')
INSERT [dbo].[Room_Type] ([id], [name], [price], [size], [capacity], [bed_code]) VALUES (N'SUT', N'Phòng suite', 1260000, 80, 10, N'SKSB')
GO
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P001', N'Phòng 001 - Lầu 1', N'DLX', N'img01', N'img02', N'img03', N'img04', N'Phòng Deluxe được thiết kế tinh tế sang trọng nội thất đầy đủ tiện nghi hiện đại, cửa sổ kính rộng thoáng bao quát toàn cảnh thành phố mang đến cho bạn một không gian thanh bình và dễ chịu sẽ là sự lựa chọn cho những doanh nhân và khách du lịch.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P002', N'Phòng 002 - Lầu 1', N'SUP', N'img05', N'img06', N'img07', N'img08', N'Phòng Superior Double hay Twin được thiết kế sang trọng ấm cúng sang trọng và đầy đủ tiện nghi, tầm nhìn thoáng khiến bạn cảm thấy dễ chịu thoải mái như ở nhà.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P003', N'Phòng 003 - Lầu 1', N'SUT', N'img09', N'img010', N'img011', N'img012', N'Phòng Suit được thiết kế tinh tế sang trọng nội thất đầy đủ tiện nghi hiện đại, tầm nhìn rộng đẹp bao quát Hồ Tây, Sông Hồng và cảnh thành phố. Sự kết hợp hài hòa giữa không gian yên bình và thoáng đãng của Sông, Hồ và những căn phòng sang trọng cùng với lòng hiếu khách tận tình, chu đáo sẽ là sự lựa chọn cho những doanh nhân và khách du lịch.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P004', N'Phòng 004 - Lầu 1', N'SUT', N'img13', N'img014', N'img015', N'img016', N'Phòng cao cấp nhất, tầng cao nhất, trang bị cùng dịch vụ đặc biệt, thường gồm 1 phòng khách, 1 phòng ngủ, 2 wc, ban công hướng đẹp nhất. ')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P005', N'Phòng 005 - Lầu 1', N'SUT', N'img017', N'img018', N'img019', N'img020', N'Royal Suit room.Phòng ngủ vương giả, phòng tắm rộng rãi, bồn tắm hoặc góc tắm, vòi sen kiểu dáng đẹp.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P006', N'Phòng 006 - Lầu 2', N'SUT', N'img021', N'img022', N'img023', N'img024', N' President Suite/Presidential Suite (Phòng tổng thống): Căn phòng đắt nhất trong khách sạn. Mỗi khách sạn chỉ có duy nhất một phòng tổng thống. Phòng có một hoặc nhiều phòng ngủ và không gian sống nhấn mạnh vào phong cách trang trí, tiện nghi cao cấp và dịch vụ riêng (ví dụ một quản gia trong suốt thời gian lưu trú). Diện tích phòng President Suite thường nằm trong khoảng 80 – 350 m2.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P007', N'Phòng 007 - Lầu 2', N'DLX', N'img021', N'img022', N'img023', N'img024', N'Được trang bị 2 giường đơn đặt cạnh nhau, cho 2 người ở. Bàn làm việc trong phòng đồng thời được thiết kế với ý tưởng cho khách kinh doanh. Diện tích phòng Hollywood Twin Room thường nằm trong khoảng 32 – 40 m2.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P008', N'Phòng 008 - Lầu 2', N'SUT', N'img025', N'img026', N'img027', N'img028', N'Mini Suite/Junior Suite: Một phòng đơn với một giường ngủ và khu vực ngồi tiếp khách. Đôi khi phòng ngủ tách biệt hẳn với khu vực tiếp khách. Diện tích phòng Junior Suite thường nằm trong khoảng 60 – 80 m2.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P009', N'Phòng 009 - Lầu 2', N'STD', N'img025', N'img026', N'img027', N'img028', N'Phòng dành cho một người, được trang bị một giường đơn. Diện tích Single thường nằm trong khoảng 37 – 45 m2.')
INSERT [dbo].[Room] ([id], [name], [roomtype_id], [image1], [image2], [image3], [image4], [description]) VALUES (N'P010', N'Phòng 010 - Lầu 2', N'STD', N'img029', N'img030', N'img031', N'img032', N'Phòng dành cho 2 người, được trang bị một giường đôi, được gọi là giường cỡ Queen. Diện tích phòng Double thường nằm trong khoảng 40 – 45 m2.')
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (1, CAST(N'1970-01-01' AS Date), N'ngandhl', N'P002', CAST(N'2021-11-15' AS Date), CAST(N'2021-11-16' AS Date), 1938000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (2, CAST(N'1970-01-01' AS Date), N'ngandhl', N'P010', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-24' AS Date), 740000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (3, CAST(N'1970-01-01' AS Date), N'ngandhl', N'P005', CAST(N'2021-11-17' AS Date), CAST(N'2021-11-17' AS Date), 3005000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (4, CAST(N'2021-11-15' AS Date), N'ngandhl', N'P008', CAST(N'2021-11-15' AS Date), CAST(N'2021-11-18' AS Date), 5370000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (5, CAST(N'2021-11-15' AS Date), N'ngandhl', N'P001', CAST(N'2021-11-15' AS Date), CAST(N'2021-11-15' AS Date), 910000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (6, CAST(N'2021-11-17' AS Date), N'ngandhl', N'P006', CAST(N'2021-11-30' AS Date), CAST(N'2021-12-02' AS Date), 1729000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (7, CAST(N'2021-11-20' AS Date), N'ngandhl', N'P003', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 4664000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (8, CAST(N'2021-11-20' AS Date), N'ngandhl', N'P008', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 5489000, N'Đoàn Huỳnh Long Ngân', N'0998894560', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (9, CAST(N'2021-11-20' AS Date), N'phutn', N'P005', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 3640000, N'Trần Ngọc Phú', N'034569770', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (10, CAST(N'2021-11-20' AS Date), N'phutn', N'P002', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 2340000, N'Trần Ngọc Phú', N'034569770', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (11, CAST(N'2021-11-20' AS Date), N'trungth', N'P005', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 3615000, N'Trần Hiếu Trung', N'0456654789', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (12, CAST(N'2021-11-20' AS Date), N'trungth', N'P008', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 3169000, N'Trần Hiếu Trung', N'0456654789', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (13, CAST(N'2021-11-20' AS Date), N'trungth', N'P001', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 3350000, N'Trần Hiếu Trung', N'0456654789', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (14, CAST(N'2021-11-20' AS Date), N'bichbtt', N'P008', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 5396000, N'Bùi Thị Thu Bích', N'090486547', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (15, CAST(N'2021-11-20' AS Date), N'bichbtt', N'P004', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 3177000, N'Bùi Thị Thu Bích', N'090486547', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (16, CAST(N'2021-11-20' AS Date), N'thaontp', N'P008', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 3575000, N'Nguyễn Thị Phương Thảo', N'45645645654', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (17, CAST(N'2021-11-20' AS Date), N'thaontp', N'P001', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 3487000, N'Nguyễn Thị Phương Thảo', N'45645645654', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (18, CAST(N'2021-11-20' AS Date), N'daotn', N'P004', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 2918000, N'Trần Ngọc Đào', N'88888456789', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (19, CAST(N'2021-11-20' AS Date), N'nguyenvana', N'P010', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 950000, N'Nguyễn Văn A', N'123456789', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (20, CAST(N'2021-11-20' AS Date), N'Bne', N'P009', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 500000, N'Nguyễn Văn B', N'9999788789', N'NORMAL')
INSERT [dbo].[Booking] ([id], [book_Date], [username], [room_id], [in_Date], [out_Date], [total], [fullname], [phone], [status]) VALUES (21, CAST(N'2021-11-20' AS Date), N'Bne', N'P001', CAST(N'2021-11-20' AS Date), CAST(N'2021-11-20' AS Date), 1219000, N'Nguyễn Văn B', N'9999788789', N'NORMAL')
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([id], [username], [room_id], [description]) VALUES (1, N'ngandhl', N'P001', N'Phòng khá thoáng, đầy đủ tiện nghi và giường ngủ cũng êm. Phòng có view biển xịn')
INSERT [dbo].[Comment] ([id], [username], [room_id], [description]) VALUES (2, N'trungth', N'P001', N'Phòng sạch sẽ, tiện nghi và thông thoáng, tiện nghi khá tốt')
INSERT [dbo].[Comment] ([id], [username], [room_id], [description]) VALUES (3, N'phutn', N'P001', N'Phòng rộng, giường đôi khá thoải mái cho 2 người ngủ, tôi khá thích phòng vì có ban công')
INSERT [dbo].[Comment] ([id], [username], [room_id], [description]) VALUES (4, N'ngandhl', N'P002', N'Tôi thấy khá ổn vì phòng rộng rãi, sạch sẽ, tủ lạnh có nước giải khát')
INSERT [dbo].[Comment] ([id], [username], [room_id], [description]) VALUES (5, N'trungth', N'P002', N'Phòng gần cầu thang, khá khó chịu mỗi khi có người đi cầu thang vì họ nói chuyện làm ồn, cách âm khá kém')
INSERT [dbo].[Comment] ([id], [username], [room_id], [description]) VALUES (6, N'phutn', N'P002', N'Của phòng bị hỏng, kêu người sữa thì hẹn nhưng lúc đi vẫn chưa sửa, tôi khá khó chịu về điều này')
SET IDENTITY_INSERT [dbo].[Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (1, N'Giặt ủi quần áo', 50000, N'Đây là dịch vụ được tạo ra nhằm đáp ứng nhu cầu vệ sinh cá nhân và mặc của khách hàng.')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (2, N'Xe đưa đón sân bay', 100000, N'Dịch vụ xe đưa đón nhằm đáp ứng nhu cầu di chuyển ngày càng cao và mong muốn tạo được trải nghiệm thoải mái nhất cho khách hàng.')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (3, N'Cho thuê xe máy tự lái', 150000, N'Đáp ứng nhu cầu đi lại tự do cho khách hàng,không hạn chế giờ giấc')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (4, N'Trông trẻ', 150000, N'Đáp ứng như cầu chăm sóc trẻ nhỏ khi khách hàng để khách hàng có thể an tâm nghĩ dưỡng')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (5, N'Bơi 4 mùa', 100000, N'Bể bơi 4 mùa có thể sử dụng mọi lúc theo nhu cầu khách hàng')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (6, N'Karaoke', 150000, N'Phòng Karaoke đáp ứng nhu cầu ca hát của khách hàng')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (7, N'Thu đổi ngoại tệ', 5000, N'Dịch vụ đáp ứng nhu cầu sử dụng,đổi trả các loại tiền ngoại tệ khách hàng')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (8, N'Hội họp, văn phòng', 1000000, N'Dịch vụ phòng họp, hội trường để tổ chức các sự kiện như sinh nhật, đám cưới, event công ty, hội thảo… Các phòng họp, sự kiện đi kèm trong khách sạn có quy mô từ nhỏ từ vài chục người đến vài trăm người. Ngoài ra ở đây còn được trang bị bàn ghế, âm thanh, ánh sáng để đảm bảo sự kiện diễn ra tốt đẹp.')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (9, N'Quầy bar', 500000, N'Quầy bar đều phục vụ thức uống, nhạc,... đáp ứng nhu cầu giải trí, thư giãn của du khách.')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (10, N'Spa và massage', 500000, N'Để đáp ứng nhu cầu làm đẹp của các chị em phụ nữ, các dịch vụ Spa được mở ra nhiều hơn trong những năm gần đây. Bao gồm: xông hơi, lột mụn, gội đầu ...')
INSERT [dbo].[Service] ([id], [name], [price], [description]) VALUES (11, N'Fitness center', 500000, N'Các phòng tập thể dục đa năng hay các phòng tập gym luôn là nơi được du khách quan tâm. Khi đi công tác hay du lịch nhưng nhiều người vẫn muốn đảm bảo tiến độ tập luyện cho cơ thể mình')
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
SET IDENTITY_INSERT [dbo].[Booking_Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Food] ON 

INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (1, N'California Roll', 70000, N'Cơm cuộn kiểu California')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (2, N'Eel Rice Roll', 90000, N'Cơm cuộn Lươn')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (3, N'Organic Salad W.Grilled Chicken Breast', 70000, N'Sa lát hữu cơ cùng lườn gà nướng')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (4, N'Korean Beef Rice Roll', 80000, N'Cơm cuộn bò kiểu Hàn Quốc')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (5, N'Korean Tuna Rice Roll', 70000, N'Cơm cuộn cá ngừ kiểu Hàn Quốc')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (6, N'Club Sandwich', 90000, N'Bánh mì kẹp')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (7, N'Braised Chicken Feet With Abalonse Sauce', 98000, N'Chân Gà Om Số Bào Ngư')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (8, N'Spinach Dumpling With Shrimp', 82000, N'Há cảo chân rau vịt và tôm')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (9, N'Prawn Dumpling', 99000, N'Há cảo tôm')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (10, N'Baked Bun With BBQ Pork', 70000, N'Bánh thịt nướng BBQ')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (11, N'California Roll', 96000, N'Cơm cuộn kiểu California')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (12, N'Pork Dumling With Shrimp', 99000, N'Xíu mại tôm và thịt heo')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (13, N'Beancurd Skinroll With Shrimp', 86000, N'Đậu hủ chiên giòn nhân tôm')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (14, N'Vegetable Fried Rice', 99000, N'Cơm rang chay')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (15, N'Mango Pomelo Sago', 96000, N'Chè trân châu xoài và bưởi')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (16, N'California Roll', 70000, N'Cơm cuộn kiểu California')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (17, N'Cantonse Chili Pork Wontons', 70000, N'Vằn thắng cay Quảng Đông')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (18, N'Steamed Minced Pork With Mushroom', 80000, N'Xíu mại thịt heo với nấm')
INSERT [dbo].[Food] ([id], [name], [price], [description]) VALUES (19, N'Steamed BBQ Pork Bun', 99000, N'Bánh bao xá xíu')
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
SET IDENTITY_INSERT [dbo].[Booking_Food] OFF
create database Booking

use master
drop database Booking
 
go
use Booking
go
create table Customer(
	username nvarchar(50) primary key,
	password nvarchar(50) not null,
	fullname nvarchar(150) not null,
	phone nvarchar(12) not null,
	address nvarchar(100) not null,
	email nvarchar(100) not null,
	isAdmin bit not null
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
	roomtype_id varchar(20) not null,
	thumbnail nvarchar(100) not null,
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
create table Room_Service(
	id int identity(1,1) primary key,
	room_id varchar(20) not null,
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
create table Room_Food(
	id int identity(1,1) primary key,
	room_id varchar(20) not null,
	food_id int not null
)
go
create table Booking(
	id int identity(1,1) primary key,
	username nvarchar(50) not null,
	room_id varchar(20) not null,
	inDate date not null,
	outDate date not null,
	total float not null
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
ALTER TABLE Room_Service
ADD CONSTRAINT FK_RS_ROOM
FOREIGN KEY (room_id)
REFERENCES Room (id);
go
ALTER TABLE Room_Service
ADD CONSTRAINT FK_RS_SERVICE
FOREIGN KEY (service_id)
REFERENCES Service (id);
go
ALTER TABLE Room_Food
ADD CONSTRAINT FK_RF_ROOM
FOREIGN KEY (room_id)
REFERENCES Room (id);
go
ALTER TABLE Room_Food
ADD CONSTRAINT FK_RF_FOOD
FOREIGN KEY (food_id)
REFERENCES Food (id);

--insert customer
go
insert into Customer values ('user','1111','user','0123456778',N'tổ 14 Bùi Thị Xuân','user@gmail.com',0)
insert into Customer values ('admin','1111','admin','0123456778',N'tổ 17 Đinh Tiên Hoàng','admin@gmail.com',1)

--insert bed
go
insert into Bed values ('SB','Single Bed')
insert into Bed values ('DB','Double Bed')
insert into Bed values ('QSB','Queen size Bed')
insert into Bed values ('KSB','King size Bed')
insert into Bed values ('SKSB','Super King size Bed')
insert into Bed values ('EXB','Extra Bed')


--insert room type
insert into Room_Type values ('STD','Phòng standard',500000,18.0,2,'SB')
insert into Room_Type values ('SUP','Phòng superior',735000,22.0,6,'QSB')
insert into Room_Type values ('SUT','Phòng suite',1260000 ,80.0,10,'SKSB')
insert into Room_Type values ('DLX','Phòng deluxe',790000,30.0,6,'KSB')

--insert Food
insert into Food values ('California Roll',70000,N'Cơm cuộn kiểu California')
insert into Food values ('Eel Rice Roll',90000,N'Cơm cuộn Lươn')
insert into Food values ('Organic Salad W.Grilled Chicken Breast',70000,N'Sa lát hữu cơ cùng lườn gà nướng')
insert into Food values ('Korean Beef Rice Roll',80000,N'Cơm cuộn bò kiểu Hàn Quốc')
insert into Food values ('Korean Tuna Rice Roll',70000,N'Cơm cuộn cá ngừ kiểu Hàn Quốc')
insert into Food values ('Club Sandwich',90000,N'Bánh mì kẹp')
insert into Food values ('Braised Chicken Feet With Abalonse Sauce',98000,N'Chân Gà Om Số Bào Ngư')
insert into Food values ('Spinach Dumpling With Shrimp',82000,N'Há cảo chân rau vịt và tôm')
insert into Food values ('Prawn Dumpling',99000,N'Há cảo tôm')
insert into Food values ('Baked Bun With BBQ Pork',70000,N'Bánh thịt nướng BBQ')
insert into Food values ('California Roll',96000,N'Cơm cuộn kiểu California')
insert into Food values ('Pork Dumling With Shrimp',99000,N'Xíu mại tôm và thịt heo')
insert into Food values ('Beancurd Skinroll With Shrimp',86000,N'Đậu hủ chiên giòn nhân tôm')
insert into Food values ('Vegetable Fried Rice',99000,N'Cơm rang chay')
insert into Food values ('Mango Pomelo Sago',96000,N'Chè trân châu xoài và bưởi')
insert into Food values ('California Roll',70000,N'Cơm cuộn kiểu California')
insert into Food values ('Cantonse Chili Pork Wontons',70000,N'Vằn thắng cay Quảng Đông')
insert into Food values ('Steamed Minced Pork With Mushroom',80000,N'Xíu mại thịt heo với nấm')
insert into Food values ('Steamed BBQ Pork Bun',99000,N'Bánh bao xá xíu')

--insert service
insert into Service values (N'Dịch vụ giặt ủi quần áo',50000,N'Đây là dịch vụ được tạo ra nhằm đáp ứng nhu cầu vệ sinh cá nhân và mặc của khách hàng.')
insert into Service values (N'Dịch vụ xe đưa đón sân bay',100000,N'Dịch vụ xe đưa đón nhằm đáp ứng nhu cầu di chuyển ngày càng cao và mong muốn tạo được trải nghiệm thoải mái nhất cho khách hàng.')
insert into Service values (N'Dịch vụ cho thuê xe máy tự lái',150000,N'Đáp ứng nhu cầu đi lại tự do cho khách hàng,không hạn chế giờ giấc')
insert into Service values (N'Dịch vụ trông trẻ',150000,N'Đáp ứng như cầu chăm sóc trẻ nhỏ khi khách hàng để khách hàng có thể an tâm nghĩ dưỡng')
insert into Service values (N'Bơi 4 mùa',100000,N'Bể bơi 4 mùa có thể sử dụng mọi lúc theo nhu cầu khách hàng')
insert into Service values (N'Dịch vụ karaoke',150000,N'Phòng Karaoke đáp ứng nhu cầu ca hát của khách hàng')
insert into Service values (N'Dịch vụ thu đổi ngoại tệ',5000,N'Dịch vụ đáp ứng nhu cầu sử dụng,đổi trả các loại tiền ngoại tệ khách hàng')
insert into Service values (N'Dịch vụ hội họp, văn phòng',1000000,N'Dịch vụ phòng họp, hội trường để tổ chức các sự kiện như sinh nhật, đám cưới, event công ty, hội thảo… Các phòng họp, sự kiện đi kèm trong khách sạn có quy mô từ nhỏ từ vài chục người đến vài trăm người. Ngoài ra ở đây còn được trang bị bàn ghế, âm thanh, ánh sáng để đảm bảo sự kiện diễn ra tốt đẹp.')
insert into Service values (N'Quầy bar',500000,N'Quầy bar đều phục vụ thức uống, nhạc,... đáp ứng nhu cầu giải trí, thư giãn của du khách.')
insert into Service values (N'Dịch vụ Spa',500000,N'Để đáp ứng nhu cầu làm đẹp của các chị em phụ nữ, các dịch vụ Spa được mở ra nhiều hơn trong những năm gần đây. Bao gồm: xông hơi, lột mụn, gội đầu ...')
insert into Service values (N'Fitness center',500000,N'Các phòng tập thể dục đa năng hay các phòng tập gym luôn là nơi được du khách quan tâm. Khi đi công tác hay du lịch nhưng nhiều người vẫn muốn đảm bảo tiến độ tập luyện cho cơ thể mình')





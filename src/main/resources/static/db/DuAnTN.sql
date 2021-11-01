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
	username nvarchar(50) not null,
	room_id varchar(20) not null,
	inDate date not null,
	outDate date not null,
	total float not null,
	fullname nvarchar(150) not null,
	phone nvarchar(12) not null 
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

--insert customer
go
insert into Customer values ('user','1111','user','0123456778',N'tổ 14 Bùi Thị Xuân','user@gmail.com','Customer')
insert into Customer values ('admin','1111','admin','0123456778',N'tổ 17 Đinh Tiên Hoàng','admin@gmail.com','Admin')
insert into Customer values ('ngandhl','1111',N'Đoàn Huỳnh Long Ngân','0998894560',N'Quận 12, TP Hồ Chí Minh','ngan@gmail.com','Customer')
insert into Customer values ('trungth','1111',N'Trần Hiếu Trung','0456654789',N'Bình Tân, TP Hồ Chí Minh','trung@gmail.com','Customer')
insert into Customer values ('phutn','1111',N'Trần Ngọc Phú','034569770',N'Trảng Bom, Đồng Nai','phu@gmail.com','Customer')
insert into Customer values ('bichbtt','1111',N'Bùi Thị Thu Bích','090486547',N'Tân An, Long An','bich@gmail.com','Customer')

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


--insert room
insert into Room values ('P001',N'Phòng 001 - Lầu 1','DLX','img01','img02','img03','img04',N'Phòng Deluxe được thiết kế tinh tế sang trọng nội thất đầy đủ tiện nghi hiện đại, cửa sổ kính rộng thoáng bao quát toàn cảnh thành phố mang đến cho bạn một không gian thanh bình và dễ chịu sẽ là sự lựa chọn cho những doanh nhân và khách du lịch.')
insert into Room values ('P002',N'Phòng 002 - Lầu 1','SUP','img05','img06','img07','img08',N'Phòng Superior Double hay Twin được thiết kế sang trọng ấm cúng sang trọng và đầy đủ tiện nghi, tầm nhìn thoáng khiến bạn cảm thấy dễ chịu thoải mái như ở nhà.')
insert into Room values ('P003',N'Phòng 003 - Lầu 1','SUT','img09','img010','img011','img012',N'Phòng Suit được thiết kế tinh tế sang trọng nội thất đầy đủ tiện nghi hiện đại, tầm nhìn rộng đẹp bao quát Hồ Tây, Sông Hồng và cảnh thành phố. Sự kết hợp hài hòa giữa không gian yên bình và thoáng đãng của Sông, Hồ và những căn phòng sang trọng cùng với lòng hiếu khách tận tình, chu đáo sẽ là sự lựa chọn cho những doanh nhân và khách du lịch.')
insert into Room values ('P004',N'Phòng 004 - Lầu 1','SUT','img13','img014','img015','img016',N'Phòng cao cấp nhất, tầng cao nhất, trang bị cùng dịch vụ đặc biệt, thường gồm 1 phòng khách, 1 phòng ngủ, 2 wc, ban công hướng đẹp nhất. ')
insert into Room values ('P005',N'Phòng 005 - Lầu 1','SUT','img017','img018','img019','img020',N'Royal Suit room.Phòng ngủ vương giả, phòng tắm rộng rãi, bồn tắm hoặc góc tắm, vòi sen kiểu dáng đẹp.')
insert into Room values ('P006',N'Phòng 006 - Lầu 2','SUT','img021','img022','img023','img024',N' President Suite/Presidential Suite (Phòng tổng thống): Căn phòng đắt nhất trong khách sạn. Mỗi khách sạn chỉ có duy nhất một phòng tổng thống. Phòng có một hoặc nhiều phòng ngủ và không gian sống nhấn mạnh vào phong cách trang trí, tiện nghi cao cấp và dịch vụ riêng (ví dụ một quản gia trong suốt thời gian lưu trú). Diện tích phòng President Suite thường nằm trong khoảng 80 – 350 m2.')
insert into Room values ('P007',N'Phòng 007 - Lầu 2','DLX','img021','img022','img023','img024',N'Được trang bị 2 giường đơn đặt cạnh nhau, cho 2 người ở. Bàn làm việc trong phòng đồng thời được thiết kế với ý tưởng cho khách kinh doanh. Diện tích phòng Hollywood Twin Room thường nằm trong khoảng 32 – 40 m2.')
insert into Room values ('P008',N'Phòng 008 - Lầu 2','SUT','img025','img026','img027','img028',N'Mini Suite/Junior Suite: Một phòng đơn với một giường ngủ và khu vực ngồi tiếp khách. Đôi khi phòng ngủ tách biệt hẳn với khu vực tiếp khách. Diện tích phòng Junior Suite thường nằm trong khoảng 60 – 80 m2.')
insert into Room values ('P009',N'Phòng 009 - Lầu 2','STD','img025','img026','img027','img028',N'Phòng dành cho một người, được trang bị một giường đơn. Diện tích Single thường nằm trong khoảng 37 – 45 m2.')
insert into Room values ('P010',N'Phòng 010 - Lầu 2','STD','img029','img030','img031','img032',N'Phòng dành cho 2 người, được trang bị một giường đôi, được gọi là giường cỡ Queen. Diện tích phòng Double thường nằm trong khoảng 40 – 45 m2.')

--insert comment
insert into Comment(username,room_id,description) values('ngandhl','P001',N'Phòng khá thoáng, đầy đủ tiện nghi và giường ngủ cũng êm. Phòng có view biển xịn');
insert into Comment(username,room_id,description) values('trungth','P001',N'Phòng sạch sẽ, tiện nghi và thông thoáng, tiện nghi khá tốt');
insert into Comment(username,room_id,description) values('phutn','P001',N'Phòng rộng, giường đôi khá thoải mái cho 2 người ngủ, tôi khá thích phòng vì có ban công');
insert into Comment(username,room_id,description) values('ngandhl','P002',N'Tôi thấy khá ổn vì phòng rộng rãi, sạch sẽ, tủ lạnh có nước giải khát');
insert into Comment(username,room_id,description) values('trungth','P002',N'Phòng gần cầu thang, khá khó chịu mỗi khi có người đi cầu thang vì họ nói chuyện làm ồn, cách âm khá kém');
insert into Comment(username,room_id,description) values('phutn','P002',N'Của phòng bị hỏng, kêu người sữa thì hẹn nhưng lúc đi vẫn chưa sửa, tôi khá khó chịu về điều này');
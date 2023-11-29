-- Author: Nguyen Cong Thuan
-- Database: thuan_tourist
-- Date created: 2023/11/04
----------------------------------SQL----------------------------------
-- DROP DATABASE thuan_tourist;
-- CREATE DATABASE thuan_tourist;

-- Table categories
CREATE TABLE categories (
    id serial PRIMARY KEY,
    name character varying (100),
    parent_id integer,
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table tourist_segments
CREATE TABLE tourist_segments (
    id serial PRIMARY KEY,
    name character varying (200),
    parent_id integer,
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table additional_services
CREATE TABLE additional_services (
    id serial PRIMARY KEY,
    name character varying (200),
    "desc" text,
	price numeric(18, 0),
	img_path text,
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table roles
CREATE TABLE roles (
    id serial PRIMARY KEY,
    name character varying (50),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table province
CREATE TYPE area_type AS ENUM ('Miền Bắc', 'Miền Trung', 'Miền Nam');
CREATE TABLE province (
    id serial PRIMARY KEY,
    name character varying (100),
	area area_type,
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table district
CREATE TABLE district (
    id serial PRIMARY KEY,
    name character varying (100),
	province_id integer REFERENCES province(id),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table wards
CREATE TABLE wards (
    id serial PRIMARY KEY,
    name character varying (100),
	district_id integer REFERENCES district(id),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table types _transportation
CREATE TABLE types_transportation (
    id serial PRIMARY KEY,
    name character varying (200),
    parent_id integer,
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table users
CREATE TYPE gender_user_type AS ENUM ('Nam', 'Nữ');
CREATE TYPE status_user_type AS ENUM ('Hoạt động', 'Đã khóa', 'Không hoạt động');
CREATE TABLE users (
    id serial PRIMARY KEY,
    role_id integer REFERENCES roles(id),
	full_name character varying(100),
	email character varying(100),
	phone_number character varying(15),
	avatar_path text,
	province_id integer REFERENCES province(id),
	district_id integer REFERENCES district(id),
	ward_id integer REFERENCES wards(id),
	address character varying(300),
	gender gender_user_type,
	status status_user_type,
	password text,
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table notifications
CREATE TABLE notifications (
    id serial PRIMARY KEY,
    title character varying (150),
    message character varying (3000),
	sender_id integer REFERENCES users(id),
	receiver_id integer REFERENCES users(id),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table news
CREATE TYPE status_news_type AS ENUM ('Đã xuất bản', 'Tạm thời ẩn');
CREATE TYPE news_type AS ENUM ('Tin tức', 'Cẩm nang');
CREATE TABLE news (
    id serial PRIMARY KEY,
    author_id integer REFERENCES users(id),
    title character varying (200),
	body text,
	view_count integer,
	status status_news_type,
	type news_type,
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table bank_accounts
CREATE TYPE bank_name AS ENUM ('VietcomBank', 'Techcombank', 'Vietinbank', 'MB', 'Agribank', 'ACB');
CREATE TABLE bank_accounts (
    id serial PRIMARY KEY,
    bank_name bank_name,
	atm_card_number character varying (30),
	pin character varying (50),
	cardholder_name character varying (100),
	expiry_date character varying (20),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table tours
CREATE TABLE tours (
    id serial PRIMARY KEY,
    type_transportation_id integer REFERENCES types_transportation(id),
	from_province_id integer REFERENCES province(id),
	to_province_id integer REFERENCES province(id),
	title character varying (200),
	number_of_day smallint,
	itinerary_highlight text,
	policy text,
	note text,
	adult_ticket_price character varying (30),
	child_ticket_price character varying (30),
	infant_ticket_price character varying (30),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table category_details
CREATE TABLE category_details (
    category_id integer REFERENCES categories(id),
    tour_id integer REFERENCES tours(id),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP,
	PRIMARY KEY (category_id, tour_id)
);
-- Table segment_details
CREATE TABLE segment_details (
    tourist_segment_id integer REFERENCES tourist_segments(id),
    tour_id integer REFERENCES tours(id),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP,
	PRIMARY KEY (tourist_segment_id, tour_id)
);
-- Table service_details
CREATE TABLE service_details (
    additional_services_id integer REFERENCES additional_services(id),
    tour_id integer REFERENCES tours(id),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP,
	PRIMARY KEY (additional_services_id, tour_id)
);
-- Table food_spots
CREATE TYPE food_spot_type AS ENUM ('Nhà hàng', 'Quán ăn đường phố', 'Quán cà phê');
CREATE TABLE food_spots (
    id serial PRIMARY KEY,
	name character varying(200),
	menu text, 
	address character varying(500),
	phone_number character varying(20),
	email character varying(100),
	type food_spot_type,
	location_map text,
	opening_hours character varying(200),
	province_id integer REFERENCES province(id),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table hotel_spots
CREATE TYPE hotel_spot_type AS ENUM ('Khách sạn', 'Khu nghỉ dưỡng', 'Nhà nghỉ');
CREATE TABLE hotel_spots (
    id serial PRIMARY KEY,
	name character varying(200),
	address character varying(500),
	phone_number character varying(20),
	email character varying(100),
	type hotel_spot_type,
	location_map text,
	province_id integer REFERENCES province(id),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table schedules
CREATE TABLE schedules (
    id serial PRIMARY KEY,
	tour_id integer REFERENCES tours(id),
	day	smallint,
	title character varying(200),
	body text,
	food_spot_id character varying(300),
	hotel_spot_id character varying(300),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table images
CREATE TYPE image_type AS ENUM ('Tin tức', 'Tour', 'Lịch trình tour');
CREATE TABLE images (
    id serial PRIMARY KEY,
	foreign_key_1 integer,
	foreign_key_2 integer,
	img_name character varying(200),
	path text,
	type image_type,
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table ratings
CREATE TYPE status_rating_type AS ENUM ('Chờ duyệt – Không hiển thị', 'Đã duyệt – Hiển thị');
CREATE TABLE ratings (
    id serial PRIMARY KEY,
	reviewer integer REFERENCES users(id),
	responder integer REFERENCES users(id),
	tour_id integer REFERENCES tours(id),
	star_count smallint,
	message text,
	message_response text,
	status status_rating_type,
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table periods
CREATE TABLE periods (
    id serial PRIMARY KEY,
	tour_id integer REFERENCES tours(id),
	departure_time character varying(20),
	arrival_time character varying(20),
	quantity smallint,
	maximum_quantity smallint,
	tourist_guide_id integer REFERENCES users(id),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table transportation
CREATE TABLE transportation (
    id serial PRIMARY KEY,
	type_transportation_id integer REFERENCES types_transportation(id),
	name character varying(200),
	distance character varying(100),
	departure_time character varying(30),
	arrival_time character varying(30),
	from_location character varying(100),
	to_location character varying(100),
	quantity smallint,
	maximum_quantity smallint,
	ticket_class character varying(100),
	seat character varying(100),
	price numeric(18, 0),
	"desc" text,
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table reservations
CREATE TYPE status_reservation_type AS ENUM ('Chờ thanh toán', 'Chờ xác nhận', 'Chờ đặt phương tiện', 'Hoàn thành');
CREATE TABLE reservations (
    id serial PRIMARY KEY,
	tour_period_id integer REFERENCES periods(id),
	bank_account_id integer REFERENCES bank_accounts(id),
	user_id integer REFERENCES users(id),
	transportation_id integer REFERENCES transportation (id),
	adult_ticket_quantity smallint,
	child_ticket_quantity smallint,
	infant_ticket_quantity smallint,
	additional_service_id integer REFERENCES additional_services (id),
	additional_service_quantity smallint,
	total_amount numeric(18, 0),
	status status_reservation_type,
	order_date character varying(30),
	otp_code character varying(20),
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table customer_details
CREATE TABLE customer_details (
    id serial PRIMARY KEY,
	reservation_id integer REFERENCES reservations(id),
	full_name character varying(100),
	phone_number character varying(20),
	email character varying(100),
	province_id integer REFERENCES province(id),
	address text,
	ordinal_number smallint,
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);

----------------------------------INSERT DATA----------------------------------
-- Table roles
INSERT INTO roles (name, created_at)
VALUES
    ('Khách hàng thành viên', CURRENT_DATE),
	('Nhân viên điều hành tour', CURRENT_DATE),
	('Hướng dẫn viên du lịch', CURRENT_DATE),
	('Nhà quản lý', CURRENT_DATE);
-- Table users
INSERT INTO users (role_id, full_name, email, phone_number, gender, status, password, created_at)
VALUES
    (4, 'Công Thuận Admin', 'admin@gmail.com','0909091233', 'Nam', 'Hoạt động', '$2y$10$w5xJK8Q2AI5PrUuSP.ObROwPRQNcDefy2evjuxrYFuaZ2kkqJFMZy', CURRENT_DATE),
	(2, 'Thuận Nguyễn DHT', 'dieuhanhtour@gmail.com','0909091233', 'Nam', 'Hoạt động', '$2y$10$w5xJK8Q2AI5PrUuSP.ObROwPRQNcDefy2evjuxrYFuaZ2kkqJFMZy', CURRENT_DATE),
	(3, 'Thuận HDV', 'hdv@gmail.com','0909091233', 'Nam', 'Hoạt động', '$2y$10$w5xJK8Q2AI5PrUuSP.ObROwPRQNcDefy2evjuxrYFuaZ2kkqJFMZy', CURRENT_DATE);
-- Table categories
INSERT INTO categories (name, parent_id, created_at)
VALUES 
	('Ngắn ngày', null, CURRENT_DATE), -- từ 1 đến 2 ngày
	('Dài ngày', null, CURRENT_DATE), -- từ 3 ngày trở lên
	('Phổ Thông', 2, CURRENT_DATE),
	('Mạo hiểm - Phượt', 1, CURRENT_DATE),
	('Văn Hóa và Lịch Sử', 2, CURRENT_DATE),
	('Ẩm Thực và Gia vị', 2, CURRENT_DATE),
	('Sinh Thái và Bảo Tồn Môi Trường', 2, CURRENT_DATE),
	('Theo Chuỗi Sự Kiện', 2, CURRENT_DATE),
	('Mua sắm', 2, CURRENT_DATE);
-- Table tourist_segments
INSERT INTO tourist_segments (name, parent_id, created_at)
VALUES 
	('Khách cá nhân', null, CURRENT_DATE),
	('Khách đoàn', null, CURRENT_DATE),
	('Cặp đôi', null, CURRENT_DATE),
	('Gia đình', 2, CURRENT_DATE),
	('Doanh nghiệp - Hội nghị', 2, CURRENT_DATE);
-- Table types_transportation
INSERT INTO types_transportation (name, parent_id, created_at)
VALUES 
	('Hàng không', null, CURRENT_DATE),
	('Xe khách', null, CURRENT_DATE),
	('Hàng không Vietnam Airlines', 1, CURRENT_DATE),
	('Hàng không Vietnam Vietjet Air', 1, CURRENT_DATE),
	('Xe khách Thành Bưởi', 2, CURRENT_DATE),
	('Xe khách phương trang', 2, CURRENT_DATE);
-- Table additional_services
INSERT INTO additional_services (name, "desc", price, img_path, created_at)
VALUES 
	('Phụ thu phòng đơn', '- Áp dụng cho khách ngủ 1 mình 1 phòng.', 1200000, '/src/assets/images/add-service.jpeg', CURRENT_DATE),
	('Thẻ SIM và Internet', '- Cung cấp SIM điện thoại di động hoặc dịch vụ internet để du khách có thể liên lạc và truy cập thông tin dễ dàng hơn.', 250000, '/src/assets/images/add-service.jpeg', CURRENT_DATE),
	('Dịch Vụ Spa và Wellness', '- Dịch vụ tập trung vào thư giãn và sức khỏe, bao gồm liệu pháp spa, yoga.', 890000, '/src/assets/images/add-service.jpeg', CURRENT_DATE);
-- Table hotel_spots
INSERT INTO hotel_spots (name, address, phone_number, email, type, location_map, province_id, created_at)
VALUES 
	('Khách sạn Mường Thanh Luxury Đà Nẵng', '270 Võ Nguyên Giáp Ngu Hanh Son District, My An, Đà Nẵng, Việt Nam', '0543543345', 'muongthanh@gmail.com', 'Khách sạn', 'google.map', 32, CURRENT_DATE),
	('Golden Lotus Grand Da Nang', '86 Lê Quang Đạo, Đà Nẵng, Việt Nam', '0435436685', 'golden@gmail.com', 'Khách sạn', 'google.map', 32, CURRENT_DATE),
	('InterContinental Danang Sun Peninsula Resort', 'Bai Bac, SonTra Peninsula, Danang', '0876543345', 'sunpeninsula@gmail.com', 'Khách sạn', 'google.map', 32, CURRENT_DATE);
-- Table food_spots
INSERT INTO food_spots (name, menu, address, phone_number, email, type, location_map, opening_hours, province_id, created_at)
VALUES 
	('Bún chả cá bà bé', 'Riêu chả, chả cá, riêu cua, cá ngừ, trứng cá', '120 Trần Cao Vân - TP.Đà Nẵng', '0653653787', 'babe@gmail.com', 'Quán ăn đường phố', 'google.map', '17h - 23h Hằng ngày', 32, CURRENT_DATE),
	('The Third House', 'Các loại cà phê rang xay', '142/3 Lê Độ Tam Thuận, Thanh Khê, Đà Nẵng', '0654345612', 'capheviet@gmail.com', 'Quán cà phê', 'google.map', '8h00 - 23h Hằng ngày', 33, CURRENT_DATE),
	('Chả cá Phượng', 'Riêu chả, chả cá, riêu cua', 'Điện Dương - Điện Bàn - Quảng Nam', '0657645764', 'bunphuong@gmail.com', 'Quán ăn đường phố', 'google.map', '5h30 - 10h Sáng Hằng ngày', 33, CURRENT_DATE),
	('Cá Chuồn Cồ Vietnamese Restaurant', 'Cà phê, Món ăn Kiểu Á, Kiểu Việt, Quốc tế', '99 Võ Nguyên Giáp Mỹ An, Ngũ Hành Sơn, Đà Nẵng', '0765433245', 'cachuon@gmail.com', 'Nhà hàng', 'google.map', '7h30 - 22h Hằng ngày', 32, CURRENT_DATE);
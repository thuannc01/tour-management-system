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
	img_url text,
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
-- Table ward 
CREATE TABLE ward (
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
	avatar_url text,
	province_id integer REFERENCES province(id),
	district_id integer REFERENCES district(id),
	ward_id integer REFERENCES ward(id),
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
-- Table schedules
CREATE TABLE schedules (
    id serial PRIMARY KEY,
	tour_id integer REFERENCES tours(id),
	day	smallint,
	title character varying(200),
	body text,
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
	url text,
	type image_type,
    created_at TIMESTAMP,
	updated_at TIMESTAMP,
	deleted_at TIMESTAMP
);
-- Table ratings
CREATE TABLE ratings (
    id serial PRIMARY KEY,
	reviewer integer REFERENCES users(id),
	responder integer REFERENCES users(id),
	tour_id integer REFERENCES tours(id),
	star_count smallint,
	message character varying(5000),
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
	adult_ticket_price numeric(18, 0),
	child_ticket_price numeric(18, 0),
	infant_ticket_price numeric(18, 0),
	quantity smallint,
	maximum_quantity smallint,
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
	('Nhà quản lý', CURRENT_DATE);
-- Table users
INSERT INTO users (role_id, full_name, email, phone_number, gender, status, password)
VALUES
    (3, 'Nguyễn Công Thuận', 'thuan@gmail.com','0909091233', 'Nam', 'Hoạt động', '123123');






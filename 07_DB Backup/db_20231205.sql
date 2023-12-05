PGDMP     -                    {            thuan_tourist    15.2    15.2 �    %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    49201    thuan_tourist    DATABASE     �   CREATE DATABASE thuan_tourist WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Vietnamese_Vietnam.1258';
    DROP DATABASE thuan_tourist;
                postgres    false            �           1247    49233 	   area_type    TYPE     c   CREATE TYPE public.area_type AS ENUM (
    'Miền Bắc',
    'Miền Trung',
    'Miền Nam'
);
    DROP TYPE public.area_type;
       public          postgres    false            �           1247    49366 	   bank_name    TYPE     �   CREATE TYPE public.bank_name AS ENUM (
    'VietcomBank',
    'Techcombank',
    'Vietinbank',
    'MB',
    'Agribank',
    'ACB'
);
    DROP TYPE public.bank_name;
       public          postgres    false            �           1247    49456    food_spot_type    TYPE     w   CREATE TYPE public.food_spot_type AS ENUM (
    'Nhà hàng',
    'Quán ăn đường phố',
    'Quán cà phê'
);
 !   DROP TYPE public.food_spot_type;
       public          postgres    false            �           1247    49278    gender_user_type    TYPE     G   CREATE TYPE public.gender_user_type AS ENUM (
    'Nam',
    'Nữ'
);
 #   DROP TYPE public.gender_user_type;
       public          postgres    false            �           1247    49478    hotel_spot_type    TYPE     q   CREATE TYPE public.hotel_spot_type AS ENUM (
    'Khách sạn',
    'Khu nghỉ dưỡng',
    'Nhà nghỉ'
);
 "   DROP TYPE public.hotel_spot_type;
       public          postgres    false            �           1247    49514 
   image_type    TYPE     a   CREATE TYPE public.image_type AS ENUM (
    'Tin tức',
    'Tour',
    'Lịch trình tour'
);
    DROP TYPE public.image_type;
       public          postgres    false            �           1247    49346 	   news_type    TYPE     L   CREATE TYPE public.news_type AS ENUM (
    'Tin tức',
    'Cẩm nang'
);
    DROP TYPE public.news_type;
       public          postgres    false            �           1247    49340    status_news_type    TYPE     b   CREATE TYPE public.status_news_type AS ENUM (
    'Đã xuất bản',
    'Tạm thời ẩn'
);
 #   DROP TYPE public.status_news_type;
       public          postgres    false            �           1247    49654    status_rating_type    TYPE     �   CREATE TYPE public.status_rating_type AS ENUM (
    'Chờ duyệt – Không hiển thị',
    'Đã duyệt – Hiển thị'
);
 %   DROP TYPE public.status_rating_type;
       public          postgres    false            �           1247    49586    status_reservation_type    TYPE     �   CREATE TYPE public.status_reservation_type AS ENUM (
    'Chờ thanh toán',
    'Chờ xác nhận',
    'Chờ đặt phương tiện',
    'Hoàn thành'
);
 *   DROP TYPE public.status_reservation_type;
       public          postgres    false            �           1247    49284    status_user_type    TYPE     u   CREATE TYPE public.status_user_type AS ENUM (
    'Hoạt động',
    'Đã khóa',
    'Không hoạt động'
);
 #   DROP TYPE public.status_user_type;
       public          postgres    false                       1255    49707 %   convert_to_integer(character varying)    FUNCTION     u  CREATE FUNCTION public.convert_to_integer(input_str character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE
    result INTEGER;
BEGIN
    input_str := REPLACE(REPLACE(input_str, ' ₫', ''), '.', '');
    BEGIN
        result := input_str::INTEGER;
    EXCEPTION
        WHEN OTHERS THEN
            result := NULL; 
    END;

    RETURN result;
END;
$$;
 F   DROP FUNCTION public.convert_to_integer(input_str character varying);
       public          postgres    false            �            1259    49217    additional_services    TABLE     '  CREATE TABLE public.additional_services (
    id integer NOT NULL,
    name character varying(200),
    "desc" text,
    price numeric(18,0),
    img_path text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 '   DROP TABLE public.additional_services;
       public         heap    postgres    false            �            1259    49216    additional_services_id_seq    SEQUENCE     �   CREATE SEQUENCE public.additional_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.additional_services_id_seq;
       public          postgres    false    219            )           0    0    additional_services_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.additional_services_id_seq OWNED BY public.additional_services.id;
          public          postgres    false    218            �            1259    49380    bank_accounts    TABLE     �  CREATE TABLE public.bank_accounts (
    id integer NOT NULL,
    bank_name public.bank_name,
    atm_card_number character varying(30),
    pin character varying(50),
    cardholder_name character varying(100),
    expiry_date character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 !   DROP TABLE public.bank_accounts;
       public         heap    postgres    false    932            �            1259    49379    bank_accounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bank_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.bank_accounts_id_seq;
       public          postgres    false    237            *           0    0    bank_accounts_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.bank_accounts_id_seq OWNED BY public.bank_accounts.id;
          public          postgres    false    236            �            1259    49203 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(100),
    parent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    49202    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    215            +           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    214            �            1259    49410    category_details    TABLE     �   CREATE TABLE public.category_details (
    category_id integer NOT NULL,
    tour_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 $   DROP TABLE public.category_details;
       public         heap    postgres    false                       1259    49628    customer_details    TABLE     �  CREATE TABLE public.customer_details (
    id integer NOT NULL,
    reservation_id integer,
    full_name character varying(100),
    phone_number character varying(20),
    email character varying(100),
    province_id integer,
    address text,
    ordinal_number smallint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 $   DROP TABLE public.customer_details;
       public         heap    postgres    false                       1259    49627    customer_details_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.customer_details_id_seq;
       public          postgres    false    258            ,           0    0    customer_details_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.customer_details_id_seq OWNED BY public.customer_details.id;
          public          postgres    false    257            �            1259    49247    district    TABLE     �   CREATE TABLE public.district (
    id integer NOT NULL,
    name character varying(100),
    province_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.district;
       public         heap    postgres    false            �            1259    49246    district_id_seq    SEQUENCE     �   CREATE SEQUENCE public.district_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.district_id_seq;
       public          postgres    false    225            -           0    0    district_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.district_id_seq OWNED BY public.district.id;
          public          postgres    false    224            �            1259    49464 
   food_spots    TABLE     �  CREATE TABLE public.food_spots (
    id integer NOT NULL,
    name character varying(200),
    menu text,
    address character varying(500),
    phone_number character varying(20),
    email character varying(100),
    type public.food_spot_type,
    location_map text,
    opening_hours character varying(200),
    province_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.food_spots;
       public         heap    postgres    false    950            �            1259    49463    food_spots_id_seq    SEQUENCE     �   CREATE SEQUENCE public.food_spots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.food_spots_id_seq;
       public          postgres    false    244            .           0    0    food_spots_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.food_spots_id_seq OWNED BY public.food_spots.id;
          public          postgres    false    243            �            1259    49486    hotel_spots    TABLE     �  CREATE TABLE public.hotel_spots (
    id integer NOT NULL,
    name character varying(200),
    address character varying(500),
    phone_number character varying(20),
    email character varying(100),
    type public.hotel_spot_type,
    location_map text,
    province_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.hotel_spots;
       public         heap    postgres    false    956            �            1259    49485    hotel_spots_id_seq    SEQUENCE     �   CREATE SEQUENCE public.hotel_spots_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hotel_spots_id_seq;
       public          postgres    false    246            /           0    0    hotel_spots_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.hotel_spots_id_seq OWNED BY public.hotel_spots.id;
          public          postgres    false    245            �            1259    49522    images    TABLE     B  CREATE TABLE public.images (
    id integer NOT NULL,
    foreign_key_1 integer,
    foreign_key_2 integer,
    img_name character varying(200),
    path text,
    type public.image_type,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.images;
       public         heap    postgres    false    965            �            1259    49521    images_id_seq    SEQUENCE     �   CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.images_id_seq;
       public          postgres    false    250            0           0    0    images_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;
          public          postgres    false    249            �            1259    49352    news    TABLE     Y  CREATE TABLE public.news (
    id integer NOT NULL,
    author_id integer,
    title character varying(200),
    body text,
    view_count integer,
    status public.status_news_type,
    type public.news_type,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.news;
       public         heap    postgres    false    926    923            �            1259    49351    news_id_seq    SEQUENCE     �   CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.news_id_seq;
       public          postgres    false    235            1           0    0    news_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;
          public          postgres    false    234            �            1259    49321    notifications    TABLE     :  CREATE TABLE public.notifications (
    id integer NOT NULL,
    title character varying(150),
    message character varying(3000),
    sender_id integer,
    receiver_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 !   DROP TABLE public.notifications;
       public         heap    postgres    false            �            1259    49320    notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.notifications_id_seq;
       public          postgres    false    233            2           0    0    notifications_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;
          public          postgres    false    232            �            1259    49555    periods    TABLE     x  CREATE TABLE public.periods (
    id integer NOT NULL,
    tour_id integer,
    departure_time character varying(20),
    arrival_time character varying(20),
    quantity smallint,
    maximum_quantity smallint,
    tourist_guide_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.periods;
       public         heap    postgres    false            �            1259    49554    periods_id_seq    SEQUENCE     �   CREATE SEQUENCE public.periods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.periods_id_seq;
       public          postgres    false    252            3           0    0    periods_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.periods_id_seq OWNED BY public.periods.id;
          public          postgres    false    251            �            1259    49240    province    TABLE     �   CREATE TABLE public.province (
    id integer NOT NULL,
    name character varying(100),
    area public.area_type,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.province;
       public         heap    postgres    false    896            �            1259    49239    province_id_seq    SEQUENCE     �   CREATE SEQUENCE public.province_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.province_id_seq;
       public          postgres    false    223            4           0    0    province_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.province_id_seq OWNED BY public.province.id;
          public          postgres    false    222                       1259    49684    ratings    TABLE     k  CREATE TABLE public.ratings (
    id integer NOT NULL,
    reviewer integer,
    responder integer,
    tour_id integer,
    star_count smallint,
    message text,
    message_response text,
    status public.status_rating_type,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.ratings;
       public         heap    postgres    false    986                       1259    49683    ratings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ratings_id_seq;
       public          postgres    false    260            5           0    0    ratings_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;
          public          postgres    false    259                        1259    49596    reservations    TABLE     ~  CREATE TABLE public.reservations (
    id integer NOT NULL,
    tour_period_id integer,
    bank_account_id integer,
    user_id integer,
    transportation_id integer,
    adult_ticket_quantity smallint,
    child_ticket_quantity smallint,
    infant_ticket_quantity smallint,
    additional_service_id integer,
    additional_service_quantity smallint,
    total_amount numeric(18,0),
    status public.status_reservation_type,
    order_date character varying(30),
    otp_code character varying(20),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
     DROP TABLE public.reservations;
       public         heap    postgres    false    977            �            1259    49595    reservations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reservations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.reservations_id_seq;
       public          postgres    false    256            6           0    0    reservations_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.reservations_id_seq OWNED BY public.reservations.id;
          public          postgres    false    255            �            1259    49226    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    49225    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    221            7           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    220            �            1259    49500 	   schedules    TABLE     j  CREATE TABLE public.schedules (
    id integer NOT NULL,
    tour_id integer,
    day smallint,
    title character varying(200),
    body text,
    food_spot_id character varying(300),
    hotel_spot_id character varying(300),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.schedules;
       public         heap    postgres    false            �            1259    49499    schedules_id_seq    SEQUENCE     �   CREATE SEQUENCE public.schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.schedules_id_seq;
       public          postgres    false    248            8           0    0    schedules_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.schedules_id_seq OWNED BY public.schedules.id;
          public          postgres    false    247            �            1259    49425    segment_details    TABLE     �   CREATE TABLE public.segment_details (
    tourist_segment_id integer NOT NULL,
    tour_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 #   DROP TABLE public.segment_details;
       public         heap    postgres    false            �            1259    49440    service_details    TABLE     �   CREATE TABLE public.service_details (
    additional_services_id integer NOT NULL,
    tour_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 #   DROP TABLE public.service_details;
       public         heap    postgres    false            �            1259    49210    tourist_segments    TABLE     �   CREATE TABLE public.tourist_segments (
    id integer NOT NULL,
    name character varying(200),
    parent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 $   DROP TABLE public.tourist_segments;
       public         heap    postgres    false            �            1259    49209    tourist_segments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tourist_segments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tourist_segments_id_seq;
       public          postgres    false    217            9           0    0    tourist_segments_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tourist_segments_id_seq OWNED BY public.tourist_segments.id;
          public          postgres    false    216            �            1259    49387    tours    TABLE        CREATE TABLE public.tours (
    id integer NOT NULL,
    type_transportation_id integer,
    from_province_id integer,
    to_province_id integer,
    title character varying(200),
    number_of_day smallint,
    itinerary_highlight text,
    policy text,
    note text,
    adult_ticket_price character varying(30),
    child_ticket_price character varying(30),
    infant_ticket_price character varying(30),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.tours;
       public         heap    postgres    false            �            1259    49386    tours_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tours_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tours_id_seq;
       public          postgres    false    239            :           0    0    tours_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tours_id_seq OWNED BY public.tours.id;
          public          postgres    false    238            �            1259    49572    transportation    TABLE     |  CREATE TABLE public.transportation (
    id integer NOT NULL,
    type_transportation_id integer,
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
    price numeric(18,0),
    "desc" text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 "   DROP TABLE public.transportation;
       public         heap    postgres    false            �            1259    49571    transportation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transportation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.transportation_id_seq;
       public          postgres    false    254            ;           0    0    transportation_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.transportation_id_seq OWNED BY public.transportation.id;
          public          postgres    false    253            �            1259    49271    types_transportation    TABLE       CREATE TABLE public.types_transportation (
    id integer NOT NULL,
    name character varying(200),
    parent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 (   DROP TABLE public.types_transportation;
       public         heap    postgres    false            �            1259    49270    types_transportation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.types_transportation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.types_transportation_id_seq;
       public          postgres    false    229            <           0    0    types_transportation_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.types_transportation_id_seq OWNED BY public.types_transportation.id;
          public          postgres    false    228            �            1259    49292    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    role_id integer,
    full_name character varying(100),
    email character varying(100),
    phone_number character varying(15),
    avatar_path text,
    province_id integer,
    district_id integer,
    ward_id integer,
    address character varying(300),
    gender public.gender_user_type,
    status public.status_user_type,
    password text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false    911    914            �            1259    49291    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    231            =           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    230            �            1259    49259    wards    TABLE     �   CREATE TABLE public.wards (
    id integer NOT NULL,
    name character varying(100),
    district_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.wards;
       public         heap    postgres    false            �            1259    49258    wards_id_seq    SEQUENCE     �   CREATE SEQUENCE public.wards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.wards_id_seq;
       public          postgres    false    227            >           0    0    wards_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.wards_id_seq OWNED BY public.wards.id;
          public          postgres    false    226            �           2604    49220    additional_services id    DEFAULT     �   ALTER TABLE ONLY public.additional_services ALTER COLUMN id SET DEFAULT nextval('public.additional_services_id_seq'::regclass);
 E   ALTER TABLE public.additional_services ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219                       2604    49383    bank_accounts id    DEFAULT     t   ALTER TABLE ONLY public.bank_accounts ALTER COLUMN id SET DEFAULT nextval('public.bank_accounts_id_seq'::regclass);
 ?   ALTER TABLE public.bank_accounts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    49206    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214    215                       2604    49631    customer_details id    DEFAULT     z   ALTER TABLE ONLY public.customer_details ALTER COLUMN id SET DEFAULT nextval('public.customer_details_id_seq'::regclass);
 B   ALTER TABLE public.customer_details ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    257    258    258                       2604    49250    district id    DEFAULT     j   ALTER TABLE ONLY public.district ALTER COLUMN id SET DEFAULT nextval('public.district_id_seq'::regclass);
 :   ALTER TABLE public.district ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            	           2604    49467    food_spots id    DEFAULT     n   ALTER TABLE ONLY public.food_spots ALTER COLUMN id SET DEFAULT nextval('public.food_spots_id_seq'::regclass);
 <   ALTER TABLE public.food_spots ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243    244            
           2604    49489    hotel_spots id    DEFAULT     p   ALTER TABLE ONLY public.hotel_spots ALTER COLUMN id SET DEFAULT nextval('public.hotel_spots_id_seq'::regclass);
 =   ALTER TABLE public.hotel_spots ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246                       2604    49525 	   images id    DEFAULT     f   ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);
 8   ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250                       2604    49355    news id    DEFAULT     b   ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);
 6   ALTER TABLE public.news ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235                       2604    49324    notifications id    DEFAULT     t   ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);
 ?   ALTER TABLE public.notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233                       2604    49558 
   periods id    DEFAULT     h   ALTER TABLE ONLY public.periods ALTER COLUMN id SET DEFAULT nextval('public.periods_id_seq'::regclass);
 9   ALTER TABLE public.periods ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    251    252    252                        2604    49243    province id    DEFAULT     j   ALTER TABLE ONLY public.province ALTER COLUMN id SET DEFAULT nextval('public.province_id_seq'::regclass);
 :   ALTER TABLE public.province ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223                       2604    49687 
   ratings id    DEFAULT     h   ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);
 9   ALTER TABLE public.ratings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    260    259    260                       2604    49599    reservations id    DEFAULT     r   ALTER TABLE ONLY public.reservations ALTER COLUMN id SET DEFAULT nextval('public.reservations_id_seq'::regclass);
 >   ALTER TABLE public.reservations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    256    256            �           2604    49229    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221                       2604    49503    schedules id    DEFAULT     l   ALTER TABLE ONLY public.schedules ALTER COLUMN id SET DEFAULT nextval('public.schedules_id_seq'::regclass);
 ;   ALTER TABLE public.schedules ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247    248            �           2604    49213    tourist_segments id    DEFAULT     z   ALTER TABLE ONLY public.tourist_segments ALTER COLUMN id SET DEFAULT nextval('public.tourist_segments_id_seq'::regclass);
 B   ALTER TABLE public.tourist_segments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217                       2604    49390    tours id    DEFAULT     d   ALTER TABLE ONLY public.tours ALTER COLUMN id SET DEFAULT nextval('public.tours_id_seq'::regclass);
 7   ALTER TABLE public.tours ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238    239                       2604    49575    transportation id    DEFAULT     v   ALTER TABLE ONLY public.transportation ALTER COLUMN id SET DEFAULT nextval('public.transportation_id_seq'::regclass);
 @   ALTER TABLE public.transportation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253    254                       2604    49274    types_transportation id    DEFAULT     �   ALTER TABLE ONLY public.types_transportation ALTER COLUMN id SET DEFAULT nextval('public.types_transportation_id_seq'::regclass);
 F   ALTER TABLE public.types_transportation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    228    229                       2604    49295    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    231    231                       2604    49262    wards id    DEFAULT     d   ALTER TABLE ONLY public.wards ALTER COLUMN id SET DEFAULT nextval('public.wards_id_seq'::regclass);
 7   ALTER TABLE public.wards ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    227    227            �          0    49217    additional_services 
   TABLE DATA           t   COPY public.additional_services (id, name, "desc", price, img_path, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    219   �                0    49380    bank_accounts 
   TABLE DATA           �   COPY public.bank_accounts (id, bank_name, atm_card_number, pin, cardholder_name, expiry_date, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    237   D      �          0    49203 
   categories 
   TABLE DATA           ]   COPY public.categories (id, name, parent_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    215   a                0    49410    category_details 
   TABLE DATA           d   COPY public.category_details (category_id, tour_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    240   a                 0    49628    customer_details 
   TABLE DATA           �   COPY public.customer_details (id, reservation_id, full_name, phone_number, email, province_id, address, ordinal_number, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    258   �      �          0    49247    district 
   TABLE DATA           ]   COPY public.district (id, name, province_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    225   �                0    49464 
   food_spots 
   TABLE DATA           �   COPY public.food_spots (id, name, menu, address, phone_number, email, type, location_map, opening_hours, province_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    244   �0                0    49486    hotel_spots 
   TABLE DATA           �   COPY public.hotel_spots (id, name, address, phone_number, email, type, location_map, province_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    246   �2                0    49522    images 
   TABLE DATA           |   COPY public.images (id, foreign_key_1, foreign_key_2, img_name, path, type, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    250   K4      	          0    49352    news 
   TABLE DATA           x   COPY public.news (id, author_id, title, body, view_count, status, type, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    235   �6                0    49321    notifications 
   TABLE DATA           w   COPY public.notifications (id, title, message, sender_id, receiver_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    233   �G                0    49555    periods 
   TABLE DATA           �   COPY public.periods (id, tour_id, departure_time, arrival_time, quantity, maximum_quantity, tourist_guide_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    252   �G      �          0    49240    province 
   TABLE DATA           V   COPY public.province (id, name, area, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    223   <H      "          0    49684    ratings 
   TABLE DATA           �   COPY public.ratings (id, reviewer, responder, tour_id, star_count, message, message_response, status, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    260   �J                0    49596    reservations 
   TABLE DATA           1  COPY public.reservations (id, tour_period_id, bank_account_id, user_id, transportation_id, adult_ticket_quantity, child_ticket_quantity, infant_ticket_quantity, additional_service_id, additional_service_quantity, total_amount, status, order_date, otp_code, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    256    L      �          0    49226    roles 
   TABLE DATA           M   COPY public.roles (id, name, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    221   =L                0    49500 	   schedules 
   TABLE DATA           �   COPY public.schedules (id, tour_id, day, title, body, food_spot_id, hotel_spot_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    248   �L                0    49425    segment_details 
   TABLE DATA           j   COPY public.segment_details (tourist_segment_id, tour_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    241   gg                0    49440    service_details 
   TABLE DATA           n   COPY public.service_details (additional_services_id, tour_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    242   �g      �          0    49210    tourist_segments 
   TABLE DATA           c   COPY public.tourist_segments (id, name, parent_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    217   Xh                0    49387    tours 
   TABLE DATA           �   COPY public.tours (id, type_transportation_id, from_province_id, to_province_id, title, number_of_day, itinerary_highlight, policy, note, adult_ticket_price, child_ticket_price, infant_ticket_price, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    239   �h                0    49572    transportation 
   TABLE DATA           �   COPY public.transportation (id, type_transportation_id, name, distance, departure_time, arrival_time, from_location, to_location, quantity, maximum_quantity, ticket_class, seat, price, "desc", created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    254   z�                0    49271    types_transportation 
   TABLE DATA           g   COPY public.types_transportation (id, name, parent_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    229   ��                0    49292    users 
   TABLE DATA           �   COPY public.users (id, role_id, full_name, email, phone_number, avatar_path, province_id, district_id, ward_id, address, gender, status, password, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    231   4�                0    49259    wards 
   TABLE DATA           Z   COPY public.wards (id, name, district_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    227   w�      ?           0    0    additional_services_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.additional_services_id_seq', 3, true);
          public          postgres    false    218            @           0    0    bank_accounts_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.bank_accounts_id_seq', 1, false);
          public          postgres    false    236            A           0    0    categories_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.categories_id_seq', 9, true);
          public          postgres    false    214            B           0    0    customer_details_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.customer_details_id_seq', 1, false);
          public          postgres    false    257            C           0    0    district_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.district_id_seq', 1, false);
          public          postgres    false    224            D           0    0    food_spots_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.food_spots_id_seq', 4, true);
          public          postgres    false    243            E           0    0    hotel_spots_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.hotel_spots_id_seq', 3, true);
          public          postgres    false    245            F           0    0    images_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.images_id_seq', 59, true);
          public          postgres    false    249            G           0    0    news_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.news_id_seq', 6, true);
          public          postgres    false    234            H           0    0    notifications_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);
          public          postgres    false    232            I           0    0    periods_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.periods_id_seq', 59, true);
          public          postgres    false    251            J           0    0    province_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.province_id_seq', 1, false);
          public          postgres    false    222            K           0    0    ratings_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.ratings_id_seq', 6, true);
          public          postgres    false    259            L           0    0    reservations_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.reservations_id_seq', 1, false);
          public          postgres    false    255            M           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 4, true);
          public          postgres    false    220            N           0    0    schedules_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.schedules_id_seq', 19, true);
          public          postgres    false    247            O           0    0    tourist_segments_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.tourist_segments_id_seq', 5, true);
          public          postgres    false    216            P           0    0    tours_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tours_id_seq', 32, true);
          public          postgres    false    238            Q           0    0    transportation_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.transportation_id_seq', 1, false);
          public          postgres    false    253            R           0    0    types_transportation_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.types_transportation_id_seq', 6, true);
          public          postgres    false    228            S           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 4, true);
          public          postgres    false    230            T           0    0    wards_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.wards_id_seq', 1, false);
          public          postgres    false    226                       2606    49224 ,   additional_services additional_services_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.additional_services
    ADD CONSTRAINT additional_services_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.additional_services DROP CONSTRAINT additional_services_pkey;
       public            postgres    false    219            )           2606    49385     bank_accounts bank_accounts_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.bank_accounts DROP CONSTRAINT bank_accounts_pkey;
       public            postgres    false    237                       2606    49208    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    215            -           2606    49414 &   category_details category_details_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.category_details
    ADD CONSTRAINT category_details_pkey PRIMARY KEY (category_id, tour_id);
 P   ALTER TABLE ONLY public.category_details DROP CONSTRAINT category_details_pkey;
       public            postgres    false    240    240            A           2606    49635 &   customer_details customer_details_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.customer_details
    ADD CONSTRAINT customer_details_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.customer_details DROP CONSTRAINT customer_details_pkey;
       public            postgres    false    258                       2606    49252    district district_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.district DROP CONSTRAINT district_pkey;
       public            postgres    false    225            3           2606    49471    food_spots food_spots_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.food_spots
    ADD CONSTRAINT food_spots_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.food_spots DROP CONSTRAINT food_spots_pkey;
       public            postgres    false    244            5           2606    49493    hotel_spots hotel_spots_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.hotel_spots
    ADD CONSTRAINT hotel_spots_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.hotel_spots DROP CONSTRAINT hotel_spots_pkey;
       public            postgres    false    246            9           2606    49529    images images_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public            postgres    false    250            '           2606    49359    news news_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public            postgres    false    235            %           2606    49328     notifications notifications_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            postgres    false    233            ;           2606    49560    periods periods_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.periods DROP CONSTRAINT periods_pkey;
       public            postgres    false    252                       2606    49245    province province_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.province DROP CONSTRAINT province_pkey;
       public            postgres    false    223            C           2606    49691    ratings ratings_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_pkey;
       public            postgres    false    260            ?           2606    49601    reservations reservations_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_pkey;
       public            postgres    false    256                       2606    49231    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    221            7           2606    49507    schedules schedules_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.schedules DROP CONSTRAINT schedules_pkey;
       public            postgres    false    248            /           2606    49429 $   segment_details segment_details_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.segment_details
    ADD CONSTRAINT segment_details_pkey PRIMARY KEY (tourist_segment_id, tour_id);
 N   ALTER TABLE ONLY public.segment_details DROP CONSTRAINT segment_details_pkey;
       public            postgres    false    241    241            1           2606    49444 $   service_details service_details_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.service_details
    ADD CONSTRAINT service_details_pkey PRIMARY KEY (additional_services_id, tour_id);
 N   ALTER TABLE ONLY public.service_details DROP CONSTRAINT service_details_pkey;
       public            postgres    false    242    242                       2606    49215 &   tourist_segments tourist_segments_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tourist_segments
    ADD CONSTRAINT tourist_segments_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.tourist_segments DROP CONSTRAINT tourist_segments_pkey;
       public            postgres    false    217            +           2606    49394    tours tours_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tours
    ADD CONSTRAINT tours_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tours DROP CONSTRAINT tours_pkey;
       public            postgres    false    239            =           2606    49579 "   transportation transportation_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.transportation
    ADD CONSTRAINT transportation_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.transportation DROP CONSTRAINT transportation_pkey;
       public            postgres    false    254            !           2606    49276 .   types_transportation types_transportation_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.types_transportation
    ADD CONSTRAINT types_transportation_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.types_transportation DROP CONSTRAINT types_transportation_pkey;
       public            postgres    false    229            #           2606    49299    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    231                       2606    49264    wards wards_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.wards
    ADD CONSTRAINT wards_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.wards DROP CONSTRAINT wards_pkey;
       public            postgres    false    227            P           2606    49415 2   category_details category_details_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.category_details
    ADD CONSTRAINT category_details_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 \   ALTER TABLE ONLY public.category_details DROP CONSTRAINT category_details_category_id_fkey;
       public          postgres    false    215    240    3347            Q           2606    49420 .   category_details category_details_tour_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.category_details
    ADD CONSTRAINT category_details_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 X   ALTER TABLE ONLY public.category_details DROP CONSTRAINT category_details_tour_id_fkey;
       public          postgres    false    3371    239    240            a           2606    49641 2   customer_details customer_details_province_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_details
    ADD CONSTRAINT customer_details_province_id_fkey FOREIGN KEY (province_id) REFERENCES public.province(id);
 \   ALTER TABLE ONLY public.customer_details DROP CONSTRAINT customer_details_province_id_fkey;
       public          postgres    false    3355    223    258            b           2606    49636 5   customer_details customer_details_reservation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_details
    ADD CONSTRAINT customer_details_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservations(id);
 _   ALTER TABLE ONLY public.customer_details DROP CONSTRAINT customer_details_reservation_id_fkey;
       public          postgres    false    3391    256    258            D           2606    49253 "   district district_province_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_province_id_fkey FOREIGN KEY (province_id) REFERENCES public.province(id);
 L   ALTER TABLE ONLY public.district DROP CONSTRAINT district_province_id_fkey;
       public          postgres    false    223    3355    225            V           2606    49472 &   food_spots food_spots_province_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.food_spots
    ADD CONSTRAINT food_spots_province_id_fkey FOREIGN KEY (province_id) REFERENCES public.province(id);
 P   ALTER TABLE ONLY public.food_spots DROP CONSTRAINT food_spots_province_id_fkey;
       public          postgres    false    244    223    3355            W           2606    49494 (   hotel_spots hotel_spots_province_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hotel_spots
    ADD CONSTRAINT hotel_spots_province_id_fkey FOREIGN KEY (province_id) REFERENCES public.province(id);
 R   ALTER TABLE ONLY public.hotel_spots DROP CONSTRAINT hotel_spots_province_id_fkey;
       public          postgres    false    3355    246    223            L           2606    49360    news news_author_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);
 B   ALTER TABLE ONLY public.news DROP CONSTRAINT news_author_id_fkey;
       public          postgres    false    235    3363    231            J           2606    49334 ,   notifications notifications_receiver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(id);
 V   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_receiver_id_fkey;
       public          postgres    false    3363    231    233            K           2606    49329 *   notifications notifications_sender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id);
 T   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_sender_id_fkey;
       public          postgres    false    233    231    3363            Y           2606    49561    periods periods_tour_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 F   ALTER TABLE ONLY public.periods DROP CONSTRAINT periods_tour_id_fkey;
       public          postgres    false    3371    252    239            Z           2606    49566 %   periods periods_tourist_guide_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_tourist_guide_id_fkey FOREIGN KEY (tourist_guide_id) REFERENCES public.users(id);
 O   ALTER TABLE ONLY public.periods DROP CONSTRAINT periods_tourist_guide_id_fkey;
       public          postgres    false    3363    231    252            c           2606    49697    ratings ratings_responder_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_responder_fkey FOREIGN KEY (responder) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_responder_fkey;
       public          postgres    false    260    3363    231            d           2606    49692    ratings ratings_reviewer_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_reviewer_fkey FOREIGN KEY (reviewer) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_reviewer_fkey;
       public          postgres    false    260    231    3363            e           2606    49702    ratings ratings_tour_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 F   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_tour_id_fkey;
       public          postgres    false    3371    239    260            \           2606    49622 4   reservations reservations_additional_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_additional_service_id_fkey FOREIGN KEY (additional_service_id) REFERENCES public.additional_services(id);
 ^   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_additional_service_id_fkey;
       public          postgres    false    256    219    3351            ]           2606    49607 .   reservations reservations_bank_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_bank_account_id_fkey FOREIGN KEY (bank_account_id) REFERENCES public.bank_accounts(id);
 X   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_bank_account_id_fkey;
       public          postgres    false    256    237    3369            ^           2606    49602 -   reservations reservations_tour_period_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_tour_period_id_fkey FOREIGN KEY (tour_period_id) REFERENCES public.periods(id);
 W   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_tour_period_id_fkey;
       public          postgres    false    252    256    3387            _           2606    49617 0   reservations reservations_transportation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_transportation_id_fkey FOREIGN KEY (transportation_id) REFERENCES public.transportation(id);
 Z   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_transportation_id_fkey;
       public          postgres    false    3389    254    256            `           2606    49612 &   reservations reservations_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_user_id_fkey;
       public          postgres    false    231    3363    256            X           2606    49508     schedules schedules_tour_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 J   ALTER TABLE ONLY public.schedules DROP CONSTRAINT schedules_tour_id_fkey;
       public          postgres    false    248    3371    239            R           2606    49435 ,   segment_details segment_details_tour_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.segment_details
    ADD CONSTRAINT segment_details_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 V   ALTER TABLE ONLY public.segment_details DROP CONSTRAINT segment_details_tour_id_fkey;
       public          postgres    false    239    241    3371            S           2606    49430 7   segment_details segment_details_tourist_segment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.segment_details
    ADD CONSTRAINT segment_details_tourist_segment_id_fkey FOREIGN KEY (tourist_segment_id) REFERENCES public.tourist_segments(id);
 a   ALTER TABLE ONLY public.segment_details DROP CONSTRAINT segment_details_tourist_segment_id_fkey;
       public          postgres    false    3349    217    241            T           2606    49445 ;   service_details service_details_additional_services_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_details
    ADD CONSTRAINT service_details_additional_services_id_fkey FOREIGN KEY (additional_services_id) REFERENCES public.additional_services(id);
 e   ALTER TABLE ONLY public.service_details DROP CONSTRAINT service_details_additional_services_id_fkey;
       public          postgres    false    242    3351    219            U           2606    49450 ,   service_details service_details_tour_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_details
    ADD CONSTRAINT service_details_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 V   ALTER TABLE ONLY public.service_details DROP CONSTRAINT service_details_tour_id_fkey;
       public          postgres    false    3371    239    242            M           2606    49400 !   tours tours_from_province_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tours
    ADD CONSTRAINT tours_from_province_id_fkey FOREIGN KEY (from_province_id) REFERENCES public.province(id);
 K   ALTER TABLE ONLY public.tours DROP CONSTRAINT tours_from_province_id_fkey;
       public          postgres    false    3355    239    223            N           2606    49405    tours tours_to_province_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tours
    ADD CONSTRAINT tours_to_province_id_fkey FOREIGN KEY (to_province_id) REFERENCES public.province(id);
 I   ALTER TABLE ONLY public.tours DROP CONSTRAINT tours_to_province_id_fkey;
       public          postgres    false    3355    223    239            O           2606    49395 '   tours tours_type_transportation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tours
    ADD CONSTRAINT tours_type_transportation_id_fkey FOREIGN KEY (type_transportation_id) REFERENCES public.types_transportation(id);
 Q   ALTER TABLE ONLY public.tours DROP CONSTRAINT tours_type_transportation_id_fkey;
       public          postgres    false    229    3361    239            [           2606    49580 9   transportation transportation_type_transportation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transportation
    ADD CONSTRAINT transportation_type_transportation_id_fkey FOREIGN KEY (type_transportation_id) REFERENCES public.types_transportation(id);
 c   ALTER TABLE ONLY public.transportation DROP CONSTRAINT transportation_type_transportation_id_fkey;
       public          postgres    false    254    229    3361            F           2606    49310    users users_district_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_district_id_fkey FOREIGN KEY (district_id) REFERENCES public.district(id);
 F   ALTER TABLE ONLY public.users DROP CONSTRAINT users_district_id_fkey;
       public          postgres    false    3357    225    231            G           2606    49305    users users_province_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_province_id_fkey FOREIGN KEY (province_id) REFERENCES public.province(id);
 F   ALTER TABLE ONLY public.users DROP CONSTRAINT users_province_id_fkey;
       public          postgres    false    3355    231    223            H           2606    49300    users users_role_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public          postgres    false    3353    221    231            I           2606    49315    users users_ward_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_ward_id_fkey FOREIGN KEY (ward_id) REFERENCES public.wards(id);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_ward_id_fkey;
       public          postgres    false    231    227    3359            E           2606    49265    wards wards_district_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wards
    ADD CONSTRAINT wards_district_id_fkey FOREIGN KEY (district_id) REFERENCES public.district(id);
 F   ALTER TABLE ONLY public.wards DROP CONSTRAINT wards_district_id_fkey;
       public          postgres    false    225    3357    227            �   e  x����J�@�ϛ��h�$EP��҃"T��K�,�j�Y�I�G��A�'o"�(�
Bs����7q6U��,,�����39LM�eZ�L��H`9[Ղ��/$���!��p�ꚦ �<A c�*R|�E	B��U�FJ�Ru�8J��Fq�*VL8eޙd		�������w�KFx���f��p�=��(Y!X�8{�1�G��.g�4��s��9�C���$�����'���is.!���P��6�q�" C1ڶ.�jj��IL�_�[raE� �s���pk�{���=��C�',�S
���y)�L���刷z���і)�<S�g�[ց�(\�����-���:0͓�#�;p0����%            x������ � �      �   �   x����j�@�ϓ���$�m�*T�	���\DJvـV��K�I�x�"��S�����7q�X�9�7���>D)�?e��%$0���,@�{��Z'�à�q�2�!'��1�g��H�R�ˑR�]��/����o�+�}�7ƅ.��f�qD�h�� T2��iR�/�\0�k�HH^�ى��P��1&�)1�g��r���b��c��I}���	&�ZZ�'�c���2�.i8�sv��         o   x�}��	C1�s2EH�d��{�N����>�|ڃ���0
w�u�s60��(�;��f׌��WX�>l㏝�}�%/��/�4̰+ܟp�K�Ԝ�|�m��y�&yi�_��s�R             x������ � �      �      x�}�mkǖ�_O>E�]f����kW�Y[���F�Kc�V/�f1�%�!��0&`YEI�ۗ��_����|��s����?�ZH��Mwթ�S空�z�X/_�F�Yt�,��t���2��|�-Zw����hw�^~<A .�I��<�Y�~�֤h�O���Y��)6�E��zy��_�#�+��g������2l���f�f�2��}������8��f�<,�?�N����u��n�,�׫���A��(:�t�흲�I�{�K��-�{�,�H~�R���$��W�D#'&f�������WJAn��o��zL�|�^��k7����C��d�^�5���RŠSNİ|�[L���n%���|�:��-(�L�O��W�܋n%N�Й���#B�qZ}�'�y�^^M����%��:�����z�������>��`~t��iu$���6�Vr]�~r�����6�+�Jdw���?�9��S얣�m�.L����M��ON	�a�4�E|T���#ړU��)N��R���Pe�y Q�կw���}@k��`!����J�_�q�[^�[��y˃��Wҁ�d��T}"�e�oesy���91P1��r��T�HTb������Z=�?���N��]d*��7D��<c`&/,ED�${��5�d:>�y2C�S۝�!�P�P���:��� VI�~~q���?NHP]m�WO�5���C�k~z8)^���D�J�鲰����3"*���h�-ch�y�M�T�ZM���*�+��.�e��<�^���&�]FD�+�Dw?���T��^�S�m�s	��XG�˹�R�V�J����c��/S{%̽B#���\���3�{��ܠ��k����7�v߫�H��͢��V5-�����}6��3L��u�x?����R6�유A]|�i~CL���\G�T�u��u&���P����/��yc#&nf
Ѥ����@-8c�$�/&/F�#g����Z� �a�̾�g�}�4�z��DH%������C����	�;�l������T2�����[�HX"��GYkY�w�O݆Cm��5�X���Ef^40�V�CY����i�����ދN�ê��������=���b/�d�Z�N����z��P2s�80+�K_8��X���xz{��6CU�u�WA��Y_�	p����%���F�'�&g�ro|X���W��'yٕ}�1i���Hj��Y����m�#]����(���$����L��3T��Sw?�����&%#Z�~3хYw�o�*xc*=YK��I�c!#c�?�lu������Ж�h	��|�5�~�vC�A�b�!=I|'���`����^�1�.���L]y�ta?�)����	���a-bԲH�\l1�)l$u������M�KC�y��ru�	к=sd�E��e��Շ����7�h��ە�Z���F����sGA�21	�x����G��C�/ݲ	bfY���tY��&���[��͉,��~��d3m���Y	--��n���_����>Q�����o �f�T]�i��ثb7&�-�v�3g~cG��pyFn^���������/K�k�r�����۾7DtH��7����[��qvb����b3v��u"��w�o�o6B �#V��qAtB�G!F��tx����u*2�#'���<�����T%n�J��`�h�p33 )��X#�D$�B ^��}w��l0���1��!`|H���wn���W��"����2�?f`B���7����#gbl>����zv�+�K�JHFE���Qf�s��ð��ԯͪ�`�T����"c��6�
Bb�nRA~��3�K�	�ֳ�ďb���?�0��&,� =-�4�3�UK8���Փ���@��)�N�r��4�v��	���+Jv� ��FD�Ю{�;�ߟ������͖�s��Ĩ�{31���UbX��B#���M��zCT�ZV`�k����C�+RV����1u��t�۱;��C�95L���?��c��z�,��^&:5CzZR�d���:e�3�8]���~X�Q�?�U�ݨ��q�����;#���P�ϽE�L�h0u���U!�R mה�{��)-�`t)���E^��x+!]FȀ����@3CssngΙ�0�o�̴WRޝ�����8C�$
;�����}c�J�j�l���D�2_]{xLhLO��+C�Q�S%���J��TW�@�.�C"��s��QD���]�_�0X������bk��W�n����ƈa�{q�g�0)�����1b3�>��L�hw5�a��O�徲�1G��[@���MMRڟ�T�>t}�#3H%��ǰ����>6VAժ�*����w�rH�������u"Zm�1�*A;�1/�Y�@��{�N�/cE-ge�i��tk9@�u�X�{<���	\�"���X���<sʴW%d����CzF�:s����BY����â������d�|���:�`�^��"S\��)���4�ő�b~LCw j���J��b;��H��?�*i{۰X���Q�_�^�Z��;�� ލWC�M��;��'낂!�
V߆�-f��.欉��QAOG�p���s�3�R�&������Q}����;`E��5kȈnF G8�ar��3P�ʭ��J��<9��9�4kzVb�8��>�s]~-�uo��;oht��>u�c�x����ջ� #��8<aP@��N��_��ā��G���ú�K��|d.�̩녁�1��b�F9�ԡc�Z�EL��J��z�4�0ns��/�i%��� ������`$�Y�		��������7`K��(4���Z�)PQ��� 1\���5`dYW�D�и���e4��uC�6K2�"B*aoe������:�1L�0��!�����������놕x�>�Sf��xHS�jp���7�CD�lfV3H��ʼ�NMk��hj8�O��k�V1A��]=-�bP[k��&e���+yg�I=n#�R�1��j8:��#C\qnJ�Ú(p����I�p9�=S�$���	��?���";�|V�L8)˟�ĈzG�V����,��!u(�95T� �����et���H�mTjE��/%;M����*�o�!���	�"����j���~���������?Y�b�y��-UkL�9��OGFʛ��^�L���t:5���*��^n]��Z|jHiI!��-"�
_���q�'U�!��Jl�}�\��L��q"q�Pa��2��U{HuE�s��c,K��g�Z��	'!�.z���!Z`}_�~���F�O��+ L����U��� v(�)cT�,wN�z���է�53����Ya�1c�BD�S�M(�G�q~�tC�(z迖ۈT�Z�%�aLv|�Xf@��C��ALi����{�bPL*ƅ�0�b��y@h�ŏ�*#�CH�J-S2�8sC�0͐���l��u�]�|\�R�*��n��|���>黙�AEb|*�	�P�U$T�n��;�}I�=�!z�@1�b�J0a�W�q�L)�VV�M�g����B�Z���za(�����05��o���*r=	�Ч��B:<�u�����vA0ek�1�x<u[�L�>bF�bB��da<�1��ђ��(!x���"�&"r��!��gf�c��;1X�[D�L���d�s1����E�>����� 	E��33 �Nge׈�1�I���6QXT95�QR�EL�n�+���"�jz�9�ôw�������(d��
2�#4mFu�B�K���a]�N�f`ާ��cu<X䯙H��w�"��V�F���|�{���0g�qz	�X(��JCF*yK_�?�7�I	�_/97DϾG,F����$��AE�}����RI�ߝ�m�ef̩]�Nt_/Z	^2'�p�ԻWLЉx�8��TLT���̭X�{��k-4����>������C�v��"��/�݀��N��ڕ��L+B������+��0s`%
�����kb� �  �7�	}��N���|���@=3�O���L���B��<�J�n���%8���*���ڇ_� ����i�˃�5#7���8;3DlE��/�6LM�c�1�bwwk������F0D�ޓ���j3�� CCm��p�F��@VP䶻���zQIt�+��αY����LB/��|�� )nGQ�{���զH�:!}���zW���\=2�X!�TTo*Im�[��񧋫�Rau���~qBŹ�+2cLA�Yʓ�X" ō����Y)��ok欼��t�����ic�_�E����v�0��r55,j)��EB��*R??I����_K�Z�b�*�՟�5�t7�iu:S6���#}z�~��>�fV/�����7���`�@�2�	�#�LG2d�}~�'�X�8�^ =� <'�̈���01#���BR��4��u�Z�� �5�HUB�����ս'�K��>�o�9�H]�5���y�R�K9E�G���x"!���c&Z�g)Jc�QH�/	m�La��j�L9��퍄;�ZAx��r��w�K�wb�]y�$��h1np��y���HD�4.&���1��4�3&�� 
?q���0TƤߔ�o�0�5K��<F�%?�w���@R��b0���`Q����T,SF��r�J.18I�3�F>���$�,1[�0J�������z,�"��0W��}�h@'��:^����fo8k591i����66�W�����h�C5�(/ �s���2T����b������B�����0��G�~a�,S��i(S�� ��*;�1���KLC)��4�B뙆RPӐ1KL��R@}� ���ck:3 �{���6L�{���� ���S���?����Z�֫c0YNi��q�>���[E�1��r�%Ќ�F�61�腊��!}~S��p��7=���q��S��$G3cX��F �KZ�Z���>�U�\$1s���¾.�-��jN�zF��!�ٵ�~2���.R�:E��o0�WQ���ނ<gfض�u1<����-@ V�4�(�c��!%�ƺ��9x|�}���^�9�[	85���t��<��������k��@GzS��n���^�kl�),�����,o��(:_a �<���6��M�3�z�����&u-�M�[g`�iՉ���i�-�]Y�Ht�Г�ߣ��1muͻ�Ǚ�Oǔ	l�� �#�i�!t<���u��7}���}5���z������t�F��#��+3Y��9":� �~3��.K1�۩���!&ת��/�U�}8{��@˯�@!�V���&���i�'Cq��4$Q���D`}��=�-�����Q���,��F�E��[C���Yt��u7�c�d?�6׺ �\�>���'�[���!�z�WZ�>�޹�����N�z#ª��� ��K�Ḃ!�����/Wȑ v��If��\��W	2r��E��h��uz�f��#"��Rj��G��2�� /�0���8f�wȊ�J��!Z����/FŃE67 m��⽉���� ߄Oi�CH��tHV��O��u8C�����>r8)���`��U�J�P�v�7v�!"����-8eԜX�[?&�L�!q�G�5��T�:�<���a���QZ��`� �D�ꣶ��(j� �(����^9�NJE��$��luG�C�0��Y�(i%�n8��ל��1c��0���]���)N��L�B�)?h�1<��4Ikw�"g>�^�S��g>��;ۭ֛���)�'�~�`��N���ɉa�NY�zm�)u����#g�vK���o�\��������D�n�q�LC!�Z�L�f����ZrnE��E0��k�TS2�8�	+�k�H�s�F�����5�C�' �c٨��f������}\|��S�rz�Ӆ}\�w�M?�i��D0����O%b������7�R           x��R�n�@=o�b>�	�ډ[N�A"R��+�^6��Z��Qb#r#�qK���P�����㆜��'�k�D**�x���3����\��U� OfГs�%9�*����k��?e�M�T�Y�d���J1��P��Y]�Q@ܓ�z���_��警��޳I���'A��~Ë#r��L�z�v��R�L;સ A}��1l�9�ɡ��!9��S�nuj��?�Y���U���>�<��N��|Җ��X�Y��ϱ�\��a��lL�>2�9��3U��E�:U��������l���t;��Y��l�xl��W��܃w[m���?�2��$�;�Nx��{��xd=U�V����&�Ru���y��)�Tన�d���H/��"x�bMn����YV��V)����g
��ER���g�(a)��`XŪ��[��"޾K�`;���r_$��߷<O��>�58A:�+�B��X?� w��K� 9 )�'�]�nR���{%E;9;CøJ�J2��Z��[�m�         @  x����j�P�盧8CLL��
�4�����%��ɹ���Vp��(�թ����N�Dޤ7b)]���s����&�I��(��a��Y�ߑ�4��@��U^������m��kì�B�TYmF�Z/�Mb"���9��	����yz|��:���0���UBH3b{W��x$S�lj�XFyjE"�G�,���.���v�V��r\���Idj�t#B�F9��.��=�j�J��O|���t}s�R8�ܡ����c�����Bx��c�R
Oq!rI�ÀFf��iN�s�ؽ�~a�p�3��sn��N�         \  x����n� ��c�*zAԋ��6٠�?���x��4��i�8{�ɓ�{x(��߼Z�ī�Q:����k��)�{6ޮ�~^W4���~-X��Iu���)�  c�T�9��6��]P5��t�f��y{mT���>�@�+��(|�(�$!�x�`���S�����ML��`��.���C"����4J�.R�v��K]O����>%��h�[�oKkIs�!��U��Q�Oo@"G$�0�MƗ,��=���hl��S���[��bG��ryl֑YV��rH��[�D�+J���I�4��]M���}���A@ݭ�a�-PU�L�K�*��4#��Ww�3� rgTi4F����K��?��y|���8
C��Lɜ�:0��XĠ2�:B� ��0	ℐOQ��N���{��r���X����e�C"��Nw�!r;��vLY��<�e��f ␈���E9��v��h���S�x�v�Pzz��C�v���XD�*[��(c�6�޵M�^���&
?Et���.r;j�r�b��r�Z��ixH����EnG�W�P�PD�ӜS�T}H���E�}��a1ѦQ��mmEt�M�~�\. ��H      	      x��[k������S�F�4�ڻKBu7\"�J����L�s��3��'誊R���(��
Xq�"lE�0���/�{93sfl�%M�F	������{9����L�	G�m%*�pm4��噓�S�W��sr�}j��Lu4�{"pF�o\1l����D0n�3s���B�\�;.��..�X,-�+�U�,�~gB�oڎX�HU���V]\p���8o�^�f�T��޴�[����K̜t�N��_5O�|�v����tG�{.<??��Ӗ?9�_?9�k�OM���hx7 A`�u��Q	5~{���&�<�tk��9~i��Xb�Xj�Mr>�b�	�Q���>���-}a��mу���oǇ�q{�����q'چkR��jE��`���Ҝ��3�}��X���K���W�F��Q���w`�װOύ��n�{
�
6&���Ka;�}7u��+����pO\�{/l�]��B��٤��N��%.�˲㎉���v�/A�z�Av��E���O�!Ʋߺ<�H7z ����(�]��M��%���ha�D�(�(A| ?WX�8ٰ�Da�(�~��ae;>�� ��Ix�Ӹ��Q'�����z�rm��6���{Ş�+�Th;a�J��G����#�I�M��<���u��)�+��Q=/�,E$��q���t�O�c%vnG�HO���"���L�������3B��4�r ��+PMg(���p��9������Ĉ�����E�|>Ѽ�HO\	��a�=�V�`o(Q�hwE��0��G���yA����,Hd!r��o}�(.Q����~[\C���_���冥��kD4]Xlu4<0;#-��G� @��)_C��FH8E��p�\UB;��&�_���'1Q��B�-��B �zn.H���A=p
���6����tB}F�gH��"|w�g��5L�pK�u��&���s��6���4Gf!��YW�E�d�w���B΂�\G��nJ�i��.昀}��/��:����@ �d�p��b��
^*�NE���!u��*���d�Q����ӰW��n�BOk�	�b>����j�1�2pz(��z}m,�NO~� �+r�b
M̿�އg0C4i��5��"Z#��lj�����e�Ҟ^���+��������1P-�fF-Xa�n���������p�֫�H���J�Ü`�f���]��J~��w�P���6��@u�l$��3�SelF�>�������M�Ba~�����N����[.�lE�&��K��1��c��{�8�1�a��=]�M0�~�২�Dl�q�����ݎ��]O6�����e��� rc�)��@6)|�1k���Q![��G_�K���Q�=���n=p�?��B�pnӁ�J%pX�� ��S��a.w?逾�쬎qFz� 4a:����A-쥐�4sX ��v��A`�q���Kn�L�MH,��˗����
�h1��-6&���a�=��=�H �4����%��n��r��-�N����RM?��q��3�1Ӡ�w(E��V��zd�u�\**��T����v-ǳ�N�z�X���@��`	�gs��ԶW>�(�h��"���^(��U'��^p�Q5d^��6����T����ñ���[����F��8g9��.� N�6Z*�8��STW�+�Ҥ<_���EWGZ���┌�z��x/��٘	�NkW8�+��C�7`�71^23?:Y�oQ��A���21�� ��� ��=��+(@��fyA���)���|��5v<e��%��t�sB���s%=�96S�1�{�pO���+rfT��nSE�B�4���#q�4<J@�
�n[B�萠�����J��ܰ��zT�ыAg�9�N�t�@6���(���"++`��7h�k~�)V92-D��&SuX,ʉ-2�I�7�� G\&LqO����d<���y���m�:x몠+5a=��a4X����W�Ai�$[u�p�ѩ7��v�+�aN�"�o�t���<lĥ	*H��y���J:19�y�Kd�E�YW{-B��5FO2c���+=�M��d��v�u'Gƙ���A��'Ϙަ=�J����'-��܃75�S1�l��_(�\t�/���ӱ�:c������i�%��� V��*u;�����r�Jp:\mj崯)+v$�m�{T���	XE��8��a��iE� ��ESN��h����5JY@&��8���<�(��1�ݟ bq�F�l�3�pv�N����1UjT,���`�ڝ��@�Ob�´�.�l��̊2�YB�=���~�+��dO�`���`�ɟ�
44�Z�<n.�n�h	Ч"9��mCM��c5�@�_�f@��-�I(�;��~����#�+��v٩�^7U��j�"8'W��T�% @g�F���^5]}��P_�������'KQe��X�T�d_�^��#��h!�@o��E�yj��d׽�v�.��G4.�\*����j �.�TW|��ʺ�ad�	�ijLf���T����=|ċ� �F�����q;�a�7���S��8lV1y��}�T����.��u ��0~��5��P����6�{��!w"n��6��;���#�	�=h��~�ФT�;ڣ�$:���+�a��ii˖#�񁪾a����2U�Y}2q5Mp�����I���� �p��S�ND'@y�MuM�Ρ�[�T*Q��ds,y��,���^l+�Kzpm	�tkp���9��5t�B��\ԑ{e�n�L�!ME�!�8�7��i&��L?�R�M��]�'h.�JO���FYx,F�{c���*V���6ӛ��f+�T�|�K��T�s���Z��,�Ľ_wB�>I�͓�ed��|*��4� �{kp�g�����Xn"�o�L��U�)��XR�<��Nk)�hRar}aּ���iz��<��S\A�P� ?N/c�nN]��{Y�	���'�ɱ�TRͷD�T�ث�Y8}��ɘ
mW�O�%Y�b���i1)�i¬RZ)�������=�*W^@1(���U�ԺZA�F�G s9�����6fD��A��PP�7�y�R=����{�Uj֦7K�&�J��'�F�'����(������N�L�4l�4qa�t\O�f�3���#�p���i��:�ᆕ���qVf��;�8�.�W��I8����Ʊ/f�j|��1�r�����X��^,g��}wl���q���X��; Ue9��{1�V<����	ie4���F��w+�pe��Eeye�ч��?+N�E���oЀqT�Ҝ��>���&)/@J�(C�db=y�Z�����G�$�_�x����W���!.��q����O �$��aV`�#?I!Q�Ǣ��'�z��a
��&)b�A��^��Pn��іE���4��NXa���MC�p�D���8�~��|��������X���#�-8}��_` ˥�'�s���Cr!J�S��Ajn�I��1ŵ-�E�����%$��YeG�GRx��ơ�z<�㱑M3>g����mq	G�+����o�t�������������oR��%����ǈ6=2Nt�y����Hbl(+1v����0�-eȩ�g���oʢ��D͉�h[�|�ez�'�+`q�O�TK�
�%�U�(`_���r�5��G�*BSwy���G9�B�:ː�*Mgg���Y6.����,��W9P�6Y��Zba���X��h��9TL6��t�		�U#��-_ֻ�u ��d��j���TBߞ=#W=W��_�W�Y��3 �?�K?^�V���z�|�d�د��˄�����Eqv�M�U�����|��"*��h����|B�X�P\Y:o2.�2K�F��4�m�~��1CmTJ0ge���Gg�iF�n�Ѫ��Gպ�@F�]��X`�ȵ����:�*�~s$Z��m%4L���N�==	�R.Q|��D�>?<=���Ĕ��b�pn���t���`A\��t�ڣ�oE߹ZW|�v �    u,��Q��.���O�׌'�S�r��%�o�8�5���u�30�+�8p��R�����񹵜���sw��0�X�,/�w^�o].���i���8i����J�Pބ��qq�Ɉ�Bu�L/yьk>�)� ���Kz�p!�tK/�1��UL����|�,�y���
�9Q�[\��zIW���9�o1s6t            x������ � �         �   x����	�0г\����"R���c������?$��#K"Jn�q� �0�Z��������Lh����ea�Y�c���yu3���[��n��6�u't�����i�bm��taO� �o���M�a�������Mr      �   �  x�}��j�@����h����؅,���@.�K��ŠC���J!�S��v%MMݤ�H���{�M:#�V$4���ϻ�|��8
�\8i�5�Q�&C�K�_c�pv����/�0�}oJ��YD�lA�x2�nt)��$��2����{�\6׸q��P��@�}�����E(l��W�pNb{r�IQLѻ�������d�s�6Y7���t8���)'�o4�^4�T1�ؗ�p�4��1�m�B_9�N~[��.Pv ^m�X�Im����Sh�v���n�{ӛ:�j���� pSl���3�Ty�M&����C��Y�5���q%�B�d�]�	�t	)	�`Z���3����|�{zkb�_z�`f6j�E�V$��
=��D��9���byҟǥ�X0ĸdz��uv�v}Զb��梚1��)�F���|q:q��d7�읰�/Gi{ʑخ�:��.�7<����߮���a"P'
�.���qP����0(C���zP���s�{�����YΣZڠْ��/�J�8m���)�`y��n�4ZˌF����{[���P�+���.I�'̃;4�>�C5
��0{�H�i�k�Z��F�*j8�T�T>�я�'Qɳ�X�(��&������틗�V�?��G�      "   .  x����J�@E뗯x���db0mAX�mbV2a1���E,òE�BX�r����K�I�"� ,2�k��=�>D��������J�T6j���\�*�Ţ���	�E)ۛ?/����$B��:�\���d�_���(������/d����_4M�^�)�O��_�&0��V`�>v9�[ᓁ�pQ+�xV�<b�A���!�xQ��E��#�!q=�z��a�M='i�a&�E����o���y����z��Nķ����؁f8@�]38V��ϡXb$^���a*���A�#T�&�a_���J            x������ � �      �   �   x�3���8�09C!����t���P�yxU��������������q����_��Eyu
G&f>��X� �[�_Z�G�1�Ǳw�Z��p�j�)�
9ww'g��j�u�Ba��]��r�ţ6F��� ��GD            x��\m�W��L~�ю@k���otH�n����&#���e��U��U�O��Y��h�&(4l�4	f"��·b��?a~ɞ�[�n��i�J���Kխ{�=�9�y��;P^<P:P?^��(��D�dA�&;�%���X?Q���8Y�[�yj�s�*ġG��>�g>pt��J0����p���ĻA���Y�i	2�3�+����lqt�=��Z��>����{��/�q�-cS4�E��+��d��tF�S����d��+6��+�����
���hv�s}/�#��&�^�d�����M��;n�w�6���v�?���%�W�;�5��[�[���3q)'�p�Nv>1�!�
6'��b�5���+sB����F_�����M�?�їo-�z��XT_.�GW��ڌr0E�
�Ҧ�[��1\5�1>�®j<^o^���Υ@�(�� ����[$Q?��
��_���	����oz�y��a�A���V ��3�us��L�&����qd�F��1w>2��z|�1>�K����pa�a7mW����\��ڊ����@'��-�ǧ9���z LXLϲI3�0ʒ�a�r��Z�96Q6�*sӢ��A;�BT�A}��w�o����ڎ8n^N
�K}.~����I��Un�f�K�o�f<���A)~���=���,ǅe�Pv��F[��7��=Ɉ�%Y��v�C|�vۅ)~��ڲBi�.i  ;j{��������O�i�a{n;O.�M�yxz/�C[q���ൣg�n0��o�F����9��Q�銑���z�:����--�gf^9(FC�Ճ��FK33�Ψ`���m��p�`z�L۶�x�;Cc���g�g6J�R�X<R\��-��3hf�s�s��S�W����;�w
���9��[��gV��Z��a0���kJ/��r�ы2�(˕|��/ϋRy�4�4W:�:���<�u9���R�󠎗N����q��x�)�o����jo�A��h4D���h4��j0�K�&<�E�G��0�z|��K�?_ī"�`sP�Ѥ�\q�&�j���z��rǦ ��Pa�l���j_�JA��/����څ׀���S1���7m�	�z8���A�б����{�\\+���E?C��t�|�r�E ������/��97��������
Ͼ.6:�>%@�»�p��,C���B�Dۀ�i�I�p>] �ںH�	X������h\��rS�������6����Df��p�#/�E����Bq��! *Ԁw�)�	+
ɤg�dI����#�D0j�(v�P���
�Gmt�*�ڣ�nG4|c8�;�kE��T.�> �H�����-n��,XV@��&�˥�}�v:mۀ�G��=������@J��؝�@d �@�Y"Vz��p	`\g�hU��[|�|���vjꨶx��C�oL�GR`��{�67�����6��x>0����	��A4��P���S|�\��.IW)şp�0�6ꐏ
,��.�d&"ˌ�`�#���T���[TW�R���3��f Pd�u�7p��>�ɑ�"asr��ߋ!�D 6��؜$U�>������A�5D����H�v'���]Xpi�*�J�+��n]�f�t�JV
K��̈i���M��!���7��˧e�i��f~����3�o,nv>eq��Z��`�{�|�qF��^��nlq�����M��ʑ�U�ny`vG����xr\Õ�����qzZ��	�\�7�������CQ=������d�|�;Io�kb��M5�1U���yb�*\
o��s��󅭻D�k*Ze��#d�==^MD�� ��(Ŀk��Ё��,0�Ҽ cX�f�|����B�6�%IKמ��,[�
6H@@��1r[�.��D�I�j9�+��'��5�y�_�`�+ +_��:�LN�����2ɓ`9q.C��7q���S��;�CMËB<�uÙ��«w��T��(;G<C&Dl�b|�o0%�r'	U�Q<��Xv3�z�V$�3uU��B�lJ�#ё\�$"K�M"J��2���h`��-�fM�qs*.���Χ�	��$�!�7f�jj��>��x��`օ��d�v.��ʡi}_SP�����刀���MLN���?<*�åH��#��ҋ��������±]�(.����/�Xa�5�|'6$�pɗ����Zۓ�t�@U�ȠE�Z�j����xQ��~$Py��v�G*�#��צ������D�j�Ȧ���8!�h�ۦ��a��0�E��p �+(\A�[F���c����`a3��_WMZ�!F;�ŷ�PQ+۸�-\J�#R�
!Z�T��0�}f��H��������pۏª�:	���E� >Y�y�PFW���n+"�o��c䍙(�vRI��@%��P)��k��HZ����w
nǗ<a4��|`@:ܙ&��x�L-���<{ٝ�<�p�^���!�ejn�(�P��	�d�V�Q.�*���]wP�;�s�N�����p_0�XX� �Y�T�4w�RJ�j���߀��_�O����"����4���k���(��Xd���4�|�f�.J�¤'�Ks�!���d�	�}�D(�ѫh�o��vcx�N��w�S���+��`������V�	(g��CF �+���2O>?�fG6N؂���G��yx��
*Ps�J�C�q#�Ibt����=�c)��ع{�iZp�S�7h���)�bd�n�*��e�R/>�ņ�6͵]���t#mDs�A��~�\��6�x�-�ZdgW�s�"pw�����3��7s���j�j��8kv<�))�=+��Dp��c��x턳`���碃d���i���R�F�y��&U���m��>@�\��":2�r�%�l��ʯ�=�P])
���v���͙e7 �_�F�?���g����+s���@���Œ(�/U�,��I0:�q��E�Xk�ؚX������NA�u��Ah*?;gdPB�e���#�2+�;-6JU���Tw���]��J�$�tD�K�U"�ç����-��Gk�Zd|y��p� 0�슒8�LT9������u#Q�ST�&���8��K��!z�R���n���`L�DW�(�d��S|���/�%���-
a�ˬ�?�H% O"본<7v6&y̨~��\�L��Dr��8��L�y�Ӊ�t:�1�;��8�g�ҙ�%9�.X���I{�Q��`3��)S�H�%s�'�h��6?�g����*�C��c�#��R��LIadR0��л�ZR1:~TEA���9"��!~Db����>��-���J�,�0�4���	o��X��2��8TE���Q=��jv�?��x����^���iE���ɱyj�t�S up���Z�R�أ�u��)�[]���4��X�e�2�f�"J�6�7-�.�K;��鎜�<�տ7�ٌ6�Ic�-F߹ m�,4�>�-L��B,:�����U5���d��'�e�C�2B";�ky�c,,�!�P5��.N�����>4��hAf"��r�4\r�T���ՎJg����Ƞ�3Y�5G���"g�R�n���a'���c[�LM����@��}���Q^!J�S��Xsm��Z�^���&�Ye|	�st��C�s̜�23,�:�"�`���CPǊ�����l�+%)W��#���"���"PS�d)-�*���1Ώp�5��6�7���Y�h4���@���kФ��#Z�>�����
���<��|�ٳ_MI�c�/µD�}+� ���]Bu��Wu1꫈	�v���������?�}̨ٶ:��^��q�+C���)��*��ly��B�;3�/&(we�r�NM��K�֖��e���)�4V��L�3 ���*c$j�S!��Vм��� �Ct@��G������A,W�ⴑpEMr��Ɍ��"�"�(�.ŗ%�҂vw��my�&�[k�J\c���)���D�l��I%9.eJޫ/�p�e 
  )Bh/V0R-�mKIH.���J������XT�6��̚�Gi�M+��sk��S[�R\:P)���r*�K]�/�&(���ͽt� Փ�Gy`)�d�7;�-j�kbv�JQsV���b,|�]B>p��|��b�j��y�X�&��$���>R�R%��A�{t(�d�͹��{fIǩ �6��pN̗FD�0Ŋ���h�C��&�!�~�� o-���� �Amm%2U\l��`V�Ǟ\�:f�0Z�N&�,>�UQ~�aDC�m3av�G�e�
&���WQw��`��y�6��"�;��� ���,S�����z��k�Q5΂GX\(�+�}qs奲2�2��������8�����Sϗ�ݥ�,��������'~���Y]z���LCH���D#�0?�2�-��5��Dl)7Y*�fB=��>;Xj��h$��!NcL�����d�c���t=�&r���c��H�a�s<���ӞMQ�O8�ׁ>}V��t�d.Q�0m%�pZ�qF�Xc��z#���
�W~� Q'j��U�GZ��������w#�A�	Ztfa~~�R��;��VTIX�n�������ux�NU�GW^��B���k���ѕ���r���m�Q�n6y}2~�ݧG̪dО�b�
�U4s����N�C�K��W=�ڡ�?x���hLvj�ʀ"!2�UP��Qb�zd��U�_�R>�=����cl˻	�1�<>���t��-�u!.9sZ�����
,�����������Z����x'�M��j��8��+܀��<�!�$���������u�u��]D���i�|M��ܸ��!T���3�����gSӨ��)RqV3����K�bMj�EӢ�]���NF9/^5�ixL3��nZ��"��M>CY�>8��o�Eߧ�Ȟ����|MeeDR�dIW�d�-�����gBUI���D�q��e�R{���;����Iy-�"���F#,���F�V�2���AYw| 	K�?ΑR�� ��_��)�-�g��+/Vj��P�X��3l��u�x|�NoTg��*�^KK���<�|^��u�7=r��G{e�a���r��We�����.�TI�*/Ԕ���T6ٜ�u$��d�!Ѿ@� ���bM_/8���
���S���X�Pec(md�1�-���s�^���@H�`Q��H��M�䩾ٛ.���ֱ wQ號�d����qe��� �t�y��^W84�x�S�&��>W(x8]�u�n� ��K�Bcܖ�x��
o�Ԝ����績���6��ۆi��/G�T9�AU�/��z�#<7	[ña0��+���xK(�0�/_��)k�+'�I��V�:�`�ऎ҈�[̅)��*��5,�oІ.�v�;ۍ^��H�d=$5�$�(J����q=�y�\t^��/u���\��)��tc�������ޏ���[�4m�k�w����/Gy�p���Os���_>U2���AJ��4�}gy�Xƌ���p&�$�TF��Mq�u|PA�~l����3�	�g�w�3��k�(j��d��b6�V����8�$��:H��!D�GQwNN�X�U֌d?��D���%�Κ��PQr�B|�����`��e�����ӽ����PHܠ*�vV��؀�	��r�u��A�cx����6e�%m�^�hX����c�Y�UEX�ePl�V�&6ݍ���kּ
+�^c�֖�橰Y:B���ơ�`��⬄J�^�؆��<��Othg_��2�|y���Z��;��g���ԑ������e"3��@��ji�� ������['0ꛌo��L��={P+���� �YkH�r�v�t:�3L���@6D�j�D7��0QZ�꺢�ʮ̢`�!�ބ���z5ub��OL��̎0�#�_!���G:���_2>s�%�U��(�!��̻$7��O�v�m����ƨ�-b:N�*�nQh9h�����?&�V�ʓW����#Lm��Xf��L�%��;óF��oy��E���%�2X�|dŋhő�r�f�y������Uj2?~bYԏ�}��,'�����Փ��F��U^D�J�(mb�����Q&jʌ�8�~t5�Ƌ� ��K�/�GX�� u��2g��\t:��S�w�)n�	Y�4-�R;2�d� �C��R?��UJrq6C�\��>�q�}��q% ���A����/"`��Q�hɈ��Q;��ce���R��n��7 ��9N�UǮ�'��25.&u�\�vX�]k�UϽe�����!�C �0Kל2z��yR�$c��<Ⱥ��6 �6<�m�ԙg�y���~K�g����ρ���["$=�6�
���3-t�[��mQ	6����B&���O��ADS������1P�3���":��;��0��S���j�N��Qu�g2�n]�O�q&<
f��W��qf�F�F:^�<ag�ݔ���"��R3S�Ү�9�/��-���7j���i�ͥU�jd�Y&t��S�t=А
��[�:Ң:e@��� ��L���	����g�S�Ν�T�����r�xi��C�����x<<ײ�]A�T E��5@�E�c950�k(��j�h�[{|/k��%�a���S����2Ș[�Q��o"@�ϟ�	���Oh9#�e�T�̕JϏ,�]~� e�Tx饗��9P         g   x�}���0�w;E(�RJ�`���<�
��;9��8����5E:Of�H�?��8����Xi|x��۸������:�K�~��Y�?v���5�s�9_��@�         j   x��ͱ�0D�:�"��r�	���@DP�ݓ�#q$6J*{j�4O�̘�x�x7q7K��ciV��Y~�q3kCA79Lu�#��}��Y�����xn9��L=      �   �   x�3���8�09C!��B���Ë�8c�8���uu����$��eSdb��s:?ܵ� ���L�JM8�3A
��ep�Qh�钟��������pw{�������33Aww������ cD5            x��=�nW���W؁�P�7I�ǀ,yEA刔g�K�bȆȦB6�MJ�x����	&N6�Z��N�c/������`�d�r���E���tiv�s��Խ�c�e$�GF���R���ٴ��f�5#�gD.��n}����������tiaq�Y\Yέ-�?ˇg�����Ht��օ�u�VՋr�FM���7�����(�;�'���������n}���yK/�Q��8�ϗ��h7��c�H��VćUF	n��_vo���U��p{�����Lb����x��WEaԞ?j�����T5Qo7b�>)�[7���	�Om��BH�vY�v�Y�v�x��[�枘c�]i��K�VW�2b~�ho�w�z}뜃�f���9�|b1m�ͦ�\dј4h�F� �e�^��C]/�\8O��zuc���gÞ��H��2�	�	�SK+pA\N�_d�?�������d��{Lw9M(���@���O�^h/�[%U7�"~V�N�l�9@�_T���Y?��ˮ����L�����H$��v�]%<��m���$네���׆/=��O��n�i7֙�K����ß��V��p[�#M��-��-�X`����0�6\�����e�����Ίy���ۺZE`�J�	�'#Ca�p��jAT��X�� ��6V���=�'2�Ka���Ot��F�u�?@#a�,��׉N1Qȑ6q�������?ͼ߀e@���"*x�	�Rx�ْ�	�p�G5K��a��n����������ul��u@-՛���HB��k~�6���agrP^r�"���������>��bJd�'0�Ns�E��� 5�9oWȯJ��h���-?֭�ԋU���ΐ(�?�^G$P!WI�2g���[Ԁ+�����xU�VyD�U��C�.k�IF��%N.fl^�2"�
�k��k7�g<�pHyż [z����@��Ӱ����Y��H5(
ڴ֗��4TQi�nBo��@Z �6̢�Y54N� �|5� �4 (�%��
�7�3�1�@�D��* �dF��2JrU����o$I��t':���j���H�� T��k�C��A^l��H�-��"���D���(�!|�o" �<�D"�Oݨ���<��~ܧ(E��1S��kD�34�^,���p&�2��C�p���ɕ)�?�(3wv�t�
�|��.�m�/�5,VQ-�*gA?�|���
�H��/Vf��D�ý{�Þ�@����g�B_�u=���< dٗ�f`����ǈ�VWEi� 8ɞ)��!?�$-�V3@]�%o.J`�;$G��ȈɈu���XȂ� �"��>��6d�W"1�Z�؍���,�Bꠊ��u�m�|ÿ�HA����e�r~�R���>�k��Ph��r�bRǍ�=�q���s��s���]*z�k�9����D��5,P��(��P����dK
�ٟu�g�Qr>R8�G�?�	�1m��x{?W��M����4H�|K�ʬ��Eɇ.>G���g��%H���%U="%vH�@��p�&e$d�Sw��h�>���wwH�1�;b���)j'�M� ��YQ�4Ďd.�j#h��1��Ћ��%	U�릂r�i�>щ!���_Wə�)�1��us�*�2pm��� о7)���ʸ]�Q����^V���Uh�ŕ����q�@��*��O�G���y4ty4:Ę64B�3�N���A몶ēJ�Z6�A�!4l�F�1���Z�:��3q�6�l4�,�'yL/B��9qȡ
9�N
�K㺗�A|�6Q���|�?w�s'`���c'��˔�J�������-y?���x��$N����R���ە���J�4ؼ�L�t�)����Ӕ�nsF�=?&�j��������s�����M�r�ҺF�
sb<����|�1�H�r�*���-vC��O4�w,<6ƺ�Fvͪ�=Fƾn!��$;�ı�
��~� r�/ne�@���Z@��@qzdرT5�	^��HBE�P�KVՊU���F��:��(����'��aE��'w</��'���[U�Mdl��S�&�)s���Rց�d�Ҫ#�@��� ���̓��Y1_�-4��_��Ǝ��QT�|�r N!��g���%�'����=�\�m�%���ʗp�8�6��RK�NZ&.e��?Ӧ�L�jp�6h/r+XB'�Ґ�/�'����sd+�*�\4�J>��u���=k^��H`Fv���q]"`ez<��n�!��e�+Ƿ�qٽ�$RFb�h"�%�w뗏����p	?|�x/��hl\QƣI�L��Tt��lR(�T<��(#�gމN�(X���J9�S~n�
 ��̼ �Ղ��B�E�~8��&u�柰RA�k~~���ߑ�I�VUb�N�+��R��!���􄢜�dЂ�Ȅ�@\=��X]G���b0M�`u���g@��u�3��&��Y��Ri��xIemNc�g����@�
�F�����^m��$>\A_�:�~v��&��@gTE�e[�(1�=��+P/5�2E�>ե�E�B�,���]GYi,���|�Q�i7o�NS��ь���{����n_g�RSD�zqB
��J1"_-׷T��g�g�2�Cٙ��W]r��fS\ZI��̭�[]`D�F$��
5.�Q�~d��v���03|޼��-��P7�U�?o�ö\�{>�rQu ����'�t8ڵLdW������'�H�#����H���Lf.����}�dx:���X8���Ȁ�:��<{���ؘ3�]4	]�3@��./�+ƽB��5�m,M���庬0r=
�mh'U���N�&O��֣�$Cŕ��4\%��J��N�y��^D"g�	+�A��2��z#<�һb����!�΅O�F	+/��E��ǟ�rP��#�uG5*�)oi�/��x}����	ÂY<�^����e8(�/��J�2��	���)��ZLA���1�ӣkڱ�+�}�s��(���5"��GG�T�2�����sÉ�QDm��v�:Dd���m7\�!�u�,�p��@�]�4�*5��m<�Z�9�7�*�N��
�,}z!w�`U����37a�{��a���G6�F���7���O������$Je�^���2��#�;��R�5�걾�q�QI����׹����$�?^;@�a0wX�^�~$͟���`cTv�\�]顲���$�C�q��vk) V��ױ��aއ0�Wb�ۺ����{�F�47ضm����V1
���j%�u% VY#�� �0[p٢���k�}�gB��i^��ڶZv��9.o"=�C*�������Z���ڦ���KD�rX�!���1¼M�OW�:n_����k�ؙ�m��3������Z�B��gG���U%�,Q`ʌ�XGA�T��:�e�����y����e�b����>�	K���g�E�������$uhA�h���'�d~ҝ�ю�qfz�hOl��=�gyOu����0������0�y����z}�h�. �V��=
F��`������N�����,�]��M���΍� p�]b�{�F)T (�K1����0!;S�NO�b_ޏ��pa��n7�pB��XV�K�Ս@�#�D)��_`�8����ey��P���6+eP�V
Q,.�[�����1WI}���߱BtT"��2&�$��	z�Iwov��[�_׾�F
=��i�=i�Sؽ%���\�qK� ����p���Y�|]����&S�T7;:���:�qz����4�`u����_����=O���oP:���-^y��[�s�T��	1K2(7��x��u�Z7*����^����X�p�m�إm������T���2Z��ί߿�a�_��10y�8�bxw�>[���tH�j�W㶹���_�j�g��u�F+�v+�O}�$U|��@焌�@�W��e�N^�H���,wG��q~��
�b�P�*��;&s��� }  �xa9w�^��<zu��֋�p<'�In�H�e2<55ŗ�p4�wA��D*��z�H)1j����@�	���r��Z���n}>K��,`��ͮe��r"����X\�fE.}Ids3�Y�M��a$q�w@s�Ď���w��p����%	��?S�%�(�LO(QO�B�����U?��la��,"���rDv�K�C�1�˝�Xu���V��
�5�Z]d1�:.�ٰq���ผ�3������������ַ���^��F��*�0��\3W�dq,);Ӭ�(��u�ɠO�\X��#e�^ /ü]!I�њ\�~x�:J��!���B�-'W8Ú��t-���I;�K���L%z>ۢ��S��&�T9���wqp��ڪ���i��e�W�݌�P�v�mv�Iޣm��s��L��L�m��V����٧�-o��x+��#��!�:y�x������$��twX@�,-��X��]Y͉��^�X��P���-^���%��8vCЋ����-�q��(g����4�e�\���z�f������]-]�O*� } �^�ɦ/--e�Lnw�������J�N���_�nق�-��z_R�&Z�Ǔ��3��4��M���q[��'�����1�w��g|�Mu%�oZH��Q;N.$��/$�I�7�h�:+��,�s�2�E�m'}d�Qk�*D�b��1XOQ`�w��"|C�m)�>c��<��.&�?::��y����<��k'�*BX�}���Hf�����Dգ�޽D���q�h���CX�|;Z���j8M��8I�����9tE+:PdF��5�P"��a��MB����ǼBBB�q�G�!g�O������2h��/����1��+�:QZ�Ǿ��1	�0A��$Ȧ±D,�(��K$����I��t&Ƣ)%�J(��XBI)���)#1J�M�c���g Z~�o�̶[_dD�e�H��Q)�rf�Usn=Ĝ���tm���!��ђ���R)�<H�MjE�N�'Q�t	'��@����9�$�+a�'�q'��Ϳ���3�CEȶ�;������)�5����Cg��5,[�&����qΝ!I`E �Z���A��m���~lv��#�{駳-��.��	)JH���r��S��F_a�T��O�TO=�)O��3�^���E�̙���� ��e���K��254�K��3O7��g��wz5�7�k�}�������-�|��I��ق��:�m|��;�-�wf�H��9��i&�zfQ�5=���N;r6<�lx����!g�CΆ��9{k9{;޼:�����	�֞W����.�W6N$��U
�3i\�N�G�#�P���t*�y?C�(W ��c��ĩ�������s3�W�|�/D��ń�M:���òȬe�O�2o�_�Dt��d�H�:f�=v
OF���9�Ҫ�)�q�5�� Xo!��H��ޱ��;̹��)Vu��e���+󋥪-r�x���(�a��b���k��!��~�dVl�b��L�?<��XR`�b���-�������Z�S��k����WO+��ΦV�������b+�f �g���IEU�m�_��M���r@g`W�`��A��k+9R��3���9a'OQ�y Lo65�AXi|�V�>��G���o��Ե�q�n2��X"y��R��톈Y�V�Z]�t�)���nP�W'	n�{������l��z�rGӼ`G��M,�jz~?M�~��ǗԜVɦ[�ʱ���uD�+(ԼP��?�k5}�#�q��5�;9^�Z�ܞ�v�FnʛY���B����`>^�.�[���J�8�2M����Vz���a�gX�Vz���a�gX�Vz��������	��3��tNEQ��x�)�ؕ���DS��T")+=��y���            x������ � �         �   x�3��8� /]!;��t�?N##c]CC]#c+0	��qqF��.L�����P���Ԓ��\�̢�̼�bNC<zM���Y�% 3�j7E�Q!$hR��ӱw���4£�I[AƱ��.)J	>m1z\\\ Pj[�         3  x���;R�P��d)h��H2B% � ��&/��2B.{`i�쬠ԍd'�����?s��aP������t���1�n_��&9w��Jah��iG`L��K,<��g@�$�2Ku�h�wI��vf}q�ɵ���X]��������X�n������Qm ��,�YBe�
�|}��V��H��#�u��Eh�0��ى�)Ѓ�Я �'&T ��	�y�~;�*TS��s���R����u#��7z��4Qf��[�A�}p��8J��	�W��v���dL��z��us�$}����            x����n]Ǖ�{��z���Z��"�N�`�,��.H�օ.� A�� ��h�h}�6n��r����d�q��{�D���\s֬Y5N5���{g?���������{g���������ߏ����qN�	������Yf&�y���ř]*#ӄ쿻�D�w����,!G�w������f���<!�?ܾ��᮶zo�n���\$�����@��	w���������ݫL������������W�����fxʛ��?����Q�G���ǻ� σ��ͻ��2����G{x�W����p�!@��՟�>��7NȜ�����2�z��?�3�l����j� ���?�^]ff��^h� #�io�ry��A>��]g���ɻ�?6���0���6�φI��<��ÿ~��q`�༹���O�Z4�x#9�w3+���ǆ��1���P�n������l���w3�|Z_Ϻ�h3�;7�
l2��9����~o��<���ݼyn383y��{=�,��fd�}P�C������<�~`��w�������6Y>����~1���W � �A��y��q���5�¥d-7����)-ק��G�����m� 4�_��Т����g��,ir�0
``��B�����p?&`�o ��>���l��M�F���>���������f3���my�7K̼e���L��������zF�@�X���7���]�����fv�_ڰB^��gtx9�ƙ@uD6�Ƀ���z>|���1OD�?������c�W��ONe�x3����9�y��vW��.��߇�q@d���l�7[P�f9���3��knlx%W��t��·{�)�!��җH�a7*�;3����"IԌ戳�̛+���9�u���[���nЕ�w�Z5�8L�o3�̣-z[�S�Q� \�w��������Pxo~��[�.:����"1y�M�����R�������È���̽�L_��T=0�����d���
������N��̬X�D�A[�n�öy�ȿ�L��h���23hF[��?F&��Ý룳a��Ȭ��'��ehk�X'�@,�7(3+#K����~�2�s����^��aq�jM��3���|���?�k�zPG����Lk`�zk*�+V`y�e�Ss�!Xaҗ
�P����#ˋ(��U`%�ԥ\�}U� +S���dR=GT*� ��\�P�&�U���i{��k�Qם]�4@@m�`��vo����n>4`[���C_�H�L�[�8yM��5�������:� �B���=Ƹ�����w8,ߜ":���`~'������Ρ�ϟ��cХ�?��d��{�tM�����f����T������A�`����V�GòD��E�h/=�"�]{�j^�xbby|[TP<�7���3����e�t����ǋ����ۀ�
$�)?�١��7�����~�R�QR�1|F�Dظ�9'��m�l�ؼ@���.�:[QlC�&�*�(��K����{YỀ��b��&�*����}��H��*Ѿ��(��w�&�8���ٖ��`�	�o�{n���X�(��|��m��f&�<�>�t��P&���E��|Vݿ_�R-
���S�������__����d�������S�s�i������m��������϶͟ژ����.�!�2����'���t�p ��!�+�hPQ8�u���F�Oh\y���yF-&>�����=���չ� @8+�r;���%��kA[���O͇~d>�����UE:WX���b��o?"�(n�k]U^�W�!��l�������'���4m7�b�܆rX5~;L�	���?d٢L��Ɋ'��˺b�p�xU���z��74l��m�  p�c�28��m�&y���.^���	�g|�������ľ���|�$_�-a͗^����ߔH��D��$H5\&9h�`ه* �]-�>Zಒx���m��q�;�1qS�H^�gbfx�ߘI�:�I�~Hd:R���F��F�A+�����7 d�GI�9y&�і�Q�,\-G�5�a�u�_$	�$4�o������9}�o�����u��WI�E�C�H'�7��y��m-8�����~쫨�C����~l#�tx���8�;�� ���i� ��%� 2_�_��,�����pJ�)����ó����5�r�<�+2�?��Lb|M>Fq+n	5K����ɰ7n8�D�:Q�7�P$�O�=.�6Ys������k֊X:�Zu�ǖ��hDxG�̭�$t?"n"�~ ���*�P�J �UBM�: ��w����߼���S|���� n�,տ@</�M��Q�H_���/���KՈ@l�(�\���ͤ:� ��t���Md��kH}�5����P<����K~�0��i��/�@ܑQ�{=|�.pK|9h��4��:!(���f
"e�����<D�!�J��\��3M�]� �ͧ� y-�ӑ�ɣ����'��C��f�{f �@��i�>'f�0�g"e����	܈v�O�S�Tp�{�<�!�(�h�����A���dx����wM��若 7��e��<��b��)kWF j��[' ��Y�wb�6]���E�t
��I}x�{�MW�A�nl5�?�m	�j�u崽�V���*�]'V&V{�[$5��8x ���lp@L|os���S�CI�x�:���P�|^�Ub��@n��K�;=~�&q�,�&���lo�7�����'{e��<������l���0�1�y@�9�g�jo��-�Cr���H
�S��X&ߞ� _�v$��7����)&�DhW[+���8M����p�_(�(y�;O�����OŬ�<�,i�L��ҭK��P�g����ɐ�������q�O��<E�
M@q��Jr ���]���=� �.�%G�{�����{�?P�*��]n��$�����x��(���͠��������k�F��#��N�<Ƥ8oNm��x��h���P�`ҌA�����|Ώ�`g�m,MdWx�WXez�ӽfҊW}�s��`ҽӖC��ӜVN��3�A>˧�E�,?�me�)b��E�կ�?��e�[ӘP�0�f�	;�L��g�N�@��(W�ْ(���>Z�G��[�nw|�'���]dΞbM,���I���6GI�@˺P��+�%ۡ D<�t����ģ|� `êy�?ה"O��g� �N�v��(��-�'% i�Q�/J��_B���}Z�{C�vGtN��V�m�����E�R@�8�w��m�����6t�=*k	�"4���`h��M�V@����*��)>\�l 5�W�;�֯��evA��^z���l�<f_V�gB� ���Ԗ������sB���.D��7u��g����د�ŎH��5��0& �0E^��]b����*����/O���g8޽�1;E�:�I>��޹��k߭c�	�)i�ȓ���4�S��� ._�xB|��l�=ڝm��]�`˒�8��  ��5'}��L��
}(��򡄲	��f]j
9�k��6�����[I��Ӆ�r��F��A�.a� PFo�i�WK�a��f�#P�OQ<���}9c�9�^�ǋ�����xY����L�8t�Ǟyыmg�!g�����OڴcW)����� K���5E���`Z$c�/�ϲ��X&���w|�jT�""8��2aڨ���ȳ"����s�]N�*>����Au�F��K�,��kL��|^'�'���s���/��Ť�}�Q]рp3�ɬ�#ANI��4צ���j|�6�q~��_ `�j�doP������T�"3�f��e��Gj_9 1Mk:/�S��*E!.Gv2n��V�ٻ(��hx�h+�Y��x�<S�����W$��:'�����0?1�c���#��5T�v(^VS�s�U�p�@�<փ���ɳ�BK���Ԧ'�'����~�@L˾������ev�0�EH�F$%���ͻ��8%���U�ivN�&��17��r��9z�'����#��yRc;�,    2�n�i�l��c��M^�pzj���p�ǜ��� �~��7�xU?���)vs�Q*u�<9����Q7l@��myiɜ�vB�>A>�V�/� ��g��[PZ���_��ab@܌�m��52r-����=�̀ԇ�DQZM�ot�n	Ń^�m�꿕STr����D��������Gs��9�$NsQO�e��C/|�D�s"r�%�_H�[_��2c� x!;
nl���3/�M�<�c��J
RH0��")*x�*z����cn�������qV��T �'���2ʧI�k�zV�S�P��F=ӀR;u���¥v���� O�=[oz>������!�a:�����^U�'�$����'�����#Zn��1_���k9ڽ�w����k�z�Ҟ4�>���WJ���.�%��$�����[�u�}�'K�O��l:�FԬ(�iq%Xd�i��C�O�>1�I�P@A� G{� r#�/���V���:#`����d��i�'��f~�t^�� a�R�5��ØN���"V�4���N���u_nBO lh;b� d��!�W?�X�4Og�|���㹝"\Vr�GL+{}X�9$�5�mL�2��u����[G-��������xAYuޞ��4���E��>)�k'6�|�G�<��.-(_]�ʬ�t�����(+;q��@���) ��?��Y��q���}R�B��:�+@�����֕
�ylWZ����@��tF׭�n	�l��DBݘ�bK<�^�Hu������TQs*Y�l"㊎�V]�"�Z�#B���i�2���~���\ZOi�A7��.ؗQ�R�m�wW��pM�Q����(�
���'��KGJ��x8�w �0m$f7<�תj}�����u�b���`�5H�(�cW����o������ݬy"�����ݪyb�L���{0�g�� P��X
���1�T���3� 0K�ӻ�<��$Y�({���Rת�{�I�8���K�qճ�1pp���ade�7$�?tL�ـ�l�6�%���4��}E�i��R:���I8og�]?�*�w��2���[�§}&�+����/?��6R;��pM���#5��itݴy�n�g$�4�m�sxTM��4c5�����|B@J�Q �'sC���5hvoN�ܾy�9�(��e#�8!%��<�[8G▖�z�^q}\����>@ru�C膍��Z�(���\�߁"[���L�T�/sn��,���~�t[�	��C*_2���"&�r�4"W�C��@�u[a5ϧCd^��a�Iž<�%��?	��P}�Z��FP��N�,v�&�c�H�x�Le��$���t>�u�ⰴ-$� ��v��W�HN�����h1��l�#�	�T���B���s�(�c��3��j��&�աiht�X� ��Z�� �i��AB ss��&/�=��E�?}yy�/�p,2��J�.�B5Z���ع�>�"�0��8� ��$㟘��H�O��xj�]/�-�����l����V^���.� �Xe玛�P p��3�E��B���(,"�� �6���t6\�� Kޟx����q�O���K�
S�T� ���bdFV�NƇ���L�:�5�4� ��]�?p06����hD��c	�e�!+�A� qY9_E����%V���� �2�@(� ��s#_���I�؋*KUS���������ᚼ�ܫ �8k���KF��X>�����G/T���F�l���vȣ����ґ&�ڐ�R��	�4P�t���`/�����)=�v�����j�U\���b-�����p��~"7P\������y� �&9�z�c�_d�V�[�W;���� q̓ݛ-��%�oF�yA8�;߱m	 ���=������k*��4w��_�@H�����A�VJ��lQ��xM��&��<.0	?�}��I��?�ߝ����L��k�	�D���$�]^��$���3YTM%%`�+�n۶�N�29��!QE���b�,P�L�m�('G�-Q�L���� �s ���d�	dr��z�H^s}|�F1�@j���T��,�X��/�P���q#<3`��F�o�AC4��7�2�Ve�=~��ȡK�F �>�84����H5��$��y(�4=��" 4{Sm���"2ͽ/�8[|y@D�&��p�օ_�͚�I���yO���
\J��^�k���l�,QS�H����{1�Q���@`��ث�g��3�xEeNr��_6� �7?^'�9���,z_T��6��p#54��O�M�P�T�I�q͜���?'�k��a+� �s ��>w�Q��|�8��Eic�@=�m�+PJE[��]�j��A��N2�.%DwF��@��k�hIEY-���U; Y�r�J�<��ư�]6��[���_ѓ� �5m�y��G	�y^z��8�I�|�Y��<�fp���T�C9���~$b�ΰM=\������O.�ȋ����7E �.�'b M�Oj���A ��"�����-; ��N��7��� )Tjt[	B/Q���'Y|���S��5F���,�������x�Ľ?���� ���#��CŖȘ�!�t� �](ϩ��G�wZG����l����<�1�"AD��|���{����Y9:T$[G�rʇ����ܸ�����	�t~a�O$��a�K����q���u� �߲4�B`���m�
cL�3���65������Y��<<��ҟ���&���l{��z�{�77�):�AFt��Lcn(�1�3�(�t�K��o�I>�5貹ע�����#�T��*�'��voԜ�ݢ[:G�C:�.5��3������n��|R��ə�
�k̀�RE�Ps.%'��J��QW��/�{$���'�I���͎�J��ږ��p��Q�';=N��}�<���6c�D�$�as�ζ�;I����D���������p3R���M[�إy��n��k�ԫ���fW3rc��I�>!�iC�f��<����OY�������ԩT�!�~n2��ny���~{��e%Y�&T"�ߨ3�k��� ʣ:�E�t�ơ^�#*᪊	���vFU(._v	s�|�L�X�  ���mG�F5��C1��=��?��f=̝U���*�W�~1,�V&�XC��h �/d�:�c�����_��&�[��X
��^�	�G�'��
�j�& j�"�:�Y{	�dqOABVn��9ǃΓ���X7�A
G�Խb�)��y�f{�%���� �⍶���Er�xĐ�Č��(�����7=����� �P�� ���$����ɗvCG~X�|(��kw��4�̋���Y�(�g���ᓒ�b�-�L��eH{�$����l'�!	 p��j{�ܧw�e�_�t\��8&��I}���RP��JC";-JL�T�G��`�|Q�K�몏 ~�ދ������4
n���A~�	�J�i�q�[U�P:�m�}��զQ�?�5^M;ԃ7)��U�~k��-��,4еZ���1T�R �4\�?@�2X�[���_U��o��:Ʉ�Ogz@k⡼��8��!$��Y���o�e��D`�lǣ5	��(ǹE�A2m��(I�i��#P�J��AH6���������4c^SR�('�D=�w�Q&^��q�-��q�[>q������=~w��<{,�M!�l�߭}�An��KM���	/rs�-�AP�g�l� �Tu��(������k��U.�E����J;V�m�f���s�V#�ʟ�fc��6��D�6W,�j,ګĠsv.����ؖ b.�5����"bGz"��Z`�X�͏,��Ƞ{�]p�Iב6uj���o?^����n����~W(.�"��?ik���s���*2=�g�T�K(��Q��Q�Y�j�)���p5ĸ�t�}��na�!1j�"1�L�� �M�\�y��z Xg�w��5�%��Z6�I��<�e�e�f�e��HEp"����L����t�Z�$����)Z"&0\esDȝ��K�;    #3�Om���(����� �Tu���W,O��z��Ĺ��Y��Ұ�<F���̤���Q!��'q����>jB�����A�b��<�'�r<$�I�گ����f�n�X����4��\p�����uSA��J�s��� �'�5�>�c��
0�/RE����J5e��2+_b5��P�$uu��0��	�����z�dr��@a
D�Z���>�Y�(���+�œ�C����רG[	����X��b�9�脀��6���ag�]d��,TB�4�Xl���|����Y{DM9�ś�#U�x��+�?�q�9$.[��n�_�~�h:A��y0:�	�ܬ�-�7N�T��}�Y�ON�;�c,[l�]�ݭn���}#�X 9[�/7V���z&��B���s���
�ċ�������X�M��E��; f����J�f&Q�8I/HUg	�H�|�$OQ��������(?Ybw$��Ⱥ�O	�U�H\$N	��")��*!��}�G�X<�[��X�8uӰ/Ů5�ty$q%�>�'�H����N��<�7�dr����$Fq�V����н��>����u�x�_ʓf/����I�0�<��|�"�T59��T��?�����G�
͊�p$�*9�@@�3�����n���}�T9�c���#��L�����=�y�+���(e�("(D�6�}ã��(�����܈-�S��<{�������iu,�����a[�Q��bi-2��/V�ţt������P�x���)	d%�y�QN´��4��!��6{U��1�o/��M{&��Ď�S�"0���mq�3��wo<!k>yq}{�'����5Rd��󦽆k�gڶ�f3�t	�|{�D^�v��6��B�*���BL�b��iW	�rr�Z�7�J�]Z�A�i �Q(��k=E��P��y�V�k��5��n��!�H� Cu6�<
������ �8��sRs`Hvw v�������ƒI�Hru�V�{y�C����U��yFgy@��Ay>x��S���dV�<�s׸��@����n��93����n��k�BM��4������KI-"V�
kM-[Ҁ��J��n�l�{�<햼�{&R�����F�$݇-�(��p�'AܻDT$r!�λ�����[Cq*wn�,�#=sS�~ Pl�7w"�c���#9�I�ʘ����g���jNKd��PO��پ�d���ɗ�?�E�u1Dad$�8��yG|�ǚxI��|\�����&�7,(w�Y��e���=��Bҳg�+��\NSx����Kd���٪ٶ�e7R*2OTM�I٠��ITIb�5��*�X��$�G����PA/����t�\���T>F"��ɯ��Х�8H ��ɺyl>"$�~ޗ�G�%p��0l�7��H0��n-����3�p31v���p�(�U=lH��c��g�$=��Hn�x��+O���B�R��5��DM8^�e.��u��n%��9��mZm"�T�_x�%�A$�Մ�s&r����/.ET.]-�n$��il�As�4�k��xT��|-��LI������:�F �ҵk�+���7c=�4��S�"pd�D�D��\�j'#�u��Ѥ��'��~�Y[�8f��%�~�D��-C�8J��=p�o�?@s/�bW[���UD�I�J�"��P<��H3�p��z�E���XQ7��ǀ�$��䷓�@��,�=�2v��k����Ǣ�����'Yd/&.�]��R���oeG,��VY�e��h�N���7j	��g&uؤ��M��7v�l1n��g��<Mu�ϘH�G��/�%1�Jz�k&�ӈ)��d-�ʖ��#��=�J�u�\���Է�OD�[�/$y4к��4WG9z��\c�xXCY�H�AW�~��2~Ԍ�Z(�rXY�|�nT��$��� �6�GP뗒�S���?�e��b4�R�z�[��P��\����|J�a��B�2 ���d��c͗! ܦz&���%;��"$��~��M@
��n��]?r�������_?Uy�����������}r��,&@�Z4�	  �#i.���D�=�eA���骾4"r��$O���������"5�{2I#��\O�6�E���G�2��&yA+7����&q.�>a���)D�N�@!%@Dø�����ݿ�!eU���
���V%���~Zp�Ơ��-�o2�Ӿ8$����H�O��w�PN����o6�ّ�H�s��0���F��g/����q�fbV��麹�9���K�"ھ��^.�����gՋL��}��������dᨮd��C�8��&9B˧�LV�!~��Ȗ�L�/^0�\��G�vi��IhV��]�8UI�r��RdN������&J1��L`"j%ӫS�O���<K¦�i�Dy�r|E��d�j�tX����LQ�o_��M ����3�P>ك7�πI�S=����v��9@�Eu(�|�sF� �bMn�y�����1\��99ϺТ��Z�Мmb�Wa��%6�ˑ�W~����oy���eQwW�$�\�򶰕��-@������^0�f_ȹ�5K���"j_.� x��`Y@�4K;>}?�G��&{ne�h����4���d�A$��Ow_�x��ݗ,�-�D>f�,h�
E���ğ4g�2�	���\G�S��b��^ØX������2�8O���Ws%`���x����p��j��<��w_^�|
�!nE&�XkF[#uE@O�~�;=QL��͟�g�X�V�Vl��~��y߮�-��c���O�d�=�S�T�
H��'ڙ��H�j����w�� �s"y����������-�e]8����J?�/YN���?n�.�Nw��\5���{�3Xvpo9�4ɒ��9􉰱55�c���J0|K~l�䳺5h��yp�3K�M��'q�t�ܰlUd�;�U8I�]�INK���f�d��A���;G�֢}"շIJ��#ͥ'f�ns���I~"��Im]��`)!KD��������wCL�hr�'6ս���q�宫n׮��8����D�V�����}�	��p�Ea`K���_��4�J����ՀB�P�rj)����>������q���꽽n~�m�Kq,~��qx�o�ڛ��,�y{����>���O߰�>�ǲ����o{mZ$���Rڪn�S��Q�z���'��q�5//XV�(_k��_X>��+&f�L�UH�<-f��.S�_Y�:�����}.?������$���|w��Ó��,�[���ˍ{�/��I��Z�}g,w�Hwͣ�b���⻛��Ǧ ���*�3T�m|���lH��HdՖ\�ǑEii ^�1%�(]ݖH����6��o��T��A�ΑZd�d��f�@</+�V�'ii��������bO�,����y$�US�P�������<#y6z�kE k�:��|�.=���Y}v�(��-~:���4v��Q��_���$���y7��0�&��*��:b���#jܻ�y�����,q�j��s��]�4��\HM������)2r9D��%���x�/X�\�f���Ƙ4텥�h8ȧ$W�ĩ2���H;�[=*������c��	ȑ��K~�Ev0?�dii�!)j�,-G�$�uE������PK@C��J�s�z�����4��+k`FҒ�#%�HF�w��b�tP4��
���4��R�=�=��+X�d?�*��
��G��ޠt��+�{#���ױ��B�Oꢵ.�Lə��@9�6(]4K"ʡʢZ�(�����{2lIG��Y�6k	YnX.x�9������E����H��������)D�	[��(n�,ؗC�䜆��5����mY�S�F��+;�@b0k�����'�r�$Sd���H�͓�OBr��-�DV{uwGy�1f�o�u�����fw�BH�@�����dT��Z����Ld��9��C@�P��5h��[���_�$_����ً��槊C�|�$� ���un�80�^Ș��du.���W���~�5VT@2�����,%�Г�������V]��#��������8�P,罧    ���s�{�X@׃=�2r	�:OȪ�l���Ӻ��K��4��#Kĸ\�x������Z#by����ၙr��(��� ��QBH.#Г��3�|�<e$�h�z���Jh��(�+�v` ?�
���'CSO��Ē��Ώ�h��%.���y�.���q���D�k��Y:"�!���ojZ;|C����񏃲E�l>�����y���$��9�/9�[\J�}~|o5b��N���Z�� ��*!=��� T����\02F�}�N2�Ń�J����Ն����r%�Nޣ5��_R;���j�{�@q"��l(^rb���#���l#G��1��� ���;Q���^5י6�չga?GJ��O�3YQ��[/yl4[� czekx��~��*<ʡ5�!Ac��f�&�0�L� 5��'���93��`��%�����cq$]�sj5B���)MȊ��=q�1����1R�R5!v��-�i<��HmF�Y�$�<�z��"���m����(|4/�(B�(�@��|�l�bZh����Sf�R�~<���ʝ6o­���ޜ��Eul���a�	� ӰYN�A��pȔ�������Y ��_
�T;���k�K�,�7,ffB�z�2YExO�|��"�8f��HZ"�K�x�Ii�J����D:H:��TK���5hɔ�X"h8%	��k�=h�����(~e]�U;C�������K��s3�Y����횥QM�*����)e�,�,ϙ��_w�DQ�E�p�!����eI}�B'
˝"b^'M���I`���%�!��Dm=�< 3�c���χp��lV��.��t�
;B<EU�D$���:ܾ`�����w+%�k�!!��۰��,��<׹'$R�[Ќ`���J\��4���s��_��������!��$�x�H)lD��]�!����P3��ͅ��]I-nGuQˇ;3Y7j��Dv]Yn���T7�{��(]���%\��i��۱v0�[��e������4/��HL���#Fr��ƓVw���3�*����@M��� ե"6XJ;��~�U���ʰ�ҿ����uC�E�~[f�����=��I�>�ߛ�إ�����ոS�)��H2�<w��i���0�󆠑��DJ�{b�6P�ʳ�]�Ĳy�;m �rzw��9A�=ұ��k����w��1O��MÄ��f�؛QYDq}���5+��j��7JZ2F�ơ��6��Ag-���;$��GK�>*�uD��Efh�E�d�f�q�G�k�����r�:4�Ǻ!ez��Q쿷�������]su���n������������}����C��4��Q�����c�@fQ��W�����p���s�3]��w��I��F����d�(r���F޸�l"!Dc�]4D�q��yA�ًF\;�\���D��i�����U�����7C2��c�H�x�]^�73���_w�x�gM���Ahh��W����������<mT�2���skMG�'�U��d��N�$�z2������Ga|0��1n�S��+d�I fhl��A8wWs)������E5�EG�b�����g 2���R���)=_�Ì�����\4H�ztl�6�O]����Gѓ��m^j�3C֊�3ͩ���Q���EN���/R8�#o:�/5������N�ފ���)�L�(�zW��7��`�{}u^"��j��X�a��j/!��b��|Wy���x	n��~����F<v_�$���0|���$G�'y��r��'�9��au���<�~���bN�}p�0y�����f�`P�Â��Dc\Cbv 2�H{3�1��ˆHY�aI�y+�m3�ʎ
��
7��w�[HH�Ď.PϢkS�;~h�1i�o�qO�~Wr����{���P����.(T=+�aJ=J�%z�"��� �K����`�T�t b�\��8�E�%���[���4�GR�������p������<�[n������0Q�Ӿ���{����xB ק1$QAE{N�2��*M�X �(��J`J�_�P��'�r������{�U`������` 0����3P���գ���O
�Eêk��Җ�r�Y�j�# &PXWN�C1��Џ�����PJ{��F M�x��6��ߎ��l^�ȭ:$�t_+��[6��q��G������78ME��w3����!1΄��;m�I���(��Q�}�<�lR�7���E���<��@u/�a�rr����Mda,i'��R�S��{��,����"�(��K���q<ѧ����� _���TuBb1���!f��%"��6ӕT��Fu�%Y!�m2���6�l� C��0'ڡ��y������)J�y� ܥX:?��6�*+E����,��%n�Q��%���c&f^��>�R�̄��uY݈H�5\` ���.��@d)��m�nK��מ��.B�]���m�Ԟ_,��w�D=�u~-"`P��DԢ|��j�<�M����J��#$J ��v��[a� x�i ��j�{m!iT����n��� 	F���}3W맍8�Y>���n��s�l4,�a���M6�斥vȹ���T�}�#����}#�6]������i�5W�mO�	��~�$��F��7������f0�lBy�y�ABV{���<<f�B[�<���kɠ��"��*�<k�{��,C�k�L�\T��Vnu�Wr��IE�}�. [z�R�ΉՆ��^xwF�c���~	�T���*|~7����©̄!*�F#�uC��_��Pd1w�Xvn=��@6y˃*>e�Pf@D������9�	Ji���$�!�1�O1�ϓ��é>L����c>,Ν�Խ@r�,q��Vi$$Y�����_6���a���Qx��F��.~���}�!&��:c8��,U�C(�$���Ѧ�r�;�J%@k2�25��J�<2s?,F�;�<04�͝���\�&���ALAF�#�S������
pο[�E�5�B��4�?����;4` fX�������+�r�B�j	�/,��J{�=�&4©���eH���j���L�9�H8xS_Fr3������q����<�U���ͼn�/O�wGHS�H+�h��h����f�n�HL\+L5���>D��*k�ԃ�=͜ y��j�&���P}pP��RYF��/��$e*�'E�����F����3��ؖ
�Gá˘�(��>}�.�	�:�ID�ub�,���5���V5�R*��4��l���+_�.�]y� ���E�OW?e���iK5C��iX��%q~Jf	տsP���ͥ{�\�m�P#'��ٳ�Z�\d���Z�{@ ��5g�+���u�R\9?\|X D�I�g��E�,�U��e��Ŋ�rh>ع���^�]�p�æ��l�2b<'����R��R\`/�/��X3P�M�ͺ �z����N���ٯ \�ᢡ"b�n5��i��HI�&"fڻ�'���'����������%	��iyo}y��Ue��9{�__DW_i��Q�������p$O}«�Z��O�G޹��CdL�؎9T(�P�
�W�jdjk&f��Ӧ�L���F�%��:ݠ�_���ퟻ�B�O;<䄌�_H
	��mw-͝3�A��&�	�V�N,�Dx�T��}�H�ѲGb��x��%⩍�P�H����5�/5:�3D#�ԺzÄ���y�=6q�|�AP�hw�5���`�Vce�#b�.`>(��tua	�$'��D�gzO{g2"���>e�Ϣ�*p��63��A��H��z\F#E�Dځ��RSC�L$5�'���`��[��7Bq
W�uggj	�[I� j嚅؆np!1O_ Q>J{�T�:o��U�qX�"f���#�<l�썬�M����͋o�mg�G��o��KS�|x;z��aR��� w�i���^�b�֒F������a�{��>�~4_�n��}� ���Y}Fb�*Ij$/1�o���B�2�H���i�]Y&���(�	H�ԛD     �b��%�W����3�B:ғ���f����@"� +�����noŭ �ԡ)@͇�Q�Hn���m"�@$:�����;$���L� ��"/so�H��]oDl~S�W�p�mk=�tI�����!�����2k]6��|ĭ���V���V�m�����?	u\��%r��Z�<&�[�Ϗ��t݉�����+���h�#	:P~+���!p�&�Ƈ���7jކ���*��o�)�s�S1����ᑂ�v�4�L:w�͆����\"��q�dYu�}�,� y��߉*�ũ�AՖR����]��Ģ�7���h\�}r�ϥ37���:�1�'9z
�s ���Bv�<�5Om_Z�0E�%t�n/��%B�Tٮ����g(����B*y+c�@ ���;�/��I�#�$Mߋ/��xK<��d38������]$"=�\얷��(�Si�IC�+5 ��hK���侔�$ �!�眦�r���G�$,��%��.�z�j��r�п d�k�Ɇ�U=W	���|��gټ�e�Vfa݈b���91�����v�CW=��0�˚�޴n��<i��-4�3}�B��r+�~��`	��g[F��h�$GU�������?5@J �� ����=���� j�>o�^�٭�.�/`�h�4v��u���W�U�ĢT��B�i�H���+��]=y�n�I︳�`�'�CF���A�Ԓ���:v��y�S[�Xq�u/E�l�Ĉ�� �~ʿ�R��+�~]�v�����/��8�Ib9L��ӊ��,O�XI�3+�m#m��Ù��e��Bk�˖�Q������vL�zxM�Ҳ1U�E�[|����g�QD��إo;�R5�<�y��p��~]?�R[I�ʁ�kw�P9$֥0D��Dmg����q��0~|;�g�]\67:ޛ���K'# i=���RX�X���BLJ�+w�Dʟ:ڽ�\"�tA��w��$d���4λl�Ր���\���ʳv:!1u��~~ڿH���KDn+���K��ƌ�n?��%<��{��F�h�`��V���D�C/�Ǧ~RN��q��Ix�"s���t"`���
�<\7b?(!�_v^���,@"/����[R�
�{���k�$N)��l$�ط�;�R��p�Z���]�˞t��X6z�[�@�0X썀|H��d�	I��$m HLK�]O4u������N��c�b�\v�i�/���E�V���>�	��"��}��!W����[�� ����P�^dF�y�ÛL��M��EQ߉H�nY�HK��F`�V�W��8��K��Q^��^�A�0jC�	+��4����<���Ҥi{DD¯����~�@6��sJH�Q6���p����:�b�#�w��8]1��].|#Xw��<�	�%����h�,	K'��L�@C2u��T^|=}�o�b��jm:���&�0��y�-ydE�7w�O�]o��:K���s*��,�Y�� \AE"�s	[�D����L�)P�OD<)R��n:W(������z�?(D����{XV�u����ˍ�m�7HiSV�I^���D)�U��'�=��(�C�c�O7��]U��Ǫɝ7ĢN�k�A�3d��U�Av⒘��^����$�T���q�����P��<0ʣ�qI�!9ԎU�yv�����G
�����Jvȸ���\Ĵ��L�"�G�ќI8��#��Q�i� ���Ź��d" �m�"���H�t�ޘp��C��ۂp~8D���������T�h�|L���߲Ք�,��$~��e�D��w4e��sF��:d���'���u H���$@��K�9�h�e����"����e&���&�������-��	Ȗ\�>Ij�e�|ڛ>��xv?
#!M�r\�Cb�C�]��,��L/��k�0F`I�VuY�P�\J{�6���vmIT$�̒�u5�h�������ǝ�XN��� D�/��i�����(��A,�HDv�D~� ��L�AH��s&z��q� �$`R�qK4b_`���e���\�3Գ���t�q���%�D�2��$�U?� 5����<B��Ț��D�(d��q?����C t-3�?h�Y��|�Q:�*�+�H,��{�>2�������	1�4�=��8rfn�}�	�H	f4DT�����I��p� 2����Eǲd��GXHn���>��n�}"CK{%)�L��P��٦�\��6�kÌ�r���׍<m[�#����D�ҿ�j����{��Z�tXk�Q�r#nߐ|�?k[��pK����ģ��j޵l^Dt�L1��k�
������t(LY[:�HV�/D�c�2҈
[��g��% �t/e�TA9Z�J&$e<-�
bR��2�HL�Kx��.&����-%������z���1uJ�һ�,��!��:s��W��t��+��T_��`4i��)h��SAvN�<H����ݓ��̮ڬ�X/ ���ӨK�T����HD��u��$/-�9����>.|Hy�m�@*����^��A��)%�J�2_���,"^W�¨��(�TR�<�V]`��M���z(�uX4�����߃/������H\����bsj��K&�t$MV35� ���ɪ����C��!����/R���xv`p��@�����m�
4�|�H�.m�L@"���ـj|�ꀺ��7%��!�6h��vg'�k=�["���~:��<�G���&��i>n�G`��-�Aw�E��voܣ� Mr���\k����]Y'X����J��#��F���j�� [�BOy""�������;���'��D��EP���)˺@J�|ʎ �\�ܳ4" ��{U?�`c��UBԤ���T%ZM�/�7����L�}OCdRQ��9��I��F��BԒ(o�BԊ3+�w���r���"������d~�T%������ �,�ϯ#�XYXg-��u��1�$�s�vi��i��S>[}"���MTִ�[��0�C�Xn	"�D����\���)5�R�A�f��G$�1���r�2ͳJȼU{X��_ڷ�^.`E@	�Y yM�l�,:��a���/$h\���!�cw_�5�Pk�>���Y��X&qyV�/0���2ŦCO�Iz�&����>a �����t9!����^h�\��܈S�͚kY� ���BE")0�,KX���
`�����ջ�x$�4b���6��u�,��+���߬�C�M ��.�b�+��Y�LGl�`R����<�����#�l�V�BH����/�ٵZ0��Q�t����i�\�Jb�E�v;���$��׈�	� "�I:3�_����`�`	,5ّ��
���� 6�k�{rp\�NV�G���C�0Ay�ݽ�y�i�	��E��Q�,����Av�c�/�E/M������3�B+��;̏�]�-@H=U�m70���S��"\)z���	��Djd�&1��}ղ3�G��O���VZB"��, �UVUFMA"�K��%�D>�&3��Cw��	��w�"$g��FJ�Ŷ��Y���S�g# 稻�"���I@
���G��eʛ�	 �[���1'����?�"��03��I�F��#pqC�sc@gpˑ.K��-�����fDВ �.�B=�rY�@Knc�P��p]U�v�0�����]Q<'��3��YS�E������\��F ��y���Ώ�b+!dU|e���f�x�`bF��;m�qu��ǁ :ĥ��Ϲ�M-��W��O@H>c6&�V��w��8��pz5j	)��UL�,��Ao'[�ȝ�|�79߫	B�1�g4$% *W=}w��Νf-BB!����f�e���!�tz�V�$����`A9�w;#�>�� 	�Tk�rD�Ӈ����u�)ı� �����m�� �C�"Yo6_����Y$u��%Dܪ�B�Dr�G�U���!�MT?cF�e!����$7���`H�ǐ�YU��V����|-��h?�7HX6a�7�q��DOR�]�W��W�2#��d�    �+���G����f�r�h�*u�2������	e.�����e2K��g��V�I�n�4��c�?�c����`"q�t��zB��i~Y� �f��e�`����2�H�h�ɇo���e]�E��A�D�!����CÂ�Q����s��q{�="n���[3,O���%�3F.˪��<�߯G��A��2��^-��k�aK3bn޸�PzL!0�'t4���#�@�#���b�!1�#��;ʧ�Y��}Pz�����k�WU����*�;��ˠ�c�~��YP��i�����D���hC"A���[�<T)��zd�6��f$r�c�vK=H��O�n��ͮB�L�)D���b���~�]�&O���a� cN����K�����{�ߓ�C�vjgf�5\>bb�H��d�r��u8!��6�(e��>��j/]�v<ڼ'©$���}�z����F^�B�eER�5x]&��R1�+�,�Zeu'H��V�[���2ҹ�bw	��v���$�hMg?Sz�4ɐ��P�`��|Mh��j7���K�3	��anB�_���Y��S��_*'9mK#`�����ED���5����������%���V�����o�|�׼B�*�ݱ�G�{/%77��]�h�Bc�+B���-OL.h��	�S�ݟɹN��b�ɸݨ�yO�e�S�� �̈��D���j>�'%�:Z���.���!�qT=�d���W&���j�Һ}�htp��2�s}k��߶�g��OY�e��]'*R�K�9�{Vi.�I����z��S�~��=7OE�X	!��h�L�*3�.�K�t�R�C��������(-}ň��%h�.��qn�ħ�`������! }�]yԥ�,�f	�=7���(�gv�{lR!a��J_b��G�U�w$����ge
�q�@��c �eD�~����]�4rBbE�?��{���
��%(������SO���,�n(�)w_G�A�r��n�VW1�A2R���Q%��Y�B�Қ�\�p$r�=�&�lD_^Z�9�k}?�2�9UJ��|
}��ʜ��n�4��{H�5��|�fk����5r��.P��*���Hk�l��5�����✓�����Š&d��o�.�M{�����Dݖ��x��Ji^B<%����C��,�����Dg�.��d^e¢��tQ�ȗQ��Դ�*1%p�=Q���V�V�����Tv�2Mʮ+���<��{vo<A����e��$��I��n�W I���O�>�H�4�Y�RڋWO�o6n9&G� t_�)hb�����������_|&�`So�� ���rA?"�HU�-nUi���0�Ĭ7���)�q�|[����H��򁀏��c�ƘR�Z"�8�uZʭ�zv���i�M�)H��Q����4-#u����D�Y
�� � .1�M�,C��@����Yd�A{	�Y��"��n� L�V�$g� �Մ����A����L�e�"Q����" ڦM�yZ1R��+���"��?�����{/�ޔ�beI�����"�O�����d�V'DL`Yro"%#�KC�sC��s�m�/pV��EUIrt� ��,��Z������Ǟ�b{p�Q�%��c�Z8Ƈ)�-�{V�Ɲ�S1lQ�֞�â،����A�CWE�M�������-x|]YA*be_����֬�����.�8#"�v��*`��MИ/絛	��:��Ǉ�j	���YZhz��Em?D@���F��\ĿDV��%G��˽6���6��,��j��2Q\�UT y*$�9�Ssʣm�^s�
_E��(�%�X4��ޅ�"��za������#��;�s>���FZ���L�t��h�L�=\jV!�<�x�ڟ�կ�s!�CV���^���ę8B"����R���^I>x����)1Ο�e�7�ت�|u7���L�k�Yэ��3�D�,T[gI�,۪9y:��~�uY)P>��<7W�X�X�կ6��E'2���!OФ�e�"1;���K�Y�w]&�kdX66A��G��w7�����$G���↛iY���[���$O�Ӿ}P�B�%9|�?��^7DJx<�J�D�%\�'$_��{�y�d�k8����s������Kg�����YX� (T�G�p�XG$wsb�O��)f?�IZ��!dQmڃ�%<H����Hj#*%
�SDj)��� N��(*AQpy�;��<�a\�Z���;YP��5s1Z��H@ٮY�1i�!+�%J��"{�W����b�$Oܮ�O�Y���VH� eAV�Gwvd"\+��s��Q��E�}H�<�z|7B l�a�_��Tz}.	"R�W!�����s��A�2�I������,�'y�p�������[?�Mr�%��p"ZL�L�YL&�2��ǂ�
&��,������8�O$�!�2���wob;h�����a' �=�BW�����Qu��j��,SYp�l"9�P�� ��]*���4e鲋��W[g2�
l_��呱5� �@⤯�����dOb�-�dJ���%5���#��Q����5k��oя����KKx����y�Tjzս�y��N\;G �9���s�����k�,7�l������w��GlB��]#�S�!dR����bH%kd~4�s`B�R��;��ւ;(
)��3�.�ps ���p��R	��@`�+����HDj�y��`�qH�s~�!���L�xe{�Y^{UX��Cg��s��|���ȶ' ��)g6�:�Rl:ٌ�p���|U$�ES����1O�"b�-TA�(�`N��O7��xW�꩖�M�2���L�e���,tJDm�:\�5�Sn��]�0ib6���b	d*o�3j �w�V[)3u�OR����T�~�HeN����0]�Z��,��i���*qp����!�,��?����F����� �Cu�G����?w�6o)�qE�s��5fՂ�2>����bև���T��tșV ��Tq�.耔
���k�V�ڊUPR[�h�8I�?8���D���@>��V_0Rp.ɕ1$Ұ��1�+s��F�ӑ]%m�K�s걻+(����,C�"��$�vЭ���N�ݭ6ɽ'}��x��++-�5��L{/�jI!6M���^=d}FS{)"F���I�q�K�IB�Y���#O'bV��>0�����BjD䒫ݻp�K:�J�{�6�ٱ�Lt�-�H�^A����Ai5y��vXҚcF?������ &������M����7���+��`=KH`5wW���c���*"����+)��)�%^+)F�9�;zI䤽��3=4A�֝�wg"��pmO�!��;C�9����Ȳhu�Q�����ԲQ��A��Y+�$�8ݒk�t98���ǀ 3&����,��d>y#"b���F��������h�l�Xe5��S��$&U9FD{⟀q(�o�GIR��/ue�(���Gy�>�H
|���}����ԋo Es~�ݵ#5*��_k��}�HǗ]r�w�13né��D�`N���Hh���r0o���>��������{w��xQ� no�R��� 9��c�����Zf�/Q$ڤ�[�:��CDJ��<L�w]<`�pɼ�f��f9r�{ϱ�!��k{�oV�G���O}QBqS�������j�"qiLMCH�����"0i�Uf��^2�F\B%�&2�||�F�iy%n0MT �mZM	B�S��H=�z�g�֛��ӃD��r�#�ǝ�zY�N��g�����S���Zw���X ��U�J����#$�*�K�)���'E���n���Z?m���rΥ��԰ȕ!"W����N�J-���L47���m���H�*���Q�}h���ob����ǯ!q������]S�%�u�S˛�)I$45�8ou�7H�L?!�d#<U����� Y��B]q�ҙ�C�S��ϻ�q�	�:�[��II�����t�&����o%`�>��!�̋�j&(��[��̪b,��;h)���n    ����%�{�<B&U����"�>��=$'uB=�w<K5��������լ�㽪BȤ�3�x�=��:@@��:7]U^�m5s�P�p���7P$�V�r�z���-��1ѓ׳#MEF$UJ(��,V�AJݵP�D+ n�i{�(�@�3J�8��Sέ���jN#B5��TA��ᮻ�qTC�ק���'
��pNb��6�V{ ���!	l����6�}.{��K`��",��J^�$�3i�j�N�\�Ղ����d;���.�'�jcV&axD⯩��؋�h�A�{� p���.@��%���Q��o�	���M�G:&Qx��N��)9���"hϠޠǲ��7$tC��ƞ�Iy����ޓ�)C������T�Dn�&��O��<������ʳ��ߵ?����B���I��{V���8Alʾ56!
���BH���J@��J�s��ˡ6Oբ���8�R��[u���qV�OA��+�LӞ�/	��Ɣ��(=R�������9T��l)UB�E`�WnŔ�cQ���q��=!��f+&�G���b� y閫�n^_�o܉������HP$"��ԝ� %��e�U�X�����nȥ.�$w3nwUJ�7�&�6��M I���}�j���B�D̒I�p'^8�����@:4�8������w��БY�����k�ƽ��]�;�"3u��|B��7Wf�ˍT4p{��Na���sO��iu�D�(`�""��.�Er�� �����F��ףw�m@����}���r����D,����{����}ןv�^�צ����n\�7�l؟�;43���lr ���^g�3��gp��Zo�&�Ӱ��usS��r4C�D[�1؝>$G��M�p�t�%�C@�%��~���MO:�R"r��WH FQ����X3R�H�"�wA@�x�d$�C�Վ@qt\PXYT�IU����ļ���ۙض�# �M���b3D����=�s/�	�n�}�4Ic�B ¢��"f�\$�� �Y��J 1�yչUЁ����6�2?�f �����B�C�=�6�����F�9���Ѱ��D>�m�-�s]�2���D�r"�g��yY��-=H��A�u��&��ғ�_�i:���5�Gi���1�4v8�IM]&y��0�K`����ء��arP�3L`������e5���)Ѵd���!�3�2t����TQ�1_����;���%6�����5�+�X~=R��.9�D0y.^ob"j�x--�(�ṝ�!���-�s�K�2"?Nի�G�m�\�Y��,Z�Y ��N";[C�Df��[�F7tm�z$�8��F"bE�u�㯲vN��������n�YN�=o8N��=��J��S�S�8��+�">ֵ��a�{	�x�H.`!�F46��[v�h_r�`U"i�6eO���<ѓ��"5�+9\v4��*�~&7��+N--IP/?�O.��8�,WDQ/�8e�I�*����}]$�ȡ�����%���#>ͭ��VQb"Y��&J��a%���3+w��s4�X��O�'�KqP]BX�ks&$�Q%�v�%�{E5T[��I�	ˑ�I}���2PR;k[.F���NAf椕�|A3^"��L9\�*��@+�N>�&�n(�
�&�S��Y�>$ƭ�c&%�y]��> �]�GA��4�H�&��NF���o�Bj�4Xdh�ǣ�v��r4wa��y�#���R�]@�{{-Ʀ��,ah����Ry֐���-��!�9&�������ĬG�I����F��c �t����m#w*$x���3������,q4ݒ�,PǌMmM^�aF`QּS��(Ի�0�h1�0�v�N��T��F>*r�<Q<.�����]���h-!�l�
��ge��Jk�pQ^7�4�=�5ID� 4�����)�2m7O&J?��s����!�栟3��I|���C�t�<�q�9�#��0�����@n) N���Au21J��d�T/A��C�1y0CKC��t_z9ϧu�"ӂ�8����|��^sDJRTF�|��*�&`�R�#1ʄU6a$OY��e [5���M��M�������rH9*�0253�w��#����މT�����q����7�P�Xđ�{�},'�h䂑) �iJE|���V��M֧�9�3f��顸�0���W���&�B�*�rYL��U��i~f��g�7�ʛٱ�v���������L̫n1�R#^$�;NT2�c$}`&W��M3���`�;�3>�'N(;�-I��IC��Wji2�	�ꅓ��mCDu�u(#(�-�G�����	՛vT��%y�X��)u�3�Oz�a �>>/D�&6{홻��p��O������3�d���G k��&�LL_ϕh�⨞����o�ˮ��������!:�<�փ��u&��TÄ/��3��w�f6���;m�gcI&�"� )�����V���	��|b��!����UEe�(evʘũJp�ؑȧl�y���|�5��L�ޠDG7�C�G��ug�^v~+fZ�h+9H̴�{w'�`tgȦ���!��
�@�ྻ���_6 D�U�A�,�N�� S�w�s�?�$�|=,"��oc `~f�ǐ������)�x��谮y0�����^c^{13��~`�$�Ih;��2_�����Q��͍�]V��y{�u~f>���V[Kd6�g'�E"���n��l� q�.��`$v0�-�?���E"����3��ɀ+��2G�r�N�B��>o�8^�UUU(������Lc��.~e�q��� U�=���H05'J�E3�}	�h!ѝ��d�����0��졟A<Kv0���O����X�b�`�/ۉ��f2;е�l��k\*�4$>�y�LOz4h'�i��9���µ��������xw�b��^G@��:��!H�mAz3�Ny���P��x~����4W�F��K�9�����فā��DQi����K~\�k�~�pxJj02-� �E��̡P��/�R��1P�x�c�����4�+�)M�/J	��~�^ r�V� ��/j�m0����k�S{�x`�U5��[�3�uG�M�Y�8��$d����U�ƽ���%�����@�/���(;��e����ČvR�7h�2���xt�d�C��:׋�$,�(t�����e09�J�k� q���v�L������Ma�y}nq���ק��� 5_�2��-h8��fjMQbn�~�������43�ꮷ�'���%e��F̊'n�>O���XnM�?8b��؞X,!"�k����^ZA�u���-w\?�u��쮙OA�O����Et��q3vT&��a.��&c��s���F��|)� ��� �N�i>&(����}w�}W����\A��ݚ�y��D�g���6����o��Y��x��r1���C�*�!��z#V�)�H�@��Z���"R>E��
�<U���TF��H��k�͢�!��%�b��⛑޹,,E����*�}�m��w�	�,�c�V�X�s��G�ݽM�Q1�_�/0���G}`��ՃL���r�ʊ�,�G�},�����&z�G!A`���N$f��"r���Tt�N�Z
�rЀ:�2�|e�z����Ťt����r�Tc8@D��4��WE_&�ko��� �g�����1�H^Ov���V�b��r��F&�ߐ2J8h{�����,�)��
���5�ֽ�E��>���uH���`�jh!fʡ��O$�����F�pq�@5���A:�-���M�cF&7��nN�S#��"���\�Iz��5��Uls
�}-�[�=@��{9�T��n�\�j�@Ž����"4�*�a�A�#�9!��H�??16�[��H:)�s�׺k��l6�(]$��U%��E}R-�� P��s�� �{���+\}D����8X��JB����c�R(�����OP��y�\���=���L(�~.ɗ2�������)�1�tG�#1    -�_�t�Ma֞�������uy�!Pիd����v�Ìy������"1f�PR��=�7"�C$(�EXҠ�)!�w\�@�/CW+�20�W�C�R�*�6�Vh��DJ2�8|IE��)�F]��ʥ)c� 58�73����Q[,� 8�c�'���7Q���RzR�?�8��<�~ubYL*������U�Sf�"��kg�d����� �^��ߙ�IrI<8o�q2��"G�Yy̴x"2o,d�W�0v'Drjb��cO���̲V�W����Sg$��t�IW���'}��%}��x�	4n��܏Mdԡ��ַ`K�>԰!�l{|��T+� ���m|�(�2e��/�~�K�H�$b��h{�n����΀�EVz�\�7���=����쬭!����!�n�ߪ���u?CK�%;����-@M��ɔ"c�x0��6�|c$�N� B�Jh�j����������V% �PM�0���	�#,
�������r���/@��C���eBˇzՏ{RR2���]�o>!�����݅4Gs̤Bh	_�?"ɒ�����'��6���C�#P���E��3Db���b���q;�>�x�zگ/�!=^ ���������f+{P#�}��}�z���E]굍#n�i�~�����b$r���q#�jܗ��zx�U'm�BfN��hJO#���x�x	`I�x�YC,��z,1�{K�&F��R�S3��!Q��l�LFy*�п@�P���d�+@���M#��8�uHEY\H>'��zW�Αƺ@�޳_�D�~Rs�X	�i�}�'&-��'T��+�����"�+������u�ېg{�8��ݺ�W@��e,k�Ru���05����棺�"���$nL���}���'�sS�w* 1�M�F�(-u."�� Z=v�Ro�=�z��r����w���\���v0���p�K���ž`���J��bC=�N ��9�6��H����Ӡ?w~`JI)�V�r�1)�ٛ]2Q+��Ͷ��4�*}S�;����jG1vr9E�q�@�1��6 f���I9�"�L@��/��B,���AYR�B;Ζ�����iK"��AH��bF1n���h�i����ڛ�����ݎ]�q�y�oQ����Z�U�Ѵ����e���m��5YO� ���q,4`A4�`H�|ZvCևa4	�%�{�MfgFDf�����B���U�b�GDdd�h��^X��@�%O�SH�+^J�n��ve����1�9܄�0�u��w�<D��Ђ�$�a�Bm�����g��P
�}WWVB�M�����E���%�yF��M+�e�r�
�����nk)7f�E�9MMgBt?�*WȮ�0B\LY�kۄz�-k?۔�1�Ў��qb&g�gӁ�qCe�+�tǺ|-�f'�} F��M�ãF@������1=K� vՃJ�B����o�����n�������;>Lo13w�&#����7���ޚ�*64Qt8��m|�i�k� �+1��b���D:��ڍ�����[}i�yV�:�Y����n��aۿ9��r���Jo��d�~ǀݮ�7�=�����4�Wr���^>R�� wB�յ �o}���	F �v0�mF8x%%�2�͈���K� buQ�!A��hy���+#���a���c&��/��3���֌"DZ���k�I�J�o3��\�]ld�/�c�Y)h�IR��.�� �e��U�ס�9�''%���1���P0q:to�9}� a�c���ee����S��oe���!�(iG��t�b��E���jF	ɻ"/S�y,�," �T�v˯Xu��1i���Mݓ#���7}O��ؒɧ�(JK"_	)#���9�/����耐` != �5dJ*���H>҃蜈�Ї�yBC���*�[��+��m�a��7T��v��:�-)�TL� ��9ZO�e��b\������fV�/b����j@���C�t�?�����n�j�YeqQh��D
�~=JI��b#�T�E�)Z�ow���Mm�A��Ч�_��D1�(:���;���2G��SSK_Ƒz�S! [���)Rΰ ���Bg]d|ֈ|c�C�
]��pQ�B�U���!�{�Ŭ7~1aњ���D����x�t�c!�\���;�N��7�ݥ��ؖ�znԺ�4B�l�O��bb(�V��* u�ǭ1�ݾj���by&�F3�S~��㉁�V:� 1;�����$�P@����V,w�@����b��ø����nc�c��^��c�yg�13��5R�����/�ٖ!��~�m���7�J��
*�Z�D�W�g�g]����EH�����H�@��zQl*�T��ԁ�D]�r����7R�D���,���L 9n�/ a9(TE,]_#	�ۯ1[LQ��VCV]�^��D�fp��	���/%�����f�^8o(}�Z�;z�+=�M3�b�M�@��8(�[0�w�n���l3��%Bp��̶S�)�U����#
�6?�
FV���c"6Ϊ9Ĉ��z�WA�->2��#cu��%�����?|lW�s� ���9�突z6c	�w)-�-��]K�B��=��!1x��|DF����L.
K��	���hi;��,
��Wd6Ϝ5�n�-�d �{?>p���}��W�	��7�	Яy����uADb�E��EE]!I��������}L��v3��k�&$�j-��-��Vţk�խ��e�"�mZ��X�q['�]9zg)H�G͊G��6�.2��[WB#@=5�U )ɝ�n>��e�e�D�L,�1��I����o���l�o@L��j�!2�*"s&�;|��Fx�G�&b`}{��!ЪXBJP�����{�K}Uw�J%>J��mK��N����
�]I�n��yB�l��&h,�}D"�-;���o��q�?"�����hq��t�G��,j���Q�0/U�:ݑ�߳�x��jQL&s�q	(�B�c���^�J��?�ML�+���n���r�u��uB�M�e�#&�'�P���#�O��� [�����G"l�]8m#���k��Sb��:��x+����m�%��'��ߗ��k��)�Q�	��I]+P�O����d�B�\�e�@��G6롼�PB3$���[��z=6�qu���"�/��T�"X$������L6U!1;��/ekP������
ی=pxuK*���V�[�l%bD��Ҫ�<J�"��ϊF��l�"��eɆ% ��I�=�r�k4�5ڿ� �՗�SĖ�EH��"��衛�������\�J� �sg:��}�s��i��좆؍u�A$�'< ��r\�sDt�cyɮx�%��Κv55��C����D��ҵq��@ ��V��c���� ��r��J�@���Oz>�Hρ��DA��}�\��������B�H'C��M6�|g_�P�6Ǯ�Y��֨S����i������S�i��9ZR����V����=��*V �.a(�k_Z$1�g�,!s�ͱ�����Mn��0�O�\�7��s�m=�5�ܣw|VJ��U�&�_�,u�x��ő��;�j!4�g��$���HY�̮���ˏ���;��j+�nu�K�j�[ťk^袀\��,�H��r�,*��1���Ycft8"0�̬��;N �d�|2���~8�[�T��ISp��K�u�~EH}6KK>��� �9�R=H����~8S�\�@8KNU�r��J60v�֗���Xt��k)��
p&h��l�.�fj�D[��q���ؗiC��<j�4g@��lo��Ǘ)(�])+�E ��W�*d���&��q�|ԕ.7���} 	�J�E��Ϝ��Џ��4��b�x��ód�'}�ڰ�	2^�6{#�=W�9m���o��:#�X}�<��%�r�ҁH�~Ô�G����"H�Ou�#P2=5��R=U��s�v ,+��O�-���Ig+�����e<InJ���w`J]�� ������V�uϛ���cK$-�_�X� +ȭ���-�	��̀_6(��ɸoZH��Qn��    �l�_���YS��Z��n�"Hέ�bZ'�P_�����Ys���Ebs�u �c�PGğ+N"�C�?@�rl� �Y�1�Z ��$h��rN� _&HN��*��F�2�K��w�+�4}�[�O\�_C�;�#��w���W�3O��y_B<p=�A���u �cѪ�@8\� ��l|!y�7�E����K�6 .�E�.�xF��<�<J�3(l������C���M	��Fv�4�����գDt�J�%����<E�nљA�r��(���B��Ͽr:�ۨ����԰��v@�&'v0��*���#l�"dv�j��!�Z�:������,)O��:!���>����<�|�]��f�Q��,�Le���%���?B�����1� ��O�s����@����	"��w�;��}"�~ɫ���QRu^���&+!s���F.��#s" �YGB[ٳP/嫯V*	���%�b�qqS(�� 1:BT�rW��ԉ��"g
����bD��N�p�oU^SƑQ�.3f��UBM9z�3)m��N�br�ܩ����tڴ����f�H,�)oM8m^4��9m>l>�sʴ"�2uO� �5mIA��"DF�"���Y�~����"6�4j7�p*-�I	���k(�s:�Kt~0�p
\$$�Suk.�4 K+ԓtoTW��Dh�P]:���:��X�������B# ��"��,��/d� e ���h&J�<hj��ژEdB$O>H�fm�B�qv��b\e	u�G�����d]����k���=�S�x1~	Y��K�m 5u���Aq���N�4XS�t)@����-"@��&��r��N���A���pB�&iD|5�2��)>n�E��� j���#�We�C2$��V]U���(w���uP�S�t�B ��:W RS"�r�������{	�QN]3��,�i��
j�Cɪ"��#��Y5�����[�v 2���bHt��,=��dB&!�oƂ!Č�1��#�&�5��,����M;"�g3ٰs�k餃D4��������Y������O���	��"�[����3��������23!�9�|b@�Q3�����)���#�;"�4��/N�K2PJS7	�%�t!�`�FU�X�eʤ�P=k�UZ�4���Z�f hW�4$�f%i� �X��J(�fgD�j/Z����tHA�jK/�FK�`�����9�{�;��@Nk�><4�K��)�o�t��WB�v��J�ZB`t�a_�ɽpU�x�bs�X*p�N�f�#�U�f :����wN���^Pw�2�'	�w���F[t��kɱ�� "�"�r�G���������n�x���zN��w��CVO�Z}�"��wr�W�!�uF�U���ӆ|vr3F�XaS1�&��@�����ª<�s�!�r�˖����By}��O��J�h^�� 1�/�U��W�NT@����6x�V�|� ��^�k5ﾓ|�O �K�R��w䓌^��~>zeG�N�Ԑذ�<�1�`�j�Mb:��y}A���W-e�v�$�D�����YH}A�iO��'Al���o�x�Gn��eL�@(�_O���n*>^HN�����C"J�	��e�Gb���l��0:�����ъ���c�w�-��}[�}�X�Mh���I-..ܔ��x�yAX�ݹ��r�͟kT�!��f���:s�������y ����/���fρ�R�!�8�����X+��j��2?�t���1.���+�Z�4Z�w)�9B@-r쎤�v2t�$`-�r�Sk9C��Y�6۽�W��y������1N����0��!�X�6�1��HK(�}}'�F���TԶ� %|����d�O��/ϻ�{���yWJʵ=�;N�􃔹��S��D�X�b���ߩ����l���u��(�C]���┙q�����?��Q^s�����%L%?��X�2���j#���Z� �{�ۆ�*R\o^Q�#��w�.�TM~�h��
n�ㅪ!Wz���@�j�%E��������W�
HP��k���A�V��7�M2w�Ζ�_gL=m��3�N�tl8�b��#��Q;#)�4Bf��XEb����#C�����{��z6DuD����A��~BDFhG&"�[��Э~g$P��yA(W���[��	�
������Q�
����g�y&����R(=ل�c�tf$�G����������~^[D���_��Ql���ш�PơtAd,S��m�L����f	#�U��!��[ 6�7n�$�9o~'M[L��_�)兜���˻1����6<�B�MB�r~�g���F�/:�E���. (����!ob�S���ϻ|E�YP�;��wZ��j�����P�%�V�ʶ<A�j���{�>��͢@�����@����+">����r�U�u���C�!.;Lw-��ڋP�y�L��|���D&��mZ�.�!G���kמ�-�ͭ \N%p�0��g�3���SD��w9;z���'�����H��K�|� z9ۗ��£*r��K�b r��{��2$n�\��f5�%�VNg�F��tk�:����aή�6$�Y�6�}��!��������BC�Z��Щ��o�������"�H��Ö<�YK��A���/���	����COD+(��/@9}���P��}~]=��lY$�h��	�� �Bpm=�L��uL.4��68c����X�?0!9�c��L�H�%6�x����o�-�T�X{�h�[��g���5O�Q�ܩ��H�&�3��_�54t�����x�z@�t�LQ:ˣZB)��e���K!��!���0�w���f�����m`4��.eH_�TJ����$�I퓈'�1������5D��bM`�ad���s9m	Dd���lp���]��z����R)�m���#v�:1.UVG��k��6�,�YS��ݯ��&�ߦ��H,;�$M��BNP/=����]���"�NN�2 �& 1#�����L�^�D��s�q)-D����VlIB[�l���䌄���J��+}(	��#�;"H%yI�xs�'���si% xJ1�Dh]������K�)E�5.��+�&_.Vv����ǟ(7s��=�}���a֩_��S6�����Y��H<�eǦG�/��-�I�M'����M�R���Y�.���HgҮ>����q�yt��<��}[F`��O����o�ݐ���'�K ,qMB���)Z���b��KHMp��Z1�a#�x<l+����$_�������g������'�?Q/#��&x���@��Ar<e�������yۭn7%W��Qc���V1��$��K2�@ݤ����_<;�CSy�c���|�b�����w�/"d����D�+]�>m9@�j������փ]D�X�3�O�"�oi�w�'%g U�鲻jE"2;��o�y���:АY�w��"b6ߎ�) Ɲ#t����qBD�$�1(�\�-"Fh!/�x�����W������IK+>E�:u6`��|�ha���,p�����T���r;�Lp�9DF@�M��e�B����IW�"+ ֩��ܵ���Լ���c��:S�M)׹�.iD������	�V��~���,i�;P�D>S��Z	�������+������."��2�"zm}���!OB�t8ꈡ�Gr�+Y�V ��z�8(^�X�1��"��
(W,���|Q�\D�VV��җ_i7���ʜ9�����2�"���Ꚏc��BS��(aq�WEZę��J�� �vUl]��~
�cP^��s'I:�-Z(��ӽB�OE��9$oV�M�e�n���^ @�����P���jV�s܄�v��A�w��T$O��h|U(��(ס�����������k<g�˰�;��F�����'�-��b^���C�w�a�H��ff�o+� >+��0&h�|� �y��4�O��o�?&"��sݐ;    �jN'ճM)0�r710�s	���	� ���ʣ���� =l|�r��"�# 3�B�K��|$���$ 1�l��Ae��M�?�lisk���W�#�_IV<.bj]sI�O��p@�ެ�U�@�xڻ�;���:��L�H��&���<ɽz��;��ޒ�L�O�������=$�z�S�*����&��3����y�E�fޏ�7��u���Yl�8,T�z������-2C��-"��on��m/ﾍR�4��3{�fK��^��ǜ}��֛��&�m?H�����}��� ��i�3>�wP�!ea��@7j��#�>�������B�L�)�LD}L���2#!1�$ʟ q?+��mu��������=��F3��޻�n4�(ۉD�T@��W���c7?�ڢ�����mD��r)�N���������ry�#�
�XB��n�҉:i���@��몏�ť 4!��T�_�)�\i����pw�,�pݒ��52�˛#rd������6�ZZ�v�G&��}@���Ai�!�"ԼF�5E 1�^-}0��|�ZMxS���x[��x!������4������3���y�} Ј=� ��WF���#�֋)Bh�i�z��u�Y�)�� �s��w����."= f�"����o_b$�i�)Q��<3�\GR�h�C��I!T���ݛ��*�έ��֙��&�8�)C����-S>��R��R��0�q�g4�G��=�& �朷_�X�<8ְ�o�|Od:`�~B��qM!n .�DF@�	��L��_?��i���Ő���1�Zr��v�B���m�"�z��B%�"Fn�m㡧���\~����?kP+�%>/2��NS@�;n�uB}���LO]D7���^}_nF�KABP�6��!}7����ZeĐ����FR2�,�鲀#ԑ�i�\ϙ�o��-f�=���L��ۈeB��dfo���Z g���@٤��c�;�MD��.o_�[��1����6`K�m���� P����?"���k�@�����ۀs�m��Kx�Pk>��Ҹ���@���gVg]�Ӻ�x�-�i��ij Kr���".9}Dl�����nW ��#��FtIFy_�g6�"0��܇��vc��~"��"N�_?�F��P^�x_��a���R���jP'v;�i&+U{�%�r�<Y\Q>�h�����M����p��Y[�j7� ꅆw�r�.�H���� �E��؄��<����D�
E��BӣH>T�eKm?��\꺍���s��o[?�/���I���-e5�3E��d���N���Tg2��B���mH�I6����)���Q��� �BQ�i>K�����9"/������>n7��*�"u'5d��ߐ����Y��;���n;#�����2���/�{9Y�t��gc&9,�/�@��#�#��j���}�$�O:X����\BT����2�2WD�,��)k5���&"��tS����l'�DB� �#���]3G�7l�5կޕ��1�q��2����dO����V�*����t�'D�r� ��WB�Rmj�����Ps X:�5�Ym�^�*��pm����TJ:*�iS���w�,�A:j��NHu�����3���A+�Y�Xw���8
���+k�	5M	 Q���)������~��V�U"P��7�X#��.?W�b��3�%�B���AC�DEH�@�:12׍f���td0�A{Ĭ��'Cd�a�b���]T��DP���s�65\&�H�?"h�_+~q1m$�����9!}��"ӡ�%�G���?1:7�!����N�@�4DDP��u#j"*ۏ��*��6 �L���y�\VB�ǡ� P���2'L�}z�<��+ "C����N�6����d�C����ۏ����qq��A���c�@�F,��pC�U���
�/�GXT���ȍ���"�׹F%[V I���X��m58��OH�s��~��\Jvy����ݩ�Z�1;�]Kl4 ���16�K��[�7�n�>�� oD��Q���@_�%N�}�|���G����~]�$�&,���gw�o��.�b�������!p��� q��͉�j/�,/qX�-�`8���Rݣ�8"�5ۈ��G�Y�#8���#��������>��-�ud��BF����]#�:Z����gՐ-k��:��*λ�(^vU\�e$:��DC�J]]���w�~�&����#���n�56qc�d��@���0��6^5@�_'�4�y����[;)�G��>�uq�s����In��J�#-����#1�������ŵ�v2�Ѕo7�����bpe��<�_1�ժ�?�^"�|�N��Med�*��h�!�Z>�t:W����]�u�$����pֱ�r�o�r��B�k$k&�{Ћ����7^��G=1�cy�_>?yt�j"�k��@�V {��g:� 1�[Y�Bft�V�&�+��}���Wl� ����}�x���b��l�1�������K�&˞�����wE�������ȉ )���z"A�5�Z��Ӽ�����n����ھ
�f����i�2��Xq <���X�aF�f���;���m�ٛ~}�&�K�|�W: �k�v dJv�on�(	6߾N��&���>��E�XP[�w�Y�cX}oB�v��A�����y���A�v��>��>o���~���L�a��Vj�ź���/AA>���Ͷ3�Jtv=�{��^����a�YK��̓��X옘ѝ�V��IЋ(����UВ�|߽���:*Aw�.�%�,��\�O�Z�A��Rڐ`1�kI	��|�T�ly�[��+���0�78�g  ��@)�'d%co�O�6`hiFbI�*#`i���Y<"�@�����F#pu}v���A�r8�P��pe���I|�����22�o�"�n���+3�_5R��/�h�4|�����D,;��?��~�H53��}*'h�����og��Ĉ7��G/9k�ٲ��C���כZ�@ ,��M3(�\�<Cކ��	f��C�dD��+=�̨�<s#�Z�nD\MI���Qu
���d-���\���(H�h�����Y�h����ե�	)�,"3 ����;��ύr�D.���؜P��!1�==y���@t@<���ZI;DL@�I�-�P�9v�i7��A��L��,����j8���a3�!����4�jZ�DP�gwo�j֕Tr�2�o�/��m5F�,�3̠�u�����7Đh���� �ss�>̌��*�<BOΖ21@`
u��1"S��d�)�����?�g�@��e?�^z�o^����LXe��6@\�3ŧ��Llcd\2�R;'������Ѵ��3Sd�%���A�$�Kє�C�zvr?9�h !��ά(�!����bGT�Rk���A�v3��*�u�r	�� L]�s��X1���.I��/!F"`�UƮ��A'M��Q�f���i&�����C�N#.9[� �k�+Y�ډP�;��n#\ӛ弅�r�����^��c��3"�-�)�9_�	@��&aM��P�	Mq����XV�ﻪt|Y�&PK|�I������ϔ�m��غ�뛶�וkV��cOPb\��nX����K��B��ca�����`����y]���V�h�"*V���T]%�=�ǿ?LNׁ�<S3<�=�!�'4����\Q���#jva5K�����<#[��،a����
�　�ek��pN�h7m�1 �=O�L�jmmEd���7�v;�1-�N;P��ݷ��B��+�d@��G�k���!9u�Ќ�s������+v+Y�%���n�?dQA�@Ǘ�kN���К�n���* �{5&��D�/�+w3N!��u����2A��h��,_��N�=*�w ��R���v��7h"�H��Fj����{��קJnٷ��o%Aj��1���i#���D����QoY:�������R����h�&��    
�����0������%��s����q-�G� v;���8���Tm�#�\��#D-�y𕓏 ��x�G ���œ��O+S)���,a���5Sr�>z�W��	��k�P���%$幡�7`7s��2��B��As\�	���_�b��)e�	���$�5{}�(I�$|��&`��K&�\ �6c�ʨ�nߔ������&�:B�e�5��m��zS��6�S� ��rN�u[n!��oں^\zS^r�޴���W�&P�����n����������VXS�Ee�����&���u����N/M�ݴxז��÷G��q�\>�r�n�Ji`��ur����I����XnYG9�Qa"�Yny`�Yn	�`��w�H}N"�) �m��r��$o�_w�a��u��py�cF�w���}���s�5"g���K���N��D�l��y��aD��6���y���&z'�wu�~�,���^﷕�y�><�@��s@�VC���CO��2�{���ag8�f[Y��;x�}�I�U�I���=��A���n��5z)a%"@��>uG5�"Vab�!�M.�֪կa�����j��k��(�\��rw:��Y�*�����S"�\�^���"�x���!�aB�;��n�N��
����q]������N*!N�:XP��q�'�Sg�?�x�^��52�g���M��#�V�RN0C���R 29�j�� ��\&�)��u�3O����ON�68���g#��c�T_ՆK�zݲ�PӋ4W嶹u��6�]����w��㣜�����]I�X�����j��QK�-� D�lnB�=��Z��Qݒ�~^�!�/%��3�&�\� SU��%��G�ZH�h����qGh�n� )ߒ�ϳ��w7 �zΌ�N$VG|�jb#�L'�٭i�K��'���
����Y��N���F��HLЊ�0��m�VV�X���[fD�ju+	��r�M��N9�΄/��0O�(G���f�+�ұ�`~�Rdf8�g	KR��YJ���H��4-�(��Fg�u��e�k<Y:.���L�d� �݁0&q���%}�K��I7�I�:��idf<���gM
O����&��cNI�ˈ��`vrL/�f4r�����L⥡6�!��\�b5%�84�����"G�t�D
�k͗�3��I)u+ xS��ȴ�jef��ly�{�@�Ioa�tz�O������ֈ�AR�t,���I��&d�b����S�#�@i=ut���$�J���jg�\}>����,wY�6��]��!P.c��溊"5�7���S�_\7�~���}����)��S����c���f  F�г\�;N�6|p*M6f��> ^�/㋎N�j��|.���(����u���z��(V��i�;E:�ŏZ���w{��	K���g� ��uD"�)cy�M��	pE��%z,��s���F�������#��T�:�����_>/�QΪ�����pi������a�k*(�kM��G��� uA�����k��F���)Q�@Q��_�n���?�M~�@��M��K�S���f�����B��ЙiP�v�w��zh���'pH����O��~���r9DH�)ysA�uZZ�ĺ�ʉuDx�[?&|z:�����Qw����ŷ$ ��O�֐�s� ���Z������<^�[?��}��͉���>��m�i�K��p�賫�����r]P�����O�h-Sz-t)��l
����Z�ʏn|� ��Fur�Ĭ�'U�?���&�r9��C?y�#~$�ȑ��9?j����mbvo|L�k9��?J��5	�Za�^�A@�&o�B���zh�YY
��@G�^/�qB��� �:�w�2�!0�n��Wb�%���cR��lЈ���;`��$�u�Ãq��ٕ
���F�	@��bf�L���HA��1>�ߪ�2��G�69!!͆Rmv���n|�c�B�S���F���&���h���?�� ��᙮�:MAF(�ݐ�v�����눈�����9#3���e�#�!����j
�3`3b�:���Tɘ�E*Y�y	�Ԩ�������r�������ƴ��#v"2����L���C}ۀEF{tލ2��1�����-�Jy6�)��t��y`ݹK٦"�V�?W�4��l�Ebs�Mk@��'D�=���=4b�2�c.J�S����햦��M^;������o��k��W�C�{�� �╫1T":Ԝx��x��Y��W�����C�	�E�$�B�W$����6�V@7��* n8�յS�L�t(S9}%��A`�@5�+"7�0�N�ꬊ��=�~.�YV�	p��)�7�@k mN��R#�a+A�4x̠u�d��¹`�;MZ�E��zm�� �jmލ@�O��M�5�����E�w_=+U8(�R���s,'�X�r��D�@�D� K�D�e`�����v M��_K�� �
��&p���Ȟ�:�K%�O��w��N�륢0�����Vfk]��s��Nݛ%raR�J��@�%���r�����-��Ѯ��4 �}���E��hׯŌ����
ɩA괁���sl���w�l
׸טo�c*�c%ب<u�d�k�G 
j� (��$�%��ڦJ� �lf��Wv�q*s�I=�)�Y����h9�wy���d�.Ԥ6?����cn�	̓#�]TXl$�Jت���7hi��V.Z֒�uUkʗ����Q���^�����ڗˋhr�������i:m4��>�	@�� ��	�f3�3IZr���~��Ϧ�n��"J�����-�PC��&aQ��cO1�ջ)VM�9�&��5���7�h=�dk��B(���Gp����x��M��mM2i�w��DL�!��!�	�˚$�����~�z�75ٌG)Z<YdVT�z��t����"������B�@_��nk������eMy9 �s^Si�T��Tdٓ|��e�*��G��ʹ�x�qG�_;�}<�c�7ώ2}���!~>ƌ���$�a,����??�y�T�ш@��>�K>+J<;̻d�90u��g?@��|8},��W� �e�Gs�>F�6��x��D�:��e�� e��'�ې]�}utT >���G=t���!�#ǥ�d< ��!%����@bK�'�r��	�x�om��E�ݸ����r��r����sޔ�H�v��6�q�=M�υh���#���&�%�/���Ǝ��>�HC��Z�^-"��Ę�v0���P)q��|�?���-d25��F����5��1��z����� 6�ѻ�G��/<m��8�h�"ڀ'��2<B@ݗ&��ĮC�e8���}%[1�ۀ�}�鱧�Ͷ\��R�# �G0>B��ΙU�� ]@�):�Q�qepi�n'���a#md����w�_ԝ"��i�:��H��4�5�E�&��!B���KȐgb_!�CV6IY���A"�;ɻ���(�W�`d3K�i|�G6� b3�MO�9s@���R��� �=|
ҵ�œB�����lI#H�bO�tO�zzK���(-8�Η��m (F�V`9�6����'�)��0��R��D@�쟠|s�{W���1#�ډi���$��ī&,����Q%����:��@:���S�4%Jјd��1+�a��:-������zt>����6 �{�ALN��է'��ހ#���Fb�,	j���c�Q�4�f��j���Rt$� R+R�&d6z����V���&��Ft�Bƕ�.�	WQ�9�}���:�s��\YPd�h�:�t�O'�&B�ʃMs�����2'A&<9=حyB�v�eD�M�*�[~x}�w�7�Ƥu;b}�A��#�B!�o[H�$`s�&D!1X���'qW��'�"?�>E��_��E�֑:ds���$h.��T�Y~�}|~�v��7���34U0Vj.�)e��e6,�?�V�������gA8��I����8P�C��_
�gҟ��jD�6 �����b��kX}��:��x+S    G>��/�vz�td]i���w��"������m�e��N?��ƽ$�}����T]�t;�H��Fq��:@fw�uvo�ĘJd���t�|,�R�q�W���o?H��yn�ޔ����y9#{�X���,`3`�cC�L�d�"eQ���<= dg��������IL�Nd���u`!����	ńL���F3��ç��f����e�����JaE��VL�q�\�u��swDq��g� ���o_�������$bv�l���r�n��KW��$��ˆ2u��k+	F@�{f�J�5R^����ʽ�w�+���{C�?y�?�٨�9΀A��h@�w��a2I���R&�S�	�?���}�N�E
��R&�^A�P�������O�e��P�����D��T�2vQ�h���3�y@�Lj��4��u��� ��(Nښr)O��)-!�0<7QGy��'gZ��ȹ�b�@F�6�{T���UlnCJ����J���C�3punC���+��©�H����O�����>�ӆ�J�J۩�m���9q#���l�Efk|槍Q7�`���50��@`�;�4��˙�q�|	x��KDM@I�Bf@l�F��6��G-"ޱ���R�Ps��wD��_j2�o��,�O];� }�P6��q ���i�{�S�A�X��?������W�q�~�msؑ�������p�H�䉡�5���="� ��D:H�m�������F+�1�C���9/���;?u�һ�f��(u���j��l��Z�� ���]��<��\�,�k�8�ye���g��X�gN�ħ��bZ�
Dm.N��D8����9�O�̝e�p�U���K��9.�e�"t�h�J$v���	�"��ݦ]��o��.�'R�?N�2c��#dj&J������:�����ZIL˦���j�&rm����M ������/˚%���_������3j�=�p�*���w$&O�Lh|�^� X6��R��#u��D��� v�(��ps��-$G�M�Ibp�K	���a*u�2aby�&d��}�7�xQ��]�B��H�1)��_bçh)��5�o��H���Md�R��:˲Dr?YKx� ��W����5���[���޿�y$G����Nl�#�9B}d$z��v~B�<׀��1�#"2x�e�N `�MM�Lљ����!���/_~z�F�سK�!8����k��!c+�e|�S%���`k20�A������{�{B���M㉸8�����"`����?yK�L���:g��1�E��-��#t��cVr���Z�yH��iK���#y!vl��!�<����@�E� �n"�)A����#i�lQG�`�����Ø�Č�	ߤI�A6-.��Wu	�{���Y �)!�_ޞ��i@�#�F���-�a�ػigC:�z�V��3W;�~r�S�!�@�C����!���Oz���v�ǣ�w�9n��%	L+p��]�!�Ƣ�q��iP������z�k!��:�0@.�V��	��Zd�� �4�xg{a�6�n��> b����V'jb�l-���:!�;��ZtX�әo��(J�ILc��K`���]��c�TE�D��N{��<���2w ��0�
�dBrW�O�����Z�R1�H�zy61p�<j���:U���������8U���1��	��,z&Bn������?�K䌃QF1Ѡ*�� M,֍�� �Оw흹V{㎦���hE�ԇ䃓K"c��Y�,+Υ+HG L���G`�}�kY�Q���h�ۍ(�b-R.��>���!��R2�e�8��v�$W��}A��!�~$��D�"gև�Є�lk��޻:�>��'jJ����u�Y���)Şd��s��U����=e���tI@�b��(�<���T� ���L(M��G�||�$���3@5���m�U �M�7	����o�q�WA>�W�χB�Z*D�K	j�\�����������Û�k���$��O��'Fq��,�o^���HuFFb��û�� @d��� Ѳq�̞)��Z<��3!�G��7��.��	.ҭ.B��,I���\�2$@�6�"J� ?�o̀��5gD��O��ռ@�/C��^�->{K�M�YZm+�:���y�b�";4Y����,Hby-��j���c}��9m����NĶƣ�5�/W��`�4�H'+������o����K�X�D6+ 3�2��8�2o~���o�|j>F�m�����9��e*<�3:HZ�������L>(�X���"6��Sm]
�|.r]_P��?�o��ս��lN9����V���񄛫�`�U� �����"�b�ZD�S�]`�����!�~�y^D��)[
	�R<`���1�M�9@���оF� o�j��7��󪕱K q�e�^�V���w�N�0	�o�:����n_��������:�H@i9�����oR�'�u��` �~��G*it��@hI��x9yz��� ��]��P���A~�U����M/��M���g����0.=��}�� ��*=�����X�#�~��njAt��	�n�̄��D�DɢJЂP��	YѭD�H�6�"e����&k�2 �y�N,�0�d#�Q��������F	H�M�4�3��I7�tW�H?�J;��dN,�KR�ϲ�� ��%���t]F�z�N����Z֣;D��(�/�L��u��dvH>�rډY��J�	����ؠ�|�	r��>
":x)���2�}���_b�Z��
FP`^��.�"��F^��ثV-""6x�|.
����r��0$�+��H�Q]�(K�?H�=�ԵNΐ� B`r@�4�|v�)��	5m�Xa����V"b��Am�C��gm��>��eEB`p��aHx�ڜ����iP��Ujk�fdB�I��Q�Vf����A�_�;���w��"Ȼ*��c	�}��K�P�:�"2VĦ^�
��^������>�R	�I��'�{��1���>H�~�_py�ʝ�Nj�
��;��7~�iPj=���Of#;�Iv*ɝ����������_V@U����<�i z&"�6�4"G@��A����EN��;b�n�DfF��Z50Q�U�M� ���/Ԗ��U�6�P^U�a'�W=Zl���G)e�w&���)�RU�j��xi䶖;���}=�cl�ð��:M�Y�W��̎�Sg�"Rժ�ţ���H��=�l@Pu)W����K[�Q�{�^���|	B}Id�X%s���6�pWd�Ũ���xO���\�ݮ��+��N/�b�תB��6���`V-�k��%�&����w�M�J����CR�>�$����m.�Л�	 ���2R�D���u�rQD����ȤI��	���X<Q.�%h������f��yP�cD��;}���ID片��i�ݹ�ɖ��c����ү���)��f4~b��[��|��>H�X�X	���k12������w���C<2s����m̀"Ȼ��w�}���+޿�u����?�^�n�FȫWG n��,^�� �+V�6|���,^�f��*�8(��Z����D�5Ӱ�: 	nE����!¹彑p΅��pޅ�1ʝs�K(ʝwq�xK9M��?�w�A�z%�/��Hg���9�u���ن������E���#�*9j������,^�*���Uz2�xY�@��2kzf����>!�p��G�᝗,Y6J��$��ĵ6��&�hLB�OsQY"���@b�DIX!hC��8��V��bA��j	0�t&G�r@������H��`�"`$�^����=봎���,wp�A��wGO�-�;7˨�H��F.��?O���R ��*�(ɧ*�q��������W('Z	r�X�k<�j�� C�/N�ڟQ�{=���m/ vZ|t�]�O^�b�!�(����B�;�ݗ��r��M��^�P�a�i�    >�� �<I�/�8�=��Ι�$���l$(X��������6@�h�k���c�&�η������@�MqB��*��� gs#4�+��������Y<sWή�2U{i}dW�&=l>�����|Ց��!��HY	�+�JU4���F\di����3������[?��O兖���]���b�#�쐸��[@�?9�1B�u [���w?ϓ�G'��AbrD���ͬ���![��i�V��z���-�$qH��]���.>~���1���L����u~D��s��"9�_ϖ��S�򔿵�@ih�������Zq�}��H����PV
��[�&U�ģ��8 �d�\k�Y��R��RT�ĥ�����oť��� �u�_�'_wUo�H	����}�JYwEeOSI	�=̹$-
�;X$,��xd�z�6�?A8�*[x�n#pk�t�D�߿�i��=sT23��%�|?��<-�3�Zm����5�8<F�F؅���Û76+pǀx8�����a�W�Z��C��|bX������f ��YAJj�`��K�kw�.�({�����Z^������ݛ�Zu���[�I>:�V}%b�mԈ:sB�l�%<��K�"O���mLK2��N(V��$�L��7�{�t�ҡ�-��H<�|a��[�t	E�lR�P\o
��k�Ö�n��{�w�3�<rv�����@� �ѐq=s������bG~mj�2�#u8�O?��l�[���d��چ���p�P"E[�~���6<��CC6!�?��P���uu���eN�=|�7_�9���#힗���2�ܘ�Z2�`�wQ���"��C���ɣ}l]�����⾊���P[
Q>y�-�SC.�Dr5�n~��̩Bɫ/����y�\[�sUi�� Xb9��L�+��%Mۂ�,����Bb��M?���="SE4����<�pdfw�k�Z�@ �֖U	 �x+p~���������*�M�p�����@�)R�� ���\Å�+?��k�(:Tn����CI��`#�_���q��_�V���-DH������~�x��j ��ψ���^�~���x��r��f{r��n}F�2i��k3�&30@#�32�6N�/����~����2�7�m6�Z[��'��u��);�NY���L�� 8Mf[���_�Tƃ��4Heа|��G�(��\#EL,��s��*�[�,ߪ��>�o�Br��e������&?��2����ӣp�o��I��]�2��h�AIFft�j�����i�^�����]���y����d��	��������4�#H��2#��m G�܉��<�Q�A��"0KRE�r�k�5Dz@�C��t\�1iЎ��W�X2L�`=����{�w���:�L�Q��s�Ö�P�&��E�!>�*k
2t�U�Qd�hk�E��������j�35��lIF��=��*�ц�j���L�>t��{�R^^��3�U�h	�����|����1V�*��5"�>2�}�ʚy��G�A�}�����R�72���� ����~nX��ϻs��v���)��AuT�s�	�mC§�A�]���YKR�(�v��j� ����J�<�w�J�ki�1�S��k�$b�m&G�%���=����sf�Q���������܀XO��Uz���t�&�H=5�V�F��>�� e[���j��+׬�	�:��	��b�8`����eK�L��sʱY���T���J�[������:��͜�s���_V`K����-(]Kl��b�l���	���\H�� ���j#Pv/�{��e�����e���G����R��P�32E�ڏWT�V:J��]�o���+0�(�������v@R�N����*2.�O��p�}��!��d��ܷ���6��K�s���g���g�EQ��O��R��'������wh?���I޾��\��MxP�+� {(}�/�Aͫ�I��T�LeV=9���IRȋ*�W�[����r��iU�R���+6/����_Yo��}�*�|y�y�J,��K���yx��g�^i:^�O�����Т�. ��ҿ|�dI�,����ɢ"�+-%��V�'�/2q���ia�&?��n��g�ʺ�q��2�Y�\n���}�|.�������G���w$<�'�����clR5���?�P���� �_p�4��I��jL9���eG����vay�����������n���ۙ��֏�;��w�F����B\�ʤ���������IH���0_\��G�e"��x��R�_��d�c����������GL�DJ$����y��e��!��1�ټ�b��n�9'.l:��X��V����͋�D��jS>"�؏ʽ���M?�o���W�d����E4Yr�wm~�f-Ot;���Hݮ�J5#�hT��Y㷠�}-����{l$,���D���de�Br&R]x��F{�C!�����:@�T��A��>�ס5�͔�WY��J���`�-]��R 9��`�Fl
ؑ���0G�R��"�ZH&��[�� b�>�j6�!��WFȝ0k=J_uLVb#y��Rœɉ�/���l���&����>}q�<�x$;�'b�a���́�9����뻯?H�Tx�Q��M��m8��A�$ 0;��*�#l�Dbu�m����� uX�A�J�L�O��
2=1��9 �Z݈#�O��~�Y����kK�a�R���Q�:���Se�U:?���j>!��_���@� ]ܻ^?ⱊ5TD�䟠��&��	-ƜN�̈����\�6�ҙ	��[�O���*���tkc�޷Q�22�g�B�])hov��}c�z-����Sv�r���Ϛ����z�ճ�����i�u�k�rN��6���YQ�"e$#3zƾ""�Gl� 2{��Ndhƍz�V�Ɋ���p�޿��[&t'Q.~�*�ՀH�n�r=^-U����D�Ȁ^�c#���f�#0�\���;`�"-�����c{�l�ѹ	����e���Q'���1��M�M��B��u"�s"f�C���j����m��l^�r�~��z�>Qg"`��F:1�q��A���w��Z��@��8���p�n�(wq��H�=����@yVB�+&��/����<��s�'['>J�V���#\����?�>B^��	 ^�s�����Q$�$�/ng�H�f����r�%�(��x_�?`p�O����%��͗��Rl�07:#)j��{w�)Hu�Q�vd�1�v4�3�����-~ܴ��H�/�`������Z��[gm� QI�Cd(�N'Ud(��"�D����d5&�r�n*S�_��3��G��и㙴�d��ޅ��i���`2!����wФ)�+lY��L�'�t�}nn���}(o� ����&��Ee+�	�u�51� �]�&t�&UBiV8���<fBA��M"T>�~'Y5�0�`����O�P h��f$%���[��)a%��^Ŝ����14��i�DS�����M3W6���Yz��� U�.�Y�D�9b�n�*l�˄�{!�9@7�sZ�7@�>�l� B*��!c:u��ϐv���S�-f�vr@� ;7�n.x�R�\|�_�\�o>HW�z�z_�z��aI����m��,�B��Vk1�WN��M��N��/�h��H���-	sǅ7����H�bv¬:�]l����¦{�x!FaCl��Y=4��Ҳ 	��%�������@ص��.!�G�X!fm���R2�g�5�r�Et؅�\�=�`��id��O��#lk0c��Cb��Z���� bh��NqH��pXs����ݷr�w�m5�[q���6� �o��IV&�qX�36���x	t�&����O����{�r~�6���C��sq�6�C	��N��0��܉���}��4�y_���10m3�zH�O|�_߼
�T�tp$fׄ�p$���/@�ZO�3�;�J���;)t��!!���*��%���"0�&��r��    �Pe)@d��!F}d	��X�].��+SY�Zm?���>90�)��}'D:ߌnXR
VZ����bA2�G�]��>��˻o�|�r�;'b�D�9�
�S�D� ���I$:���3!b�(���|#�*-[��(Ȑi�ɽQ*� ��u�?�{�ߨ�3N��zW|V�ڒ3���+�E�;W[�Fp]U;��~�{"�R0?���#:� AS�أ���2̀.��zr+u�)��S��o#��lq�Y��BbKI�}up ��#�eHr-����~ (����j��W7���Y'Q�Sm�Bd.x���χ���'�1�/ζ����9P��O э�Z�5;Y�veȟ�T�U3ځ�/w�>y�C���n�B Tk'����w��g�L���F��I��a�!����t-Gy�u�(_�m���l^#��3��� 7�Y~�dPF&��.lA@���YZ\d�zQ�U�n�0�\5p�\Qn�����a ��=#�><5�P����8��!�|c}~!��n�WiWq���v/_��,T��O�N6���^� �EA��x�E:#�E@�K\K\2լ�|7�6Jw2_
\��͏�����,��77Q��:�������>*C��EC������Ӊ����邳��x�����?��ę��8퐟���O���Tw��姍6��O�s���8�BW3��|��>����;@g���x�Q�� �^\��Cf���o~�İ��lE���=��A֛�igiZ�=��f"��>l�1y��I�w@��&�Y;|��e�=�@�zO�! �����&d�^H胐�#'#���{�.(?��� �8��uU����c/sw��y�\|���g�����@�V/_�����m�/v��A����� ��Χ��D�4"�Hh�� �GUL#~Ք3�@@_}r������9��K��1'"���zB�lR���;��g&�O\"�:��ix[sҒ�}�C��=��>� �>O�Zz����������[M%#���E|�I�O"�l4�_�R��\6��H�| ��:�$��=�^���/�oL�7d��tF���v˿�7��u�'w��y�+&�߽`�
S��}�S��H"�i/m\ }������$�`��o$V[��׏tbE���<� O��������R~Z}��&��Ţ�O�'f��,V�� �Yŝ�?*��0Y��4�c�>x���M;O��x�?�I��	�~�o ;}ݻ�o�Tݲ�"����`޼9t�?���tG��r�듏U�(�-�/����ɤ.؟�����?Hˣ��&��<'^JG�w�>�����AZa=�=-�g�)�@�f~���u�s�ig�^G(�Y�J��0��$Չ�h�r��vH`��|����@B'�J��&������]�	�rܑ%r�o���d����R�,�a�?��j)̮6O��xy;S�����
�R'���{���f��*�e��0[�$�J<-�����1@A6e}d:d$DB�Ռ}��$�Ǹb=���ݷ�-�ďh[����u�� ]��4�%٬�V�_~zs������E7�SN����~~�]���	X�����B/$kW>���iʔ�$;Y$-}5�l$$���,[W� �Z��lԒ�\�dߩ��䂊��wup��rt��q�yH�w&{�6�0�5��f��+~�8I����\���_��m4�*����iv~����g��#U-�co ��>���,�^U'��BL��9y�hĶhS��'�0���aK\��vW�� �������U���r�!��j��!vk�|D�~�{��.������(-7��L���<�QT��c�]P���L�X�
����4X�#9 �bu��j�ͪ�ЕǼJ��$����0�F��Y�Q-B�Yz.�V{?3�˧������%ʗ:Ӧ������Rz�(+a狫�,��n�֗��ne�v$$���*54U�)�>
�&?��Q���캐xv}.��S�l�Ҫ�'iQ݇/�7{��+�P9��Q_��칒���`����	���ǒ�B�iR�����VV|u�"�̹<�D���} �J\ϧ���e��ί��/��������yd��GZ��L�I��q �B��ӗA:�?�w�������~��Y"،��W/S�_�\�?y��W(*u�������W�eUBj�<��}A�#�c׍�:��M����[M�����,���&WA��_��a���f�~��E��� 9o��\�3}����6���u�ex���y�HG��QX&��l���L�9FB�2����:����@�	���M(�Dx������t����{��ƕ���.0Uw:k��N��eT�2B����׷i[%��EV���ɳ�=V��,���n�~�z�K
���߽M���-�i��=��u��8�E$,=��(�.�u�t��~�&*���Qr/P8�����pE[��8Fb�W�XH��ח)�{}�z�k��^|&^&Ey��:Hu~(10.nRp�l"���'i�&Q�ރ�����v������^j'K!Zj:��m��h�Z�7AVr=S�i��KKh�Y$����>���u�E)bJ�.����k���-�e|k�����HzF�ĺ���eZ}��.��D��p?�3�X��k�9Fb�_<��$/#���� ��t�6!B�[�j/o�(��}��8J���x�������(4��U������>�Һ�/R��m�Ȕ����wo��ؙxeiBb�=H�X������O���m<y��R7�Y)F"D���$���t0,�*�U��[�,�����U��됧)�:k�\rNh��^y��OY�=~��$�Q��	���/;�$���AWyEهw�JO|p�|`����I�}ҡ�i��,����P i��$i��}�h����0�$�\/�y�U}W�F�e?�4Ȋ�����$�ps�d)�`3c� ja*��Ȭ?�3F(����Mr���"2�@lc}�i=�F��핥�1pz~�8���������?��ʏ��ZAS�	t��K�<!uq����ۗ,�2��2d�o^�t	���'�y\��յ��]¥U�"�+Z`�]-=�8� -͍>��kˑ�����o����$�!č)�F�b��������(~hL"���?�G�]Vp��"���p�(1K�vg�c�������͞����i��s鼲������>
�R��U��>yt�ʮ&S�� /����庌�ƃia���נ垌��AX���8(�d�������b�Vlu�H\V�?{��NH<���GA<�K��rT}��=�옓��6�����)��%#�i�+�p��2�ﰂ.�K�{p��(��.�i��ٴ!�v�ۻ?�<9����]��Y㧋�.|�K������Ѱ��B2�+�4��K��2~�o�~}�E�v��E����QXG�����B&P"�������	)��� 	�~�FI�:��{r����c�+(�Ω�z��9?���:�|6��RT���ž!�ˏ|t���U��7/uS.un�eU����<?K{G$��_kh��E�� 1	��{��/ۻD�|^����ϒ�ER
�緌�Z:�C�ȃ�̓��!P:֞�<�t@.�+z�����8ɋ��t�)�~�o!i]�s�JK�Ó��F@W���u,"P�t�χ0Q��a05F�.eV;'wE�Q�Q�'�͌:�!��} ��E��)���r?X
酟�����A\��u�N���_~�u��.E_w�du���촐��Ͷ������t�7̀���ic��P�h�5��E⢿�ןa�~��Ga�ރ�G�Q9���<����GDQ࣓�7�����Mk$�J|t��>���O�L6��)�SU�G��Aiќ�ΐ�P˯�?�}xT������4�����6#I��)�׉�wN�<�rw���!�9և)�o��r�S������_r�2�(�����`����u4?��R�_KV*ɫ��I,�O�-呂���"A�+^V@u���y��@�e%�p��L    ��Ë⥨�0��:H�xq�� .C��wP�t�k)������(w]���(C���m�~X,d$�!�#��4��WiK��X���"(�z,�؄�r�g����V�X�/����(/�̞ʪ��JD�F���i��H/AH=�ۃ��H�7��˨% J �,uH���Е<_w@vux]��Eb���gI�Q����������X�0�'3s����n=9������l���{�L*���]zΏ�U�����5+s�����H�<y�w'y�e�>�"�@IZ���|&�ĵs>���u�ǿ]�8��)��Ԙ�GV-��V�b���Gj����.�b��7Z�+*qC��L&}�ԓ�G7�ؖ��� B�5����i� �|��!p���奆�J��o��w��RF��y�4��)ᣔ�D@t~.Ӊ��8#�p��/�-L@�֏�PF�R����F�p���#�8��"C�G�_䏋bM���O�@�<��(���赞;�	Ĉ�8M%4�a�/��y�u}���6�v��"@Zk�vj�C��H�$D���ih��.�{u<��\Eo�Ŏ�����E�4v@r��ݻ��_b.-��A�8[ʦ$�۾��	]�R������C���_I��7Z�a�Љ��=H�U�>�1|��L�;/ B�}��D�4+�u>��5�����AZ"6$ll 4�hl�'@��`v\�#��M�R����+�#|1��EN�i� ��W��EJ�"�:YX"��RyN�~�V��Û�r�4�����p.Nd�	X͞������Bj}���o��7�@���<,����)
<Z�>�U`�(�g�w6���@��tb�K�e�������������ͮ.H�F��~�}
R��>�7o,��Nx���A�r�������:����zg��49B&��za�����ô�.����ߖ���O�J�}L']wP����7'��$�"�au�t��: z.T���E����|r�{W9����>��C_Ƿ�c�MJA��bu��� �͚'�4��>O���_�s�<��)L�.Ig�S1�Z��� `t������JI���V�a v�=����{�k�`�͋�y�*& ZU���w�F6cHN�r�In���5v~=zǙ��|���9�Ϲ�!�A�K��f@� ΂�\��1#���"0��+2����X�D����=�M���>��T��^H�T�9�9�����j$,(�����T$dM�1���A��&RO�k˄&blΤL�k|�R�Vj��$��Y�HiДz�d�f� q�Ϳw�*�F���d._U�HjH���}�4��^���sUH�v����l��qA�`)�-馰^�%MS�q�~�3	��#�k(-�������:�1�0���2~Ylׁn�ANZ���)"_D�j	�?n3���*%���!�;��^�x����Z �����F���Z�T�"�U��L���ʷ��\��,I)�#�כ�)wjhO7���*e�`q5�����&r�.۔��y����0��K�������,5�1���\a9��uՀ0��Heb�e�l�Q`ʄK)��"_%qZ��Ђayٴ~|>�L����1�׈�of�:�52S8�z����N�W 8��Q�"�]7 �s�3F�:��Gh8W.���V�{P/J!PE�Q� j��#�Ŀ�_�	;�JN�-� ��B�@����bw2`�v�;6# ��	=�F���o�$#��_���)K���-���X�#��J�5a�T&��,F��
�
�������p��˿M)_�|��_���Ɗ"��,�K���˟���g')��e��۵� �^��?�?[�ҮV�4)%�x%�p�6n�;(@���}k�̕A�*�2Py�=t��T.��{SĪ!�,H��Ut��la)"���@���]����ݪy�Vq�*?��ȥć����YZ�We)Rf?�E�����[Y��sPxӽ�)tZ����WǳO-�GE'}dMw�$�e�TB&�%:=�Ha��VFr�Y�`J	��y�t�m(o�zŊݢX�.T���`T���kP�V�
����C�x��4gʎ����+k�B\�J1~�_�@J?����1gvr��h��c}΀�x�>/e�.��D�;�s���Aڪ���<|L6�U^�ߜ>:(*���U�6�ƾ͍A�A¦�+�T�l��D�.��
�Br�"�Q�5����ۗ���ņPd����bf%�h�ʠ�W�11��gc���~&�qS[�Ute�a}�21r��$c[׮ *2�w&M"_�BM�ˋ,��B];�1?�,��q���M-�����T2�S_՘�G�^I\��>��.>LT�FK��.�i �[��Ҡi9ؗH&���o"_��t��Y�{&Z5�r�3��Փ��0\��L�W"M� �1{=i��*���̬��ր�����lg���H`����C1@��<X�U[�M��>%�����Ŕ�th�2O#�N�3HE\u�L�X.oEޟ���T�����lX�l���ps}�'�}~Y�
�
��"3O�4q��Zm���b�
�������6�ٓ��(�����v6_�-�Ku��7�(�P�i�� �9�#���Ğd ��79.���0�0�����(��	��	eżoz0cYvE)0`�����7RP��+^v��T>)H!��o����漏a 7��Y��Es����((�A�#U�M0;A)
�p3E�t/s�f�IF�������@�V>���T�TU�l)ōӍD�v�ӕ��>��u�	e���!M&����a�J�P��������Y:j<���g�������BH�ɯ�Aòk3J@���4f���k�܊����)S} ������L@��6'b>��k�ܰ���V$rlN[��}��&���L1��^�M |�M���^|mea��.�׆׷v�)�YX�/H~��Al׉Sr�����]�4��`����ב@K��%5a�m�����W�T�84����v���֙�u����]5ĆA�~�܎=��u�!¬��s�B;^Ϯ��9���k��L������7G�2�tg�����E�2�B�X�l��Lybg���C@+x����M(\��7iqZ	���l�+s}�����ioe,��Q��f1������,��!p�{>���@ɑƃ�ߝ���R57Yz�灠�����s!(aa�d�P��Se�B��=hd�6>Srx��O�Ǉ���~����0�hF((���m `��ǌ�@�A� �^��E���

Q�/��>e��F�R;L ��T��.ʉ_���q�dY�Sⲃ����[���q��Q~�C�N([>�S�|���<�B�L�5H==���X#mC�{"=�1��`�b�<V[�pFd_A��J��b��J2??�W���|�� �:���	0�Q�Q�/4*5����P!��yd��a��왚jw�MŖ?�b��>į�����7��^�B���c��ʘ*y���~8�u_^��U�ͥ`���e(�n=c�u��v�tx��oh�kֈ�o4�#��C���r�!��H���W�+ �=H�;� +�7�a�u�34T�Cu�7_ĳ�yD��&����OSe�GGp����͸a>�c��;����
���-�c"մ���j�.#�%����T��-�C����Z��@E��g��ڷW����'E!f9��|*����^im`�0Y�+��M&L��������z�Җ�m|1 fd��9/qu�Y�kD��c��F@���;�c���\���@�ڪ��ȶ���A��^�C&�!��@���<k�"�[�逸>ߐ/p=Uɘ��H��7u6F���?�-Sp%�XX�`�7�6J�`ƱS�~���F~Z?��뮖.�˜�n���7=2�������O?��B���W�K���B�g����>H9c�ڡ��1C�o�*�/�L�nO�Hc'�+�ׁ�g=��V���C�A}��L�ST@����8����+@�x�k!��q�_�:��    Ce3��������x�L�����a+h}��|�) Zu̚������k\���#X�젅�^*=��/��2��:�G�M.��������ʑv��.���`��0��w��Q��x��swF9�4��N���ml�+��bG��
�y�S?O���.,�݆P���N+�^�Z�0i~���W�c̆9�,��lQ��)\�U�ző��˲�0#��sF��])�t/$�X�Y
����賛y�[#���*��{�8��_�j+��hт��]���a;!��Ex
�-oxO_�u�f��q��0�wD�V�u�oO?���Xp���eV�c�ېa�+O�Nn�t�V��Qt�+��@O5�7��o/�t�9��=��b�]�{w��YvB��n��۲x��۞(�TT6�/�⑶�`e�=<�fp+�n0�g��� &�.����������y� �=��^��"rh��5ad���Ee��>����{{�����_�o�!��������H���a'65q�V	qn�N�� �{l?!��N?*G#�����b�HL2��}?��ˣx"x�Ü���,�1j�%�g���1j�r��dy}�2d'm)}n4�Ng���{�Ꮷ3�V�L	���!�0>BS���m3AM�.�
���<4L���n� �	E7��D&�ݱ� �HU9lM�}%�����xF�� ;�4�e9A�M��(j����zD� 	aVR���������)��|ĕ\��b�ot����IX�*�:�/>�嘙�c��"�\ȫTzۅ���> C �[���Ry O2��oVb���xlT�=���=��wViiK׊�N�0��!�=�ʧ�0؟|f�J���:�?QZ�$xs�� 3<���J�Xt�M Wx��I�Q#�S��
c'�Ee���	l�R@	J<V���>���2B||a1�)�aJׯ��hՅ���$k�	��e���R��	���P[��QI㯭,M��Q��6�1�S���w��=�L�����a���GbBN��l�!-�֧<J�3�d���1!zܧ�Y%�@kKA����8!�i�����O`��&��Ի�Fߛ��3a����u� جE���	n��0�4e+���~_D�)��m�cGX8�9$p���-���7�(��A���V����t�% (��LF�d}b�o��� [ŪBZُ;��)硙���=I��j.���?)�ޭ^�t�7):�� E��C��{��
 �� E�U��IZ]N@R�7���Z��s�V{�g\Plҏ�1���!8Ӂ]�'(bl�N{x>��*��Z�@�7�_�8�t�֕�ٹ��H%�)=i�S�Na����b���/��hê���������2�������^/�Yj79�Z��P|V�b$@[�t+��
�ْvtq�t��h�90lG6�0�-�@1�E T�F×�K�ދL�"qh�\�S�V����t�E�����H��� I�]Ua��h_{�������_�{SBB��j�%��H�S>�:I�=ҽn�:,�����W�r��G���nqt��b�����e�M9戳����>A	0���	ū]�`��k���Ma���Q	16����gb5�n^�J.+!g7�,���j���H�;ly�߾
r51>����DM������.8hS$D�yv�lKde$�ZƤf�C���+�ȧ#��[��&�|���M�\��߇�r{g���5���p��?������r>�pbu��jG@�M���Mi"&(�?�A���v��V�0ߤ���.�ܭ����� ��IrL��Z����a6��ZD·��a��˵�Ò�6pC�|Opli�tsO�������ɧ|{�_��ņ/7&��)m�w_6��j޽���U����j=O_^5��7�i��Z�DmO�W6ئ�ȮA��TH
��$B6����/��!���Hp�'�ޫ֪�!��C��O怮[����(l'z����h
��?�[�\��ns	N���ڜ��![�������;hR�t���L1Y�cc3'Q�جg���g�]�g���V�\D��fk�R��Gc��iw-d6��H���YL�E�d�swڝ,�6K�*"��X<j�[���Z-�yi,^u��FZ�n
�<mN�g��(��M�}|8���Fcmb�Y���=�x�)��MG�)�2dwڨ,�QY<�4`qk,�t���V�� ^t(��Zmbk��)رm>����!�7;)��q�����o, �e~ܣ�T������#Tc�6݂�pO�$+�˪�>$�3-��(ԑS5x45�p�S����ι�ģ�\O:�X<�`�s�ū�X�E��Θ����fq�S��a9`1�Z��.�u��K�窎�F��9����r��@d�£k�@��P�n�t�&Pc��WܭX���P};o�1�7�x2�_�NBMJU#��94��H�c�͖ȶC��)F�p�^���꧵�OM�����/'���ۀ�x����D`��'%p ��Nx�Qk8?96V�x����<Gi����Ѭ`jZ�TE��{��=6�x�9�Z��^�=��4��=�[������8Uպ��Mj�<�������M�����k׳�-�$��iS邘6�!�������w��ݛۀ�m��A�d1m��#i[������d��&ꂖ�bj����C�x��c���Y{�ŋ6*�W�o��$�2��N�Žv(�I\�8��,��6�,=6��x���x��&]�b��Pq'=&bus�x�.�(�-bk"V�Y�j�X�h�Xc�3T��j���j�m��a,���Y�뚈i�ƿc�ś6*��0�XZ�Ž�9��D,�CY<��$��KX�F��W�,V#���Hq�Ӏ��S�i"��@����E����W�%,���Ѝ�.��q���^ߜŃv(�u7���E<�p`��Ⱞ�x��D�5�P���bu�8�#�G�nO��,V��ms��!�M?��d��6gq�C��V'b���8�P��!�y��Z-���Á�1��CH6��m��� ��w�x�r��m�c���Ӳ�����Ӄ�v��MX���,[X
�*�{9[G�B O�R��q[�8:-|�d��2ҵ��4�e�����G�B�s���׋�<-�M��D���a^VBI���:��Nҽ�zM�ֿ7S5;��8K�p:��׺O�P�����+P�ng��בT����9$�A�W���k��8�LƖ��|�b+`)\B��:���4��B����^�2��p緅S�����f����Lj�x!1Է�Jp{�{���K�F��F�D�0�S}t�O�=1��;�	���g�G!<��ݱ�Q�7y	 I'}�M�"߁HG�3���.���A�);`��=���������pm`��_�O��J�Qnd��CX��BB��e�����Mds�
���.�D�����o_��
Ȁ�T���jtc�G �=dO�y@,�W��{���Z����Pe��o�6la�����������$�X����I������E�Pj��ۢ��������\6��\��v-C/�	�>���-���~v!���ס�F
V��e	�sۧ�����c@�V��0�������ғ��w�T
�4����#�)HQ��u�%HQ��Uj�H�aa��m��õn�e������fL,�Μ�ź 6�e.=�[�B��5�qY�햀@��I�d�r�Q��-�~����&=�/~ S+�u�}�1��h`�@�j˻0cc�tr$�Sq���v$��>��Hfm�73�j�Z�K\��W�LL	��l��ꖞ�p@��C�A���;	1�r0yM�6Z:�$S��}J5��r|��SC7��A���æ6UY��:��gaF�;��L1�B8��JxX�f��6�G3kx�� c�7j�	��>�����'T�4gS k�Z��C3����Bl�������V����)��eZ/��������y��'�!�ݣ    R���#��fB@�����5p���M ��5�@s��E��Į�b�c�՘�xb���a�P¦3���HG�f�J�+��2���������0d����op�2��G�F�F���Hn�l�el�1����|&ϳ�d��Okr}���7�����y�E���b��1��\nK�e�hҏ��x2���ح� �UF�������6������6�A���F~q��|BӲ��{�T#Y��/.�U����0���gΌFh�����iӚZ-���k��ea�ẉQ�1<�EM�;����V�Z̇���v�兑iP�q>.>��#�W~Ӥ�1+�1�?
LGϱ��HO�i"�&��a̛..@,�& �3��V����s"�*:6���b�'ѝi%��{t53��
}ӝ�~�߾��5aTA�pΒ3f퉥2tބ����[�x5��A����R �H������'�,{����v�q6@)B����Rac��0b��U�SKy?�k_��dPH©�OA܋���l����t�4�j �a���}�"������YYz�t,�w|5��sd/����1�l(��MW�^�v�Ɓ�u-�B��]��Au*��}A�k��|1C𡊼������r(aV��D+�/5�����X���	�r�i:���pu�1J����_�m?d<�����uye�o�W��Xa��D!9� ��*C�|v�
 �݆hn����~\�hm�M�Y�L5-Rėc�dǫ)�?d�̼�3�p
�y�Bk���j<�U8>	͋�C 1#��ק�R��ġOꇷ��HH8d��g)y��(�Y������`����I%a�h�'�\���Til/o�/KȀ�5Y�a|���4X���L��"���d�HQ��IJ��RIg(Ҟ��D:�HG>;��g'"���"]�xJ�x����Q�8^ǳ�a���L�p��b���g1�h�Sz_��K�oSJ{��r`��$]��X��(")ŦvA���d)V9��� g�Z��������(2,gͦ#�ٷ�w!@?0�� ����z�N탴��ci/���Az��#TV�����6�s �=�7��(,��5��_�	���b��v�c'��/����P��� �~�/��Rw;#�}���%!�w�E@����� �)g �h0h�w򾮊	f�2>�l���2���,Ф��"ڬ%	$ֽr�����I9<r*��|v���+8���� �>ɒ�	�+V&�P���@b9j)�# �fY5��;�ڑ�� U������|�gc��M�34,f���*D'_r�M@��Üu�28��+cW�V7����Lc�ȯ�
R�]�J�D��W����4{|���ힽ�1Ii�E�#=�n�����������A����0SxV����O\m5
�rX��\���t@��� �S����7�R��,���u/�ZϿ\��$�Ħ)`cuO�"�Ґ9�c�L���&GBU��'q�M ��`���
�3e�����?�m8_p/������
)� ş��Qbq;���75��:`^#	*O!%Q���erye0{, 0��$`i�/�C�Md�Ʀ*#5��[�"�2�Bc��ԙƈe�&CH�Ҡ)o�-$�@K�ƀ�)�w��/OX�����k�������Y4�B��c9���*�煣@?��|
0Q���)������:���y�2-��rz������,�eQh���>V��H�w��>�����b4�y����g�Ui�J��<��F��0�5kSzL�V/��_�
Azj�<����d���-��S�X)�y(�ΆO�6!�^�
��_���~
�1fY t��c�@�2��
0��f&��̟b�2@�E�Y������	��u9�y Q-.�9�}��7R��� 
F�/L��f>�y�O����~�,�Q7�iy5����}��a[�� �C�}�1Bw����`mV&��R�,u�}V���AI{S�UX�;�E:��O�;�D*7���fh��NP�6&И�1�Xb �m��
�_��g
��6#�j@)>����E��!��<u�-/H������s�d{��i���"��_�X2��Z�^��_V+&�jxE��"�O_&��6@֨>���?�˄`?��rf�F[}�����X��^ Ej��Uޓ}�TVc���6.֍i<�L�#U�bd�ga��uQf���wl�ׅ(��~0�Ȇs��� +^)����1KV	Pl�P�m�Y*�k�V�F�hcCE4�r�*��k<4�E]���g}���'�0�^A��E��m��_��E\A���$����R�,�j�H](|F)P����a�W�r�y(\{�B��\#��3�B�f�}t�[�J��Qx(F\@zu�)PoEg�4�("��\�������'�l¾ϥ���û�D��{G1��el�3�s: !W"Pǁ�yEW��w���	�qmW�a_���C��)����E_��X�,J@��u6˱���� �HI_����W����c�#�g�:��J���'5�L���/�} ��}6�K�*@"�{��� 4���0�86�YNv�1S��e���S�XmI{�{YkV���� ���|#��[���G��PX�������.���Na��<�sReF�]/�e j���{�0H���^�\�AF������<G�Yk�]����F��>�E��pgÔ�h�c���o�DLX�}_���Nu�0o|���@�:���
Ue�[o�a[oX^���2+��w33xpds���L޶�C�np�z�r��3�T����??�1���g˫�w�P���7��8<XI�y��շ��D,g8�����m�c��|�f �hY3�P��LG�y7�������_���~�}@���RةP�^�*���m��x�=G�1��5:e�����#0�mY�I~�x;(=-+,(�K1]^�4I
IH:��(.�W���z���g=�Gry�d����:�T�.��՛���D��l��$����ۻt�BA�A�*��gA�A�*��z*�ȩ�R�V)WtW�\���7���0">u�}�S�#�x@ݬ����3Ru��
f����/K��8 �k�K�r��$�<�!o6�A��1R5G�z�'��f7|��
@_u���}�cb��nO���$�G��t���	l�}�a��8���6��m�K��nN0�45I��#3]5}�f��{��j!4^DS*��H���ܝ۸"x{�x/#	;Z�Q��)�6EV|�����g��L�(��k	@A����pC,G�Z71�w����rmW<Й��X�_�@��	���"��( {�,�@{��)m�<��j6X)9��W��B�qP�r1 ���]b�f1,�Lr�y�ш<$-N��ɧ�3ҡ{)�Ɉq�ei�i�0�1�T/T�U͆��,G�,����q
�j��쳹��P�#C���D����Z�)�k�wr�<(R
�)��[�s�	��h��Iz�4�Z߰�z��0��u���b��NSR��P��9{/�uӔWK�`�������V��.9:�4�y�L��ŏr޳��uĵ^h`�k�l���|4
L;P� �׼$I����a�=c�ړO�����U�#c�!�X;B��1%45�[7��w�@��f{��P��kDJL�ݩ�}nT ���.���?u�^����n")��� ��tS)���8g���}�5Rb�e7&)nU����f��l�t��b�*-�R1mYJwۆ �؈i({��c�bֆL��f�	Fiow��E ��|8<�p!p_~QmAB��� ��?)*���3S�,�ny���>И�<%}�B�;��1=D:y[���*pr����p��ǺB�3�pӪ�}��I݉Rн�%��!8G	���` B�Mye9�k-�]���'��^������[�Gص�������=ˏ<Ev�g|��\�3M(D�N�#R�;�+�]���� ��G9�䨖#+5�ET+�9|��F�/y0IQQ�뀫�#U�MFy    �h��Wug&�@d�:�n@f@|�`��Ռdh�ǔx/A�&D�R;<����A:~��'����7�5��;K� ��f���2��x�-��j�!`WE�uw����hM��Ov�����_!�n��L6������]bZm�V��6��]�q���~�'��4 �&� �j$��ϒ�r�Tĸ�t����/,G9�Ǉ5��(D7�}d3��Z}�MmA��v�#D����}�O�9=qX=�1F0��7�m�[���ޗ	�ؖ}���"m఼���v_���S3�����+Ђ�K��Y��7_ws=�租�w��[<y��7�?۷ea��[<!�@@L+��S��f�N�`�3��r(����"����Ozܗ��-�^�	�rG�\aBD|x���@]
(U|<X��H��N�r��r��Nlw�t�O��ݴ	���`9��~�4YN��\JQ>v(#�6b9��� x�ϣt�?�J��6j���_�&�Jީ�'���A���,K7$��h��X�P|��Xj����`_Xqӓ����&�U�&�9Wf�f����V�e0��XPl�B�e�U�qj�Z�y�$s�'��߽No�6���ӛ��{��I0��Zm.20랐_��%0��[AUb��|7��(�'$9��Zo`��g�4�VB{A]��
�y�C�d���v�.6{�>���>�/�M���K`.�Y���H������U�PU��T���$����w�ɇ-���O�i`�/��L4<qB��iup3S�Leei��R\9"���9m�Y�y͖a9^2,Gz��#�34N^�n9��1�k	�%���+��.|���-,-�F��o*Ii}��J�S��|�0*ߕ���<�U�S�֫�`cǆ��p5@G���rJ�R�P̅Z,�F7ڠ:"K�>�{s���������%̌���nu���}� u�]>B��Y��bQ�,�
`>�V{`eI-d�`5�ʖ&�E��S��%!0�Mx����<���7]��=�#��H��7���Ohf��ݲCO(�-Z��A1��kA�"�;-�B1 ���w�B#��W���7�8 �f�|�ڔћ�|�~)&� В�MՉ�o|��O����$� ���<i*6,����S.�Ka���Q���33�>&�R��٫�xԃ ��(�)��s��B靬����_^�>+�H����V0�rj0���pT Ϯ���m��<X$� ͷ^Xd�AQ� F���|<��l"X��	h�������m)��6��|*��[� Fİ�>?��� ���=���B���)�����o�U�@�s������A�q�Ee��N+o���I1�f���� /!}��F��N�-����^�:W��4��^�:�ܻ������H�P<IƦ�Ņ(�y0�-b!pm��Ğ(k�필Q�'w���u���'��<�x9���G p��X8!D�;�3j%�"b�����B�|R1���ڈ%���Y�d*jJ9+/2)�M����4G�%���ͻ)���D�C}���(�(UA�I0�J�T,� �)�@$� y�1M�m� ���a[�V	����,4�`f)���E��&S�J�֌��w����B	��(||��R#@�oRB���nf�g�ť��(��$*�� A䓪	"�⩌����#!���v���\�`�H�,R����b��`\D��	0҇$� Ж6���vn9�� (��3G䡠��.�A����~��7 �*����ǘ _��7BP�a�c"/�{�O\]�4#����X������̃"���r����ɥ�|s_��x���Җݳ�r��rW�z"��O>������z"�Rqu���b�b=�����*�'��mt3A7��f`������Ŷ��	�n���$�{�{s��X�R)V���=��f�	*��]\Tk�.}�Xl@+��L�i���ātq�L�x+��t�� [��r�-O�����e�cZ�]����(d¼5�UxO�g���H�-�:_�)Ӑ�y�=Q�-x,^uy�}�)�t���T�W;�KKc�_Y�����q$�^%����U���5<#���X��7rf���)���6��Dy�g1�I��������]O~�L�c����3&��R�>��8�*x�q؂�a�ӺY�z$�+�Qv�|B�lg�l8חR����S.��+��b��W27G�g�xs���ps���	���W6s��"%f{��(�\$��1�oT�*n�p
 �ȍ?W�!{5l��������L������|���}�z�'ⅶ��ߓCي�*�JU�Hwvv�KEU�����ؕEazb�J*U�S8[�Gu[F����G��䛣>��Э����FOS��D/���,�c!�����pKy >�`���9��t6� ��*�D���&�܈H�z0>�;E"��*�k���f'`�glL1Y+�]%8���U7Y�߽\ZTp^�OR�Ű'S��M6��"���*�M��I���*���2�>*鯫�acڋ$����X�V�)+�}J����7���~rIE�2T2i[	Q_�z	?��(��M
�W�N҅1bŶ����f8*��y��3[[��d`qd+a�.����1h.G8H���ظJ@���P���ئ���1E�>�~ߵ�[��|�u!�*
l����'��
���y꘍���hܙPCuKo\D�d-Gv4�����.RKx���%�(�Zo37��*$Ff��]W��g�Ʒg?������\Df&��Sx�W�˝�/[/�I��% ���\�I�l�_U�T\Lr߰|�6���:֜=k�Ǟ���\��S�Xj^�B�4 ������UJ W)_��@�S��X���v�X���Yϐ���GL��䫧Pw�ns�C��i��w��`�V�28ƏB�NR�����R�Z��CF6Y���.���y���,^%_��l7و���G.I"4҃�Ğl���O&���F(�,%�{�P�ߜ�[[�E�6��d�����i��������Ej։���~n�����~�~F����5�,��5ނjky̆L�U�u��rec�*i9��4֙���X.�2u���m�Ҿ��T��\��~��/a���Vj��E�lp���"�)��IL���d9�S�k��0��;v[�#� �y/��(����::G^�+�0~�~~ exy�i!� p��>��n��u;��!�����tʐ�AJ�?��_�Z��R�`��i�:���O��<E�<8���ӛ�H�=dNEjE�t��')K������Rdb?�l�ws��m��>Xְ���!0ij+U�*��k�A!�e�Rb޵��*��u��� NJ��1�;cq��h�7r����8���)׷��WtZ�0�G�� ��gnl��L`V�h�J���Fpa0�+��#�lN��B��C�Z2V�N�$:z͛��E�c��U���At�"��L��t�;���#X"M1i�-+���>l#W����LL1���x��/�_fV2ʘ�Ҭ����}�<bc������ޞ��S������x�����̒�=��y��:4Y夬8�FV�b�ŉS@E�k..�(o��o����{	�{�I���������'��')�K�>",ϟ=+�r���yC��x��d]����E�=ɶ��}x�y���&m�nl|�tR��$��"D���^nC��3�)��:۶�
C��˫�����l�zϹ�O;�W��jI+ƺ��T�_�j�Fl�g�'���_����m-���?a0��F�>�����+?�(g�j?�m`W[
V�GQ���MD��,@C�YC ��$e�#�k�����_E`5�����Bp=�2N�J���7R�[U#Azxݺ�	�k�u�3F����=��,���'�>V�|�V)#^�����s�2h�{�AArt�2}xX�W+�I�m�(6��d�)85��������ːĸ��� w�<�r
6b����|���僒�$x���r��tCQ��m{�"#<���LJЕ�D P	  ���37����-Z�P�qk�m���HI��s�qhC�H09<�g�����,&o�z����;�0�E�Ύ?Eu��k@����עD��h�w���,o�>[j��xZ�+���!|QFA95���7it�L�� ��M���`�r;O	L�ZZB M��wQ�#����bk˽*�9)��T�Y��Ur�QGuC*�	�#	�!7u�	�sDnp��(��@N�\5*� wѺ�t�I�T�$�9���j%W�(�J�/m**��ݻ�����d���,^ݸi��Q�)1�G���f&'؜J8�3�����Ȃ���p�Lʨ$�M�w��ܰ�`U
6^ת���s���N�`�5I2U���Y-��Qfn4Q}qa���t�"�����ˌP\��i�bf�K�Ƹ�Ti����P�?��XV�����Rp$�ݥPb�G�@�'2a1WH�LRb"��0PSŦ<��@��t��W�|�bl�5��ܥ�Q�����b�!�(F�q�b�η ����F�N/�`����aS�C0k��>ω�R�d%�"n�H
���@���(��K��Y�=����
�k�(RŪ|쀤�������ASy��y��fk !|3̅�>���uDjJ����(���U�)a�.�Q��#f�|�T]*�BX��Ԋu�	���yl�=mP��,�Y�z9���5�"j�Da���07S��0��J@��C�J���*O[π�`�n���ӫ���lڽ-�`� kKt�������������{�\S����ؘLK�WMA�	���߽h���#�(3D&\��&Jɒ��J��0S�
����t�}��W�W𔝷*
�H������NK�0�B1<��D�6L�(_v�c����}V�1P�rF���*���C���26#Ѫ����H�:�����r:tH��=ޅjTw���?�������$��"�L��b�]�b����!V��F�QOVBRիV�#��^s�3�=���F�F�R<��V��0p]�@�Ԛ̰?$_�}k�r8`k� [g:�0�n��B�{�1O�/7�l2�����6��FAp�R����X�Sa(��i;��w)+��E����BXldB��wyu�eȽ�6��Jd��!t���=ȉb��|0�oMg����ܳy��|Ei-X���gX��� 5��U�X���@�u��|�y��)���]�z��m�z/EM�3w���g�\�[�*yJ�xb�]�8�s����޼�l���P�z]�%'�/l�͘jz�����7�y�u�Z,��i��$_�B��	���'�vf1���x�M��"�"�WY�W����a#�L�N�m~#fїJw��,��b�ǰ��C0��\.�Uĕk8V(�;�#;c/"Kw��&������H�p���L@�@_��	%L�y)�<lC�։�2�,K#�q�Io�:�w��\}S���xg���"�>4��B���M���.�X���۟Gl82 #ٺ��$�)W޽�9I���0�Φ6���14��1�Nd��@�fwj��<��Wkߞ��h����J��:̈́�T��b����f����Ӧy\v�<Oϊ���|��H�H�8�z��#��˅X�Fv�o�'>!P��/�x�K�R�]ś(W,���9�;Q�D괻�E�:h��H{�RD[1c3p�\7J�Bq��v� �Zi��pR��_g:#oI|�I/����a�V��h%�T��j-(5e�V
Y�I�>yXl�y�x��e�(��>o��Jf{�0[32�;�l�ɋ��B)ҩ��a�ȇw���� ���7�}[�tA�I�o�#1Ɨ�70a)H��ǁ��4O �EQ��:�r�p���IG�ۂd��b�G9�B�P -;�����:I�\�O�`��K)���S��#����#�An�uf�%0<r{���=0<���-�����'�c80�ۋ_f_D����R�P?,����S��S���K<����j��J��/�P̑m�*��l�&�0M	�E���6��p<05�� �� pı{�iS<��������$�g��o�E@;���N�~�M�^D��sd�Vkg_��u#�y�t`��i���ȀQt�PP�)[r@J���6E/���u]�]"!�1^���VsR�R���^LUxx���6���\��KN�TU�H�������.��|s���TC��W�,�k`�(����(����gE����k�k���}�
WN�U),���#�u1��,ܮ�5I ��YzN *�[Isv��xUC(5�e��`��-��0�~u������i$�����S���C�&䖧���~�#,�E��8w�j�Ţ����^1����_��_�?Sj��     
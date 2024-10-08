PGDMP         6            
    {            thuan_tourist    15.2    15.2 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    33717    thuan_tourist    DATABASE     �   CREATE DATABASE thuan_tourist WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Vietnamese_Vietnam.1258';
    DROP DATABASE thuan_tourist;
                postgres    false            {           1247    33749 	   area_type    TYPE     c   CREATE TYPE public.area_type AS ENUM (
    'Miền Bắc',
    'Miền Trung',
    'Miền Nam'
);
    DROP TYPE public.area_type;
       public          postgres    false            �           1247    33882 	   bank_name    TYPE     �   CREATE TYPE public.bank_name AS ENUM (
    'VietcomBank',
    'Techcombank',
    'Vietinbank',
    'MB',
    'Agribank',
    'ACB'
);
    DROP TYPE public.bank_name;
       public          postgres    false            �           1247    33794    gender_user_type    TYPE     G   CREATE TYPE public.gender_user_type AS ENUM (
    'Nam',
    'Nữ'
);
 #   DROP TYPE public.gender_user_type;
       public          postgres    false            �           1247    34106 
   image_type    TYPE     a   CREATE TYPE public.image_type AS ENUM (
    'Tin tức',
    'Tour',
    'Lịch trình tour'
);
    DROP TYPE public.image_type;
       public          postgres    false            �           1247    33862 	   news_type    TYPE     L   CREATE TYPE public.news_type AS ENUM (
    'Tin tức',
    'Cẩm nang'
);
    DROP TYPE public.news_type;
       public          postgres    false            �           1247    33856    status_news_type    TYPE     b   CREATE TYPE public.status_news_type AS ENUM (
    'Đã xuất bản',
    'Tạm thời ẩn'
);
 #   DROP TYPE public.status_news_type;
       public          postgres    false            �           1247    34045    status_reservation_type    TYPE     �   CREATE TYPE public.status_reservation_type AS ENUM (
    'Chờ thanh toán',
    'Chờ xác nhận',
    'Chờ đặt phương tiện',
    'Hoàn thành'
);
 *   DROP TYPE public.status_reservation_type;
       public          postgres    false            �           1247    33800    status_user_type    TYPE     u   CREATE TYPE public.status_user_type AS ENUM (
    'Hoạt động',
    'Đã khóa',
    'Không hoạt động'
);
 #   DROP TYPE public.status_user_type;
       public          postgres    false            �            1259    33733    additional_services    TABLE     &  CREATE TABLE public.additional_services (
    id integer NOT NULL,
    name character varying(200),
    "desc" text,
    price numeric(18,0),
    img_url text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 '   DROP TABLE public.additional_services;
       public         heap    postgres    false            �            1259    33732    additional_services_id_seq    SEQUENCE     �   CREATE SEQUENCE public.additional_services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.additional_services_id_seq;
       public          postgres    false    219                       0    0    additional_services_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.additional_services_id_seq OWNED BY public.additional_services.id;
          public          postgres    false    218            �            1259    33896    bank_accounts    TABLE     �  CREATE TABLE public.bank_accounts (
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
       public         heap    postgres    false    927            �            1259    33895    bank_accounts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bank_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.bank_accounts_id_seq;
       public          postgres    false    237            	           0    0    bank_accounts_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.bank_accounts_id_seq OWNED BY public.bank_accounts.id;
          public          postgres    false    236            �            1259    33719 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(100),
    parent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    33718    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    215            
           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    214            �            1259    33926    category_details    TABLE     �   CREATE TABLE public.category_details (
    category_id integer NOT NULL,
    tour_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 $   DROP TABLE public.category_details;
       public         heap    postgres    false            �            1259    34086    customer_details    TABLE     �  CREATE TABLE public.customer_details (
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
       public         heap    postgres    false            �            1259    34085    customer_details_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.customer_details_id_seq;
       public          postgres    false    254                       0    0    customer_details_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.customer_details_id_seq OWNED BY public.customer_details.id;
          public          postgres    false    253            �            1259    33763    district    TABLE     �   CREATE TABLE public.district (
    id integer NOT NULL,
    name character varying(100),
    province_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.district;
       public         heap    postgres    false            �            1259    33762    district_id_seq    SEQUENCE     �   CREATE SEQUENCE public.district_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.district_id_seq;
       public          postgres    false    225                       0    0    district_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.district_id_seq OWNED BY public.district.id;
          public          postgres    false    224                        1259    34114    images    TABLE     A  CREATE TABLE public.images (
    id integer NOT NULL,
    foreign_key_1 integer,
    foreign_key_2 integer,
    img_name character varying(200),
    url text,
    type public.image_type,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.images;
       public         heap    postgres    false    966            �            1259    34113    images_id_seq    SEQUENCE     �   CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.images_id_seq;
       public          postgres    false    256                       0    0    images_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;
          public          postgres    false    255            �            1259    33868    news    TABLE     Y  CREATE TABLE public.news (
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
       public         heap    postgres    false    918    921            �            1259    33867    news_id_seq    SEQUENCE     �   CREATE SEQUENCE public.news_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.news_id_seq;
       public          postgres    false    235                       0    0    news_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.news_id_seq OWNED BY public.news.id;
          public          postgres    false    234            �            1259    33837    notifications    TABLE     :  CREATE TABLE public.notifications (
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
       public         heap    postgres    false            �            1259    33836    notifications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.notifications_id_seq;
       public          postgres    false    233                       0    0    notifications_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;
          public          postgres    false    232            �            1259    34019    periods    TABLE     �  CREATE TABLE public.periods (
    id integer NOT NULL,
    tour_id integer,
    departure_time character varying(20),
    arrival_time character varying(20),
    adult_ticket_price numeric(18,0),
    child_ticket_price numeric(18,0),
    infant_ticket_price numeric(18,0),
    quantity smallint,
    maximum_quantity smallint,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.periods;
       public         heap    postgres    false            �            1259    34018    periods_id_seq    SEQUENCE     �   CREATE SEQUENCE public.periods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.periods_id_seq;
       public          postgres    false    248                       0    0    periods_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.periods_id_seq OWNED BY public.periods.id;
          public          postgres    false    247            �            1259    33756    province    TABLE     �   CREATE TABLE public.province (
    id integer NOT NULL,
    name character varying(100),
    area public.area_type,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.province;
       public         heap    postgres    false    891            �            1259    33755    province_id_seq    SEQUENCE     �   CREATE SEQUENCE public.province_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.province_id_seq;
       public          postgres    false    223                       0    0    province_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.province_id_seq OWNED BY public.province.id;
          public          postgres    false    222            �            1259    33995    ratings    TABLE     =  CREATE TABLE public.ratings (
    id integer NOT NULL,
    reviewer integer,
    responder integer,
    tour_id integer,
    star_count smallint,
    message character varying(5000),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.ratings;
       public         heap    postgres    false            �            1259    33994    ratings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.ratings_id_seq;
       public          postgres    false    246                       0    0    ratings_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;
          public          postgres    false    245            �            1259    34054    reservations    TABLE     ~  CREATE TABLE public.reservations (
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
       public         heap    postgres    false    957            �            1259    34053    reservations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reservations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.reservations_id_seq;
       public          postgres    false    252                       0    0    reservations_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.reservations_id_seq OWNED BY public.reservations.id;
          public          postgres    false    251            �            1259    33742    roles    TABLE     �   CREATE TABLE public.roles (
    id integer NOT NULL,
    name character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    33741    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    221                       0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    220            �            1259    33972 	   schedules    TABLE       CREATE TABLE public.schedules (
    id integer NOT NULL,
    tour_id integer,
    day smallint,
    title character varying(200),
    body text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.schedules;
       public         heap    postgres    false            �            1259    33971    schedules_id_seq    SEQUENCE     �   CREATE SEQUENCE public.schedules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.schedules_id_seq;
       public          postgres    false    244                       0    0    schedules_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.schedules_id_seq OWNED BY public.schedules.id;
          public          postgres    false    243            �            1259    33941    segment_details    TABLE     �   CREATE TABLE public.segment_details (
    tourist_segment_id integer NOT NULL,
    tour_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 #   DROP TABLE public.segment_details;
       public         heap    postgres    false            �            1259    33956    service_details    TABLE     �   CREATE TABLE public.service_details (
    additional_services_id integer NOT NULL,
    tour_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 #   DROP TABLE public.service_details;
       public         heap    postgres    false            �            1259    33726    tourist_segments    TABLE     �   CREATE TABLE public.tourist_segments (
    id integer NOT NULL,
    name character varying(200),
    parent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 $   DROP TABLE public.tourist_segments;
       public         heap    postgres    false            �            1259    33725    tourist_segments_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tourist_segments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.tourist_segments_id_seq;
       public          postgres    false    217                       0    0    tourist_segments_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.tourist_segments_id_seq OWNED BY public.tourist_segments.id;
          public          postgres    false    216            �            1259    33903    tours    TABLE     �  CREATE TABLE public.tours (
    id integer NOT NULL,
    type_transportation_id integer,
    from_province_id integer,
    to_province_id integer,
    title character varying(200),
    number_of_day smallint,
    itinerary_highlight text,
    policy text,
    note text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.tours;
       public         heap    postgres    false            �            1259    33902    tours_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tours_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.tours_id_seq;
       public          postgres    false    239                       0    0    tours_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.tours_id_seq OWNED BY public.tours.id;
          public          postgres    false    238            �            1259    34031    transportation    TABLE     |  CREATE TABLE public.transportation (
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
       public         heap    postgres    false            �            1259    34030    transportation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transportation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.transportation_id_seq;
       public          postgres    false    250                       0    0    transportation_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.transportation_id_seq OWNED BY public.transportation.id;
          public          postgres    false    249            �            1259    33787    types_transportation    TABLE       CREATE TABLE public.types_transportation (
    id integer NOT NULL,
    name character varying(200),
    parent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
 (   DROP TABLE public.types_transportation;
       public         heap    postgres    false            �            1259    33786    types_transportation_id_seq    SEQUENCE     �   CREATE SEQUENCE public.types_transportation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.types_transportation_id_seq;
       public          postgres    false    229                       0    0    types_transportation_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.types_transportation_id_seq OWNED BY public.types_transportation.id;
          public          postgres    false    228            �            1259    33808    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    role_id integer,
    full_name character varying(100),
    email character varying(100),
    phone_number character varying(15),
    avatar_url text,
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
       public         heap    postgres    false    906    909            �            1259    33807    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    231                       0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    230            �            1259    33775    ward    TABLE     �   CREATE TABLE public.ward (
    id integer NOT NULL,
    name character varying(100),
    district_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);
    DROP TABLE public.ward;
       public         heap    postgres    false            �            1259    33774    ward_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ward_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.ward_id_seq;
       public          postgres    false    227                       0    0    ward_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.ward_id_seq OWNED BY public.ward.id;
          public          postgres    false    226            �           2604    33736    additional_services id    DEFAULT     �   ALTER TABLE ONLY public.additional_services ALTER COLUMN id SET DEFAULT nextval('public.additional_services_id_seq'::regclass);
 E   ALTER TABLE public.additional_services ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    33899    bank_accounts id    DEFAULT     t   ALTER TABLE ONLY public.bank_accounts ALTER COLUMN id SET DEFAULT nextval('public.bank_accounts_id_seq'::regclass);
 ?   ALTER TABLE public.bank_accounts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    236    237    237            �           2604    33722    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    34089    customer_details id    DEFAULT     z   ALTER TABLE ONLY public.customer_details ALTER COLUMN id SET DEFAULT nextval('public.customer_details_id_seq'::regclass);
 B   ALTER TABLE public.customer_details ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253    254            �           2604    33766    district id    DEFAULT     j   ALTER TABLE ONLY public.district ALTER COLUMN id SET DEFAULT nextval('public.district_id_seq'::regclass);
 :   ALTER TABLE public.district ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    34117 	   images id    DEFAULT     f   ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);
 8   ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    255    256    256            �           2604    33871    news id    DEFAULT     b   ALTER TABLE ONLY public.news ALTER COLUMN id SET DEFAULT nextval('public.news_id_seq'::regclass);
 6   ALTER TABLE public.news ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    33840    notifications id    DEFAULT     t   ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);
 ?   ALTER TABLE public.notifications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    34022 
   periods id    DEFAULT     h   ALTER TABLE ONLY public.periods ALTER COLUMN id SET DEFAULT nextval('public.periods_id_seq'::regclass);
 9   ALTER TABLE public.periods ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    248    247    248            �           2604    33759    province id    DEFAULT     j   ALTER TABLE ONLY public.province ALTER COLUMN id SET DEFAULT nextval('public.province_id_seq'::regclass);
 :   ALTER TABLE public.province ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    33998 
   ratings id    DEFAULT     h   ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);
 9   ALTER TABLE public.ratings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    246    246            �           2604    34057    reservations id    DEFAULT     r   ALTER TABLE ONLY public.reservations ALTER COLUMN id SET DEFAULT nextval('public.reservations_id_seq'::regclass);
 >   ALTER TABLE public.reservations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251    252            �           2604    33745    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    33975    schedules id    DEFAULT     l   ALTER TABLE ONLY public.schedules ALTER COLUMN id SET DEFAULT nextval('public.schedules_id_seq'::regclass);
 ;   ALTER TABLE public.schedules ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    243    244            �           2604    33729    tourist_segments id    DEFAULT     z   ALTER TABLE ONLY public.tourist_segments ALTER COLUMN id SET DEFAULT nextval('public.tourist_segments_id_seq'::regclass);
 B   ALTER TABLE public.tourist_segments ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    33906    tours id    DEFAULT     d   ALTER TABLE ONLY public.tours ALTER COLUMN id SET DEFAULT nextval('public.tours_id_seq'::regclass);
 7   ALTER TABLE public.tours ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239            �           2604    34034    transportation id    DEFAULT     v   ALTER TABLE ONLY public.transportation ALTER COLUMN id SET DEFAULT nextval('public.transportation_id_seq'::regclass);
 @   ALTER TABLE public.transportation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    250    250            �           2604    33790    types_transportation id    DEFAULT     �   ALTER TABLE ONLY public.types_transportation ALTER COLUMN id SET DEFAULT nextval('public.types_transportation_id_seq'::regclass);
 F   ALTER TABLE public.types_transportation ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    33811    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            �           2604    33778    ward id    DEFAULT     b   ALTER TABLE ONLY public.ward ALTER COLUMN id SET DEFAULT nextval('public.ward_id_seq'::regclass);
 6   ALTER TABLE public.ward ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            �          0    33733    additional_services 
   TABLE DATA           s   COPY public.additional_services (id, name, "desc", price, img_url, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    219   ��       �          0    33896    bank_accounts 
   TABLE DATA           �   COPY public.bank_accounts (id, bank_name, atm_card_number, pin, cardholder_name, expiry_date, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    237   ��       �          0    33719 
   categories 
   TABLE DATA           ]   COPY public.categories (id, name, parent_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    215   ��       �          0    33926    category_details 
   TABLE DATA           d   COPY public.category_details (category_id, tour_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    240   �       �          0    34086    customer_details 
   TABLE DATA           �   COPY public.customer_details (id, reservation_id, full_name, phone_number, email, province_id, address, ordinal_number, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    254   8�       �          0    33763    district 
   TABLE DATA           ]   COPY public.district (id, name, province_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    225   U�                 0    34114    images 
   TABLE DATA           {   COPY public.images (id, foreign_key_1, foreign_key_2, img_name, url, type, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    256   r�       �          0    33868    news 
   TABLE DATA           x   COPY public.news (id, author_id, title, body, view_count, status, type, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    235   ��       �          0    33837    notifications 
   TABLE DATA           w   COPY public.notifications (id, title, message, sender_id, receiver_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    233   ��       �          0    34019    periods 
   TABLE DATA           �   COPY public.periods (id, tour_id, departure_time, arrival_time, adult_ticket_price, child_ticket_price, infant_ticket_price, quantity, maximum_quantity, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    248   ��       �          0    33756    province 
   TABLE DATA           V   COPY public.province (id, name, area, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    223   ��       �          0    33995    ratings 
   TABLE DATA           |   COPY public.ratings (id, reviewer, responder, tour_id, star_count, message, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    246   �       �          0    34054    reservations 
   TABLE DATA           1  COPY public.reservations (id, tour_period_id, bank_account_id, user_id, transportation_id, adult_ticket_quantity, child_ticket_quantity, infant_ticket_quantity, additional_service_id, additional_service_quantity, total_amount, status, order_date, otp_code, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    252    �       �          0    33742    roles 
   TABLE DATA           M   COPY public.roles (id, name, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    221   =�       �          0    33972 	   schedules 
   TABLE DATA           f   COPY public.schedules (id, tour_id, day, title, body, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    244   ��       �          0    33941    segment_details 
   TABLE DATA           j   COPY public.segment_details (tourist_segment_id, tour_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    241   ��       �          0    33956    service_details 
   TABLE DATA           n   COPY public.service_details (additional_services_id, tour_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    242   ��       �          0    33726    tourist_segments 
   TABLE DATA           c   COPY public.tourist_segments (id, name, parent_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    217   �       �          0    33903    tours 
   TABLE DATA           �   COPY public.tours (id, type_transportation_id, from_province_id, to_province_id, title, number_of_day, itinerary_highlight, policy, note, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    239   *�       �          0    34031    transportation 
   TABLE DATA           �   COPY public.transportation (id, type_transportation_id, name, distance, departure_time, arrival_time, from_location, to_location, quantity, maximum_quantity, ticket_class, seat, price, "desc", created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    250   G�       �          0    33787    types_transportation 
   TABLE DATA           g   COPY public.types_transportation (id, name, parent_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    229   d�       �          0    33808    users 
   TABLE DATA           �   COPY public.users (id, role_id, full_name, email, phone_number, avatar_url, province_id, district_id, ward_id, address, gender, status, password, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    231   ��       �          0    33775    ward 
   TABLE DATA           Y   COPY public.ward (id, name, district_id, created_at, updated_at, deleted_at) FROM stdin;
    public          postgres    false    227   )�                  0    0    additional_services_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.additional_services_id_seq', 1, false);
          public          postgres    false    218                       0    0    bank_accounts_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.bank_accounts_id_seq', 1, false);
          public          postgres    false    236                       0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 1, false);
          public          postgres    false    214                       0    0    customer_details_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.customer_details_id_seq', 1, false);
          public          postgres    false    253                        0    0    district_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.district_id_seq', 1, false);
          public          postgres    false    224            !           0    0    images_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.images_id_seq', 1, false);
          public          postgres    false    255            "           0    0    news_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.news_id_seq', 1, false);
          public          postgres    false    234            #           0    0    notifications_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);
          public          postgres    false    232            $           0    0    periods_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.periods_id_seq', 1, false);
          public          postgres    false    247            %           0    0    province_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.province_id_seq', 1, false);
          public          postgres    false    222            &           0    0    ratings_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.ratings_id_seq', 1, false);
          public          postgres    false    245            '           0    0    reservations_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.reservations_id_seq', 1, false);
          public          postgres    false    251            (           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 3, true);
          public          postgres    false    220            )           0    0    schedules_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.schedules_id_seq', 1, false);
          public          postgres    false    243            *           0    0    tourist_segments_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tourist_segments_id_seq', 1, false);
          public          postgres    false    216            +           0    0    tours_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.tours_id_seq', 1, false);
          public          postgres    false    238            ,           0    0    transportation_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.transportation_id_seq', 1, false);
          public          postgres    false    249            -           0    0    types_transportation_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.types_transportation_id_seq', 1, false);
          public          postgres    false    228            .           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    230            /           0    0    ward_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.ward_id_seq', 1, false);
          public          postgres    false    226                       2606    33740 ,   additional_services additional_services_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.additional_services
    ADD CONSTRAINT additional_services_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.additional_services DROP CONSTRAINT additional_services_pkey;
       public            postgres    false    219                       2606    33901     bank_accounts bank_accounts_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.bank_accounts
    ADD CONSTRAINT bank_accounts_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.bank_accounts DROP CONSTRAINT bank_accounts_pkey;
       public            postgres    false    237            �           2606    33724    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    215                       2606    33930 &   category_details category_details_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.category_details
    ADD CONSTRAINT category_details_pkey PRIMARY KEY (category_id, tour_id);
 P   ALTER TABLE ONLY public.category_details DROP CONSTRAINT category_details_pkey;
       public            postgres    false    240    240            '           2606    34093 &   customer_details customer_details_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.customer_details
    ADD CONSTRAINT customer_details_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.customer_details DROP CONSTRAINT customer_details_pkey;
       public            postgres    false    254                       2606    33768    district district_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.district DROP CONSTRAINT district_pkey;
       public            postgres    false    225            )           2606    34121    images images_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public            postgres    false    256                       2606    33875    news news_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public            postgres    false    235                       2606    33844     notifications notifications_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_pkey;
       public            postgres    false    233            !           2606    34024    periods periods_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.periods DROP CONSTRAINT periods_pkey;
       public            postgres    false    248                       2606    33761    province province_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.province
    ADD CONSTRAINT province_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.province DROP CONSTRAINT province_pkey;
       public            postgres    false    223                       2606    34002    ratings ratings_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_pkey;
       public            postgres    false    246            %           2606    34059    reservations reservations_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_pkey;
       public            postgres    false    252                       2606    33747    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    221                       2606    33979    schedules schedules_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.schedules DROP CONSTRAINT schedules_pkey;
       public            postgres    false    244                       2606    33945 $   segment_details segment_details_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.segment_details
    ADD CONSTRAINT segment_details_pkey PRIMARY KEY (tourist_segment_id, tour_id);
 N   ALTER TABLE ONLY public.segment_details DROP CONSTRAINT segment_details_pkey;
       public            postgres    false    241    241                       2606    33960 $   service_details service_details_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.service_details
    ADD CONSTRAINT service_details_pkey PRIMARY KEY (additional_services_id, tour_id);
 N   ALTER TABLE ONLY public.service_details DROP CONSTRAINT service_details_pkey;
       public            postgres    false    242    242            �           2606    33731 &   tourist_segments tourist_segments_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.tourist_segments
    ADD CONSTRAINT tourist_segments_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.tourist_segments DROP CONSTRAINT tourist_segments_pkey;
       public            postgres    false    217                       2606    33910    tours tours_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tours
    ADD CONSTRAINT tours_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.tours DROP CONSTRAINT tours_pkey;
       public            postgres    false    239            #           2606    34038 "   transportation transportation_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.transportation
    ADD CONSTRAINT transportation_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.transportation DROP CONSTRAINT transportation_pkey;
       public            postgres    false    250                       2606    33792 .   types_transportation types_transportation_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.types_transportation
    ADD CONSTRAINT types_transportation_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.types_transportation DROP CONSTRAINT types_transportation_pkey;
       public            postgres    false    229                       2606    33815    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    231            	           2606    33780    ward ward_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.ward
    ADD CONSTRAINT ward_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.ward DROP CONSTRAINT ward_pkey;
       public            postgres    false    227            6           2606    33931 2   category_details category_details_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.category_details
    ADD CONSTRAINT category_details_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 \   ALTER TABLE ONLY public.category_details DROP CONSTRAINT category_details_category_id_fkey;
       public          postgres    false    215    3325    240            7           2606    33936 .   category_details category_details_tour_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.category_details
    ADD CONSTRAINT category_details_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 X   ALTER TABLE ONLY public.category_details DROP CONSTRAINT category_details_tour_id_fkey;
       public          postgres    false    240    239    3349            G           2606    34099 2   customer_details customer_details_province_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_details
    ADD CONSTRAINT customer_details_province_id_fkey FOREIGN KEY (province_id) REFERENCES public.province(id);
 \   ALTER TABLE ONLY public.customer_details DROP CONSTRAINT customer_details_province_id_fkey;
       public          postgres    false    254    3333    223            H           2606    34094 5   customer_details customer_details_reservation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_details
    ADD CONSTRAINT customer_details_reservation_id_fkey FOREIGN KEY (reservation_id) REFERENCES public.reservations(id);
 _   ALTER TABLE ONLY public.customer_details DROP CONSTRAINT customer_details_reservation_id_fkey;
       public          postgres    false    252    3365    254            *           2606    33769 "   district district_province_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.district
    ADD CONSTRAINT district_province_id_fkey FOREIGN KEY (province_id) REFERENCES public.province(id);
 L   ALTER TABLE ONLY public.district DROP CONSTRAINT district_province_id_fkey;
       public          postgres    false    225    223    3333            2           2606    33876    news news_author_id_fkey    FK CONSTRAINT     y   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_author_id_fkey FOREIGN KEY (author_id) REFERENCES public.users(id);
 B   ALTER TABLE ONLY public.news DROP CONSTRAINT news_author_id_fkey;
       public          postgres    false    3341    231    235            0           2606    33850 ,   notifications notifications_receiver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(id);
 V   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_receiver_id_fkey;
       public          postgres    false    231    233    3341            1           2606    33845 *   notifications notifications_sender_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES public.users(id);
 T   ALTER TABLE ONLY public.notifications DROP CONSTRAINT notifications_sender_id_fkey;
       public          postgres    false    233    3341    231            @           2606    34025    periods periods_tour_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.periods
    ADD CONSTRAINT periods_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 F   ALTER TABLE ONLY public.periods DROP CONSTRAINT periods_tour_id_fkey;
       public          postgres    false    239    248    3349            =           2606    34008    ratings ratings_responder_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_responder_fkey FOREIGN KEY (responder) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_responder_fkey;
       public          postgres    false    246    231    3341            >           2606    34003    ratings ratings_reviewer_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_reviewer_fkey FOREIGN KEY (reviewer) REFERENCES public.users(id);
 G   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_reviewer_fkey;
       public          postgres    false    231    3341    246            ?           2606    34013    ratings ratings_tour_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 F   ALTER TABLE ONLY public.ratings DROP CONSTRAINT ratings_tour_id_fkey;
       public          postgres    false    239    246    3349            B           2606    34080 4   reservations reservations_additional_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_additional_service_id_fkey FOREIGN KEY (additional_service_id) REFERENCES public.additional_services(id);
 ^   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_additional_service_id_fkey;
       public          postgres    false    252    3329    219            C           2606    34065 .   reservations reservations_bank_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_bank_account_id_fkey FOREIGN KEY (bank_account_id) REFERENCES public.bank_accounts(id);
 X   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_bank_account_id_fkey;
       public          postgres    false    252    237    3347            D           2606    34060 -   reservations reservations_tour_period_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_tour_period_id_fkey FOREIGN KEY (tour_period_id) REFERENCES public.periods(id);
 W   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_tour_period_id_fkey;
       public          postgres    false    248    252    3361            E           2606    34075 0   reservations reservations_transportation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_transportation_id_fkey FOREIGN KEY (transportation_id) REFERENCES public.transportation(id);
 Z   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_transportation_id_fkey;
       public          postgres    false    252    250    3363            F           2606    34070 &   reservations reservations_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservations_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 P   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservations_user_id_fkey;
       public          postgres    false    252    3341    231            <           2606    33980     schedules schedules_tour_id_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.schedules
    ADD CONSTRAINT schedules_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 J   ALTER TABLE ONLY public.schedules DROP CONSTRAINT schedules_tour_id_fkey;
       public          postgres    false    239    3349    244            8           2606    33951 ,   segment_details segment_details_tour_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.segment_details
    ADD CONSTRAINT segment_details_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 V   ALTER TABLE ONLY public.segment_details DROP CONSTRAINT segment_details_tour_id_fkey;
       public          postgres    false    239    3349    241            9           2606    33946 7   segment_details segment_details_tourist_segment_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.segment_details
    ADD CONSTRAINT segment_details_tourist_segment_id_fkey FOREIGN KEY (tourist_segment_id) REFERENCES public.tourist_segments(id);
 a   ALTER TABLE ONLY public.segment_details DROP CONSTRAINT segment_details_tourist_segment_id_fkey;
       public          postgres    false    217    3327    241            :           2606    33961 ;   service_details service_details_additional_services_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_details
    ADD CONSTRAINT service_details_additional_services_id_fkey FOREIGN KEY (additional_services_id) REFERENCES public.additional_services(id);
 e   ALTER TABLE ONLY public.service_details DROP CONSTRAINT service_details_additional_services_id_fkey;
       public          postgres    false    242    3329    219            ;           2606    33966 ,   service_details service_details_tour_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.service_details
    ADD CONSTRAINT service_details_tour_id_fkey FOREIGN KEY (tour_id) REFERENCES public.tours(id);
 V   ALTER TABLE ONLY public.service_details DROP CONSTRAINT service_details_tour_id_fkey;
       public          postgres    false    242    239    3349            3           2606    33916 !   tours tours_from_province_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tours
    ADD CONSTRAINT tours_from_province_id_fkey FOREIGN KEY (from_province_id) REFERENCES public.province(id);
 K   ALTER TABLE ONLY public.tours DROP CONSTRAINT tours_from_province_id_fkey;
       public          postgres    false    239    3333    223            4           2606    33921    tours tours_to_province_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tours
    ADD CONSTRAINT tours_to_province_id_fkey FOREIGN KEY (to_province_id) REFERENCES public.province(id);
 I   ALTER TABLE ONLY public.tours DROP CONSTRAINT tours_to_province_id_fkey;
       public          postgres    false    3333    223    239            5           2606    33911 '   tours tours_type_transportation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tours
    ADD CONSTRAINT tours_type_transportation_id_fkey FOREIGN KEY (type_transportation_id) REFERENCES public.types_transportation(id);
 Q   ALTER TABLE ONLY public.tours DROP CONSTRAINT tours_type_transportation_id_fkey;
       public          postgres    false    3339    239    229            A           2606    34039 9   transportation transportation_type_transportation_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transportation
    ADD CONSTRAINT transportation_type_transportation_id_fkey FOREIGN KEY (type_transportation_id) REFERENCES public.types_transportation(id);
 c   ALTER TABLE ONLY public.transportation DROP CONSTRAINT transportation_type_transportation_id_fkey;
       public          postgres    false    3339    250    229            ,           2606    33826    users users_district_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_district_id_fkey FOREIGN KEY (district_id) REFERENCES public.district(id);
 F   ALTER TABLE ONLY public.users DROP CONSTRAINT users_district_id_fkey;
       public          postgres    false    225    231    3335            -           2606    33821    users users_province_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_province_id_fkey FOREIGN KEY (province_id) REFERENCES public.province(id);
 F   ALTER TABLE ONLY public.users DROP CONSTRAINT users_province_id_fkey;
       public          postgres    false    3333    231    223            .           2606    33816    users users_role_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public          postgres    false    3331    231    221            /           2606    33831    users users_ward_id_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_ward_id_fkey FOREIGN KEY (ward_id) REFERENCES public.ward(id);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_ward_id_fkey;
       public          postgres    false    3337    231    227            +           2606    33781    ward ward_district_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ward
    ADD CONSTRAINT ward_district_id_fkey FOREIGN KEY (district_id) REFERENCES public.district(id);
 D   ALTER TABLE ONLY public.ward DROP CONSTRAINT ward_district_id_fkey;
       public          postgres    false    227    3335    225            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �            x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   i   x�3���8�09C!����t���P�yxU��������������q����_��Eyu
G&f>��X� �[�_Z�G�1H���҇��)�ދGm� w�2�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�3�4��K/�|��5O���t���҇���q�d�&�9��&f��%��rX�����1g�
�K�����ka��w��K�T1�T14P)7���4r�4(
-��O
�/
�KvIM�4J-�*�(�t+M�2��.�r󍪄����� [�6~      �      x������ � �     
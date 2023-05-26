--
-- PostgreSQL database dump
--

-- Dumped from database version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.9 (Ubuntu 13.9-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO sellbuy;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO sellbuy;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO sellbuy;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO sellbuy;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: api_activitylog; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_activitylog (
    id bigint NOT NULL,
    message character varying(300),
    activity_type character varying(60),
    follow_url character varying(200),
    created_at timestamp with time zone,
    activity_by_id bigint,
    activity_for_id bigint,
    product_id bigint
);


ALTER TABLE public.api_activitylog OWNER TO sellbuy;

--
-- Name: api_activitylog_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_activitylog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_activitylog_id_seq OWNER TO sellbuy;

--
-- Name: api_activitylog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_activitylog_id_seq OWNED BY public.api_activitylog.id;


--
-- Name: api_badge; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_badge (
    id bigint NOT NULL,
    badges integer,
    price double precision,
    created_at timestamp with time zone
);


ALTER TABLE public.api_badge OWNER TO sellbuy;

--
-- Name: api_badge_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_badge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_badge_id_seq OWNER TO sellbuy;

--
-- Name: api_badge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_badge_id_seq OWNED BY public.api_badge.id;


--
-- Name: api_bannerad; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_bannerad (
    id bigint NOT NULL,
    title character varying(200) NOT NULL,
    slug character varying(200) NOT NULL,
    active boolean NOT NULL,
    show_prices boolean NOT NULL,
    url character varying(200),
    image character varying(100),
    banner_status character varying(60),
    thumbnail character varying(100),
    description character varying(200),
    date timestamp with time zone NOT NULL,
    "order" integer,
    offer_id bigint,
    product_id bigint,
    user_id bigint
);


ALTER TABLE public.api_bannerad OWNER TO sellbuy;

--
-- Name: api_bannerad_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_bannerad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_bannerad_id_seq OWNER TO sellbuy;

--
-- Name: api_bannerad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_bannerad_id_seq OWNED BY public.api_bannerad.id;


--
-- Name: api_brand; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_brand (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    icon character varying(100),
    slug character varying(50),
    created timestamp with time zone NOT NULL,
    category_id bigint
);


ALTER TABLE public.api_brand OWNER TO sellbuy;

--
-- Name: api_brand_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_brand_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_brand_id_seq OWNER TO sellbuy;

--
-- Name: api_brand_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_brand_id_seq OWNED BY public.api_brand.id;


--
-- Name: api_buybadge; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_buybadge (
    id bigint NOT NULL,
    created_at timestamp with time zone,
    badges_id bigint,
    user_id bigint
);


ALTER TABLE public.api_buybadge OWNER TO sellbuy;

--
-- Name: api_buybadge_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_buybadge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_buybadge_id_seq OWNER TO sellbuy;

--
-- Name: api_buybadge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_buybadge_id_seq OWNED BY public.api_buybadge.id;


--
-- Name: api_category; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_category (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(50),
    created timestamp with time zone NOT NULL,
    icon character varying(100),
    parent_id bigint
);


ALTER TABLE public.api_category OWNER TO sellbuy;

--
-- Name: api_category_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_category_id_seq OWNER TO sellbuy;

--
-- Name: api_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_category_id_seq OWNED BY public.api_category.id;


--
-- Name: api_favouriteproduct; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_favouriteproduct (
    id bigint NOT NULL,
    product_id bigint,
    user_id bigint
);


ALTER TABLE public.api_favouriteproduct OWNER TO sellbuy;

--
-- Name: api_favouriteproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_favouriteproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_favouriteproduct_id_seq OWNER TO sellbuy;

--
-- Name: api_favouriteproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_favouriteproduct_id_seq OWNED BY public.api_favouriteproduct.id;


--
-- Name: api_generalactivitylog; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_generalactivitylog (
    id bigint NOT NULL,
    message character varying(300),
    created_at timestamp with time zone,
    user_id bigint
);


ALTER TABLE public.api_generalactivitylog OWNER TO sellbuy;

--
-- Name: api_generalactivitylog_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_generalactivitylog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_generalactivitylog_id_seq OWNER TO sellbuy;

--
-- Name: api_generalactivitylog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_generalactivitylog_id_seq OWNED BY public.api_generalactivitylog.id;


--
-- Name: api_image; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_image (
    id bigint NOT NULL,
    image character varying(100)
);


ALTER TABLE public.api_image OWNER TO sellbuy;

--
-- Name: api_image_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_image_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_image_id_seq OWNER TO sellbuy;

--
-- Name: api_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_image_id_seq OWNED BY public.api_image.id;


--
-- Name: api_makeoffer; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_makeoffer (
    id bigint NOT NULL,
    make_offer_status character varying(20) NOT NULL,
    bid_amount character varying(30) NOT NULL,
    created_at timestamp with time zone,
    product_id bigint,
    user_id bigint
);


ALTER TABLE public.api_makeoffer OWNER TO sellbuy;

--
-- Name: api_makeoffer_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_makeoffer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_makeoffer_id_seq OWNER TO sellbuy;

--
-- Name: api_makeoffer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_makeoffer_id_seq OWNED BY public.api_makeoffer.id;


--
-- Name: api_myaddressbook; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_myaddressbook (
    id bigint NOT NULL,
    address character varying(300),
    phone_number character varying(300),
    created_at timestamp with time zone,
    user_id bigint
);


ALTER TABLE public.api_myaddressbook OWNER TO sellbuy;

--
-- Name: api_myaddressbook_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_myaddressbook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_myaddressbook_id_seq OWNER TO sellbuy;

--
-- Name: api_myaddressbook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_myaddressbook_id_seq OWNED BY public.api_myaddressbook.id;


--
-- Name: api_notification; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_notification (
    id bigint NOT NULL,
    url character varying(50),
    message character varying(120),
    is_seen boolean NOT NULL,
    date timestamp with time zone NOT NULL,
    receiver_id bigint,
    sender_id bigint
);


ALTER TABLE public.api_notification OWNER TO sellbuy;

--
-- Name: api_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_notification_id_seq OWNER TO sellbuy;

--
-- Name: api_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_notification_id_seq OWNED BY public.api_notification.id;


--
-- Name: api_order; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_order (
    id bigint NOT NULL,
    total_amount character varying(30) NOT NULL,
    currency character varying(20) NOT NULL,
    payment_status character varying(20) NOT NULL,
    order_status character varying(20) NOT NULL,
    user_id bigint,
    created_at timestamp with time zone
);


ALTER TABLE public.api_order OWNER TO sellbuy;

--
-- Name: api_order_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_order_id_seq OWNER TO sellbuy;

--
-- Name: api_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_order_id_seq OWNED BY public.api_order.id;


--
-- Name: api_order_products; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_order_products (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.api_order_products OWNER TO sellbuy;

--
-- Name: api_order_products_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_order_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_order_products_id_seq OWNER TO sellbuy;

--
-- Name: api_order_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_order_products_id_seq OWNED BY public.api_order_products.id;


--
-- Name: api_orderpayment; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_orderpayment (
    id bigint NOT NULL,
    ref character varying(50),
    amount character varying(20) NOT NULL,
    currency character varying(20) NOT NULL,
    method character varying(30) NOT NULL,
    date timestamp with time zone NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.api_orderpayment OWNER TO sellbuy;

--
-- Name: api_orderpayment_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_orderpayment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_orderpayment_id_seq OWNER TO sellbuy;

--
-- Name: api_orderpayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_orderpayment_id_seq OWNED BY public.api_orderpayment.id;


--
-- Name: api_otp; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_otp (
    id bigint NOT NULL,
    email character varying(254),
    phone_number character varying(20),
    otp character varying(5) NOT NULL,
    expiry character varying(2) NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.api_otp OWNER TO sellbuy;

--
-- Name: api_otp_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_otp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_otp_id_seq OWNER TO sellbuy;

--
-- Name: api_otp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_otp_id_seq OWNED BY public.api_otp.id;


--
-- Name: api_product; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_product (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    slug character varying(50) NOT NULL,
    description text NOT NULL,
    market_price double precision NOT NULL,
    discount_price double precision,
    negotiable boolean NOT NULL,
    user_id bigint,
    product_status character varying(60),
    date timestamp with time zone,
    reserved boolean NOT NULL,
    condition character varying(60),
    price_type character varying(60),
    video_file character varying(100),
    video_yt_url character varying(200),
    brand_id bigint,
    deal_method_mailing boolean NOT NULL,
    deal_method_mailing_detail character varying(200),
    deal_method_meetup boolean NOT NULL,
    deal_method_meetup_detail character varying(200)[] NOT NULL
);


ALTER TABLE public.api_product OWNER TO sellbuy;

--
-- Name: api_product_categories; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_product_categories (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.api_product_categories OWNER TO sellbuy;

--
-- Name: api_product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_product_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_product_categories_id_seq OWNER TO sellbuy;

--
-- Name: api_product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_product_categories_id_seq OWNED BY public.api_product_categories.id;


--
-- Name: api_product_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_product_id_seq OWNER TO sellbuy;

--
-- Name: api_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_product_id_seq OWNED BY public.api_product.id;


--
-- Name: api_product_images; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_product_images (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    image_id bigint NOT NULL
);


ALTER TABLE public.api_product_images OWNER TO sellbuy;

--
-- Name: api_product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_product_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_product_images_id_seq OWNER TO sellbuy;

--
-- Name: api_product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_product_images_id_seq OWNED BY public.api_product_images.id;


--
-- Name: api_promotion; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_promotion (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    offer_price double precision NOT NULL,
    currency character varying(20) NOT NULL,
    description character varying(200),
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.api_promotion OWNER TO sellbuy;

--
-- Name: api_promotion_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_promotion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_promotion_id_seq OWNER TO sellbuy;

--
-- Name: api_promotion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_promotion_id_seq OWNED BY public.api_promotion.id;


--
-- Name: api_reportproduct; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_reportproduct (
    id bigint NOT NULL,
    report_type character varying(60),
    product_id bigint,
    user_id bigint
);


ALTER TABLE public.api_reportproduct OWNER TO sellbuy;

--
-- Name: api_reportproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_reportproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_reportproduct_id_seq OWNER TO sellbuy;

--
-- Name: api_reportproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_reportproduct_id_seq OWNED BY public.api_reportproduct.id;


--
-- Name: api_reportreview; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_reportreview (
    id bigint NOT NULL,
    report_type character varying(60),
    review_id bigint,
    user_id bigint
);


ALTER TABLE public.api_reportreview OWNER TO sellbuy;

--
-- Name: api_reportreview_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_reportreview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_reportreview_id_seq OWNER TO sellbuy;

--
-- Name: api_reportreview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_reportreview_id_seq OWNED BY public.api_reportreview.id;


--
-- Name: api_review; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_review (
    id bigint NOT NULL,
    message character varying(50),
    rating numeric(4,2),
    product_id bigint,
    user_id bigint
);


ALTER TABLE public.api_review OWNER TO sellbuy;

--
-- Name: api_review_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_review_id_seq OWNER TO sellbuy;

--
-- Name: api_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_review_id_seq OWNED BY public.api_review.id;


--
-- Name: api_room; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_room (
    id bigint NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(100) NOT NULL,
    slug character varying(50),
    created_by_id bigint,
    joined_by_id bigint,
    product_id bigint
);


ALTER TABLE public.api_room OWNER TO sellbuy;

--
-- Name: api_room_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_room_id_seq OWNER TO sellbuy;

--
-- Name: api_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_room_id_seq OWNED BY public.api_room.id;


--
-- Name: api_seller; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_seller (
    id bigint NOT NULL,
    name character varying(200) NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(20),
    seller_status character varying(60),
    receipt character varying(100),
    user_id bigint
);


ALTER TABLE public.api_seller OWNER TO sellbuy;

--
-- Name: api_seller_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_seller_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_seller_id_seq OWNER TO sellbuy;

--
-- Name: api_seller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_seller_id_seq OWNED BY public.api_seller.id;


--
-- Name: api_user; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    username character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254),
    phone character varying(20),
    phone2 character varying(20),
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    account_type character varying(60),
    language character varying(60),
    profile_image character varying(100),
    is_deleted boolean NOT NULL,
    app_score numeric(5,2),
    email_slug character varying(150) NOT NULL,
    is_seller boolean NOT NULL,
    location public.geometry(Point,4326),
    number_slug character varying(150) NOT NULL,
    twilio_sid character varying(150) NOT NULL,
    verify_location boolean NOT NULL,
    location_name character varying(150) NOT NULL,
    lat character varying(150),
    long character varying(150),
    activate boolean NOT NULL,
    bio character varying(300),
    city character varying(100),
    country character varying(100),
    cover_image character varying(100),
    dob date,
    gender character varying(10),
    state character varying(100),
    total_badges numeric(10,2),
    shop_name character varying(150) NOT NULL
);


ALTER TABLE public.api_user OWNER TO sellbuy;

--
-- Name: api_user_categories; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_user_categories (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.api_user_categories OWNER TO sellbuy;

--
-- Name: api_user_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_user_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_categories_id_seq OWNER TO sellbuy;

--
-- Name: api_user_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_user_categories_id_seq OWNED BY public.api_user_categories.id;


--
-- Name: api_user_followers; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_user_followers (
    id bigint NOT NULL,
    from_user_id bigint NOT NULL,
    to_user_id bigint NOT NULL
);


ALTER TABLE public.api_user_followers OWNER TO sellbuy;

--
-- Name: api_user_followers_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_user_followers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_followers_id_seq OWNER TO sellbuy;

--
-- Name: api_user_followers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_user_followers_id_seq OWNED BY public.api_user_followers.id;


--
-- Name: api_user_groups; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.api_user_groups OWNER TO sellbuy;

--
-- Name: api_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_groups_id_seq OWNER TO sellbuy;

--
-- Name: api_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_user_groups_id_seq OWNED BY public.api_user_groups.id;


--
-- Name: api_user_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_id_seq OWNER TO sellbuy;

--
-- Name: api_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_user_id_seq OWNED BY public.api_user.id;


--
-- Name: api_user_user_permissions; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.api_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.api_user_user_permissions OWNER TO sellbuy;

--
-- Name: api_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.api_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_user_user_permissions_id_seq OWNER TO sellbuy;

--
-- Name: api_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.api_user_user_permissions_id_seq OWNED BY public.api_user_user_permissions.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO sellbuy;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO sellbuy;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO sellbuy;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO sellbuy;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO sellbuy;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO sellbuy;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO sellbuy;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO sellbuy;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO sellbuy;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO sellbuy;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO sellbuy;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO sellbuy;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO sellbuy;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_rest_passwordreset_resetpasswordtoken; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.django_rest_passwordreset_resetpasswordtoken (
    created_at timestamp with time zone NOT NULL,
    key character varying(64) NOT NULL,
    ip_address inet,
    user_agent character varying(256) NOT NULL,
    user_id bigint NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.django_rest_passwordreset_resetpasswordtoken OWNER TO sellbuy;

--
-- Name: django_rest_passwordreset_resetpasswordtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.django_rest_passwordreset_resetpasswordtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_rest_passwordreset_resetpasswordtoken_id_seq OWNER TO sellbuy;

--
-- Name: django_rest_passwordreset_resetpasswordtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.django_rest_passwordreset_resetpasswordtoken_id_seq OWNED BY public.django_rest_passwordreset_resetpasswordtoken.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO sellbuy;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO sellbuy;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO sellbuy;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO sellbuy;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO sellbuy;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO sellbuy;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO sellbuy;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id bigint NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO sellbuy;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO sellbuy;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: sellbuy
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO sellbuy;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: sellbuy
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO sellbuy;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: sellbuy
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: api_activitylog id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_activitylog ALTER COLUMN id SET DEFAULT nextval('public.api_activitylog_id_seq'::regclass);


--
-- Name: api_badge id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_badge ALTER COLUMN id SET DEFAULT nextval('public.api_badge_id_seq'::regclass);


--
-- Name: api_bannerad id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_bannerad ALTER COLUMN id SET DEFAULT nextval('public.api_bannerad_id_seq'::regclass);


--
-- Name: api_brand id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_brand ALTER COLUMN id SET DEFAULT nextval('public.api_brand_id_seq'::regclass);


--
-- Name: api_buybadge id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_buybadge ALTER COLUMN id SET DEFAULT nextval('public.api_buybadge_id_seq'::regclass);


--
-- Name: api_category id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_category ALTER COLUMN id SET DEFAULT nextval('public.api_category_id_seq'::regclass);


--
-- Name: api_favouriteproduct id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_favouriteproduct ALTER COLUMN id SET DEFAULT nextval('public.api_favouriteproduct_id_seq'::regclass);


--
-- Name: api_generalactivitylog id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_generalactivitylog ALTER COLUMN id SET DEFAULT nextval('public.api_generalactivitylog_id_seq'::regclass);


--
-- Name: api_image id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_image ALTER COLUMN id SET DEFAULT nextval('public.api_image_id_seq'::regclass);


--
-- Name: api_makeoffer id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_makeoffer ALTER COLUMN id SET DEFAULT nextval('public.api_makeoffer_id_seq'::regclass);


--
-- Name: api_myaddressbook id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_myaddressbook ALTER COLUMN id SET DEFAULT nextval('public.api_myaddressbook_id_seq'::regclass);


--
-- Name: api_notification id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_notification ALTER COLUMN id SET DEFAULT nextval('public.api_notification_id_seq'::regclass);


--
-- Name: api_order id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_order ALTER COLUMN id SET DEFAULT nextval('public.api_order_id_seq'::regclass);


--
-- Name: api_order_products id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_order_products ALTER COLUMN id SET DEFAULT nextval('public.api_order_products_id_seq'::regclass);


--
-- Name: api_orderpayment id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_orderpayment ALTER COLUMN id SET DEFAULT nextval('public.api_orderpayment_id_seq'::regclass);


--
-- Name: api_otp id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_otp ALTER COLUMN id SET DEFAULT nextval('public.api_otp_id_seq'::regclass);


--
-- Name: api_product id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product ALTER COLUMN id SET DEFAULT nextval('public.api_product_id_seq'::regclass);


--
-- Name: api_product_categories id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product_categories ALTER COLUMN id SET DEFAULT nextval('public.api_product_categories_id_seq'::regclass);


--
-- Name: api_product_images id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product_images ALTER COLUMN id SET DEFAULT nextval('public.api_product_images_id_seq'::regclass);


--
-- Name: api_promotion id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_promotion ALTER COLUMN id SET DEFAULT nextval('public.api_promotion_id_seq'::regclass);


--
-- Name: api_reportproduct id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_reportproduct ALTER COLUMN id SET DEFAULT nextval('public.api_reportproduct_id_seq'::regclass);


--
-- Name: api_reportreview id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_reportreview ALTER COLUMN id SET DEFAULT nextval('public.api_reportreview_id_seq'::regclass);


--
-- Name: api_review id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_review ALTER COLUMN id SET DEFAULT nextval('public.api_review_id_seq'::regclass);


--
-- Name: api_room id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_room ALTER COLUMN id SET DEFAULT nextval('public.api_room_id_seq'::regclass);


--
-- Name: api_seller id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_seller ALTER COLUMN id SET DEFAULT nextval('public.api_seller_id_seq'::regclass);


--
-- Name: api_user id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user ALTER COLUMN id SET DEFAULT nextval('public.api_user_id_seq'::regclass);


--
-- Name: api_user_categories id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_categories ALTER COLUMN id SET DEFAULT nextval('public.api_user_categories_id_seq'::regclass);


--
-- Name: api_user_followers id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_followers ALTER COLUMN id SET DEFAULT nextval('public.api_user_followers_id_seq'::regclass);


--
-- Name: api_user_groups id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_groups ALTER COLUMN id SET DEFAULT nextval('public.api_user_groups_id_seq'::regclass);


--
-- Name: api_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.api_user_user_permissions_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_rest_passwordreset_resetpasswordtoken id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_rest_passwordreset_resetpasswordtoken ALTER COLUMN id SET DEFAULT nextval('public.django_rest_passwordreset_resetpasswordtoken_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	aqibijaz3@gmail.com	t	t	2
3	ahtashamfaheem8@gmail.com	t	t	4
4	winnerceo@gmail.com	t	t	6
5	stevie.tricks1@gmail.com	t	t	72
6	jacev021191@gmail.com	t	t	74
7	dsypalo54@gmail.com	t	t	77
8	mkolodiychik@gmail.com	t	t	78
9	lodovico.venturoli@gmail.com	t	t	79
10	jeamymax@gmail.com	t	t	80
11	mahdanks45@gmail.com	t	t	82
12	info@gccs.be	t	t	83
13	nunotech911@gmail.com	t	t	84
14	duiliogullo.92@gmail.com	t	t	85
15	semdejonge@gmail.com	t	t	86
16	edimodeborel@gmail.com	t	t	87
17	rami.kamar@gmail.com	t	t	90
18	adeelahmad31105@gmail.com	t	t	98
19	msarfaraz.meyo@gmail.com	t	t	99
20	musharaf42@gmail.com	t	t	100
21	mohd.reehaan010@gmail.com	f	t	113
22	alex.geeknation@gmail.com	t	t	114
23	lena.geeknation@gmail.com	t	t	115
24	buloy11@gmail.com	t	t	116
25	yangpspider@gmail.com	t	t	119
26	cryzsalex0129@gmail.com	t	t	120
27	maqsoodahmed15750@gmail.com	t	t	121
28	bcsm-f18-408@superior.edu.pk	t	t	122
29	yangpspider@hotmail.com	f	t	123
30	richard.geeknation@gmail.com	t	t	124
31	geeknation.yogeek@gmail.com	t	t	125
32	edwinkurian0915@gmail.com	t	t	126
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: api_activitylog; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_activitylog (id, message, activity_type, follow_url, created_at, activity_by_id, activity_for_id, product_id) FROM stdin;
\.


--
-- Data for Name: api_badge; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_badge (id, badges, price, created_at) FROM stdin;
\.


--
-- Data for Name: api_bannerad; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_bannerad (id, title, slug, active, show_prices, url, image, banner_status, thumbnail, description, date, "order", offer_id, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: api_brand; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_brand (id, name, icon, slug, created, category_id) FROM stdin;
5	Gam	icon_Ib80a8f.jpeg	gam	2023-05-18 18:28:15.762841+00	\N
8	Fit'Ff	images_4.jpg	fitff	2023-05-18 22:12:01.871866+00	38
9	Sulo	icon_XXfWQMM.jpeg	sulo	2023-05-18 22:13:08.782126+00	7
10	Lee	icon_lRRbZFw.jpeg	lee	2023-05-18 22:26:55.741716+00	6
11	Biba	icon_wwHSAE5.jpeg	biba	2023-05-18 22:27:18.134803+00	6
13	Zara	icon_SJk6Dhi.jpeg	zara	2023-05-18 22:28:42.946744+00	7
14	Castelle	icon_BitMpA2.jpeg	castelle	2023-05-18 22:30:43.608138+00	2
15	Patana	icon_mnAVvho.jpeg	patana	2023-05-18 22:31:03.117694+00	2
17	Furno	icon_NLZS5kw.jpeg	furno	2023-05-22 19:29:33.329285+00	2
18	Fgfdg	icon_69aycBI.jpeg	fgfdg	2023-05-25 23:36:40.319288+00	2
4	Fit'Ffffffffttghgfgg	download_12.jpg	fitffffffffttghgfgg	2023-05-18 18:24:25.240292+00	38
6	Bunna'Ss	icon_jTrrL3Y.jpeg	bunnass	2023-05-18 18:31:43.152007+00	3
2	Levvi'Sd	icon_NT2AxRv.jpeg	levvisd	2023-05-17 21:21:36.884728+00	\N
12	Pumag	icon_EoheGUZ.jpeg	pumag	2023-05-18 22:28:23.527574+00	7
\.


--
-- Data for Name: api_buybadge; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_buybadge (id, created_at, badges_id, user_id) FROM stdin;
\.


--
-- Data for Name: api_category; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_category (id, name, slug, created, icon, parent_id) FROM stdin;
2	Furniture	furniture	2022-12-13 19:47:45.800921+00	furniture.png	\N
3	Baby & Kids	baby-kids	2022-12-13 19:48:32.021749+00	baby.png	\N
4	Hot Items	hot-items	2022-12-13 19:49:21.380273+00	hotitem.png	\N
8	Health & Beauty	health-beauty	2022-12-13 19:53:30.664365+00	http-35.92.201.68-8000mediaimage_16.png	\N
12	Minecraft	minecraft	2022-12-13 19:56:02.487002+00	icon_qqdpFoM.jpeg	\N
13	Architect	architect	2022-12-13 19:56:35.299647+00	icon_mrAyvgF.jpeg	\N
10	Books, Music & Tickets	books-music-tickets	2022-12-13 19:54:41.809821+00	image_19.png	\N
9	Games, Hobbies & Craft	games-hobbies-craft	2022-12-13 19:54:07.704033+00	image_17.png	\N
7	Men'S Fashion	mens-fashion	2022-12-13 19:52:08.420272+00	men_fashion.png	\N
14	Iphone Plus +	iphone-plus	2022-12-23 21:23:40.56243+00	icon_8QII94z.jpeg	\N
16	Sports	sports	2023-03-21 23:46:00.000847+00	1679332707694.jpeg	\N
17	Food	food	2023-03-21 23:49:01.688482+00	xiaomi-redmi-note-11-pakistan-priceoye-jek47_JSmrHi4.jpg	\N
19	Fitness	fitness	2023-03-22 17:05:51.278529+00	icon_zjIkWwe.jpeg	\N
25	Entertainment	entertainment	2023-03-22 17:24:03.172493+00	1679332707694_EaXtNvZ.jpeg	\N
34	Iphone	iphone	2023-04-10 21:42:39.343455+00	icon_QKGdtsF.jpeg	14
6	Women'S Fashion	womens-fashion-gisrc0	2022-12-13 19:51:08.768414+00	women_fashion.png	\N
38	Men'S	mens	2023-04-26 19:35:58.827737+00	icon_oJWO5UX.jpeg	\N
\.


--
-- Data for Name: api_favouriteproduct; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_favouriteproduct (id, product_id, user_id) FROM stdin;
141	38	115
142	46	115
143	47	118
62	10	5
144	46	118
145	45	118
146	44	118
147	43	118
68	21	64
70	20	64
75	22	64
76	2	77
78	15	5
79	5	\N
159	46	99
160	47	99
86	31	92
87	30	92
161	44	99
89	26	92
162	43	99
91	24	92
92	34	94
93	32	94
37	12	15
95	36	92
96	29	92
40	18	2
97	22	92
164	45	99
99	18	7
100	21	7
45	16	5
166	42	99
49	21	5
167	48	99
53	21	2
169	44	93
115	21	102
116	20	102
118	18	114
182	47	98
183	51	98
184	50	98
185	49	98
186	48	98
187	42	98
188	43	98
189	44	98
190	45	98
191	46	98
192	50	102
133	40	98
193	58	93
194	57	93
195	56	93
196	59	93
202	60	126
\.


--
-- Data for Name: api_generalactivitylog; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_generalactivitylog (id, message, created_at, user_id) FROM stdin;
1	Login Successfully	2023-04-10 21:20:18.838647+00	102
2	Login Successfully	2023-04-10 21:37:16.412109+00	94
3	Login Successfully	2023-04-10 21:38:29.139473+00	102
4	Login Successfully	2023-04-10 21:40:38.480939+00	94
5	Login Successfully	2023-04-10 21:44:32.022464+00	102
6	Login Successfully	2023-04-10 21:47:08.352173+00	102
7	Login Successfully	2023-04-10 21:47:16.4423+00	94
8	Login Successfully	2023-04-10 21:47:56.52877+00	102
9	Login Successfully	2023-04-10 21:49:15.252096+00	102
10	Login Successfully	2023-04-10 22:14:27.001627+00	92
11	Created Product Item	2023-04-10 23:19:06.594072+00	98
12	Created Product Item	2023-04-10 23:21:42.229215+00	98
13	Created Product Item	2023-04-10 23:40:35.246558+00	98
14	Login Successfully	2023-04-11 02:40:25.034698+00	7
15	Login Successfully	2023-04-11 02:43:55.689869+00	7
16	Login Successfully	2023-04-11 02:48:49.464642+00	7
17	Login Successfully	2023-04-11 02:59:39.340716+00	7
18	Login Successfully	2023-04-11 03:03:15.550539+00	7
19	Login Successfully	2023-04-11 03:03:51.165882+00	7
20	Login Successfully	2023-04-11 07:02:22.369476+00	7
21	Login Successfully	2023-04-11 07:25:44.842546+00	7
22	Login Successfully	2023-04-11 09:43:57.208664+00	101
23	Login Successfully	2023-04-11 16:22:28.999012+00	92
24	Created Product Item	2023-04-11 17:09:28.561794+00	98
25	Login Successfully	2023-04-11 18:04:33.119562+00	92
26	Login Successfully	2023-04-11 19:26:02.941631+00	92
27	Login Successfully	2023-04-11 19:59:44.2177+00	94
28	Changed Profile Picture	2023-04-11 20:11:01.468084+00	92
29	Login Successfully	2023-04-11 20:16:32.867194+00	92
30	Changed Profile Picture	2023-04-11 20:18:04.469634+00	92
31	Changed Profile Picture	2023-04-11 20:20:38.090901+00	92
32	Login Successfully	2023-04-12 01:27:40.471674+00	7
33	Login Successfully	2023-04-12 01:28:35.827338+00	101
34	Login Successfully	2023-04-12 01:32:55.129511+00	7
35	Login Successfully	2023-04-12 01:33:14.993343+00	101
36	Created Product Item	2023-04-12 01:36:00.174699+00	101
37	Login Successfully	2023-04-12 01:42:43.153713+00	7
38	Login Successfully	2023-04-12 01:44:04.47189+00	101
39	Login Successfully	2023-04-12 01:49:58.237282+00	117
40	Login Successfully	2023-04-12 02:30:44.93453+00	7
41	Login Successfully	2023-04-12 02:31:17.278468+00	7
42	Login Successfully	2023-04-12 02:39:38.787532+00	118
43	Login Successfully	2023-04-12 02:40:24.355852+00	118
44	Login Successfully	2023-04-12 02:40:43.946993+00	118
45	Login Successfully	2023-04-12 04:02:33.069136+00	7
46	Created Product Item	2023-04-12 05:20:46.047653+00	115
47	Login Successfully	2023-04-12 08:09:35.525204+00	7
48	Login Successfully	2023-04-12 20:04:52.5999+00	102
49	Login Successfully	2023-04-12 20:42:35.581176+00	102
50	Login Successfully	2023-04-14 04:08:44.186846+00	7
51	Login Successfully	2023-04-14 04:11:15.220837+00	7
52	Login Successfully	2023-04-18 06:35:24.487583+00	101
53	Changed Profile Picture	2023-04-18 07:35:03.007602+00	101
54	Login Successfully	2023-04-18 07:38:51.908271+00	101
55	Login Successfully	2023-04-19 08:07:09.257781+00	7
56	Login Successfully	2023-04-19 08:07:44.169338+00	101
57	Login Successfully	2023-04-19 09:51:37.171399+00	101
58	Login Successfully	2023-04-20 01:11:47.951418+00	101
59	Login Successfully	2023-04-20 01:48:27.612821+00	101
60	Login Successfully	2023-04-20 03:26:32.857351+00	7
61	Login Successfully	2023-04-20 19:30:39.817017+00	93
62	Login Successfully	2023-04-21 18:45:36.125271+00	93
63	Login Successfully	2023-04-21 18:45:36.396359+00	93
64	Login Successfully	2023-04-21 21:16:45.373136+00	92
65	Login Successfully	2023-04-24 01:03:48.032865+00	7
66	Login Successfully	2023-04-24 01:05:00.671676+00	101
67	Login Successfully	2023-04-24 01:24:03.976025+00	101
68	Login Successfully	2023-04-24 03:07:35.79812+00	7
69	Login Successfully	2023-04-24 05:42:12.647721+00	101
70	Login Successfully	2023-04-24 06:20:22.912511+00	101
71	Login Successfully	2023-04-25 07:56:01.519376+00	101
72	Login Successfully	2023-04-26 01:21:30.660571+00	7
73	Login Successfully	2023-04-26 06:44:57.519011+00	7
74	Login Successfully	2023-04-26 07:58:52.000284+00	101
75	Login Successfully	2023-04-26 17:26:14.584858+00	92
76	Login Successfully	2023-04-26 17:35:14.659222+00	7
77	Login Successfully	2023-04-26 18:13:41.468964+00	93
78	Login Successfully	2023-04-26 18:52:48.394796+00	7
79	Login Successfully	2023-04-26 18:54:51.472347+00	7
80	Login Successfully	2023-04-26 19:19:56.509624+00	92
81	Login Successfully	2023-04-26 19:20:44.824727+00	7
82	Login Successfully	2023-04-26 19:21:16.914627+00	92
83	Login Successfully	2023-04-26 20:07:30.758321+00	92
84	Login Successfully	2023-04-26 20:38:06.216982+00	93
85	Login Successfully	2023-04-26 20:38:06.312366+00	93
86	Login Successfully	2023-04-26 21:19:24.891558+00	92
87	Changed Profile Picture	2023-04-26 21:31:38.859821+00	99
88	Login Successfully	2023-04-26 23:03:25.953846+00	102
89	Login Successfully	2023-04-27 11:46:51.903836+00	7
90	Created Product Item	2023-04-27 23:02:03.578431+00	98
91	Created Product Item	2023-04-27 23:03:00.438057+00	98
92	Created Product Item	2023-04-27 23:04:19.83164+00	98
93	Created Product Item	2023-04-27 23:47:00.436176+00	98
94	Created Product Item	2023-04-27 23:47:28.008193+00	98
95	Created Product Item	2023-04-27 23:47:56.572984+00	98
96	Created Product Item	2023-04-27 23:48:32.07631+00	98
97	Login Successfully	2023-04-28 05:05:09.604375+00	101
98	Login Successfully	2023-04-28 06:11:34.564175+00	7
99	Changed Profile Picture	2023-04-28 06:15:43.191459+00	7
100	Login Successfully	2023-04-28 06:16:56.107663+00	101
101	Login Successfully	2023-04-28 06:17:13.85289+00	7
102	Changed Profile Picture	2023-04-28 06:17:38.360421+00	7
103	Login Successfully	2023-04-28 06:17:59.350389+00	101
104	Created Product Item	2023-04-28 20:55:39.48942+00	98
105	Login Successfully	2023-04-28 21:44:03.688177+00	92
106	Login Successfully	2023-04-28 22:07:30.077354+00	92
107	Login Successfully	2023-04-30 12:28:55.372825+00	101
108	Login Successfully	2023-05-02 00:52:36.004214+00	7
109	Login Successfully	2023-05-02 06:51:23.281324+00	7
110	Login Successfully	2023-05-03 03:48:41.573106+00	7
111	Login Successfully	2023-05-03 05:11:56.698555+00	7
112	Login Successfully	2023-05-03 07:58:54.05521+00	101
113	Login Successfully	2023-05-03 07:58:54.463563+00	101
114	Login Successfully	2023-05-03 08:34:14.148192+00	7
115	Login Successfully	2023-05-04 00:51:45.236811+00	7
116	Login Successfully	2023-05-04 01:26:05.035149+00	101
117	Login Successfully	2023-05-04 01:32:20.428655+00	7
118	Login Successfully	2023-05-04 01:39:22.919444+00	101
119	Login Successfully	2023-05-05 10:08:10.966582+00	102
120	Login Successfully	2023-05-05 10:08:10.982644+00	102
121	Login Successfully	2023-05-05 11:12:13.614633+00	102
122	Login Successfully	2023-05-05 20:51:44.850452+00	93
123	Login Successfully	2023-05-05 21:01:23.555111+00	92
124	Login Successfully	2023-05-05 21:52:36.860191+00	93
125	Created Product Item	2023-05-07 19:18:26.037045+00	102
126	Created Product Item	2023-05-08 16:36:14.024923+00	99
127	Login Successfully	2023-05-08 19:05:37.885872+00	102
128	Login Successfully	2023-05-08 19:54:33.209048+00	92
129	Login Successfully	2023-05-09 02:15:17.794467+00	92
130	Login Successfully	2023-05-09 02:15:30.868847+00	102
131	Created Product Item	2023-05-10 21:14:33.458983+00	99
132	Login Successfully	2023-05-11 00:22:38.405451+00	93
133	Login Successfully	2023-05-11 01:06:20.864378+00	102
134	Login Successfully	2023-05-11 01:42:06.237608+00	102
135	Login Successfully	2023-05-12 05:11:32.570253+00	101
136	Login Successfully	2023-05-12 09:49:09.9364+00	101
137	Login Successfully	2023-05-13 09:57:21.187485+00	7
138	Login Successfully	2023-05-15 01:02:07.118401+00	101
139	Created Product Item	2023-05-15 01:02:43.090952+00	101
140	Login Successfully	2023-05-16 02:14:23.666282+00	101
141	Created Product Item	2023-05-16 02:51:17.921812+00	101
142	Login Successfully	2023-05-16 03:05:50.568006+00	101
143	Login Successfully	2023-05-16 03:06:09.91345+00	101
144	Login Successfully	2023-05-16 03:08:19.251476+00	101
145	Login Successfully	2023-05-16 06:48:35.580343+00	101
146	Login Successfully	2023-05-16 22:59:19.959008+00	92
147	Login Successfully	2023-05-16 23:06:50.168249+00	92
148	Login Successfully	2023-05-16 23:10:30.461259+00	92
149	Login Successfully	2023-05-16 23:10:30.831077+00	92
150	Login Successfully	2023-05-17 01:00:06.760295+00	92
151	Login Successfully	2023-05-17 09:03:13.066318+00	101
152	Login Successfully	2023-05-17 21:22:53.449584+00	93
153	Created Product Item	2023-05-17 21:23:43.863349+00	93
154	Created Product Item	2023-05-17 21:25:26.44563+00	93
155	Created Product Item	2023-05-17 21:29:42.556638+00	98
156	Login Successfully	2023-05-17 21:38:27.754909+00	102
157	Login Successfully	2023-05-17 21:38:50.728943+00	93
158	Login Successfully	2023-05-17 21:39:33.398856+00	102
159	Created Product Item	2023-05-17 21:40:16.021052+00	98
160	Created Product Item	2023-05-17 21:44:04.662458+00	98
161	Created Product Item	2023-05-17 21:47:01.012691+00	98
162	Created Product Item	2023-05-17 22:30:33.384141+00	98
163	Login Successfully	2023-05-18 07:28:59.293985+00	101
164	Login Successfully	2023-05-18 16:59:17.429963+00	92
165	Login Successfully	2023-05-18 17:35:38.086293+00	92
166	Login Successfully	2023-05-18 18:49:23.513257+00	92
167	Login Successfully	2023-05-18 21:44:49.898056+00	92
168	Login Successfully	2023-05-18 21:57:35.80376+00	102
169	Login Successfully	2023-05-18 21:57:36.04958+00	102
170	Login Successfully	2023-05-18 21:58:13.246897+00	92
171	Login Successfully	2023-05-18 22:08:19.492712+00	92
172	Login Successfully	2023-05-18 22:24:17.132942+00	92
173	Created Product Item	2023-05-18 22:46:44.168595+00	98
174	Created Product Item	2023-05-18 22:50:50.446682+00	98
175	Created Product Item	2023-05-18 23:01:53.617029+00	98
176	Created Product Item	2023-05-18 23:03:50.886235+00	98
177	Login Successfully	2023-05-19 00:33:59.889144+00	101
178	Login Successfully	2023-05-19 08:49:00.65454+00	101
179	Login Successfully	2023-05-19 08:56:18.341262+00	101
180	Login Successfully	2023-05-20 02:38:37.005868+00	7
181	Login Successfully	2023-05-20 02:42:40.623099+00	101
182	Login Successfully	2023-05-20 02:51:24.984251+00	101
183	Login Successfully	2023-05-22 00:54:07.989279+00	101
184	Login Successfully	2023-05-22 01:01:11.214005+00	101
185	Created Product Item	2023-05-22 15:50:56.912743+00	102
186	Login Successfully	2023-05-22 16:23:40.461469+00	92
187	Created Product Item	2023-05-22 17:07:22.380656+00	99
188	Created Product Item	2023-05-22 17:11:55.848248+00	99
189	Created Product Item	2023-05-22 17:17:31.40524+00	99
190	Login Successfully	2023-05-22 17:28:24.804919+00	92
191	Login Successfully	2023-05-23 06:40:38.435641+00	101
192	Login Successfully	2023-05-25 23:23:38.548523+00	92
193	Login Successfully	2023-05-26 02:42:42.302948+00	7
194	Login Successfully	2023-05-26 03:17:50.938337+00	101
195	Login Successfully	2023-05-26 08:40:18.662433+00	7
196	Login Successfully	2023-05-26 08:55:36.711777+00	7
\.


--
-- Data for Name: api_image; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_image (id, image) FROM stdin;
1	products/chair.jpg
2	products/photo-1505740420928-5e560c06d30e.jpeg
3	products/collection-beauty-products-with-copy-space_23-2148620110.webp
4	products/61-PblYntsL._AC_SL1500_.jpg
5	products/61-PblYntsL._AC_SL1500__0cC7RBj.jpg
6	products/hot.jpg
7	products/sili.jpg
8	products/images.jpg
9	products/g.jpg
10	products/images_1.jpg
11	products/bing.jpg
12	products/bing_iSFzNAi.jpg
13	products/bing_2N2y5UE.jpg
14	products/bing_dddqXoE.jpg
15	products/bing_NuNc6u3.jpg
16	products/bing_trxiZdt.jpg
17	products/bing_NnVOTRZ.jpg
18	products/bing_7gZaodf.jpg
19	products/bing_m6mNWID.jpg
20	products/plmb.jpg
21	products/download.jpg
22	products/gardening-reduces-stress-planting.jpg
23	products/Electrician-Measuring-Voltage.jpg
24	products/gardening-reduces-stress-planting_QZjZhG4.jpg
25	products/wp9465229-black-hole-in-space-wallpapers.jpg
26	products/chair2.jpg
27	products/chair3.jpg
28	products/photo_2023-01-13_18-19-24.jpg
29	products/Aibo-zoom.jpg
30	products/iphone.jpeg
31	products/iphone_2.png
32	products/iphone_FCCpEUG.jpeg
33	products/iphone_q0akBUH.jpeg
34	products/download_3.png
35	products/account-profile-user-icon--icon-search-engine-10.png
36	products/download_3_iY4jErH.png
37	products/xiaomi-redmi-note-11-pakistan-priceoye-jek47.jpg
38	products/download_1.jpg
39	products/1679332707694.jpeg
40	products/download_1_EdgbSIO.jpg
41	products/iphone_If5cUVJ.jpeg
42	products/bc2bad088c7bc9eac8607526f14ac098.jpg
43	products/iphone_A7h4YHq.jpeg
44	products/iphone_2_30MbugQ.png
45	products/images.png
46	products/download_2.jpg
47	products/download_1_TxFVGWA.jpg
48	products/download_1.jfif
49	products/xiaomi-redmi-note-11-pakistan-priceoye-jek47_V6WJoEr.jpg
50	products/51eFathAaoL.jpg
51	products/344f1f911aadae69243d6875aa06f61e.jpg
52	products/v8bjp_512.jpg
53	products/download.jfif
54	products/adeel2.jpg
55	products/adeel3.jpg
56	products/download_1_GBr3hwZ.jpg
57	products/download_1_7YP4a9X.jpg
58	products/download_9TB7hnh.jpg
59	products/download_1_DTZwYKd.jpg
60	products/download_BE9w19Z.jpg
61	products/Screenshot_72.png
62	products/Screenshot_11.png
63	products/download_2_eOmM9yb.jpg
64	products/ikea_small_clock.jpeg
65	products/q.jpg
66	products/q_1eQKmf2.jpg
67	products/1.png
68	products/download_4.jpg
69	products/images_1_c0QbZBb.jpg
70	products/images_XKsn1yZ.jpg
71	products/download_6.jpg
72	products/download_7.jpg
73	products/download_8.jpg
74	products/images_2.jpg
75	products/106880066-1620413243866PetrusWineBottle-jpg.jpg
76	products/chatter-3.jpg
77	products/philippines.png
78	products/philippines_n89Fc4L.png
79	products/philippines_CjPsHzY.png
80	products/philippines_yIi56Nz.png
81	products/philippines_u0Mn5qa.png
82	products/philippines_aqBrRTc.png
83	products/philippines_5ZaO7nf.png
84	products/philippines_Mthap9r.png
85	products/philippines_xtiRqpl.png
86	products/philippines_5uahSFi.png
87	products/philippines_tfjMrIR.png
88	products/philippines_D5jFMZW.png
89	products/images_3.jpg
90	products/images_3_t6V0F2D.jpg
91	products/purple.jpg
92	products/bed.jpeg
93	products/download_9.jpg
94	products/img030_1.jpg
95	products/download_10.jpg
96	products/106880066-1620413243866PetrusWineBottle-jpg_rpiEraz.jpg
97	products/mount-everest-6000x3375-11019.jpg
98	products/mount-everest-6000x3375-11019_vRWKT2m.jpg
99	products/indonesian-rupiah.png
100	products/images_4.jpg
101	products/images_4_fTR23dA.jpg
102	products/download_11.jpg
103	products/download_11_PynrW1G.jpg
104	products/0025425_SSDSDENTS_3c63c.jpeg
105	products/images_5.jpg
106	products/images_5_ufwBN9J.jpg
107	products/logo.png
108	products/Capture.PNG
109	products/download_12.jpg
110	products/download_12_DrX9Rul.jpg
111	products/download_12_WhDpqaS.jpg
112	products/download_12_k51WKtF.jpg
\.


--
-- Data for Name: api_makeoffer; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_makeoffer (id, make_offer_status, bid_amount, created_at, product_id, user_id) FROM stdin;
1	PN	10	2022-12-14 06:48:49.834326+00	1	5
2	PN	12	2022-12-28 05:38:47.638952+00	21	64
3	PN	15	2022-12-28 05:39:48.203021+00	21	64
4	PN	222	2022-12-28 05:41:23.514257+00	21	64
6	PN	25	2023-01-10 19:36:09.227304+00	20	2
5	CA	2400	2022-12-28 05:55:05.404431+00	21	64
7	PN	3500	2023-03-01 04:25:01.061204+00	20	75
8	PN	12	2023-03-28 18:57:52.361631+00	\N	\N
9	PN	123	2023-03-29 18:11:28.588857+00	\N	\N
10	PN	3000	2023-03-29 19:37:09.485138+00	\N	92
11	CA	111	2023-03-30 23:33:05.819962+00	39	94
12	CA	111	2023-03-30 23:34:30.921533+00	39	94
13	AP	111	2023-03-30 23:35:18.913486+00	39	94
14	AP	111	2023-03-30 23:37:40.447362+00	38	94
15	PN	5	2023-04-11 08:56:21.44685+00	15	114
16	PN	50	2023-04-12 03:33:04.090953+00	39	118
17	PN	300	2023-04-12 03:36:11.40573+00	20	118
18	PN	20000	2023-04-12 05:14:49.913533+00	40	115
19	PN	40	2023-04-28 21:11:34.783903+00	48	98
20	PN	20	2023-05-11 01:11:02.902551+00	57	93
21	PN	21	2023-05-16 05:41:19.927958+00	58	101
22	PN	8	2023-05-16 06:01:34.925848+00	52	101
23	PN	9	2023-05-16 06:02:13.80381+00	52	101
\.


--
-- Data for Name: api_myaddressbook; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_myaddressbook (id, address, phone_number, created_at, user_id) FROM stdin;
1	ahtashamfaheem8@gmail.com	124323432	2023-03-28 22:37:47.132951+00	93
2	@gmail,com	234235	2023-03-28 22:40:00.142455+00	93
3	ahtashamfaheem8@gmail.com		2023-03-28 22:57:32.522559+00	93
4	113123		2023-03-28 22:59:44.216874+00	93
5	ahtashamfaheem8@gmail.com	0320233322	2023-03-29 00:16:27.129459+00	93
\.


--
-- Data for Name: api_notification; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_notification (id, url, message, is_seen, date, receiver_id, sender_id) FROM stdin;
1	\N	Admin approved your seller request 	f	2022-12-14 18:56:27.687581+00	5	7
2	\N	Ahtasham Faheem made your product Chair favourite 	f	2022-12-14 19:50:43.828478+00	2	4
3	\N	Admin approved your seller request 	f	2022-12-14 19:51:09.976008+00	8	7
4	\N	Zubair Muhammad made your product Make Up Kit favourite 	f	2022-12-19 02:35:08.808392+00	8	5
5	\N	Zubair Muhammad made your product Chair favourite 	f	2022-12-19 05:04:55.994561+00	2	5
6	\N	Ahtasham Faheem made your product Make Up Kit favourite 	f	2022-12-19 17:17:41.989493+00	8	4
7	\N	Ahtasham Faheem made your product Head Phone favourite 	f	2022-12-19 17:33:34.77116+00	8	4
8	\N	Ahtasham Faheem made your product Make Up Kit favourite 	f	2022-12-19 17:34:42.255643+00	8	4
9	\N	Ahtasham Faheem made your product Make Up Kit favourite 	f	2022-12-19 17:35:32.461469+00	8	4
10	\N	Ahtasham Faheem made your product Make Up Kit favourite 	f	2022-12-19 18:43:31.966644+00	8	4
11	\N	Ahtasham Faheem made your product Make Up Kit favourite 	f	2022-12-19 20:30:00.720556+00	8	4
12	\N	Ahtasham Faheem made your product Make Up Kit favourite 	f	2022-12-19 20:32:32.858769+00	8	4
13	\N	Ahtasham Faheem made your product Make Up Kit favourite 	f	2022-12-19 20:34:07.979922+00	8	4
14	\N	Ahtasham Faheem made your product Make Up Kit favourite 	f	2022-12-19 20:34:39.895645+00	8	4
15	\N	Ahtasham Faheem made your product Make Up Kit favourite 	f	2022-12-19 20:35:13.098922+00	8	4
16	\N	Ahtasham Faheem made your product Head Phone favourite 	f	2022-12-19 20:35:56.412967+00	8	4
17	\N	Ahtasham Faheem made your product Head Phone favourite 	f	2022-12-19 21:00:01.089543+00	8	4
18	\N	Ahtasham Faheem made your product Head Phone favourite 	f	2022-12-19 21:17:05.887777+00	8	4
19	\N	Ahtasham Faheem made your product Make Up Kit favourite 	f	2022-12-19 21:19:45.826542+00	8	4
20	\N	Ahtasham Faheem made your product Make Up Kit favourite 	f	2022-12-19 21:22:47.454173+00	8	4
21	\N	Ahtasham Faheem made your product Head Phone favourite 	f	2022-12-19 21:59:08.89317+00	8	4
22	\N	Ahtasham Faheem made your product Head Phone favourite 	f	2022-12-19 22:00:45.383252+00	8	4
23	\N	Ahtasham Faheem made your product Head Phone favourite 	f	2022-12-19 22:01:19.660531+00	8	4
24	\N	Ahtasham Faheem made your product Head Phone favourite 	f	2022-12-19 22:05:06.523152+00	8	4
25	\N	Ahtasham Faheem made your product Make Up Kit favourite 	f	2022-12-19 22:06:29.068648+00	8	4
26	\N	NA NA made your product Make Up Kit favourite 	f	2022-12-19 22:09:29.539386+00	8	15
27	\N	NA NA made your product Make Up Kit favourite 	f	2022-12-19 22:09:35.664354+00	8	15
28	\N	NA NA made your product Make Up Kit favourite 	f	2022-12-19 22:14:58.186284+00	8	15
29	\N	NA NA made your product Head Phone favourite 	f	2022-12-19 22:23:53.299695+00	8	15
30	\N	NA NA made your product Make Up Kit favourite 	f	2022-12-19 22:26:45.583682+00	8	15
31	\N	NA NA made your product Make Up Kit favourite 	f	2022-12-19 22:26:50.383051+00	8	15
32	\N	NA NA made your product Make Up Kit favourite 	f	2022-12-19 22:28:18.397821+00	8	15
33	\N	Zubair Muhammad made your product Make Up Kit favourite 	f	2022-12-20 03:17:46.988914+00	8	5
34	\N	Zubair Muhammad made your product Nintendo Switch favourite 	f	2022-12-20 03:58:17.075743+00	5	5
35	\N	Zubair Muhammad made your product Head Phone favourite 	f	2022-12-20 03:58:19.986845+00	8	5
36	\N	Zubair Muhammad made your product Nintendo Switch favourite 	f	2022-12-20 03:58:26.387022+00	5	5
37	\N	Zubair Muhammad made your product 90s cap favourite 	f	2022-12-21 08:55:02.667815+00	5	5
38	\N	NA NA made your product 12345678901234567890123456789012345678901234567890 favourite 	f	2022-12-21 19:27:06.223875+00	5	15
39	\N	NA NA made your product 12345678901235678890123456789901234567890 favourite 	f	2022-12-21 19:27:08.743844+00	5	15
40	\N	Ahtasham Faheem made your product fresh cabbage favourite 	f	2022-12-22 20:05:28.535876+00	5	4
41	\N	Ahtasham Faheem made your product fresh cabbage favourite 	f	2022-12-22 20:06:09.013686+00	5	4
42	\N	Aqib Ijaz Muhammad Ijaz made your product fresh cabbage favourite 	f	2022-12-22 20:54:13.882115+00	5	2
43	\N	Admin approved your seller request 	f	2022-12-23 19:57:47.049545+00	4	7
44	\N	Admin approved your seller request 	f	2022-12-23 19:57:49.853573+00	2	7
45	\N	Ahtasham Faheem made your product Buzzing express favourite 	f	2022-12-23 20:19:24.640241+00	5	4
46	\N	Ahtasham Faheem made your product Buzzing express favourite 	f	2022-12-23 20:21:13.745229+00	5	4
47	\N	Ahtasham Faheem made your product Bike favourite 	f	2022-12-23 22:14:28.77472+00	4	4
48	\N	Ahtasham Faheem made your product Bike favourite 	f	2022-12-23 22:15:18.081646+00	4	4
49	\N	Admin approved your seller request 	f	2022-12-24 23:07:10.583896+00	64	7
50	\N	Zubair Muhammad made your product Gardening needs favourite 	f	2022-12-26 13:26:35.491603+00	5	5
51	\N	Zubair Muhammad made your product Lancashire Chair favourite 	f	2022-12-26 17:56:39.534467+00	2	5
52	\N	Zubair Muhammad made your product Bike favourite 	f	2022-12-30 21:07:20.488726+00	4	5
53	\N	Zubair Muhammad made your product Lancashire Chair favourite 	f	2022-12-30 21:10:25.418841+00	2	5
54	\N	Zubair Muhammad made your product Lancashire Chair favourite 	f	2022-12-30 21:21:27.023096+00	2	5
55	\N	Ahtasham Faheem made your product Bike favourite 	f	2023-01-06 21:10:07.367695+00	4	4
56	\N	Ahtasham Faheem made your product Lancashire Chair favourite 	f	2023-01-06 21:16:31.031784+00	2	4
57	\N	Ahtasham Faheem made your product Buzzing express favourite 	f	2023-01-06 22:02:30.561549+00	5	4
58	\N	Aqib Ijaz Muhammad Ijaz made your product Lancashire Chair favourite 	f	2023-01-10 18:43:11.673464+00	2	2
59	\N	Ahtasham Faheem made your product Lancashire Chair favourite 	f	2023-01-11 18:51:53.484401+00	2	4
60	\N	Ahtasham Faheem made your product Lancashire Chair favourite 	f	2023-01-11 18:55:16.681345+00	2	4
61	\N	Ahtasham Faheem made your product CHIPPENDALE IN SHIPSTON favourite 	f	2023-01-11 18:56:44.036926+00	64	4
62	\N	Ahtasham Faheem made your product CHIPPENDALE IN SHIPSTON favourite 	f	2023-01-11 18:58:33.931786+00	64	4
63	\N	Ahtasham Faheem made your product CHIPPENDALE IN SHIPSTON favourite 	f	2023-01-11 18:58:44.268285+00	64	4
64	\N	Ahtasham Faheem made your product CHIPPENDALE IN SHIPSTON favourite 	f	2023-01-11 19:01:23.86248+00	64	4
65	\N	Ahtasham Faheem made your product Lancashire Chair favourite 	f	2023-01-12 17:17:08.245099+00	2	4
66	\N	Ahtasham Faheem made your product Bike favourite 	f	2023-01-12 17:24:57.462093+00	4	4
67	\N	Zubair Muhammad made your product 90s cap favourite 	f	2023-01-16 23:54:35.651651+00	5	5
68	\N	Test User made your product Ai dog favourite 	f	2023-02-09 18:43:38.521886+00	5	64
69	\N	Test User made your product Ai dog favourite 	f	2023-02-15 23:01:01.463908+00	5	64
70	\N	Test User made your product Ai dog favourite 	f	2023-02-15 23:02:20.589052+00	5	64
71	\N	Test User made your product Ai dog favourite 	f	2023-02-15 23:05:15.777303+00	5	64
72	\N	Test User made your product Ai dog favourite 	f	2023-02-15 23:05:50.299825+00	5	64
73	\N	Test User made your product Lancashire Chair favourite 	f	2023-02-17 11:55:21.812688+00	2	64
74	\N	Test User made your product Ai dog favourite 	f	2023-02-17 14:01:42.805177+00	5	64
75	\N	Test User made your product CHIPPENDALE IN SHIPSTON favourite 	f	2023-02-17 20:05:20.106512+00	64	64
76	\N	Test User made your product Some guys guitar favourite 	f	2023-02-17 20:08:07.60083+00	5	64
77	\N	Test User made your product Some guys guitar favourite 	f	2023-02-17 20:08:18.245446+00	5	64
78	\N	Test User made your product Some guys guitar favourite 	f	2023-02-21 21:00:01.931328+00	5	64
79	\N	Test User made your product Some guys guitar favourite 	f	2023-02-21 21:11:07.165667+00	5	64
80	\N	Test User made your product Some guys guitar favourite 	f	2023-02-21 21:12:37.581592+00	5	64
81	\N	Дмитрий С made your product Head Phone favourite 	f	2023-03-01 18:11:17.561282+00	8	77
82	\N	SellBuy Admin made your product Wood werx favourite 	f	2023-03-07 16:40:06.613165+00	5	7
83	\N	Zubair Muhammad made your product Wood werx favourite 	f	2023-03-07 16:41:31.022007+00	5	5
84	\N	sarfraz31105  made your product Nintendo Switch favourite 	f	2023-03-28 18:41:51.75594+00	5	92
85	\N	sarfraz31105  made your product Android Charge2 favourite 	f	2023-03-28 19:23:45.262765+00	\N	92
86	\N	sarfraz31105  made your product Ai dog favourite 	f	2023-03-28 19:24:58.698869+00	5	92
87	\N	sarfraz31105  made your product AirPods favourite 	f	2023-03-28 21:50:36.602565+00	92	92
88	\N	sarfraz31105  made your product head phone favourite 	f	2023-03-28 22:36:11.721331+00	92	92
89	\N	sarfraz31105  made your product new favourite 	f	2023-03-28 22:36:56.137476+00	92	92
90	\N	sarfraz31105  made your product head phone favourite 	f	2023-03-28 22:49:01.771166+00	92	92
91	\N	sarfraz31105  made your product AirPods favourite 	f	2023-03-28 22:57:09.803359+00	92	92
92	\N	sarfraz31105  made your product mobile phone favourite 	f	2023-03-28 22:57:14.066696+00	92	92
93	\N	sarfraz31105  made your product rty favourite 	f	2023-03-28 22:57:19.527638+00	92	92
94	\N	sarfraz31105  made your product Android Charge3 favourite 	f	2023-03-28 22:58:18.047134+00	92	92
95	\N	sarfraz31105  made your product Android Charge2 favourite 	f	2023-03-28 22:58:22.477011+00	\N	92
96	\N	sarfraz31105  made your product Android Charge favourite 	f	2023-03-28 22:58:28.267215+00	\N	92
97	\N	aqibijaz3+admin  made your product Data Cables favourite 	f	2023-03-29 19:38:08.224581+00	92	94
98	\N	aqibijaz3+admin  made your product Head Phone 4 favourite 	f	2023-03-29 19:42:13.902096+00	92	94
99	\N	Sarfraz Meyo made your product mobile phone favourite 	f	2023-03-30 20:39:35.491204+00	92	92
100	\N	Sarfraz Meyo made your product Iphone 13 favourite 	f	2023-03-30 21:54:33.9116+00	94	92
101	\N	Sarfraz Meyo made your product head phone favourite 	f	2023-03-30 21:59:07.271513+00	92	92
102	\N	Sarfraz Meyo made your product Some guys guitar favourite 	f	2023-03-31 20:10:10.656597+00	5	92
103	\N	SellBuy Admin made your product joy favourite 	f	2023-04-04 10:52:56.401775+00	92	7
104	\N	SellBuy Admin made your product fresh cabbage favourite 	f	2023-04-04 10:57:47.037529+00	5	7
105	\N	SellBuy Admin made your product Lancashire Chair favourite 	f	2023-04-06 17:25:51.536264+00	2	7
106	\N	SellBuy Admin made your product Make Up Kit favourite 	f	2023-04-06 17:31:23.280886+00	8	7
107	\N	ahtashamfaheem8  made your product Kids towel favourite 	f	2023-04-06 19:18:19.846569+00	92	93
108	\N	richard_alcaide  made your product cable favourite 	f	2023-04-10 10:03:13.8299+00	92	101
109	\N	richard_alcaide  made your product Baby toy favourite 	f	2023-04-10 10:04:08.964641+00	92	101
110	\N	richard_alcaide  made your product jacket favourite 	f	2023-04-10 10:17:03.989752+00	92	101
111	\N	Adeel Ahmad made your product Kids towel favourite 	f	2023-04-10 17:14:17.039275+00	92	98
112	\N	Adeel Ahmad made your product Kids towel favourite 	f	2023-04-10 18:07:47.441819+00	92	98
113	\N	Adeel Ahmad made your product Kids towel favourite 	f	2023-04-10 18:08:26.564014+00	92	98
114	\N	Adeel Ahmad made your product Kids towel favourite 	f	2023-04-10 18:10:09.801453+00	92	98
115	\N	Adeel Ahmad made your product Kids towel favourite 	f	2023-04-10 18:14:34.677261+00	92	98
116	\N	Adeel Ahmad made your product Kids towel favourite 	f	2023-04-10 18:15:11.612311+00	92	98
117	\N	Adeel Ahmad made your product Kids towel favourite 	f	2023-04-10 18:18:15.604537+00	92	98
118	\N	Adeel Ahmad made your product Iphone 13 favourite 	f	2023-04-10 18:19:45.039066+00	94	98
119	\N	Adeel Ahmad made your product mobile phone favourite 	f	2023-04-10 18:20:22.494978+00	92	98
120	\N	aqibijaz3+client Fusion made your product Lancashire Chair favourite 	f	2023-04-10 20:24:12.238726+00	2	102
121	\N	aqibijaz3+client Fusion made your product CHIPPENDALE IN SHIPSTON favourite 	f	2023-04-10 20:24:16.496612+00	64	102
122	\N	Alexandra Roxas made your product fresh cabbage favourite 	f	2023-04-11 07:09:07.266719+00	5	114
123	\N	Alexandra Roxas made your product fresh cabbage favourite 	f	2023-04-11 07:09:07.664187+00	5	114
124	\N	Elena Grace Chichirita made your product cable favourite 	f	2023-04-11 09:30:07.660353+00	92	115
125	\N	Adeel Ahmad made your product Jeans favourite 	f	2023-04-11 22:03:17.977746+00	98	98
126	\N	Adeel Ahmad made your product Jeans favourite 	f	2023-04-11 23:11:37.586993+00	98	98
127	\N	Adeel Ahmad made your product Bed favourite 	f	2023-04-11 23:15:14.8497+00	98	98
128	\N	Adeel Ahmad made your product Bed favourite 	f	2023-04-11 23:30:48.203904+00	98	98
129	\N	Adeel Ahmad made your product Caps favourite 	f	2023-04-11 23:31:08.345893+00	98	98
130	\N	Adeel Ahmad made your product Cap favourite 	f	2023-04-11 23:31:47.152905+00	98	98
131	\N	Adeel Ahmad made your product joy favourite 	f	2023-04-11 23:32:05.851564+00	92	98
132	\N	Adeel Ahmad made your product Lancashire Chair favourite 	f	2023-04-11 23:33:12.877125+00	2	98
133	\N	Adeel Ahmad made your product Jeans favourite 	f	2023-04-11 23:44:53.336836+00	98	98
134	\N	Adeel Ahmad made your product Jeans favourite 	f	2023-04-11 23:46:23.357248+00	98	98
135	\N	Adeel Ahmad made your product Jeans favourite 	f	2023-04-11 23:47:16.102384+00	98	98
136	\N	Adeel Ahmad made your product Jeans favourite 	f	2023-04-11 23:50:49.831344+00	98	98
137	\N	Adeel Ahmad made your product mobile phone favourite 	f	2023-04-11 23:51:12.584723+00	92	98
138	\N	Adeel Ahmad made your product Baby toy favourite 	f	2023-04-11 23:52:33.721418+00	92	98
139	\N	Adeel Ahmad made your product mobile phone favourite 	f	2023-04-11 23:52:53.493164+00	92	98
140	\N	Adeel Ahmad made your product Bed favourite 	f	2023-04-11 23:55:11.255583+00	98	98
141	\N	Adeel Ahmad made your product Jeans favourite 	f	2023-04-11 23:56:12.487886+00	98	98
142	\N	Adeel Ahmad made your product Caps favourite 	f	2023-04-11 23:57:23.038591+00	98	98
143	\N	Adeel Ahmad made your product Cap favourite 	f	2023-04-12 00:01:05.814188+00	98	98
144	\N	Adeel Ahmad made your product joy favourite 	f	2023-04-12 00:01:22.572616+00	92	98
145	\N	Adeel Ahmad made your product Jeans favourite 	f	2023-04-12 00:03:29.376537+00	98	98
146	\N	Elena Grace Chichirita made your product Mens Pant favourite 	f	2023-04-12 03:08:39.274945+00	92	115
147	\N	Elena Grace Chichirita made your product Bed favourite 	f	2023-04-12 03:21:51.744527+00	98	115
148	\N	marjonel.rodriguez  made your product Jeans favourite 	f	2023-04-12 03:37:37.670429+00	98	118
149	\N	marjonel.rodriguez  made your product Bed favourite 	f	2023-04-12 03:37:39.666801+00	98	118
150	\N	marjonel.rodriguez  made your product Caps favourite 	f	2023-04-12 03:37:41.841307+00	98	118
151	\N	marjonel.rodriguez  made your product Cap favourite 	f	2023-04-12 03:37:43.200083+00	98	118
152	\N	marjonel.rodriguez  made your product joy favourite 	f	2023-04-12 03:37:44.439575+00	92	118
153	\N	richard_alcaide  made your product Jeans favourite 	f	2023-04-16 05:26:03.081468+00	98	101
154	\N	richard_alcaide  made your product Bed favourite 	f	2023-04-16 05:26:05.870719+00	98	101
155	\N	richard_alcaide  made your product Caps favourite 	f	2023-04-16 05:26:10.812136+00	98	101
156	\N	richard_alcaide  made your product Cap favourite 	f	2023-04-18 06:36:04.969971+00	98	101
157	\N	richard_alcaide  made your product Clock favourite 	f	2023-04-18 06:36:13.202101+00	115	101
158	\N	richard_alcaide  made your product Jeans favourite 	f	2023-04-18 06:36:53.493481+00	98	101
159	\N	richard_alcaide  made your product truck favourite 	f	2023-04-20 01:18:34.152488+00	92	101
160	\N	richard_alcaide  made your product Bed favourite 	f	2023-04-20 02:35:21.741744+00	98	101
161	\N	Muhammad Sarfaraz made your product mobile phone favourite 	f	2023-04-26 18:19:36.856614+00	92	99
162	\N	Muhammad Sarfaraz made your product Clock favourite 	f	2023-04-26 18:19:48.316195+00	115	99
163	\N	Muhammad Sarfaraz made your product Jeans favourite 	f	2023-04-26 18:19:53.990552+00	98	99
164	\N	Muhammad Sarfaraz made your product Bed favourite 	f	2023-04-26 18:20:01.245795+00	98	99
165	\N	Muhammad Sarfaraz made your product Jeans favourite 	f	2023-04-26 20:14:20.244384+00	98	99
166	\N	Muhammad Sarfaraz made your product Cap favourite 	f	2023-04-26 20:16:07.652422+00	98	99
167	\N	Muhammad Sarfaraz made your product joy favourite 	f	2023-04-26 20:16:21.134361+00	92	99
168	\N	Muhammad Sarfaraz made your product Clock favourite 	f	2023-04-26 20:17:28.517077+00	115	99
169	\N	Muhammad Sarfaraz made your product Caps favourite 	f	2023-04-26 20:18:44.746533+00	98	99
170	\N	Muhammad Sarfaraz made your product truck favourite 	f	2023-04-26 20:19:54.271837+00	92	99
171	\N	Muhammad Sarfaraz made your product Kids towel favourite 	f	2023-04-26 20:21:58.950348+00	92	99
172	\N	Muhammad Sarfaraz made your product Clock favourite 	f	2023-04-26 20:24:40.10338+00	115	99
173	\N	ahtashamfaheem8  made your product Cap favourite 	f	2023-04-26 20:38:57.220953+00	98	93
174	\N	ahtashamfaheem8  made your product Cap favourite 	f	2023-04-26 20:41:25.698002+00	98	93
175	\N	ahtashamfaheem8  made your product Bed favourite 	f	2023-04-26 20:42:58.404546+00	98	93
176	\N	Adeel Ahmad made your product truck favourite 	f	2023-04-26 22:28:22.978652+00	92	98
177	\N	MUHAMMAD SARFARAZ made your product Jeans favourite 	f	2023-04-26 23:09:58.397252+00	98	122
178	\N	MUHAMMAD SARFARAZ made your product Bed favourite 	f	2023-04-26 23:10:03.260204+00	98	122
179	\N	MUHAMMAD SARFARAZ made your product Bed favourite 	f	2023-04-26 23:10:32.464995+00	98	122
180	\N	MUHAMMAD SARFARAZ made your product Jeans favourite 	f	2023-04-26 23:13:51.653708+00	98	122
181	\N	MUHAMMAD SARFARAZ made your product Jeans favourite 	f	2023-04-26 23:14:10.73184+00	98	122
182	\N	MUHAMMAD SARFARAZ made your product Jeans favourite 	f	2023-04-26 23:15:41.426593+00	98	122
183	\N	MUHAMMAD SARFARAZ made your product Clock favourite 	f	2023-04-26 23:16:12.320215+00	115	122
184	\N	MUHAMMAD SARFARAZ made your product Clock favourite 	f	2023-04-26 23:16:27.988657+00	115	122
185	\N	Adeel Ahmad made your product Clock favourite 	f	2023-04-26 23:23:49.085828+00	115	98
186	\N	Adeel Ahmad made your product Clock favourite 	f	2023-04-27 19:04:41.308527+00	115	98
187	\N	Adeel Ahmad made your product Jeans favourite 	f	2023-04-27 19:07:59.241356+00	98	98
188	\N	Adeel Ahmad made your product Table favourite 	f	2023-04-27 23:26:08.15532+00	98	98
189	\N	Adeel Ahmad made your product Chair favourite 	f	2023-04-27 23:26:10.207888+00	98	98
190	\N	Adeel Ahmad made your product sofa favourite 	f	2023-04-27 23:26:12.699259+00	98	98
191	\N	Adeel Ahmad made your product Clock favourite 	f	2023-04-27 23:26:16.270993+00	115	98
192	\N	Adeel Ahmad made your product Kids towel favourite 	f	2023-04-27 23:26:22.652307+00	92	98
193	\N	Adeel Ahmad made your product joy favourite 	f	2023-04-27 23:26:25.9909+00	92	98
194	\N	Adeel Ahmad made your product Cap favourite 	f	2023-04-27 23:26:28.284942+00	98	98
195	\N	Adeel Ahmad made your product Caps favourite 	f	2023-04-27 23:26:30.512774+00	98	98
196	\N	Adeel Ahmad made your product Bed favourite 	f	2023-04-27 23:26:32.993711+00	98	98
197	\N	aqibijaz3+client Fusion made your product Chair favourite 	f	2023-05-05 11:17:25.875428+00	98	102
198	\N	ahtashamfaheem8  made your product Laptop favourite 	f	2023-05-11 00:47:55.189083+00	99	93
199	\N	ahtashamfaheem8  made your product Wooden Bed favourite 	f	2023-05-11 00:47:56.908209+00	102	93
200	\N	ahtashamfaheem8  made your product Fan favourite 	f	2023-05-11 00:47:58.41031+00	98	93
201	\N	ahtashamfaheem8  made your product oven favourite 	f	2023-05-11 00:48:01.77334+00	99	93
202	\N	Richard Alcaide made your product Ladies Suit favourite 	f	2023-05-12 09:41:15.300191+00	98	101
203	\N	Richard Alcaide made your product dress favourite 	f	2023-05-12 09:41:42.394009+00	98	101
204	\N	Richard Alcaide made your product Fan favourite 	f	2023-05-16 03:26:53.592592+00	98	101
205	\N	Edwin Ryu made your product bat favourite 	f	2023-05-26 08:58:32.476004+00	98	126
206	\N	Edwin Ryu made your product new bed favourite 	f	2023-05-26 08:58:55.829436+00	99	126
207	\N	Edwin Ryu made your product Red Wine favourite 	f	2023-05-26 08:59:21.275443+00	101	126
\.


--
-- Data for Name: api_order; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_order (id, total_amount, currency, payment_status, order_status, user_id, created_at) FROM stdin;
1	12	USD	Awaiting Payment	IN	64	2023-02-14 21:00:25.910297+00
2	12	USD	Awaiting Payment	IN	64	2023-02-14 21:03:25.623888+00
3	12	USD	Awaiting Payment	IN	64	2023-02-15 19:16:22.025818+00
\.


--
-- Data for Name: api_order_products; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_order_products (id, order_id, product_id) FROM stdin;
1	1	22
2	2	23
3	3	13
\.


--
-- Data for Name: api_orderpayment; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_orderpayment (id, ref, amount, currency, method, date, order_id) FROM stdin;
1	\N	12	USD	Gpay	2023-02-14 21:00:25.938124+00	1
2	\N	12	USD	Gpay	2023-02-14 21:03:25.650176+00	2
3	\N	12	USD	Gpay	2023-02-15 19:16:22.053139+00	3
\.


--
-- Data for Name: api_otp; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_otp (id, email, phone_number, otp, expiry, created_at) FROM stdin;
1	ss44@yopmail.com	\N	8evM1	2	2023-03-11 21:09:50.16072+00
2	mohd.reehaan010@gmail.com	\N	sxhSP	2	2023-03-11 21:10:58.798466+00
3	aqibijaz3@gmail.com	\N	ssAXq	2	2023-03-15 20:29:11.018656+00
4	aqibijaz3@gmail.com	\N	LqQQs	2	2023-03-15 21:45:58.936043+00
5	aqibijaz3@gmail.com	\N	61NCz	2	2023-03-15 21:48:33.945034+00
6	aqibijaz3@gmail.com	\N	PUb0G	2	2023-03-15 22:22:01.96957+00
7	adeelahmad31105@gmail.com	\N	kbRok	2	2023-03-20 19:37:21.366216+00
8	sarfraz31105@gmail.com	\N	YYAqs	2	2023-03-20 19:40:30.978544+00
9	ahtashamfaheem8@gmail.com	\N	BIfLI	2	2023-03-24 22:10:31.953901+00
10	aqibijaz3+admin@gmail.com	\N	ZTIiT	2	2023-03-29 18:36:55.630937+00
11	happyplayer1991@gmail.com	\N	FNtVv	2	2023-04-04 08:23:59.484221+00
12	happyplayer1991@gmail.com	\N	ZgzvH	2	2023-04-04 08:25:00.764357+00
13	richard_alcaide@yahoo.com	\N	YYrWK	2	2023-04-07 10:37:45.209337+00
14	aqibijaz3+client@gmail.com	\N	gFGC2	2	2023-04-07 22:27:14.201532+00
15	ahtashamfaheem@gmail.com	\N	9XYzT	2	2023-04-08 22:02:14.30901+00
16	ahtashamfaheem@gmail.com	\N	qqOaO	2	2023-04-08 22:14:10.948749+00
17	cryzsa_chibyo29@yahoo.com	\N	62c0z	2	2023-04-12 01:46:18.817795+00
18	cryzsa_chibyo29@yahoo.com	\N	OLyLx	2	2023-04-12 01:46:19.264586+00
19	cryzsa_chibyo29@yahoo.com	\N	3hxMq	2	2023-04-12 01:47:55.834094+00
20	cryzsalex0129@gmail.com	\N	B9AEQ	2	2023-04-12 01:48:09.781531+00
21	cryzsalex0129@gmail.com	\N	6PYvM	2	2023-04-12 01:48:26.494822+00
22	cryzsalex0129@gmail.com	\N	sehvr	2	2023-04-12 01:48:47.853004+00
23	m.rodriguez000026@gmail.com	\N	R3eTP	2	2023-04-12 02:37:06.510417+00
24	marjonel.rodriguez@gmail.com	\N	WtR3A	2	2023-04-12 02:38:27.646241+00
25	aqibijaz3@gmail.com	\N	55gt0	2	2023-05-05 09:56:17.470532+00
26	ahtashamfaheem8@gmail.com	\N	oHlL8	2	2023-05-05 21:21:54.428637+00
27	ahtashamfaheem8@gmail.com	\N	Bxe8J	2	2023-05-05 21:33:39.871523+00
28	ahtashamfaheem8@gmail.com	\N	uZPMt	2	2023-05-05 21:34:27.561712+00
29	ahtashamfaheem8@gmail.com	\N	hh3HF	2	2023-05-05 21:45:18.881347+00
\.


--
-- Data for Name: api_product; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_product (id, name, slug, description, market_price, discount_price, negotiable, user_id, product_status, date, reserved, condition, price_type, video_file, video_yt_url, brand_id, deal_method_mailing, deal_method_mailing_detail, deal_method_meetup, deal_method_meetup_detail) FROM stdin;
1	Chair	chair	Single Chair	12	\N	t	2	AV	2022-12-13 21:28:11.393118+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
2	Head Phone	head-phone	Smart head phone	60	\N	f	8	AV	2022-12-14 20:38:31.575095+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
3	Make Up Kit	make-up-kit	make up kit	80	\N	f	8	AV	2022-12-14 20:39:46.058675+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
29	head phone	head-phone-cdigbt	best head phone	500	\N	f	92	AV	2023-03-28 21:13:40.762514+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
5	Nintendo Switch	nintendo-switch	Nintendo Switch	300	\N	f	5	AV	2022-12-20 03:51:00.387291+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
6	Hot carbon	hot-carbon	super hot when heated	123	\N	f	5	AV	2022-12-20 08:10:05.166358+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
7	Edible pain	edible-pain	Edible pain per kilo\n$1 Red color\n$2 yellow color	1	\N	f	5	AV	2022-12-20 08:12:44.096892+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
8	Gardener Ninja tools	gardener-ninja-tools	Gardening ninja stuff used but not abused	12	\N	f	5	AV	2022-12-20 08:15:37.454553+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
9	Leg powered carbon fiber structure	leg-powered-carbon-fiber-structure	dont skip Leg day, never!	500	\N	f	5	AV	2022-12-20 08:29:13.949397+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
10	90s cap	90s-cap	Ducks caps	900	\N	f	5	AV	2022-12-21 03:25:04.923505+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
11	12345678890234567890123456778890	12345678890234567890123456778890	test for title	122	\N	f	5	AV	2022-12-21 03:29:56.011915+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
12	12345678901235678890123456789901234567890	12345678901235678890123456789901234567890	tes title 2	1234	\N	f	5	AV	2022-12-21 03:30:49.847811+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
13	12345678901234567890123456789012345678901234567890	12345678901234567890123456789012345678901234567890	test 5	123	\N	f	5	AV	2022-12-21 03:34:09.113827+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
14	Plumbing works 24/7	plumbing-works-247	Fix em all\nFix em good\nFree check up	123	\N	f	5	AV	2022-12-22 01:43:29.606031+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
15	Wood werx	wood-werx	If I could I Wood!	155	\N	f	5	AV	2022-12-22 01:45:15.532578+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
17	Buzzing express	buzzing-express	Hands off those pesky wires.	242	\N	f	5	AV	2022-12-22 01:49:15.632812+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
19	Bike	bike	Speed	200	\N	f	4	AV	2022-12-23 21:45:27.363533+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
30	mobile phone	mobile-phone	best mobile	20000	\N	f	92	AV	2023-03-28 21:17:00.854982+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
31	AirPods	airpods	AirPods deliver an unparalleled wireless headphone experience, from magical setup to high-quality sound	1495	\N	f	92	AV	2023-03-28 21:23:15.294282+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
32	Head Phone 4	head-phone-4	best head phone in market	100	\N	t	92	AV	2023-03-28 23:34:44.225624+00	f	LU	FF	product/videos/2023/03/28/WhatsApp_Video_2023-03-11_at_21.00.07.mp4	https://www.youtube.com/watch?v=v7jtk_KYZtc&ab_channel=AkshayAnil	\N	f	\N	f	{}
33	laptop	laptop	laptop	120000	\N	f	92	AV	2023-03-28 23:47:52.496286+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
21	Lancashire Chair	lancashire-chair	A lovely pair of 17th Century Oak Lancashire Chairs of very good color and in nice original condition with original seats, and standing tall on the original feet.	2500	\N	f	2	AV	2022-12-24 23:45:32.987893+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
34	Data Cables	data-cables	Genuine Data Cables with best possible Prices i	500	\N	f	92	AV	2023-03-29 14:49:38.861188+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
16	Gardening needs	gardening-needs	We plant, you harvest!	555	\N	f	5	AV	2022-12-22 01:47:22.245222+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
35	jacket	jacket	Stay fashionable and warm with Our exclusive collection of men's jackets	20000	\N	f	92	AV	2023-03-29 18:59:29.05717+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
18	fresh cabbage	fresh-cabbage	per bunch	0	\N	f	5	AV	2022-12-22 03:25:51.228335+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
22	Some guys guitar	some-guys-guitar	Hi, I'm trying to sell this on the yoGeek telegram. The dev said he would sell for me on yogeek. Buy this so we MOOOOOOON	5000	\N	f	5	AV	2023-01-14 02:22:34.102506+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
23	Ai dog	ai-dog	Please buy my doggy	200	\N	f	5	AV	2023-01-16 23:53:18.191253+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
36	Iphone 13	iphone-13	Full year of technical support and troubleshooting.\r\nEligible for replacement or refund within 1-year of receipt, if you are not satisfied.	890	\N	f	94	AV	2023-03-29 19:05:23.569353+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
20	CHIPPENDALE IN SHIPSTON	chippendale-in-shipston	The chairs are considerably older than 1876	5555	\N	f	64	AV	2022-12-24 23:12:23.929126+00	f	BN	FP	\N	\N	\N	f	\N	f	{}
24	Android Charge	android-charge	best Android Charge in market	200	\N	t	\N	AV	2023-03-23 20:01:19.968534+00	f	LU	FF		https://www.youtube.com/watch?v=v7jtk_KYZtc&ab_channel=AkshayAnil	\N	f	\N	f	{}
25	Android Charge2	android-charge2	best Android Charge in market2	200	\N	t	\N	AV	2023-03-23 20:02:35.328873+00	f	LU	FF	product/videos/2023/03/23/WhatsApp_Video_2023-03-11_at_21.00.07.mp4	https://www.youtube.com/watch?v=v7jtk_KYZtc&ab_channel=AkshayAnil	\N	f	\N	f	{}
26	Android Charge3	android-charge3	best Android Charge in market3	200	\N	t	92	AV	2023-03-23 20:04:23.690256+00	f	LU	FF	product/videos/2023/03/23/WhatsApp_Video_2023-03-11_at_21.00.07_VL0YHZ9.mp4	https://www.youtube.com/watch?v=v7jtk_KYZtc&ab_channel=AkshayAnil	\N	f	\N	f	{}
27	rty	rty	ty	7	\N	f	92	AV	2023-03-24 20:56:28.300637+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
28	new	new	product	2	\N	f	92	AV	2023-03-24 22:23:55.492599+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
37	cable	cable	best cable	3000	\N	f	92	AV	2023-03-30 15:01:48.897572+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
38	Mens Pant	mens-pant	best mens pant	5000	\N	f	92	AV	2023-03-30 15:06:06.323883+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
39	mobile phone	mobile-phone-zd3wez	mobile phone	50000	\N	f	92	AV	2023-03-30 15:12:39.244588+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
40	Baby toy	baby-toy	Baby toy	30000	\N	f	92	AV	2023-03-31 01:15:09.267039+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
41	truck	truck	ddr	5000	\N	f	92	AV	2023-03-31 01:15:40.247143+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
42	Kids towel	kids-towel	Kids towel	4540	\N	f	92	AV	2023-03-31 01:16:12.637514+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
43	joy	joy	dghdrt	670	\N	f	92	AV	2023-03-31 01:16:54.282505+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
44	Cap	cap	Best Cap	2000	\N	f	98	AV	2023-04-07 21:39:42.866745+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
45	Caps	caps	best caps in markete	10	\N	f	98	AV	2023-04-10 23:19:06.656682+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
46	Bed	bed	best bed	99	\N	f	98	AV	2023-04-10 23:21:42.254462+00	f	BN	FP	product/videos/2023/04/10/Sab_Kuchh__-_New_Full_screen_WhatsApp_Status_-_B_Praak_-_Sargu_u48Oq7l.mp4	https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
47	Jeans	jeans	Best mens jeans	3000	\N	f	98	AV	2023-04-11 17:09:28.619714+00	f	BN	FP	product/videos/2023/04/11/jhaanjar_song__jasminbhasin_short_gippygarewal.mp4	https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
48	Clock	clock	small clock from ikea	50	\N	f	115	AV	2023-04-12 05:20:46.058208+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
49	sofa	sofa	best soft sofa	5675	\N	f	98	AV	2023-04-27 23:02:03.629984+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
50	Chair	chair-pzkmxe	good quality chair with low price	3454	\N	f	98	AV	2023-04-27 23:03:00.450847+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
51	Table	table	pure and dry wood hand made table	54675	\N	f	98	AV	2023-04-27 23:04:19.843118+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
52	Ladies Suit	ladies-suit	dgd	4646	\N	f	98	AV	2023-04-27 23:47:00.447194+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
53	Suit	suit	dsg	465	\N	f	98	AV	2023-04-27 23:47:28.019644+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
54	dress	dress	dfrhr	546	\N	f	98	AV	2023-04-27 23:47:56.584099+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
55	Ladies Sandle	ladies-sandle	rtytr	56	\N	f	98	AV	2023-04-27 23:48:32.087385+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
56	Fan	fan	sdg	454	\N	f	98	AV	2023-04-28 20:55:39.500182+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
57	Wooden Bed	wooden-bed	This bed made by pure wooden.	12	\N	f	102	AV	2023-05-07 19:18:26.047795+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
58	Laptop	laptop-8iflvs	cheap price Laptop	300000	\N	f	99	AV	2023-05-08 16:36:14.036569+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
59	oven	oven	fast and safe	30000	\N	f	99	AV	2023-05-10 21:14:33.469383+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
60	Red Wine	red-wine	This is a red wine	5	\N	f	101	AV	2023-05-16 02:51:17.932548+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
61	lock	lock	gfj gjtyj	3000	\N	f	98	AV	2023-05-17 21:29:42.566756+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
62	bat	bat	etery	3000	\N	f	98	AV	2023-05-17 21:47:01.023877+00	f	BN	FF		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
63	Cricket ball	cricket-ball	dfgdfh rthyrty thty ttyu	2000	\N	f	98	AV	2023-05-17 22:30:33.395323+00	f	LU	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
64	Sofa	sofa-ashvow	high quality sofa	5000	\N	f	98	AV	2023-05-18 22:50:50.461268+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	15	t	mailing and delievery details	t	{"[object Object],[object Object],[object Object],[object Object],[object Object]"}
65	Scarf	scarf	dsfdg	54765	\N	f	98	AV	2023-05-18 23:03:50.900735+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	10	t	Mailing & Delivery	t	{"[{\\"place\\":\\"Lahore, Pakistan\\",\\"lat\\":31.5203696,\\"lng\\":74.35874729999999},{\\"place\\":\\"Punjab, India\\",\\"lat\\":31.1471305,\\"lng\\":75.34121789999999}]"}
66	Buy & Sell	buy-sell	Fashion Shoes	200	\N	f	102	AV	2023-05-22 15:50:56.963458+00	f	LU	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	t	{"[{\\"place\\":\\"Pakistan\\",\\"lat\\":30.375321,\\"lng\\":69.34511599999999}]"}
67	furnit	furnit	adwef	400	\N	f	99	AV	2023-05-22 17:07:22.392969+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	t	ertgfer	t	{"[{\\"place\\":\\"Lahore, Pakistan\\",\\"lat\\":31.5203696,\\"lng\\":74.35874729999999}]"}
68	new bed	new-bed	dfgd	5000	\N	f	99	AV	2023-05-22 17:11:55.860529+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	\N	f	\N	f	{}
69	bed2	bed2	undefined	56	\N	f	99	AV	2023-05-22 17:17:31.419581+00	f	BN	FP		https://www.youtube.com/watch?v=a18py61_F_w&list=RDa18py61_F_w&start_radio=1	15	f	\N	f	{}
\.


--
-- Data for Name: api_product_categories; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_product_categories (id, product_id, category_id) FROM stdin;
1	1	2
3	3	6
5	5	9
6	6	4
7	7	4
8	8	8
10	10	7
11	11	2
12	12	2
13	13	4
14	14	2
15	15	2
16	16	8
18	18	2
20	20	2
21	21	2
23	23	3
33	33	3
35	35	7
37	37	4
38	38	7
40	40	3
41	41	3
42	42	3
43	43	4
44	44	7
45	45	3
46	46	2
47	47	7
48	48	4
49	49	2
50	50	2
51	51	2
52	52	6
53	53	6
54	54	6
55	55	6
56	56	9
57	57	2
58	58	4
59	59	4
60	60	4
61	61	3
62	62	3
63	63	9
64	64	2
65	65	6
66	66	7
67	67	2
68	68	2
69	69	2
\.


--
-- Data for Name: api_product_images; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_product_images (id, product_id, image_id) FROM stdin;
1	1	1
2	2	2
3	3	3
5	5	5
6	6	6
7	7	7
8	8	8
9	9	9
10	10	10
11	11	12
12	12	13
13	13	15
14	14	20
15	15	21
16	16	22
17	17	23
18	18	24
19	19	25
20	20	26
21	21	27
22	22	28
23	23	29
24	24	1
25	25	1
26	26	1
27	27	1
28	28	1
29	29	36
30	30	37
31	31	38
32	32	5
33	33	39
34	34	40
35	35	42
36	36	43
37	37	46
38	38	48
39	39	49
40	40	50
41	41	51
42	42	52
43	43	53
44	44	56
45	45	57
46	46	58
47	47	63
48	48	64
49	49	68
50	50	69
51	51	70
52	52	71
53	53	72
54	54	73
55	55	74
56	56	90
57	57	92
58	58	93
59	59	95
60	60	96
61	61	99
62	62	101
63	63	103
64	64	104
65	65	106
66	66	107
67	67	108
68	68	111
69	69	112
\.


--
-- Data for Name: api_promotion; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_promotion (id, name, offer_price, currency, description, created_at) FROM stdin;
\.


--
-- Data for Name: api_reportproduct; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_reportproduct (id, report_type, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: api_reportreview; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_reportreview (id, report_type, review_id, user_id) FROM stdin;
\.


--
-- Data for Name: api_review; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_review (id, message, rating, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: api_room; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_room (id, name, description, slug, created_by_id, joined_by_id, product_id) FROM stdin;
1	1_4_2	room for product 1 by user 4	1_4_2	4	2	1
2	3_5_8	room for product 3 by user 5	3_5_8	5	8	3
3	2_5_8	room for product 2 by user 5	2_5_8	5	8	2
4	1_5_2	room for product 1 by user 5	1_5_2	5	\N	1
5	9_7_5	room for product 9 by user 7	9_7_5	7	5	9
6	8_4_5	room for product 8 by user 4	8_4_5	4	5	8
7	17_4_5	room for product 17 by user 4	17_4_5	4	5	17
8	19_2_4	room for product 19 by user 2	19_2_4	2	4	19
9	21_64_2	room for product 21 by user 64	21_64_2	64	2	21
10	21_5_2	room for product 21 by user 5	21_5_2	5	2	21
11	19_5_4	room for product 19 by user 5	19_5_4	5	4	19
12	20_2_64	room for product 20 by user 2	20_2_64	2	64	20
13	20_5_64	room for product 20 by user 5	20_5_64	5	64	20
14	16_4_5	room for product 16 by user 4	16_4_5	4	5	16
15	14_4_5	room for product 14 by user 4	14_4_5	4	5	14
16	18_64_5	room for product 18 by user 64	18_64_5	64	5	18
17	23_64_5	room for product 23 by user 64	23_64_5	64	5	23
18	22_73_5	room for product 22 by user 73	22_73_5	73	5	22
19	23_83_5	room for product 23 by user 83	23_83_5	83	5	23
20	21_84_2	room for product 21 by user 84	21_84_2	84	2	21
21	23_85_5	room for product 23 by user 85	23_85_5	85	5	23
22	35_94_92	room for product 35 by user 94	35_94_92	94	92	35
23	36_92_94	room for product 36 by user 92	36_92_94	92	94	36
24	42_97_92	room for product 42 by user 97	42_97_92	97	92	42
25	42_7_92	room for product 42 by user 7	42_7_92	7	92	42
26	43_102_92	room for product 43 by user 102	43_102_92	102	92	43
27	46_114_98	room for product 46 by user 114	46_114_98	114	98	46
28	38_117_92	room for product 38 by user 117	38_117_92	117	92	38
29	20_118_64	room for product 20 by user 118	20_118_64	118	64	20
30	40_115_92	room for product 40 by user 115	40_115_92	115	92	40
31	46_120_98	room for product 46 by user 120	46_120_98	120	98	46
32	57_93_102	room for product 57 by user 93	57_93_102	93	102	57
33	57_101_102	room for product 57 by user 101	57_101_102	101	102	57
34	53_101_98	room for product 53 by user 101	53_101_98	101	98	53
35	58_101_99	room for product 58 by user 101	58_101_99	101	99	58
36	60_116_101	room for product 60 by user 116	60_116_101	116	101	60
37	66_99_102	room for product 66 by user 99	66_99_102	99	102	66
\.


--
-- Data for Name: api_seller; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_seller (id, name, email, phone, seller_status, receipt, user_id) FROM stdin;
1	undefined undefined		\N	PN		\N
2	Zubair Muhammad	s@gmil.com	2222222	AP		5
3	Test User	s2@yopmail.com	1234567891	AP		8
4	Ahtasham Faheem	ahtashamfaheem8@gmail.com	\N	AP		4
5	Aqib Ijaz Muhammad Ijaz	aqibijaz@gmail.com	03034727173	AP		2
6	NA NA	testuser@gmail.com	NA	AP		64
\.


--
-- Data for Name: api_user; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_user (id, password, last_login, is_superuser, first_name, username, last_name, email, phone, phone2, is_staff, is_active, date_joined, account_type, language, profile_image, is_deleted, app_score, email_slug, is_seller, location, number_slug, twilio_sid, verify_location, location_name, lat, long, activate, bio, city, country, cover_image, dob, gender, state, total_badges, shop_name) FROM stdin;
4	!fGr15Yk2fXjAHtBDuqcxUqRd2ACisAt7DnBL0Hod	2023-01-13 17:05:10.909034+00	f	Ahtasham	ahtasham	Faheem	ahtashamfaheem8@gmail.com	\N	\N	f	t	2022-12-13 20:05:08.845195+00	IN	EN		f	0.00		t	\N			f		\N	\N	t	\N	\N	\N	\N	\N	3	\N	0.00	
8	pbkdf2_sha256$260000$WoH7uBHJ5IxeOrxpAiG21G$R1twro8u/f7OMuSf3PZO3ikHkPRYlJSfXzeVZ+AgUZU=	2022-12-14 19:51:21.634288+00	f	Test	test1	User	s2@yopmail.com	1234567891	\N	f	t	2022-12-14 19:16:09+00	IN	JA	profile/avatar_oHRfCw3.jpeg	f	0.00		t	\N			f		\N	\N	t	\N	\N	\N	\N	\N	3	\N	0.00	
15	pbkdf2_sha256$260000$CEXe0hTykHhopCl4kWtmgv$WJTbwpfQGEomTN8G7ycsi4HS0uEuYcFVNEQBiKuRuV0=	2023-02-15 18:49:35.406726+00	f	NA	aqibijaz	NA	aqibijaz3@gmail.com	NA	\N	f	t	2022-12-16 18:53:58.177253+00	IN	JA	profile/avatar_1jaovUp.jpeg	f	0.00		f	0101000020E6100000FE28EACC3D783F40D6157D4F76915240			f	Johar Town, Lahore, Pakistan	\N	\N	t	\N	\N	\N	\N	\N	3	\N	0.00	
6	!r5QiNpFdXOl59h8xCZnribfwU1KWdYzDXq7zgcS6	2022-12-14 07:58:19.753975+00	f	Daldal	daldal	Song	winnerceo@gmail.com	\N	\N	f	t	2022-12-14 07:58:19.673639+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N	\N	\N	3	\N	0.00	
62	pbkdf2_sha256$260000$YTJE807zeynkCntNOwNoEW$KDmR9j1kkwoQYRzsBCsHMg0147cVJ++CQdGNvfHRKmI=	\N	f	NA	ypratham	NA	ypratham0014@gmail.com	NA	\N	f	t	2022-12-24 12:32:03.399102+00	IN	JA	profile/avatar_3WH3KyF.jpeg	f	0.00	d9QRh8jid9HmZWCZ	f	\N	31tRueiE3PtqV5HR	US6b3b261a4a43442ab245baa1ae01945d	f		\N	\N	t	\N	\N	\N	\N	\N	3	\N	0.00	
123	!tH4R1KsJvG3BTSUalT14lRNCP97RBVkqFiAqwQny	\N	f	Jeongho	jeongho	Yang	yangpspider@hotmail.com	\N	\N	f	t	2023-05-10 08:28:10.756868+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
119	!UZuFDF5iG4JV6eE4MEcTi4xLxyycHbaWuqCleUpc	2023-05-10 08:28:19.738728+00	f	Jay	jay	Yang	yangpspider@gmail.com	\N	\N	f	t	2023-04-14 04:11:57.24979+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
122	!GX3WXwSUxgHff2Lnh5NSuhSisFM1G7TrbyCqJOt1	2023-05-08 16:28:00.973814+00	f	MUHAMMAD	muhammad2	SARFARAZ	bcsm-f18-408@superior.edu.pk	\N	\N	f	t	2023-04-26 21:34:09.968639+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
61	pbkdf2_sha256$260000$1jqU6Py4EpbUH0Crv81Ib0$JNaqDFHgzx8Mauw+daqJe2YmsyUGJSHvpyWWIMCZya0=	\N	f	NA	Korn Fields	NA	garouban@gmail.com	NA	\N	f	t	2022-12-20 07:42:32.90119+00	IN	JA	profile/avatar_ZAC8m77.jpeg	f	0.00	FdTzORbrShDXhtui	f	\N	VJJMdanEuE4uOM4m	US4bd031c2968a4a2e8302147b083436a2	f		\N	\N	t	\N	\N	\N	\N	\N	3	\N	0.00	
116	!1z1XwyLmwtphTBkxuhMiYAxn0TK1zv4owmchmtIZ	2023-05-19 00:43:00.428356+00	f	MrBuloy11	mrbuloy11__2023-04-28 06:11:47.857413+00:00	sdg	buloy11@gmail.com__2023-04-28 06:11:47.857377+00:00	\N	\N	f	t	2023-04-12 01:45:34.5243+00	IN	EN		t	0.00		f	\N			f		\N	\N	t	\N	\N	united kingdom	cover_profile/4096999.png	\N	3	\N	0.00	
65	pbkdf2_sha256$260000$8Xb6hidQCfJ1XCQqDkUCa7$Rq22uFr+b7avCaUsRBX8+CYflm6TstaYJOtIlyqf5hE=	\N	f	NA	Exzile	NA	Exzile100@gmail.com	NA	\N	f	t	2023-01-08 02:32:16.737058+00	IN	JA	profile/avatar_GdfTNz0.jpeg	f	0.00		f	\N	y4u5mc7Vs85MViFr	USc4622b882afe40088f623b41b5fae715	f		\N	\N	t	\N	\N	\N	\N	\N	3	\N	0.00	
70	!zibSI7gWadhjQwRenFGP67gDOgkAHXyA0tsiOuJC	2023-02-27 17:41:42.22903+00	f	David		Teves	exzile100@gmail.com	\N	\N	f	t	2023-02-27 17:41:42.19968+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
69	pbkdf2_sha256$260000$J9xe7oRMljt51K0a5wBFPA$Vs3xZ4l5OF/CoZmBsgcGr6tksO7vqUKm0n4h4SNuT/o=	\N	f	NA	Edwin	NA	happyplayer1991@gmail.com	NA	\N	f	t	2023-02-23 17:37:56.08311+00	IN	JA	profile/avatar_moL1lgr.jpeg	f	0.00		f	\N	MABvA8C4OT9Q0LSQ	USa0fc952021d646528875deeb8a7a8b6f	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
64	pbkdf2_sha256$260000$TbyQtAGdSM58MLDMIaASxM$yH9w/YzK5HwAEF9K6gbvkbouKTQ7AapkeqUYPjqBsNY=	2023-03-10 20:00:24.565833+00	f	Test	testuser	User	testuser@gmail.com	03035452136	\N	f	t	2022-12-24 22:40:11+00	IN	JA	profile/avatar_7mWvwvp.jpeg	f	15.00		t	0101000020E610000025D52DF136853F40CF413CB7F5965240		US573a2d1732a142818b4222aae0aa0380	f	Lahore, Pakistan	\N	\N	t	\N	\N	\N	\N	\N	3	\N	0.00	
2	!3fHbKEblxa1pa7Z3MJH311gseENG9n5QLURtTDro	2023-01-05 20:02:51.924872+00	t	Aqib Ijaz	aqib	Muhammad Ijaz	aqibijaz@gmail.com	03034727173	\N	f	t	2022-12-13 20:03:38+00	IN	EN	profile/avatar_haZ2SwR.jpeg	f	0.00		t	0101000020E610000024D52DF136853F40CF413CB7F5965240			f	Lahore, Pakistan	31.5203696	74.35874729999999	t	\N	\N	\N	\N	\N	3	\N	0.00	
67	pbkdf2_sha256$260000$wHgtU4V1nRzJA0dExXJRul$Q2k2FdEqQ3ZWFK22YS9E4PBdIJHsSY9Z6uGc1RKt65k=	\N	f	NA	Chajin	NA	ckwls3437@gmail.com	NA	\N	f	t	2023-02-23 09:19:26.760595+00	IN	JA	profile/avatar_pKmvbQw.jpeg	f	0.00		f	\N	jCFDRbpxq5cip6iv	US13d10a8d9daa4f26b501014a5311b2ac	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
68	pbkdf2_sha256$260000$HXh8YaXR8xL1vWRgRnomDj$WZv6hyEb8YMmQNXKAYZakjmcuosOIpay84hOtPo9Irk=	\N	f	NA	123123123__2023-02-23 17:30:26.460489+00:00	NA	whwndrl1103@gmail.com__2023-02-23 17:30:26.460454+00:00	NA	\N	f	t	2023-02-23 09:20:09.862871+00	IN	JA	profile/avatar_TO9G5Xl.jpeg	t	0.00		f	\N	OAKXx93XzWnugDOB	US1ad1235f206c45e9a7608ac25f810951	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
71	pbkdf2_sha256$260000$BAWPY3o2z5qWTqNyDiQcLK$UkHvKH8FKTQJzHq63kY774F8bieN1cCBHtAHqDKfML0=	2023-02-27 17:45:41.256645+00	f	NA	DeSnaake__2023-04-03 21:41:08.427840+00:00	NA	shibarium@cratelocker.com__2023-04-03 21:41:08.427792+00:00	NA	\N	f	t	2023-02-27 17:43:36.708106+00	IN	JA	profile/avatar_9r4xfLs.jpeg	t	0.00		f	\N	2MBHTEvUHDKLwyYR	US6ee00b1126504824a54ce4ee4fe7dde1	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
66	pbkdf2_sha256$260000$RHp5WVwq3txtHfCqFuImIR$I3zXK15lPAK9lL5hOLKROCXUcTRy8sA5cMjPDI4IG2E=	\N	f	NA	happyplayer__2023-02-23 09:20:53.837149+00:00	NA	happyplayer1991@gmail.com__2023-02-23 09:20:53.837117+00:00	NA	\N	f	t	2023-02-13 10:55:19.063774+00	IN	JA	profile/avatar_bu3Yl6W.jpeg	t	0.00		f	\N	ChR6qs1LfQpMzefT	US524bbab53b814d10a7fd1893bfde95bd	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
72	!4Y4d8LpKWkE44FyL7TlKpuQynqBZCbWPBkvBSjy9	2023-02-27 18:47:35.21822+00	f	Steve	steve	Tricks	stevie.tricks1@gmail.com	\N	\N	f	t	2023-02-27 18:47:35.176759+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
73	pbkdf2_sha256$260000$8CtA0kiYRtdMrtp65OOQI0$WTbiao7GSrCfGRiKY67TWA/GMZLmUBWGRFjU/GzWNLY=	2023-02-28 19:44:22.677785+00	f	NA	Frolman	NA	krauther@inbox.ru	NA	\N	f	t	2023-02-28 19:42:30.007363+00	IN	JA	profile/avatar_kzZNGLS.jpeg	f	0.00		f	\N	8BtHVbu3isYWELCP	USd21d7e85bfbf45a99bab69e869cf234b	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
76	pbkdf2_sha256$260000$3hWxu8K3SWazB1iPJ2eGBc$K2vmKJm4S4CWd5d0ZgYhj5eUdI23kajXrFj6YA7/+Qk=	\N	f	NA	Geek132023	NA	peter_gw@live.nl	NA	\N	f	t	2023-03-01 09:23:15.304888+00	IN	JA	profile/avatar_NFViBaL.jpeg	f	0.00	fj6hvS1qrGN8f0st	f	\N	OEoOyOZBLqFloWzs	US495bdbdd0ed940afaf135c66c894d0c4	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
74	!sfOv4r81oIT70P5nzNpaseY2gBGuUWwNx1fJL6ZB	2023-02-28 21:38:21.250463+00	f	Jack	jack	Evans	jacev021191@gmail.com	\N	\N	f	t	2023-02-28 21:38:21.21174+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
75	pbkdf2_sha256$260000$IvCm33Xu0XkXCzWW0kdXw0$58v9OMmHMoOHF8v9h3R6fiwK+QCEvvtgKNujDFjzcUo=	2023-03-01 04:23:38.430559+00	f	NA	Crypto_Sundevil	NA	cryptosundevil@gmail.com	NA	\N	f	t	2023-03-01 04:20:45.037935+00	IN	JA	profile/avatar_mQxbL37.jpeg	f	0.00		f	\N	pnuk0kdLRNA6jmUJ	USdeda4ced53c44faf91c6241c69f0d544	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
77	!k5j19ZNO5qKBfsq8TY0F366WJg6GfsjdabE31lD9	2023-03-01 18:13:55.239462+00	f	Дмитрий	user	С	dsypalo54@gmail.com	\N	\N	f	t	2023-03-01 18:09:25.340132+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
78	!0uYP47iKtEN5Fytboih1K5Yucw1pGVlAJprifZK2	2023-03-01 19:06:01.737978+00	f	Max	max	Kolodiychik	mkolodiychik@gmail.com	\N	\N	f	t	2023-03-01 19:06:01.698498+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
79	!ilJbBK2GQlK33KVu1KqGDyg5f7pnZewRXpYqaewk	2023-03-02 09:48:26.764659+00	f	Lodovico	lodovico	Venturoli	lodovico.venturoli@gmail.com	\N	\N	f	t	2023-03-02 09:48:26.727764+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
80	!gXppciT02kQdeMcwkcJHOjj6gSGJWtjagUPTZT6Z	2023-03-02 23:28:38.79572+00	f	Jean	jean	Maxi	jeamymax@gmail.com	\N	\N	f	t	2023-03-02 23:28:38.757861+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
60	pbkdf2_sha256$260000$zT5LFLLIPA5twQv85GsGkK$BJiHDGAq590+lgHoVR2gbujCNtuT/BFudfm1tINjgY0=	\N	f	Test	test2	User	test2@yopmail.com	+9732424245	\N	f	t	2022-12-17 10:28:16.050559+00	IN	JA	profile/images_nGwl0uu.jpeg	f	0.00	qxtKTbsPfEl4hf7u	f	\N	eFgC6G3dJYnmSqrJ	USb76a1555eae34ef586112cae1e5a6bba	f		\N	\N	t	\N	\N	\N	\N	\N	3	\N	0.00	
81	pbkdf2_sha256$260000$ervntAGmzeNAYN6Btm8f2N$0kp4d1eFInos8EI4j/zb2Xh+ofxdSzoaRvM8Ce0HAv8=	2023-03-03 00:57:00.461677+00	f	NA	Xpirimint	NA	xpirimint@protonmail.com	NA	\N	f	t	2023-03-03 00:53:36.404818+00	IN	JA	profile/avatar_KACoMst.jpeg	f	0.00		f	\N	9kALNmjNIiY0wcDZ	US36b73745287f4415a68d0efd2cbd2f46	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
82	!5k8Qw1IMtpxdPZyMlawqoKt3pUv8F9Ubsfk0TZJg	2023-03-03 02:52:02.188961+00	f	Mahdan	mahdan	Kintara Sanie	mahdanks45@gmail.com	\N	\N	f	t	2023-03-03 02:52:02.151335+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
88	pbkdf2_sha256$260000$L4FSnH8CToBZncNQyKNYrJ$bWBtRqnxGQOTbBYT33JUOuggCXUBUMPWGRz2slKvBFI=	\N	f	NA	OneMore	NA	Cfp_ssj3@yahoo.com	NA	\N	f	t	2023-03-08 05:50:06.20956+00	IN	JA	profile/avatar_Ewk7VfH.jpeg	f	0.00		f	\N	rxQsNjqvdEU149sL	US410712a0d4c444f88bfd09f1bbc6ad12	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
83	!9teDGVmTL1trBPemBxLJhD6yOsUz0OJxo7reAe84	2023-03-03 08:32:22.089868+00	f	Timothy	timothy		info@gccs.be	\N	\N	f	t	2023-03-03 08:29:45.057456+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
95	pbkdf2_sha256$260000$AtweZCHyc77BbScno6RP3J$1VLrxmgbM+4rQc3qM8CNIEvQ8ogyfY9TCdb9qF3RxVs=	\N	t		faraz		faraz@gamil.com	0309999	\N	t	t	2023-04-03 19:30:07.484087+00	IN	EN		f	0.00		f	\N		USe9cffb4db3e549f8a7a6a5b4d1cbef7d	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
84	!5hdazqKmr4C0u1DAVWsizKlamDFUNXca9QXkcFq0	2023-03-03 09:46:04.681174+00	f	Nuno	nuno	Marques	nunotech911@gmail.com	\N	\N	f	t	2023-03-03 09:46:04.645031+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
85	!oWQPCwUszrGqa2dw6seLvUMMfJrbQbihmX4nfpcG	2023-03-06 14:30:33.176366+00	f	Duilio	duilio	Gullo	duiliogullo.92@gmail.com	\N	\N	f	t	2023-03-06 14:30:33.134868+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
86	!u1kCmG7hk6C9ghnubJs728kBmCAvOdWK4BTovLiW	2023-03-07 12:01:54.196645+00	f	Sem	sem	De Jonge	semdejonge@gmail.com	\N	\N	f	t	2023-03-07 12:01:54.153957+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
97	pbkdf2_sha256$260000$xymfca2y2QxXLb8nTvRmqW$TW0+2F9IsGVPw3XRiqu/XWmDTEC9mq/LFTXfohqkbmA=	2023-04-10 08:50:48.920054+00	f	happyplayer1991	97__2023-04-10 08:54:07.176481+00:00		happyplayer1991@gmail.com__2023-04-10 08:54:07.176451+00:00	\N	\N	f	t	2023-04-04 08:25:21.465707+00	IN	EN		t	0.00		f	\N		US9cba6fd3f900443b9c298a3cf2b43956	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
87	!4BHcXabPOTeZ6XufAYszSojEpZucbyfl6s5Xz6lx	2023-03-07 18:30:31.623011+00	f	Aurélien Ludwig	aurelien_ludwig	Edimo de Borel	edimodeborel@gmail.com	\N	\N	f	t	2023-03-07 18:30:31.583432+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
117	pbkdf2_sha256$260000$3AWhF8igdUXXTSmOEviw57$/ro4NT3r7JwFOdy53umJZegVhDd1Z0eUNuOr4n9T89s=	2023-04-12 01:49:58.232221+00	f	cryzsalex0129	117__2023-04-12 02:33:08.968309+00:00		cryzsalex0129@gmail.com__2023-04-12 02:33:08.968276+00:00	\N	\N	f	t	2023-04-12 01:49:30.896951+00	IN	EN		t	0.00		f	\N		US54a07677e2be46ef9ac43afc318105b4	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
120	!5qpjde42Lffs72GLOkz8hw1Kk3s4FvxQ1ncutyAh	2023-04-20 03:41:33.353813+00	f	Cryzsalex0129	cryzsalex0129		cryzsalex0129@gmail.com	\N	\N	f	t	2023-04-20 01:48:12.341703+00	IN	CN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
90	!nXdxng7fv2K8IGZbtbsSGYDQVc4CZQhvklcEBu7W	2023-03-15 08:42:32.928417+00	f	Rami	rami	kamar	rami.kamar@gmail.com	\N	\N	f	t	2023-03-15 08:42:32.891266+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
5	pbkdf2_sha256$260000$tHZQMGLYrgUvPfJhyPnbPX$E2/zoxSm1d29jJT1fznGc6W88riSoiE7UOBGNWh/iTA=	2023-04-03 20:23:43.172577+00	f	Zubair	zubair	Muhammad	s@gmil.com	2222222	\N	f	t	2022-12-13 20:20:47+00	IN	JA	profile/avatar_6GM5wSb.jpeg	f	20.00		t	0101000020E6100000CB72D9E89CD34540CE35711786D853C0			t	Toronto, ON, Canada	\N	\N	t	\N	\N	\N	cover_profile/death.jpeg	\N	3	\N	0.00	
96	pbkdf2_sha256$260000$S68WPTDiVT4rODDRLbeuGh$Tq9wfT4NLVtSu2V7Kgo8B27f0RjlLxLsPKrv1OYIdsI=	\N	t		Ali		ali@gmail.com	346436	\N	t	t	2023-04-03 19:38:49.928029+00	IN	EN	profile/avatar_wJvBQIL.jpeg	f	0.00		f	\N		US282649f25bb24e44a32b75555de562bb	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
100	!haaBrJl9S2gqnnaL3N04BJFAS5ORk9l1eCp65Kt9	2023-04-06 19:30:32.466192+00	f	Musharraf	musharraf	Faheem	musharaf42@gmail.com	\N	\N	f	t	2023-04-06 19:30:32.429071+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
94	pbkdf2_sha256$260000$05Md2HVLmNINLoLB6obSC3$xtVqQeYwNjp4tEArZxhgE89yRQ8g0JjAyubQlVbir1Y=	2023-04-11 19:59:44.211419+00	t	Aqib	94	Ijaz	aqibijaz3+admin@gmail.com	03034727173	\N	f	t	2023-03-29 18:37:27+00	PR	EN	profile/avatar_iZGkpVQ.jpeg	f	0.00		f	\N		USe4cf8323f62248c5a926ef0080d6781d	f		\N	\N	t	I have updated the code buy and sell with sweesher structure and in this project Locationzation already implement.Also implemented the fonts in it.	\N	\N	cover_profile/cover.jpeg	2023-03-22	3	\N	0.00	
91	pbkdf2_sha256$260000$qXElFIeosyze8HNnRq6AxB$7MOBPVNWSOQgQfaj27LQ/iU2y7Vw1AXG82Q4ox+ZLro=	2023-03-22 20:44:25.264066+00	f	Aqib	91__2023-04-10 19:46:27.201088+00:00	Ijaz	aqibijaz3@gmail.com__2023-04-10 19:46:27.201054+00:00	03034727173	\N	f	t	2023-03-15 22:22:22.298913+00	IN	EN		t	0.00		f	\N		USee8515b5561a49e0b849a8e49761a7dd	f		\N	\N	t	Bio	stocktan	united states		2023-03-23	1	california	0.00	
104	pbkdf2_sha256$260000$SBa9MAnncYapEXjor1dZ2z$UEu/8aQxAjcmOADmO1qTDTd+pMzfxPBl/NQxHly3DwA=	2023-04-08 22:14:56.204958+00	f	ahtashamfaheem	104__2023-04-08 22:15:21.550789+00:00		ahtashamfaheem@gmail.com__2023-04-08 22:15:21.550753+00:00	\N	\N	f	t	2023-04-08 22:14:47.183231+00	IN	EN		t	0.00		f	\N		US63e456739e2540f8ae9ce9230dcd5093	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
103	pbkdf2_sha256$260000$4x5ZqftVkRCEaa3mtoTiZE$v6quk5aQ+TqwBYRlhyeGIrCPNDLdDJzw6iroFpfwcF8=	2023-04-08 22:02:52.421127+00	f	ahtashamfaheem	103__2023-04-08 22:11:33.429839+00:00		ahtashamfaheem@gmail.com__2023-04-08 22:11:33.429804+00:00	\N	\N	f	t	2023-04-08 22:02:40.634414+00	IN	EN		t	0.00		f	\N		US06f82487e4e44d23ae4ee15cc9727777	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
7	pbkdf2_sha256$260000$seTNx39HQu9TWO8ejNJguF$hV4fhMg62QtcH3t1BEcZq5cyoRjk4zSrtbxcAfeo+AY=	2023-05-26 08:55:36.706468+00	t	SellBuy	admin	Admin	admin@yopmail.com	123456789	\N	f	t	2022-12-14 18:26:55+00	IN	EN	profile/1661765296851-msgl_profil.jpeg	f	0.00		t	\N			f		\N	\N	t	\N	\N	\N	cover_profile/aaron-burden-cEukkv42O40-unsplash.png	\N	3	\N	0.00	
1	pbkdf2_sha256$260000$seTNx39HQu9TWO8ejNJguF$hV4fhMg62QtcH3t1BEcZq5cyoRjk4zSrtbxcAfeo+AY=	2023-05-17 22:22:21.367925+00	t	Sell	sellbuy	Buy	sellbuy@yopmail.com	1234567890	\N	t	t	2022-12-13 19:28:47+00	IN	EN	profile/BPZA5781_1.jpg	f	0.00		f	\N			f		\N	\N	t	\N	\N	\N	\N	\N	3	\N	0.00	
93	pbkdf2_sha256$260000$uPLVsnHH7kWl2sLBnt6Zoh$e+aWP9Qv50yN7Crxn0StqQs++JXjqCCDJhIbKC1FMXw=	2023-05-17 21:38:50.723789+00	f	ahtashamfaheem8	93		ahtashamfaheem8@gmail.com	\N	\N	f	t	2023-03-24 22:11:00.183038+00	IN	EN		f	0.00		f	0101000020E6100000DE8FDB2F9F7A3F408C12F417FA915240		USbe5d712a53d9437394a6a030fb3c52c2	f	G1 Johar Town Lahore, Block G1 Block G 1 Phase 1 Johar Town, Lahore, Pakistan	31.4789915	74.2808895	f	\N	\N	\N	cover_profile/html_css_jquery.PNG	\N	3	\N	0.00	
102	pbkdf2_sha256$260000$8EBZYbsirwts051TrNzBcM$lv913iwxeFypqpkKUcw80ENXbhUyyAsn+ZuWArAWk8s=	2023-05-18 21:57:36.045081+00	f	aqibijaz3+client	102	Fusion	aqibijaz3+client@gmail.com	03034727173	\N	f	t	2023-04-07 22:27:45.124178+00	IN	EN	profile/avatar_Bs5HT21.jpeg	f	0.00		f	0101000020E6100000FE28EACC3D783F40D6157D4F76915240		USf1362fb4483445669a95f07a325186fa	f	Johar Town, Lahore, Pakistan	31.469693	74.27284610000001	t	Good	\N	\N	cover_profile/wp10776054-akatsuki-anime-laptop-hd-wallpapers.jpg	2023-04-17	3	\N	0.00	Fussion
124	!8Xq8BIjy6iItjsjnxAYOrFLaVgakM7EEqaawfQJ3	2023-05-26 08:15:07.897115+00	f	Richard-GeekNation	richard-geeknation	Alcaide	richard.geeknation@gmail.com	\N	\N	f	t	2023-05-15 06:26:22.182337+00	IN	EN		f	0.00		f	0101000020E6100000719D352ED2262D4038F581E41D445E40			f	Oranbo, Pasig, Metro Manila, Philippines	14.5758223	121.0643245	t	\N	\N	\N		\N	3	\N	0.00	
126	!w6WsoGmdGqOedRi9KawTu9tjtKE9z7D1E7G88Olx	2023-05-26 08:57:39.832778+00	f	Edwin	edwin6	Ryu	edwinkurian0915@gmail.com	\N	\N	f	t	2023-05-26 08:56:37.596533+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
114	!xDIXiZ3zs74WbnZU7RXNGE9dnMiPqKaASz53vXsk	2023-04-12 02:33:29.513967+00	f	Alexandra	alexandra	Roxas	alex.geeknation@gmail.com	\N	\N	f	f	2023-04-11 03:04:40.241125+00	IN	EN	profile/avatar_xdo7mwv.jpeg	f	0.00		f	\N			f		\N	\N	f	\N	\N	\N		\N	3	\N	0.00	Alexandra Shop
125	!rGeirxSFl3OUXLa1GLPcV2omCH5ZqLchL9W0VEJE	2023-05-22 03:31:37.951595+00	f	Richard	richard	Alcaide	geeknation.yogeek@gmail.com	\N	\N	f	t	2023-05-22 03:31:37.915838+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
118	pbkdf2_sha256$260000$4dapIhGzndaqCXU6nzHRCj$T22yYVBP2rW77yelKO/dvgv87vDa+kYcYtWebz0C/oU=	2023-04-12 02:40:43.941395+00	f	marjonel.rodriguez	118		marjonel.rodriguez@gmail.com	\N	\N	f	t	2023-04-12 02:39:14.31691+00	IN	EN		f	0.00		f	\N		US0022db0545c94b9298f1a168f83927c8	f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
115	!AYNUgzdwzj8WmzVtoYNosfqTz1Jrq1Xt9RlufTeV	2023-04-12 09:58:50.884696+00	f	Elena Grace	elena_grace	Chichirita	lena.geeknation@gmail.com	567547	\N	f	t	2023-04-11 07:01:50.398577+00	IN	EN	profile/avatar_bX8cLkh.jpeg	f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
121	!NG4FnsyTv9izeMvEgBTFUw6Je83zMrnyoIMRImY3	2023-04-20 07:50:57.432711+00	f	Maqsood	maqsood	Ahmed	maqsoodahmed15750@gmail.com	\N	\N	f	t	2023-04-20 07:49:52.995559+00	IN	EN		f	0.00		f	\N			f		\N	\N	t	\N	\N	\N		\N	3	\N	0.00	
113	!6qEfFejT8R0oQtkhCLgO6x3rqUUDGoBYWLXmhGYj	2023-04-10 18:46:05.769975+00	f	Muhammad	muhammad	Rehan	mohd.reehaan010@gmail.com	4564574	\N	f	t	2023-04-10 18:14:02.305569+00	IN	EN	profile/avatar_9JZ2Jkg.jpeg	f	0.00		f	\N			f		\N	\N	t	Best shop	\N	\N		\N	3	\N	0.00	Rehan Shop
92	pbkdf2_sha256$260000$D7yECh7wG0tnlAqQXmfGIO$SI53rNovkU/W9OqSYTX/dXLFYe63z+E6+DWaa4C4pe0=	2023-05-25 23:23:38.542427+00	t	Sarfraz	92	Meyo	sarfraz31105@gmail.com	0309934534	\N	f	t	2023-03-20 19:41:17+00	IN	EN	profile/avatar_rH4w6HS.jpeg	f	0.00		f	\N		US60f286b53ccd4b1fb7b518e25de9d835	f		\N	\N	t	We are experts in Amazon Seller Account opening and management. We are well versed with all features of Amazon like Amazon Search Engine, Product listing	united kingdom	united kingdom	cover_profile/bed.jpeg	2023-03-14	1	united kingdom	0.00	
98	!psIw07Nc2VIR2xN7GOxXlRvxluXpmPkGKbxZPQms	2023-05-25 16:54:49.66189+00	f	Adeel	adeel__2023-04-10 19:15:02.385213+00:00	Ahmad	adeelahmad31105@gmail.com__2023-04-10 19:15:02.385176+00:00	45645754	\N	f	t	2023-04-04 19:13:11.767284+00	IN	EN	profile/avatar_xQ5vOqw.jpeg	t	0.00		f	0101000020E6100000D20550E7E5753F408FBD83447F8F5240			f	Sultan Town, Lahore, Pakistan	31.4605393	74.2421428	t	Best Shoe Store Buyers and sellers can learn a lot about each other by looking at clear frontal face photos. Buyers and sellers can learn a lot about each other...	\N	\N	cover_profile/download_e9Pw9zH.jpg	\N	3	\N	0.00	Shoe Store2
99	!QNt4SguYsXN0jG5MJHL5DU8WyAIw9EGxqD1I9Cq9	2023-05-26 00:39:44.862465+00	f	Muhammad	muhammad__2023-04-10 17:17:36.427739+00:00	Sarfaraz	msarfaraz.meyo@gmail.com__2023-04-10 17:17:36.427702+00:00	123	\N	f	t	2023-04-04 19:31:35.734545+00	IN	EN	profile/avatar_pKoe4QY.jpeg	t	0.00		f	0101000020E610000063DCC3149BD740406E7E688B10435240			f	Islamabad, Pakistan	33.6844202	73.04788479999999	t	updated	Banda Aceh	Indonesia	cover_profile/z_index_error.png	2023-05-10	3	Aceh	0.00	faraz Shop Updated
101	pbkdf2_sha256$260000$lMqs1CIShMupDRDVH4QTvn$U1hfKge9mjVShnGb1ibOmGWwlYiGmlFwD69/dTEbv+c=	2023-05-26 03:17:50.93199+00	f	Richard	101	Alcaide	richard_alcaide@yahoo.com	\N	\N	f	t	2023-04-07 10:38:35.765516+00	IN	EN	profile/avatar_1ChsU0o.jpeg	f	0.00		f	0101000020E6100000A715F07C50F52C40602D2DD967395E40		USbe0b21cd94ba4d9abd38d48536c74af5	f	Cavite City, Cavite, Philippines	14.4791297	120.8969634	t	We doing Direct drop shipping from Distributor of the brands we have MOP only: Gcash No.: 0965567314 Shipping/payment Schedule: Mon-Fri (8am-3pm) Free Delivery is by LEX	\N	\N		\N	1	\N	0.00	My Shop
\.


--
-- Data for Name: api_user_categories; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_user_categories (id, user_id, category_id) FROM stdin;
2	64	2
3	64	3
4	64	4
6	7	2
9	7	13
11	73	10
12	73	4
15	75	2
16	75	4
18	75	9
19	81	9
21	81	7
\.


--
-- Data for Name: api_user_followers; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_user_followers (id, from_user_id, to_user_id) FROM stdin;
\.


--
-- Data for Name: api_user_groups; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_user_groups (id, user_id, group_id) FROM stdin;
1	1	1
4	2	1
717	113	1
10	4	1
14	5	1
41	6	1
47	7	1
53	8	1
800	114	1
805	115	1
862	116	1
865	117	1
872	118	1
900	119	1
79	15	1
916	120	1
934	121	1
987	122	1
1190	123	1
1235	124	1
1362	125	1
1462	126	1
175	60	1
209	61	1
266	62	1
272	64	1
352	65	1
376	66	1
410	67	1
412	68	1
423	69	1
438	70	1
440	71	1
445	72	1
448	73	1
452	74	1
455	75	1
459	76	1
461	77	1
466	78	1
469	79	1
472	80	1
475	81	1
479	82	1
482	83	1
487	84	1
490	85	1
493	86	1
498	87	1
501	88	1
507	90	1
510	91	1
526	92	1
550	93	1
558	94	1
592	95	1
594	96	1
601	97	1
612	98	1
618	99	1
638	100	1
643	101	1
656	102	1
661	103	1
666	104	1
\.


--
-- Data for Name: api_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.api_user_user_permissions (id, user_id, permission_id) FROM stdin;
1	2	2
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.auth_group (id, name) FROM stdin;
1	Individual
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	1	29
30	1	30
31	1	31
32	1	32
33	1	33
34	1	34
35	1	35
36	1	36
37	1	37
38	1	38
39	1	39
40	1	40
41	1	41
42	1	42
43	1	43
44	1	44
45	1	45
46	1	46
47	1	47
48	1	48
49	1	49
50	1	50
51	1	51
52	1	52
53	1	53
54	1	54
55	1	55
56	1	56
57	1	57
58	1	58
59	1	59
60	1	60
61	1	61
62	1	62
63	1	63
64	1	64
65	1	65
66	1	66
67	1	67
68	1	68
69	1	69
70	1	70
71	1	71
72	1	72
73	1	73
74	1	74
75	1	75
76	1	76
77	1	77
78	1	78
79	1	79
80	1	80
81	1	81
82	1	82
83	1	83
84	1	84
85	1	85
86	1	86
87	1	87
88	1	88
89	1	89
90	1	90
91	1	91
92	1	92
93	1	93
94	1	94
95	1	95
96	1	96
97	1	97
98	1	98
99	1	99
100	1	100
101	1	101
102	1	102
103	1	103
104	1	104
105	1	105
106	1	106
107	1	107
108	1	108
109	1	109
110	1	110
111	1	111
112	1	112
113	1	113
114	1	114
115	1	115
116	1	116
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add site	6	add_site
22	Can change site	6	change_site
23	Can delete site	6	delete_site
24	Can view site	6	view_site
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add token	8	add_tokenproxy
30	Can change token	8	change_tokenproxy
31	Can delete token	8	delete_tokenproxy
32	Can view token	8	view_tokenproxy
33	Can add email address	9	add_emailaddress
34	Can change email address	9	change_emailaddress
35	Can delete email address	9	delete_emailaddress
36	Can view email address	9	view_emailaddress
37	Can add email confirmation	10	add_emailconfirmation
38	Can change email confirmation	10	change_emailconfirmation
39	Can delete email confirmation	10	delete_emailconfirmation
40	Can view email confirmation	10	view_emailconfirmation
41	Can add social account	11	add_socialaccount
42	Can change social account	11	change_socialaccount
43	Can delete social account	11	delete_socialaccount
44	Can view social account	11	view_socialaccount
45	Can add social application	12	add_socialapp
46	Can change social application	12	change_socialapp
47	Can delete social application	12	delete_socialapp
48	Can view social application	12	view_socialapp
49	Can add social application token	13	add_socialtoken
50	Can change social application token	13	change_socialtoken
51	Can delete social application token	13	delete_socialtoken
52	Can view social application token	13	view_socialtoken
53	Can add Password Reset Token	14	add_resetpasswordtoken
54	Can change Password Reset Token	14	change_resetpasswordtoken
55	Can delete Password Reset Token	14	delete_resetpasswordtoken
56	Can view Password Reset Token	14	view_resetpasswordtoken
57	Can add user	15	add_user
58	Can change user	15	change_user
59	Can delete user	15	delete_user
60	Can view user	15	view_user
61	Can add brand	16	add_brand
62	Can change brand	16	change_brand
63	Can delete brand	16	delete_brand
64	Can view brand	16	view_brand
65	Can add category	17	add_category
66	Can change category	17	change_category
67	Can delete category	17	delete_category
68	Can view category	17	view_category
69	Can add image	18	add_image
70	Can change image	18	change_image
71	Can delete image	18	delete_image
72	Can view image	18	view_image
73	Can add product	19	add_product
74	Can change product	19	change_product
75	Can delete product	19	delete_product
76	Can view product	19	view_product
77	Can add favourite product	20	add_favouriteproduct
78	Can change favourite product	20	change_favouriteproduct
79	Can delete favourite product	20	delete_favouriteproduct
80	Can view favourite product	20	view_favouriteproduct
81	Can add order	21	add_order
82	Can change order	21	change_order
83	Can delete order	21	delete_order
84	Can view order	21	view_order
85	Can add order payment	22	add_orderpayment
86	Can change order payment	22	change_orderpayment
87	Can delete order payment	22	delete_orderpayment
88	Can view order payment	22	view_orderpayment
89	Can add review	23	add_review
90	Can change review	23	change_review
91	Can delete review	23	delete_review
92	Can view review	23	view_review
93	Can add promotion	24	add_promotion
94	Can change promotion	24	change_promotion
95	Can delete promotion	24	delete_promotion
96	Can view promotion	24	view_promotion
97	Can add seller	25	add_seller
98	Can change seller	25	change_seller
99	Can delete seller	25	delete_seller
100	Can view seller	25	view_seller
101	Can add room	26	add_room
102	Can change room	26	change_room
103	Can delete room	26	delete_room
104	Can view room	26	view_room
105	Can add notification	27	add_notification
106	Can change notification	27	change_notification
107	Can delete notification	27	delete_notification
108	Can view notification	27	view_notification
109	Can add make offer	28	add_makeoffer
110	Can change make offer	28	change_makeoffer
111	Can delete make offer	28	delete_makeoffer
112	Can view make offer	28	view_makeoffer
113	Can add banner ad	29	add_bannerad
114	Can change banner ad	29	change_bannerad
115	Can delete banner ad	29	delete_bannerad
116	Can view banner ad	29	view_bannerad
117	Can add activity log	30	add_activitylog
118	Can change activity log	30	change_activitylog
119	Can delete activity log	30	delete_activitylog
120	Can view activity log	30	view_activitylog
121	Can add badge	31	add_badge
122	Can change badge	31	change_badge
123	Can delete badge	31	delete_badge
124	Can view badge	31	view_badge
125	Can add buy badge	32	add_buybadge
126	Can change buy badge	32	change_buybadge
127	Can delete buy badge	32	delete_buybadge
128	Can view buy badge	32	view_buybadge
129	Can add my address book	33	add_myaddressbook
130	Can change my address book	33	change_myaddressbook
131	Can delete my address book	33	delete_myaddressbook
132	Can view my address book	33	view_myaddressbook
133	Can add report product	34	add_reportproduct
134	Can change report product	34	change_reportproduct
135	Can delete report product	34	delete_reportproduct
136	Can view report product	34	view_reportproduct
137	Can add report review	35	add_reportreview
138	Can change report review	35	change_reportreview
139	Can delete report review	35	delete_reportreview
140	Can view report review	35	view_reportreview
141	Can add otp	36	add_otp
142	Can change otp	36	change_otp
143	Can delete otp	36	delete_otp
144	Can view otp	36	view_otp
145	Can add general activity log	37	add_generalactivitylog
146	Can change general activity log	37	change_generalactivitylog
147	Can delete general activity log	37	delete_generalactivitylog
148	Can view general activity log	37	view_generalactivitylog
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-12-13 19:43:47.340231+00	1	https://yogeek.link/	2	[{"changed": {"fields": ["Domain name", "Display name"]}}]	6	1
2	2022-12-13 19:44:40.301676+00	1	SellBuy	1	[{"added": {}}]	12	1
3	2022-12-13 19:44:43.740771+00	1	SellBuy	2	[]	12	1
4	2022-12-13 19:45:18.307504+00	2	SellBuy	1	[{"added": {}}]	12	1
5	2022-12-13 19:46:45.099426+00	1	Sports & Leisure	1	[{"added": {}}]	17	1
6	2022-12-13 19:46:47.602694+00	1	Sports & Leisure	2	[]	17	1
7	2022-12-13 19:47:45.801723+00	2	Furniture	1	[{"added": {}}]	17	1
8	2022-12-13 19:48:32.022632+00	3	Baby & Kids	1	[{"added": {}}]	17	1
9	2022-12-13 19:49:21.381209+00	4	Hot Items	1	[{"added": {}}]	17	1
10	2022-12-13 19:49:59.37026+00	5	Electronic & Appliances	1	[{"added": {}}]	17	1
11	2022-12-13 19:51:08.769294+00	6	Women'S Fashion	1	[{"added": {}}]	17	1
12	2022-12-13 19:52:08.421105+00	7	Men'S Fashion	1	[{"added": {}}]	17	1
13	2022-12-13 19:53:30.665297+00	8	Health & Beauty	1	[{"added": {}}]	17	1
14	2022-12-13 19:54:07.704853+00	9	Games,Hobbies & Craft	1	[{"added": {}}]	17	1
15	2022-12-13 19:54:41.810974+00	10	Books,Music & Tickets	1	[{"added": {}}]	17	1
16	2022-12-13 19:55:13.932943+00	11	Sad Poetry	1	[{"added": {}}]	17	1
17	2022-12-13 19:56:02.488126+00	12	Minecraft	1	[{"added": {}}]	17	1
18	2022-12-13 19:56:35.300545+00	13	Architect	1	[{"added": {}}]	17	1
19	2022-12-13 19:59:24.393662+00	1	sellbuy	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Phone number", "Profile image"]}}]	15	1
20	2022-12-13 20:27:09.832898+00	2	aqib	2	[{"changed": {"fields": ["Superuser status", "User permissions", "Is_seller"]}}]	15	1
21	2022-12-13 21:28:00.622554+00	1	Image object (1)	1	[{"added": {}}]	18	1
22	2022-12-13 21:28:11.400085+00	1	Product object (1)	1	[{"added": {}}]	19	1
23	2022-12-14 18:27:55.964128+00	7	admin	2	[{"changed": {"fields": ["Superuser status", "Is_seller"]}}]	15	1
24	2022-12-14 19:49:41.184104+00	8	test1	2	[{"changed": {"fields": ["Is_seller"]}}]	15	1
25	2022-12-14 20:37:55.441129+00	1	Individual	2	[{"changed": {"fields": ["Permissions"]}}]	3	1
26	2022-12-14 20:40:56.200619+00	11	test5	3		15	1
27	2022-12-14 20:40:56.203612+00	10	test3	3		15	1
28	2022-12-14 20:40:56.205942+00	9	test2	3		15	1
29	2022-12-14 20:44:48.113589+00	12	test5	3		15	1
30	2022-12-16 18:46:40.835633+00	2	aqib	2	[{"changed": {"fields": ["Email address"]}}]	15	1
31	2022-12-16 20:56:32.868405+00	17	test	1	[{"added": {}}]	15	1
32	2022-12-16 20:57:27.800579+00	18	test3	1	[{"added": {}}]	15	1
33	2022-12-16 20:57:39.751918+00	18	test3	3		15	1
34	2022-12-16 20:57:39.754431+00	17	test	3		15	1
35	2022-12-16 20:57:39.756619+00	14	test6	3		15	1
36	2022-12-16 20:57:39.758203+00	13	test5	3		15	1
37	2022-12-16 20:58:21.718893+00	19	test	1	[{"added": {}}]	15	1
38	2022-12-16 20:58:29.663258+00	19	test	3		15	1
39	2022-12-16 20:58:55.023351+00	20	test	1	[{"added": {}}]	15	1
40	2022-12-16 20:59:04.205544+00	20	test	3		15	1
41	2022-12-16 21:00:18.993424+00	21	test6	3		15	1
42	2022-12-16 21:02:35.448015+00	32	test12	3		15	1
43	2022-12-16 21:02:35.451398+00	31	test11	3		15	1
44	2022-12-16 21:02:35.453175+00	30	test10	3		15	1
45	2022-12-16 21:02:35.455711+00	29	test9	3		15	1
46	2022-12-16 21:02:35.457446+00	28	test8	3		15	1
47	2022-12-16 21:02:35.460265+00	27	test7	3		15	1
48	2022-12-16 21:02:35.461931+00	26	test6	3		15	1
49	2022-12-16 21:02:35.464012+00	25	test5	3		15	1
50	2022-12-16 21:02:35.465565+00	24	test4	3		15	1
51	2022-12-16 21:02:35.467425+00	23	test3	3		15	1
52	2022-12-16 21:02:35.469104+00	22	test2	3		15	1
53	2022-12-16 21:03:58.583044+00	33	test2	3		15	1
54	2022-12-16 21:08:46.366463+00	34	aqibijaz11	2	[{"changed": {"fields": ["Email_slug", "Number_slug"]}}]	15	1
55	2022-12-16 21:10:19.998929+00	34	aqibijaz11	2	[]	15	1
56	2022-12-17 10:23:43.040007+00	36	test3	3		15	1
57	2022-12-17 10:23:43.043235+00	35	test2	3		15	1
58	2022-12-17 10:24:53.083264+00	42	test8	3		15	1
59	2022-12-17 10:24:53.086885+00	41	test7	3		15	1
60	2022-12-17 10:24:53.088479+00	40	test6	3		15	1
61	2022-12-17 10:24:53.091264+00	39	test5	3		15	1
62	2022-12-17 10:24:53.092901+00	38	test4	3		15	1
63	2022-12-17 10:24:53.095419+00	37	test3	3		15	1
64	2022-12-17 10:26:27.404167+00	50	test9	3		15	1
65	2022-12-17 10:26:27.406663+00	49	test8	3		15	1
66	2022-12-17 10:26:27.408373+00	48	test7	3		15	1
67	2022-12-17 10:26:27.409971+00	47	test6	3		15	1
68	2022-12-17 10:26:27.412168+00	46	test5	3		15	1
69	2022-12-17 10:26:27.426422+00	45	test4	3		15	1
70	2022-12-17 10:26:27.431722+00	44	test3	3		15	1
71	2022-12-17 10:26:27.434596+00	43	test2	3		15	1
72	2022-12-17 10:27:57.062462+00	59	test10	3		15	1
73	2022-12-17 10:27:57.065669+00	58	test9	3		15	1
74	2022-12-17 10:27:57.067348+00	57	test8	3		15	1
75	2022-12-17 10:27:57.07092+00	56	test7	3		15	1
76	2022-12-17 10:27:57.072457+00	55	test6	3		15	1
77	2022-12-17 10:27:57.074948+00	54	test5	3		15	1
78	2022-12-17 10:27:57.076604+00	53	test4	3		15	1
79	2022-12-17 10:27:57.078568+00	52	test3	3		15	1
80	2022-12-17 10:27:57.079925+00	51	test2	3		15	1
81	2022-12-20 07:36:09.631516+00	1	https://yogeek.shop/	2	[{"changed": {"fields": ["Domain name", "Display name"]}}]	6	1
82	2022-12-24 22:53:58.298868+00	63	aqibijaz112	2	[{"changed": {"fields": ["Email_slug", "Number_slug"]}}]	15	1
83	2022-12-24 23:03:12.557635+00	64	testuser	2	[{"changed": {"fields": ["Email_slug", "Number_slug"]}}]	15	1
84	2022-12-24 23:03:26.758851+00	63	aqibijaz112	3		15	1
85	2022-12-24 23:03:38.619657+00	34	aqibijaz11	3		15	1
86	2022-12-24 23:03:50.311737+00	16	aqibijaz1	3		15	1
87	2022-12-24 23:15:34.544401+00	20	Product object (20)	2	[{"changed": {"fields": ["Description"]}}]	19	1
88	2022-12-27 11:20:05.773228+00	2	aqib	2	[{"changed": {"fields": ["Lat", "Long"]}}]	15	1
89	2023-02-23 18:35:51.658487+00	3	muhammad	2	[{"changed": {"fields": ["Profile image", "Cover image", "Number_slug"]}}]	15	1
90	2023-02-23 18:37:29.078066+00	5	zubair	2	[{"changed": {"fields": ["Cover image", "Number_slug"]}}]	15	1
91	2023-02-23 18:38:00.483628+00	5	zubair	2	[{"changed": {"fields": ["Email_slug"]}}]	15	1
92	2023-02-23 18:38:20.376549+00	5	zubair	2	[{"changed": {"fields": ["Email_slug", "Number_slug"]}}]	15	1
93	2023-03-11 21:08:56.952902+00	3	muhammad	3		15	1
94	2023-03-20 21:47:08.322244+00	15	Mobile	1	[{"added": {}}]	17	1
95	2023-03-30 21:44:33.625508+00	94	94	2	[{"changed": {"fields": ["Superuser status", "Account type", "Cover image", "Bio"]}}]	15	1
96	2023-03-31 21:22:25.687369+00	92	92	2	[{"changed": {"fields": ["Superuser status", "Cover image"]}}]	15	1
97	2023-04-04 10:37:15.912619+00	7	admin	2	[{"changed": {"fields": ["Password", "Cover image"]}}]	15	1
98	2023-04-10 18:03:55.835959+00	2	SellBuy	2	[]	12	1
99	2023-04-10 18:06:44.364826+00	89	89	3		15	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	sites	site
7	authtoken	token
8	authtoken	tokenproxy
9	account	emailaddress
10	account	emailconfirmation
11	socialaccount	socialaccount
12	socialaccount	socialapp
13	socialaccount	socialtoken
14	django_rest_passwordreset	resetpasswordtoken
15	api	user
16	api	brand
17	api	category
18	api	image
19	api	product
20	api	favouriteproduct
21	api	order
22	api	orderpayment
23	api	review
24	api	promotion
25	api	seller
26	api	room
27	api	notification
28	api	makeoffer
29	api	bannerad
30	api	activitylog
31	api	badge
32	api	buybadge
33	api	myaddressbook
34	api	reportproduct
35	api	reportreview
36	api	otp
37	api	generalactivitylog
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-12-13 19:26:42.561065+00
2	contenttypes	0002_remove_content_type_name	2022-12-13 19:26:42.574138+00
3	auth	0001_initial	2022-12-13 19:26:42.642971+00
4	auth	0002_alter_permission_name_max_length	2022-12-13 19:26:42.651939+00
5	auth	0003_alter_user_email_max_length	2022-12-13 19:26:42.660389+00
6	auth	0004_alter_user_username_opts	2022-12-13 19:26:42.668356+00
7	auth	0005_alter_user_last_login_null	2022-12-13 19:26:42.676327+00
8	auth	0006_require_contenttypes_0002	2022-12-13 19:26:42.679339+00
9	auth	0007_alter_validators_add_error_messages	2022-12-13 19:26:42.6874+00
10	auth	0008_alter_user_username_max_length	2022-12-13 19:26:42.695127+00
11	auth	0009_alter_user_last_name_max_length	2022-12-13 19:26:42.703535+00
12	auth	0010_alter_group_name_max_length	2022-12-13 19:26:42.712092+00
13	auth	0011_update_proxy_permissions	2022-12-13 19:26:42.722316+00
14	auth	0012_alter_user_first_name_max_length	2022-12-13 19:26:42.737167+00
15	api	0001_initial	2022-12-13 19:26:42.817949+00
16	account	0001_initial	2022-12-13 19:26:42.87691+00
17	account	0002_email_max_length	2022-12-13 19:26:42.888685+00
18	admin	0001_initial	2022-12-13 19:26:42.926346+00
19	admin	0002_logentry_remove_auto_add	2022-12-13 19:26:42.93731+00
20	admin	0003_logentry_add_action_flag_choices	2022-12-13 19:26:42.948979+00
21	api	0002_brand_category_image_product	2022-12-13 19:26:43.084731+00
22	api	0003_product_user	2022-12-13 19:26:43.10947+00
23	api	0004_category_icon	2022-12-13 19:26:43.118577+00
24	api	0005_auto_20220921_0542	2022-12-13 19:26:43.147046+00
25	api	0006_favouriteproduct	2022-12-13 19:26:43.187892+00
26	api	0007_user_profile_image	2022-12-13 19:26:43.203329+00
27	api	0008_product_product_status	2022-12-13 19:26:43.221121+00
28	api	0009_order_orderpayment	2022-12-13 19:26:43.315223+00
29	api	0010_review	2022-12-13 19:26:43.357266+00
30	api	0011_user_is_deleted	2022-12-13 19:26:43.375994+00
31	api	0012_auto_20221213_1924	2022-12-13 19:26:43.948091+00
32	authtoken	0001_initial	2022-12-13 19:26:43.995033+00
33	authtoken	0002_auto_20160226_1747	2022-12-13 19:26:44.084871+00
34	authtoken	0003_tokenproxy	2022-12-13 19:26:44.090792+00
35	django_rest_passwordreset	0001_initial	2022-12-13 19:26:44.142616+00
36	django_rest_passwordreset	0002_pk_migration	2022-12-13 19:26:44.250807+00
37	django_rest_passwordreset	0003_allow_blank_and_null_fields	2022-12-13 19:26:44.299188+00
38	sessions	0001_initial	2022-12-13 19:26:44.323207+00
39	sites	0001_initial	2022-12-13 19:26:44.334522+00
40	sites	0002_alter_domain_unique	2022-12-13 19:26:44.353284+00
41	socialaccount	0001_initial	2022-12-13 19:26:44.518534+00
42	socialaccount	0002_token_max_lengths	2022-12-13 19:26:44.652602+00
43	socialaccount	0003_extra_data_default_dict	2022-12-13 19:26:44.680511+00
44	api	0013_user_location_name	2022-12-14 19:10:56.304287+00
45	api	0014_auto_20221227_1117	2022-12-27 11:17:39.838476+00
46	api	0015_auto_20230222_1936	2023-02-22 19:36:39.1067+00
47	api	0016_auto_20230222_1938	2023-02-22 19:38:38.603856+00
48	api	0017_auto_20230311_2107	2023-03-11 21:07:59.092278+00
49	api	0018_user_shop_name	2023-04-10 18:11:35.723556+00
50	api	0019_generalactivitylog	2023-04-10 20:58:01.304239+00
51	api	0020_auto_20230518_2101	2023-05-18 21:01:38.24373+00
\.


--
-- Data for Name: django_rest_passwordreset_resetpasswordtoken; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.django_rest_passwordreset_resetpasswordtoken (created_at, key, ip_address, user_agent, user_id, id) FROM stdin;
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
nghq51iiu2768i3lht4dterlkzshhjyj	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p7Y32:0IACUFwX_t9TyVGAxd0rnF1ESYt4Gg4v7TCJfoSXfGw	2023-01-03 08:32:28.800945+00
2zi020kn09c2ozbdr7tz2ka3iyehlv1m	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pBN1N:sx3EAJxsMAyWmAvVwPU8G9HRrxav4uDDX65WNd7Kjhg	2023-01-13 21:34:33.586448+00
mgt0voi3o8le95peq1mk4roly3jn0vmb	.eJxVjM0OgyAQhN-Fc2MoKj_e2hchu8sSSSkmFXpp-u7VxovH-Wbm-wggWlqp_s2vFBMHz09IWUyl5XwRHlqdfVv55VMQk1DixBDowWUvIOcdd4eu-2-Oeu1uW-JSE0FNS7kfr5NqhnXePBg4sNYDolHy2kunDfUkLWqwzug-2IGcRpCoRgJkHmK0o1EmxOgkjuL7A5C5SEk:1p5BV4:9Ln1lS4a_h7UpjVHsXe5ltS2k27Z-DGzSs8-nVVf5GU	2022-12-27 20:03:38.465467+00
c71e0jrlwg6rjgrbrqu36zelrbks945n	.eJxVjMsOgyAURP-FdWMQvTzctT9CLnCJpBQThW6a_nu1ceNy5sycD0Pvl1aqfdOaYqJg6YUps6m0nG_MYquzbRutNgU2sYFdOof-SeUAmPNRd6eu-29OvHX3PVGpyWNNS3mcr4tqxm3ePQadpFGCdkrCgJyDgwA0xtj3OoadRGUGNyouBAoNWkgA6YwLqAzXA_v-AG5XRtM:1p5BW0:mkcf5WSJsGMNHKTjyBYx0tG8AZSomN-uwzb_MGseUnY	2022-12-27 20:04:36.761822+00
9adgt2u4yljzr45ium1q0tsnf6gbpcgh	.eJxVjE0OwiAQhe8ya9PMAKltd3oRMsCQEpEmFtwY725ruunmJe_v-wB7v7RS7VteKSYJVp6cMkyl5XwBy63Otq3ysinABAZOmWP_kLIXnPMedweu-2-Oeu1um5NSk-ealnI_XifUzOu8cUiEr9gTIo69NqSjaD_ESAaVwpEkRA6aRhnUJoqN40H66DST0w49fH9swUe5:1p5BWW:PZQGL9P6ATj7s6vPbNp3YOxWDVwFzF66aTP6A1k9IFs	2022-12-27 20:05:08.917098+00
mfnnrh0rayfi1idn3b9nhm1jswghmonh	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p5Bmj:1pl9Rf_rhNOREYRoah7zyBWuWxyRsWwl9OXE7o_LUIM	2022-12-27 20:21:53.307151+00
9x2hxgzfwtlpqjw9cxy9llb9j9ct6m3r	.eJxVjDEOwjAMRe-SGUW4aYLFyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izAXP43ZjSQ-sG5E711mxqdZkntptid9rttYk-L7v7d1Col2-dxwFZ0EOgBFmVUf3RSU7kvaADGgcAyJnZeXJBHUqioIRJFeiE5v0BB4M5FQ:1p5BnS:BcOUwam2CZeEaoSdh0qXAC69nwHne8-itxOM7mh6Jek	2022-12-27 20:22:38.271524+00
88beoiyrye5u5t8ymek2fbdfm8rznjdf	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p5BsV:7Q6IellDgroZCYoO55fyMlDxsgSRsnsHCdf-dBuKJIA	2022-12-27 20:27:51.790956+00
fuwkh5wfhc9fhrpsh1fw3le8bsbkznf3	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p5Btq:fGZmguNpq8T8mL8RtT5lLXpywsav3qqtBMM_SgSX06Y	2022-12-27 20:29:14.983562+00
jvmblh43e7tj93iw1xxd349of2r30fus	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p5Cyu:OmklUb6cX7QPd8K9JSys1HkgOQpSp_-pJXmtauRRuA0	2022-12-27 21:38:32.496552+00
yatjd23f08pl5t1ni5tgy60cj7lqveg2	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p5D6A:YtG86fg2TCUAziA0-HcMIFbp9eU7dDTUP8K-QiJ5oLQ	2022-12-27 21:46:02.285943+00
b044wjdrh222gh009wss82vsx9ij9c5e	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p5DxI:Atj7ULJ9EsMeOYl0ouq7dnbFZKFYs2-LCQscbT9ln9E	2022-12-27 22:40:56.103199+00
i8o7s246xhe1wev4xs4wqfaaggnctkbd	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p5E2a:EitVgTAzC0OBkDrleWZ8uZB9xvPXHTZTJCmgkom6O_o	2022-12-27 22:46:24.361282+00
sdd6w3s6hd1fm7gxf1o1iedn0xnfimeo	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p5EA9:Ymcei7f4-Z3Gqy3ntR-4jdr_ukc99MsFcaAXD8gKWhM	2022-12-27 22:54:13.278647+00
hq9pthcv3qmipb2fjoyk53yzsns2pai3	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p5LGT:g8GTqZSHTWmRZX2I8KkiWDul8DIZjqqwXKQnTp-hjCo	2022-12-28 06:29:13.136986+00
1q13vcmv0sdlrb6mc5dtv04t1fwaiony	.eJxVjMsOgyAURP-FdWOovMRd_RFyuVwiKcVEoZum_15t3LicMzPnwwBxaaW6N60pJgqOXpAyG0vL-cYctDq7ttHqUmAj0-zCPOCTylFAzgfuTl3335z11j32RKUmhJqWMp2vi2qGbd49ngskFJYGAtsbbzRx6DVp5QdJ0pg-CDLGxqiVUpIHwRVZrUDfQfqI7PsDi-xHxg:1p5Meh:uGMJtM4q4dpiMr2DKZ7bHJyoUMPt2qM7mmx1xIFBKHE	2022-12-28 07:58:19.76144+00
5mpc8util0wu9ga14ugv5fwu6lfx0gig	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p5WGy:7NL6r9DsSt0oRDggfl6XNN0HQJ4ao1jAWU3Ka2WzxvA	2022-12-28 18:14:28.789648+00
xiy8m10wln0581r92ejk57yzthtugr0r	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p5WOF:9LiLgZ6yocXu2VgDgyD9AyWMZi6fu1yrTv2OtfCP-tI	2022-12-28 18:21:59.351948+00
s7bxnsxikvqe5bw32fzfp0enltqtnw8q	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p5WUN:CjkE6TMSoUmfDejmRqUoRfhNIAGB8tSwpqSCDKfCmj4	2022-12-28 18:28:19.094719+00
9essrhd3a4zx3ccq74ww74sezo5jcnvl	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p5Wuy:SG6G-MpAr3Yw65IsFA9IcoOy56pcJxLASW2g_Sy27UE	2022-12-28 18:55:48.954506+00
fgufgi4s95hy9fvi3dg6d199slgfuim3	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p5XRN:g5p9AMTskIerAX355gG_b_sI-Xyr5sY-jp1DZkLRXqc	2022-12-28 19:29:17.433583+00
di1uqx9qvvq4up7gnzskjr0suoe8m6hb	.eJxVjDsOwjAQBe_iGlkbO_5R0ucM1q694ACypTipEHeHSCmgfTPzXiLitpa4dV7inMVZeHH63QjTg-sO8h3rrcnU6rrMJHdFHrTLqWV-Xg7376BgL98ayCOggjGNOqAhdHC1SmsDKTOM2lvjgGmwXimPTjERameZQ0hpQCveH8_zN48:1p5Xlm:apiCyvziTQi_aDum-LLPaCV1E1FJtrsTiFgIoudy1Tc	2022-12-28 19:50:22.780674+00
qh823g759376xkfa04kfiwdvrecdazg7	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p5XmS:VPYEjTbh9A1WKWMHbYkWLH_SokREreRMyMnX0luVgZ0	2022-12-28 19:51:04.390831+00
839ziqfjmi6krz4ukufbvf3ud8931ugf	.eJxVjDsOwjAQBe_iGlkbO_5R0ucM1q694ACypTipEHeHSCmgfTPzXiLitpa4dV7inMVZeHH63QjTg-sO8h3rrcnU6rrMJHdFHrTLqWV-Xg7376BgL98ayCOggjGNOqAhdHC1SmsDKTOM2lvjgGmwXimPTjERameZQ0hpQCveH8_zN48:1p5Xmj:js21lALgbgug4oXxZJhDZsl9WjnrnVpxx1Y341ZBUPg	2022-12-28 19:51:21.645305+00
e3aferegub3b8l0m0czrh9f1rs5ahjtv	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p5Y1I:3MXdCPgVcqP1DwqMT0tBDF-EV6j3qdbXDNLkWKfGBCc	2022-12-28 20:06:24.6096+00
c8nmwo4myw7ihwya6p4vjzu5wmy6tv95	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p5gWr:N0XFFqnwPp22u7wPE1yMJOfTpgMvehkwhquWnpW02rg	2022-12-29 05:11:33.415161+00
cwr42zy80gjqkq7dv3byujxkpx8x9ag7	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p5gXD:w1_SQk6bL0h44mzYES_WQd5kQZunuyOhVqDObirKMGg	2022-12-29 05:11:55.515791+00
b4pup2ewwgy0p4vok7c8s5geg1fpercg	.eJxVjMsOgjAUBf-la9NAL_Th0r3fQO6rFjWQUFgZ_11JWOj2zMx5mQG3tQxb1WUYxZxN25vT70jID512InecbrPleVqXkeyu2INWe51Fn5fD_TsoWMu3Ro8iPRMQZUixY-18BtUmKgtjjlH7EDJByylFCg6gEceMzmtwJOb9AU03OY8:1p6Fuv:K93xwR6mhv9XcBI15GsBlPAfjPb3A5YZP1ftx_vGZU4	2022-12-30 18:58:45.532536+00
2fu91kbz49pyllhmxn9pq1ejo018z53n	.eJxVjMsOgjAUBf-la9NAL_Th0r3fQO6rFjWQUFgZ_11JWOj2zMx5mQG3tQxb1WUYxZxN25vT70jID512InecbrPleVqXkeyu2INWe51Fn5fD_TsoWMu3Ro8iPRMQZUixY-18BtUmKgtjjlH7EDJByylFCg6gEceMzmtwJOb9AU03OY8:1p6G5a:JMqodrP-tIuslfE0y0NTWgjIFn0WGI03QuqzZR7ZVAI	2022-12-30 19:09:46.989232+00
x37tvlfftyrpv4vqkl7go7xl8t4d8h5z	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p6Gnn:SYnsgF4Y9vFVeDE1JbShehXopKfzA_n9wRk_gDDxVrA	2022-12-30 19:55:27.593111+00
1i59w37edt9fw35ex2ghe35ecguwaqcv	.eJxVjDEOwjAMRe-SGUW4aYLFyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izAXP43ZjSQ-sG5E711mxqdZkntptid9rttYk-L7v7d1Col2-dxwFZ0EOgBFmVUf3RSU7kvaADGgcAyJnZeXJBHUqioIRJFeiE5v0BB4M5FQ:1p6Hxa:pUkZdXXVG8IPkDxO3LCKHIb4_wMTKMuD2p7GXy5HXPw	2022-12-30 21:09:38.690778+00
6udnfzcsv501xabapppta78z7j43xhbf	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p6eN7:g1xlQOH2ftpHJjT3gzJbswPw97j9H3noy_f98hLqLh4	2022-12-31 21:05:29.998651+00
ryks7ajdk62oifdllsu85gusdnet389r	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p6ewS:gpeXNKhxKx73tC210WO7VdW7j6_N4i_WwwQzHR7CT6c	2022-12-31 21:42:00.233392+00
5ckd5fdakfwy7t707npyak12qhq8vr4j	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p6exF:dYq0ZHp_WmJAz4CFglzAq_Be9uw5Gt4g6q9PcxKJzM0	2022-12-31 21:42:49.638112+00
jqknvljy9glx5ykps7fvmtwr1bfum3au	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p6f1F:C0sdgNTW-fcKqk80KrdcEIS76w5Fe51PsU-UMQnnLzs	2022-12-31 21:46:57.368987+00
doke0yegka7im201ttpzc7pkkc7suwn2	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p6f2o:793NsLYxe9eYrudvJ1b4qCDTg9UR88rkeFNzuiVtSPo	2022-12-31 21:48:34.360119+00
sy0u10v2s7ig6pufmo2mzn1593f66jem	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p6f50:oDRUopMbC7LaId2pxAvF8lK6UerIdcOQQbutJE4AB4A	2022-12-31 21:50:50.264683+00
1kc2r70a1f7pdzoh60eb8024u6zpmk5y	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p6f7S:XfiW1Gl2yc3ZQSY_BnKQIyQDQot9Qz6UhRc2PiPeHcQ	2022-12-31 21:53:22.915042+00
s01kdex88uiqud5m4mfahgtt0r0pk5yn	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p6fAy:9ByITZZyRZp7N6AMxirVDaOQZwygkbmfq6_-_s-bdpw	2022-12-31 21:57:00.52776+00
9mtk3ywgrydil8rdfgrf4anmvzy2f1t4	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p6fHu:jtUVdiEFGai92CAFVUJC2aHe9FTkVRceJOTR9nmdAok	2022-12-31 22:04:10.597209+00
6d5212trzwlwygk8d1yrzz1jxpe06fu2	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p6fKp:cwjLomXpu9BJavXej3YxoiYtLkGS1JvFCJkuUw72spY	2022-12-31 22:07:11.729373+00
2z5mzdutwp876y2v0yfx0e630qenfvrp	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p74JT:EkgJXGW2H2tesKxWhpDF8EiowSFM54d6idgOyxcWC_U	2023-01-02 00:47:27.972311+00
kf2hrm28h5hbshh2und5vkrwx4dz6f9l	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p754V:ZeN7T_wvRnP4gtA0c8m8q-acysdIJUdBQ5hui-DMK0Q	2023-01-02 01:36:03.887587+00
3jthsqo12hphzysoww08vj5xq5y5fuo6	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p75Bq:UhvtVpCickfxmKM57aWSBzYHWwWo_EsZb9mvNJMtSWI	2023-01-02 01:43:38.563756+00
5qaxgunzfxifbbpy9vf8sbe701ld6jqd	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p75iV:pZxED1pYnwNWnQGmcrs66lJ0I4Qc1LK-N-dIA7K-0io	2023-01-02 02:17:23.404388+00
l9ixa7cpoqqjqyhs0nztimdal4pzeyom	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p764N:I3iPnDCyYyh1sUzl1-t0VXIR261mdosHUMVMeQJgZlY	2023-01-02 02:39:59.145328+00
rtce386t0w17w49eav9rx05m7vygynfg	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p79C2:hgHkgwPCc8YA0ZG3M-z0M3mWtNX971D0tAKn9USPfKA	2023-01-02 06:00:06.896243+00
qrguvlj6w1o5oacqwxz82sqxbc9134fv	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p7RkD:JHT3scec8kFId39I4cCF2V-lxzo3_y9sMimzrnm-vmU	2023-01-03 01:48:37.745464+00
e0r6vw2d2qmfr05a7iam2t57o8wbfaao	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p7RnG:-U6Gs_wC9qPpEBD-PpJrjxVu1W5koxDIPzs15ljXF3E	2023-01-03 01:51:46.297378+00
tyrrma8gmttb8nvhc3fnv4pgj4rv6k8u	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1p9DYm:EuiF5smSSYyrFyPETqJvYB5wzK6JGpG8gaNYXaAeMtk	2023-01-07 23:04:08.242429+00
k1u7zc7i3775wu0m5cfywxdz61osfa0g	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p7TB7:aiDfAYcj_jjyGmili_Asbbr9_WZ2_dwcNDpEnLqboQs	2023-01-03 03:20:29.653078+00
orxpggdjyms4zeyqac505f1nafz2qbwy	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p7Y4z:HNw03gG_avSj0h9huWieFUme1B0Bw--zO3uqjjlBTVU	2023-01-03 08:34:29.504067+00
l8nc178likvdw3m22qbldkisz9wg4y7u	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p7TXa:i46S7YcjG8XKwhjBMXl8BdfLPPdGLzRr-mkvUBg5FaA	2023-01-03 03:43:42.383765+00
zmmwwaxorjkqusk2p0wgfd26wydpqz7u	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p7Y6U:G3Y3y2KON52RQ5MDRGxP7kAlj17Rghk7Hbi97r-SfmE	2023-01-03 08:36:02.430461+00
ak9lff4r8vnvgpl28u1hvlx95612en3d	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p7WYh:iYOtrObBex03LsjE57yZaIqhRFhdsqSzGugJTfVCekU	2023-01-03 06:57:03.922605+00
xwk387ckx5387o6nh2xbst1djss4ljze	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p7YAf:coIqxkpqEvKLWhHbw5lPifzsA2xF5PHIX4jTdKxPSZA	2023-01-03 08:40:21.219867+00
8q8f5wg1910j0uhehhqdk4xos878slpi	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p7XEn:AT5M27XHR_lSF9qdfLFIPWY4mLaM_SNJKT6RYpMQVsw	2023-01-03 07:40:33.58291+00
ns49t08cj9zwqfgrt2b1enmf1390ul02	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p7isW:FnhcuRNqyvMrPKHtOZcj2DDx9cLRAlzCGqdK235rOIk	2023-01-03 20:06:20.858685+00
csm68jkykgw7md9828fhwkmj4ml8z1dj	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p7XHX:8AveyXifyNNYLYU7SZ2CuPRIVWGZyLHmMh64GRP9gOQ	2023-01-03 07:43:23.262572+00
jec4plgnzeenh59c8tfl9wysu3j92tjk	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p7jCn:0YV8o02938L3zGn3hn3PpgVJqM3SHgsD01Z88cEo9oY	2023-01-03 20:27:17.903568+00
tsxytbhizdo2rr39heg6aal3ijbqnxy1	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p7XPw:6Wi7w2XQPq6-RWatsP0uclfI8C4E7_NX5k8Z_EytwnY	2023-01-03 07:52:04.736222+00
ecciq0oqk9rq03zmgypurjid7h90ifq0	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p7jSh:x-TvdXKdKxq_3mKP9xbDfrk4s0GSjPaxfjxGzJSJcBs	2023-01-03 20:43:43.280285+00
h7ef1h77vdwgmx0hv47wpzz1lbt5s154	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p7jZc:KNH23-4KCnrDAoLtwLIC7WFE5E4bVkNKIOdm48-5BL4	2023-01-03 20:50:52.476756+00
bie6rgtmfilhnxlskixqe765hypxgofd	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p7jtd:QuWS8olmDirEr9RkIaGC5RyLkd2uywVmuyC7Jy5JDQI	2023-01-03 21:11:33.782265+00
ybpihaie5d6f2gxc53ou3vx0s21anr7k	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p7pkm:JDM5Cazcs1AfviJiDJc-QUfctTwLxNgyw1R-6YiVLVg	2023-01-04 03:26:48.161765+00
8oy3p913kjghu6jewec6c92bwjgpvkgl	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p7tHL:tiLZ2W36RzODex63SZIlib6iAoMSYBXHflOVkuaoh0E	2023-01-04 07:12:39.083567+00
fhkd95nr5wrz74anoh3b8z51c4rxux4v	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p85ip:pDEXn9KWAAZFCdKxrvr1L4CDlHPns3xtfsD5RBrM87E	2023-01-04 20:29:51.304646+00
fi87st7nojfi7577k8aa68b6712zvyfz	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p85kK:Kc9-ryUEq26ALv_Sb-lkEMch6oFNlFCXMk-FSumsxKY	2023-01-04 20:31:24.283888+00
s68nstpun542ldluk8edbm80qy0p34vk	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p85t8:q1te1rMN-EN3WuKD7FyYshmQw6EUZx70kjkKX8LU5yc	2023-01-04 20:40:30.195841+00
3vt7pr9unvq3k6br63e9nlq7bkvgoz40	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p86zW:B5TiUQtDGTUyGkcEOgXSptrExx8XbQzq7UMc25k_tWA	2023-01-04 21:51:10.343713+00
eunqm97iw8orwwbvjwhppvej5fnbwfb4	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p8HLO:XYPMJ_DQjTMYjFmeJB8i7l8E7I8yv8rKdOdh5OW0zkk	2023-01-05 08:54:26.216062+00
1xhidmrkze9yuo719j1q5ghs8j3fxzbo	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p8HLj:Io7DRUUxD8mD9I7NYxwd1Dr_rv9JaNRO-Idiq-0S3xM	2023-01-05 08:54:47.851842+00
6ghjc87s2aql43j4t0bg7ksrl7rmjku2	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p8SP2:ya54fHuwV8nSPnlgxIzkywixx9yVtfueyO9DWEGG73c	2023-01-05 20:42:56.7076+00
tbouh7cn87yhvn7q0v9en5db93sua333	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p8TDK:MKSjbjShUeJh8BjQHQiMajB5I1J1TR7CZ-P7p0ggqEg	2023-01-05 21:34:54.715854+00
mlqhmhshef978b18hby8dzva4x6og6w1	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p8oAj:Tkn0FplbBcAcjPa-5iVOQCZq3LSzF9LxGkmDqCDpbZM	2023-01-06 19:57:37.200184+00
my258phbo31yxsveq5uas9xe25yortw0	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p8oJj:wPbzLxfxLCL3ULJz3Jq-lfyQ8L8nTXvMGah9N1JpaW0	2023-01-06 20:06:55.846736+00
vm297ndr60t8p0cvhhz6fyvbqo065l2x	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p8oKA:1WO0CsCdUyW-E1Jixd5z11yoebiwFHobygWCG2tipZI	2023-01-06 20:07:22.060173+00
5ogcu4luzq6hmgjofs7uot8xf7hwjcpk	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pBN26:Sg4UWzSPz0xPE0_CJ0wpmZoaho6_VJTsISlWtzk6wug	2023-01-13 21:35:18.389914+00
nhm1ur26bqpvu361u6hj1fb5aefb7b03	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1pcaPk:9lQ69r8LPl2AL_5DVUyE2DfB-sQfoKOD5o7k0GVdDQ0	2023-03-29 23:20:12.674395+00
8eotaih9ph4eah1u8hqc9wkhvxv4klx0	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pSNOy:-2S3tO_J8TgqCUJyBXT7GcNc-CBDFLKFodGPgm5CrR4	2023-03-01 19:25:12.255466+00
ep0lcn9l5ugnxebn9d9nzoqkk58tbof3	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1phCwU:dfPvY3QMRAjtL0bsrB9eY5F05qtDBwCV_XUB45DPWIM	2023-04-11 17:17:06.024714+00
nlhrsnvq1rey7j2objei52r81e3li0bh	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pWhOZ:23cxezjzbXIJr5jlGmRZyGETiFwHTRYOLg1vCBwo1Bg	2023-03-13 17:34:39.424631+00
17w1k83etfkuw9ia8z389ov6u6fjwarj	.eJyVVGtz6jYQ_SutP18nMhgwzHSmhAlJCI_wynXodDSyLBtRIflaMsHO8N8rgW2STttpv2l3j_dx9qw_LCkwRQxhLDKu4MViIqbc6n1Ypds8aWj1eMbYNyuTJIVXM0nFgYYktXpWLETMiKUhJmw5jucC0HLbntv1vI4HQMNt6ihDUsGyxiVHiBSBO0E5qdOSo0oR1AFUVf_HfGSPKNPxLUqSPGEoJ6nT7Tq_xsZ_g8VeYw4kpRElISzBKs3IN4ujPdEfvhBF0p9eENfAmB4Ih58D2hmhPWV57T0DE4pVlhp7q1Qie7e3bNu8uVBgKMKCK8KVqX-LbvsP031-RH2_s4PJ4riwydtmtF5FtPVezMmWuK9TFi5aBXC_L36R3baNDVECI2YqEG6dThfmv-4iQVK-i9Sw8_MoDPzWaCdGwAUDBsBuvU0crJZ3cXp4xKvXoVM0i_d98rcboBLKLCHppUSEmNT0RDTVuL9wYRClq8r0hZf_so1kKzipZzBGo7IY4nGGYpPvfqqhlTJVnhjf07TkRVHBr9-o-il4fH1fYPDa7lkGObwmKCc14ysURZ8dIWF65LB2aaFHlBFI9-f2LjWwOJhr-OzSnyKstIwqlZ0trfDKNsUIY5-I_qJ_qwEaTRu4tgNWwOu1QM9p3HiN1kb3r94powLK8z1UZEPJsvhi82wf6H6uDr0EKLEwOgWmW01lmled6pFV3XZART0UVTUmFEH1jAm_3Lk5OiUUYjBAYUykzn2qs32cqrZQGKZEShP_7V9-IP_nfCsKk1RTbgYx5ul3084fhH-9DTO6sZyriK7BEm_lqNG9QaBPWFcOJstHFR_s4ToqnkEwip7hj9GdvxFwfr-xJ2w9x-7Sd3cwU_7Mf5KT1wDTtTumAX0pCvx2n6BAhONoOW7yoj3ckXVQtGfbw_GOLiM5O9qt2XgymxeLpjh0m4-bDeXrB0Tijo0C7KN5p5uMs-nWH0ztkM-KcWf20F95jbU_QYP47bn_XSz7i6flcD50s3C0HaHx4GGHn8FkjjLp5aunMd_1gdNuW-V8WmY4JaqUyjGheh2wupXT6fQn9MYBsw:1plnE4:_ralNZW_GWVLimJk6ChvfxnDPu1LxrnSMlwMWxpCFbA	2023-04-24 08:50:12.834718+00
egbuqvziq0rgzuvsulyc28ncrr8vui8o	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pjt3a:2FGcoMDCHwCzeIZ_9EnuxUNUw7-MX2O77NNkDHVmW0s	2023-04-19 02:39:30.393289+00
xdydr7qchbd25vzvuxdg1edzpitjxck4	.eJxVjEEOwiAQRe_C2pC2AwO4dO8ZyAwDUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1FnFYw6_Y5M6ZGnncidptus0zyty8h6V_RBm77Okp-Xw_07qNTqt0bTC7N31ltkYEkSTCgl44AGoBtcb1MO7D04IOiLgDPYSWfQMRAV9f4AAPM3uA:1plzFe:71Ucy6EuQBCO2o73c4RhhrR0hU5oJH9vNfxiwMH1jgg	2023-04-24 21:40:38.485269+00
mtpolcbnjl8t8hv202crl26mk83pigad	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1plLbH:agHVtc1CsYr4s4KLRkRkMUNuFTAIN0XkqxqXg_lkmBk	2023-04-23 03:20:19.858311+00
0qc0b4q6gsdkkdu8m2zbf8lecjjauu0q	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pmPGu:QESZbnhTHOfSwgt7pqiqGCOuahT-Lao3TKSrkGmE6YE	2023-04-26 01:27:40.476354+00
dtbsqbvbur1gu3jhe3bq73svdlbfycrd	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1ps4M6:Is1oN_C7e8SenE-vveFUOURLVpbL6QoctdkYKGZOnyQ	2023-05-11 16:20:26.792268+00
y4bdgrvw6hk1zlrnfgtcxd6f8l95oloa	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1ppKwK:19bjltpVwefsLEnDXHZ8uM3jXxtJEleJ77jHh9YrNM8	2023-05-04 03:26:32.861527+00
9x2sj17ycfpi7tewddnm00ve7qpwve8u	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pv45J:ZvZTNXN8RvKlWRMfh4K9dAC7qi1d2uAmRxUoBjn713M	2023-05-19 22:39:29.452305+00
orob3nj62hbdly9173mlosw16m4wc27h	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1prlQI:xWf3P8ZflZo1-S7TxOg9vCYHq8VOhSJWiriVzFEUejM	2023-05-10 20:07:30.762826+00
xfviqbyv2hszafs3ab7eluznwjopxbf2	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pz3ko:Vj5eP9fP-0pEacOtoBmTjwhRp0oTYRhsNOJOJQ6CobE	2023-05-30 23:06:50.172722+00
6sxu1bm5383ll08muaw92n1mam9ppne7	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1q05d1:asb2lFqh2_GtoWudVn0KimVW1lYBwyFcV0GrlwUo5_A	2023-06-02 19:19:03.359361+00
bm6zhc8oa8848epf4g1h3b6bwudso0h0	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p8oOR:psmLlqzssFPtHiOKn8k1Swtq-jFMO7Wf5rZvBCkZb2s	2023-01-06 20:11:47.793506+00
2bf2mbg6guv6uuatphe5r0v8yfgiki1o	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pCJVx:5uyU5XrTDNcYjeRvefEloTtu_NtdQBKlOqi4jChdH2M	2023-01-16 12:02:01.399193+00
1zpnrj7isyndoliq2yli67r3o5ctc6ac	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1pcaR8:K-7LknLIow9OaW6xfmWQ6ipO4wpgPCublX5eUI24ZTM	2023-03-29 23:21:38.714434+00
n2s2ft0rzwga24srje72dojzt3k91hkp	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pSjl0:c1_3xD0GxlzgQbHTCEMQKtMP8vXUkybtFw6lXA2jtOI	2023-03-02 19:17:26.934109+00
46qvinhj2nrcbg3bhk6youj2h32x0f9i	.eJxVjMsOwiAQRf-FtSFQKg-X7vsNZBhmpGogKe3K-O_apAvd3nPOfYkI21ri1mmJcxYXEZw4_Y4J8EF1J_kO9dYktrouc5K7Ig_a5dQyPa-H-3dQoJdvrcZAnghtopyZs9WEBsk7HNjbpFATBKXtwMEZi5qJWbvgRuWVOUMS7w9KozkR:1plnEe:oMIt4gusY90k0zg0orWIXgzc0BLP_Rrwj0pQwV0cDD4	2023-04-24 08:50:48.926999+00
yljwj6vjpix8frd6ayo9rp9vq3m8jhej	.eJyNVW1v4jgQ_it3-bylSQiEIJ10vJW-LdBCocfpZDm2k3hx4jR2gFDx39cmCbSr3dV98zwzHj_zzEzybgiOKGQQIZ4nEpQW4yFNjO67UcH6SLHRTXLGvhi5IBm4mGnGtxSTzOgaIechI4YK0W7DMl3Ls02349qe67im47WabeVlUEhQvVHmwFAS8I3ThJzTkr3MIFAOWL_-y3wkhpQpP9kfKCOWaf4daqSBeKy8W5LRgBIMqjCZ5eSLkcCYqCtDqLj_sSBbIlRoSLckAR9dCgxgTFlRo3VoSpHMM41EUqaie33NomajFEALhHgiSSI1h2t43RtP4mK_3oTL_fouxouWs4lWd8tOPwczl65XBKBln40OCzTv_yW89hXSMnEEmX6BJFfjvnE8ltJ_bkYKhdjxTMvz54H68zs3XEEcfXvaPZPkZjxru-FwGm56t69Fz5SCTvP7wU9bQAUQeUqy8okAMqFUCmim4n4QREdUUJ3pB3F-35A04gk589eGXVsMJmEOQ51rNFGh9VjKItXY3aSSRVKeXO7I85En4eVchoEL1dMkFOCSoKpSly5hEHwEMGFE6mmsIDXlgaoF0PhEr3wD8a1ehY-QugqRVHNUD9rJUuNd2_oxwtgHkT8Nv2GbdvPKtK9sd2G5XcfqOnbD8ry14i93lFEOxGkZapmBYHlY2kke-4rPBYBpCgTiekxNzVZJmRU1U1WyPNP2KT8XReU5BnO_PoYkKZe8qZlwCRnwIQ5Vv7vm8Zzt_VjTghhnRAjt__c3X4__t7u1eGmmxNYlaPP4nyayIcnnjdBFa8u6jM_FWcUbBbS9BjR7y-16Kd5eeqODzdJXZz2ioZXeirfxTBD3aYZX-yL9iukjvHntjG48BxW368X03pmDfLO_ES04GbSGm_locI8Pi2Y4nrZG4w57zjtpU5A3NGoVqzjOekv8GtmFE3ec--f24GHqepMoHbf2L-aMLgpnAfjL3jP3oyecvj4-PthzIodwEP7z0MNo3nvuzW-exj7ewbvtpP_12XWAjIYPBzpehos3r78zrXbZFVWcmi6UEVlNyD6lqgugXhH9DQEwlxE4t8FwTeMT6EOk0miP-hFouFHJ2DjFVG7R6ClLfeFouUz96tanVBEUkcrT9ollmwS3Leh4HbvlwoCYTey40HObGFu447ecoOk4AWqjAJm-2wwwdGCrbboe8W3j-B0vtTjZ:1pWhVO:1wg450GqL6z3NcWRtld8CEc7M9Hpk9RkuHP3ORXl98A	2023-03-13 17:41:42.237327+00
w62jaaba92fa7zu0g3wf5kdb9zgqxqd0	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1phF1O:xOcJl-sQKdkURJZom3UZzte5FKeQCyFLD1K_QoJwS6w	2023-04-11 19:30:18.367197+00
ltr8jgpoofwuvywav23ii293x3hgk24t	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1ps5So:ctGm33wbQs7nbFqQK1CFEUzBC01cLWM9cTlKfsOGXV0	2023-05-11 17:31:26.749765+00
9yqeyb1ejkxelmcvii8wymeger6k7eg0	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pjtS2:lfbHL9zKCV0DnfoYOmOGdjJXw4JrRQPs7IWSLlSuFek	2023-04-19 03:04:46.511971+00
5ud6el0b43qrz1cwipxzudx0ih9mijxo	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1plzJQ:1TDK8r1YMD9dt1BKjwN8tSOjpae0WD6i_0xeEESpj3w	2023-04-24 21:44:32.027496+00
7tanbptd49ilsunc3hitgoclkp0q1ohv	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1plLbI:6y-LKEfSNXB7L8pUdJD4Hjx8nFhNvUxxplE7fFesUZw	2023-04-23 03:20:20.237981+00
qo9fy8go0nk22ti090wuxeseqcugvi2x	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pmPHn:cYcnHO3O2ddYHXtOnoDIlpTDOVt-Ygx-jFJJjcWkXeQ	2023-04-26 01:28:35.831406+00
8e998g4bch2bs90r9jlasjaav7rau0c3	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pv4Aw:ovflJi3vjpYCB3-hf49K0j8ralluzCT90E0ZLejTqwU	2023-05-19 22:45:18.231809+00
rm89fyo8d6b44c1jiviqee53vs8h84d3	.eJxVjcsOwiAQRf-FtWno8GhxZ3-EDAwEYkMTgZXx3xXThS7vua8ns9hbsr2Gh83ErmwGzi6_1KG_hzIs3PeBJ_T-6KVN38xp1-n2UaG07LHlo2xn628qYU3jwnBEDhEUOQiLjlySEVp5qQS4IAF8XJ2Qi6FVq0g6CkVccdJGmuBm9noD98Y8TQ:1ppLAr:vfkd5AZpuxhCWkqal6If8XKJGYpPnrcABkhwL6KgNAI	2023-05-04 03:41:33.360242+00
ko7vybmmmqouy1oc5s4sv5mov37jsgaf	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1prltu:4fcJhCMSvYuoM2OF_J1aMFfArjnqYosDjhh-HUFghhs	2023-05-10 20:38:06.221544+00
fbuny8jmgayfm9pbbbmo0qys5zaxvgph	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pz3oM:tQr9V1ZWE6-nGUkSV8Soiv9KMoY3gx6e__hN3ChJw2M	2023-05-30 23:10:30.465615+00
zhp9sd5buih6wm40xum70ordq3dtknqg	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1q0CUP:_wi9UzuIVYV3dCaDTvaZYTt9mODbTUlS_NPrmYQfsnE	2023-06-03 02:38:37.010215+00
mbs8quw8sle7nbfkf17l0dsnu2xsu1ew	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p8qCM:alJb6UmNPWxWBprgt0q2DDo1sp8AqZEOoe5jQJhF3Ps	2023-01-06 22:07:26.501169+00
ic5wmfnpzyt79zn1v9b3k76ot5xtexco	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pCsiY:ALqdmYELTm5ja9TXq6EMLSCNvwzUwtc9utrdlTD9134	2023-01-18 01:37:22.503601+00
82394yjhegtwn168d1vx5zqvtoze7rxt	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1pcaWb:x_mZ0cVsGmaq-Dk7ByEeTCb1B2SUHhhe-dE6tnQC5R0	2023-03-29 23:27:17.878036+00
jio3cufqzbqqw5k2hyaxpc65sqz60ltn	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pT96w:ImjC-FWM2w-CABONPXaw9G60b5QoYnxeMbiOhkMZwQA	2023-03-03 22:21:46.442982+00
2mxw43s0zxhi14fxcuif0lmg4yt9qxtz	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1plnFf:Q2ncw1dQ_NQuy9nCnn-W4HQhRmrKUHy2tQp8MYdY8FI	2023-04-24 08:51:51.443022+00
7mhkirivn0ih1v9mhllzo7trtbb95itw	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pWhXj:WqGgoqDSM8tJTjyZsPtnIZRikuIbYBqPvR3zx6NgcfQ	2023-03-13 17:44:07.22876+00
1dhk08jfo1cttazkz4r2zhtupewca5c2	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1phHvr:LTB6GMwRKZ9Jo5RcNc8BwleO0XvOqKQC0_0F0RA65u8	2023-04-11 22:36:47.489505+00
apjtdrnc6rlw1w1odvereid8pac179qn	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1ps73E:VIgaiJvCbqm2qMbfRxP-qoYdIX4eU8E_8xp70XhVluA	2023-05-11 19:13:08.882785+00
nmbhdsus2ctq3zez3yvgt3786c3ahial	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pjtwl:Rq8mxqb28ea0p8TSKxq0M4dDlDB0mQY7xCL5Vfq-KpQ	2023-04-19 03:36:31.59173+00
5x2p7w7wgblk1d5twwgvr68680uwioug	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1plzLw:7rL_VMMtwOvcd2b2hm_yYBOILEopFwlwgDNwgWIB3GM	2023-04-24 21:47:08.356368+00
9pptnjmsgcrrhvujgltvz84lmpz6fzqg	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1plLbc:az8cgrqzC-TfgMCuml7WOmEZBL7y7hsPsRfrrXnH7cs	2023-04-23 03:20:40.956908+00
7efsr1nncfiskihyblcyhnuqdu3hr50u	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pmPLz:pCGbsHpWbRpxmhqqhop0XNfVOLOYemIh9ttXEw-fm5o	2023-04-26 01:32:55.133621+00
wimlpj00y4vzso958mz7x0qtqjsv7cz0	.eJyVVNtu4zYQ_ZVWz2tHd1-AAtU6jl1v5FuSZp2iECiJkuhQpEpSsrWB_72kJdnJ9oL2jWdmOHPmcIZvGqcRAhhEES2JCBqEaYqINn7TWrM6olgbkxLjT1rJIQuusGC0QjFk2lhLKU0x1GSIcmuG4Qx1fehaI8cx7YHl6O7QlF4MuAjaGk2OGAgY7Cki8JIWHgUDgXSArvo_5oM5QFj6c5rFfQZhBgDRDf3nVNn7Ec1lTAUZShCMgzZYsBJ-0gjIobzolxnIcxD_sJV3iYxOUQVJ8J1X2hOQI1x3ji66QJEombJkQhR8fHODM6vfiKHEiigRkAjF5AbceLNlXh9D97j4up9vVpuetbuNNiPmf761jcyfr1d4_VI69QYQ7h1-4iO3FynRaASwqgGJdjo1r_DxXQrA-YEypdSPRzY4-OHXHcqf57i6C59mRj59Mmb71HUG_r1ZsOnrBD_98bevgXjAywKypkQCMJdSJYjJuL9KwjNadGatoXVF59zfqfVfXqvIKIGXvhQwO4QBSUuQqozTpQztJlfUhbL9smy1EoiS6x1xOVKSXs9N2Dv65zGpg2uCtnsliQBJ8t4QQwyFGtjWJBchQRgGKD_Ta2pEtFLb8t4kr4JIyAnrpvCM5AZ0WBWDGL8T_8N-aKZuWj3d7pn6oz4Y28OxPeiPhtaL5C8OCCMa8PO-dGIHHJdpg0mZh5LP1QCKIuARVdOrK7ZSSlZ3TGXL4kI7RPTSFBKXmJiG3TGFpPkHLMWECoCDEMQp5DL36ZLt7dTRAnHMIOfK_9u_fDD_Z707CQsmJVeNKHj6XdF5heTjvqjWFTKuQ3R1tvFaDcxRH-gexCM-WUdwmNpZPfU-T7Jvr0Zx2G6tOp0k8-n-8dgLp_5K7PLFAsJJHfR23vBhSY3HuZXxLwFMFsWL7ptPjjvZZzQxASLg-XCLKqvykxqg8H71uO09e4tsvZ452WxjlRNbHMCzN5wZe_9X8G0T9QahvqtI7U7ES2Uwx84qT-jFBkzS3Rdv5z942-nD3ebOLuNFllT3c38-d6t8OXITczWti6OX6obram1_cswiBkU7KscCyecIul05nU5_AoKUCqY:1ppP27:dz3dq0XLlObeg0_PlbA5OV6-yC1WZSyAeW9WvCCOHUk	2023-05-04 07:48:47.991319+00
gkkce2xl960d1p0lspwxukdb66q9pwen	.eJxVjMEOgjAQRP-lZ0Ngain1pj9Clt1N2khKIu2J-O-C4aDHefNmNjNSLXGsq77GJOZmOsBcfulE_NR8VDTPB26Ieam5NF_nrNfmvifNJTGVtOTHufq7irTG_Uc9wTqA22uwvWOVDp4hwbcDk-st0CMcDkEsdkYeQayKG6xOYt4f5m08PQ:1pvLJQ:CThh_OIV4Q1Dqvcqyv_Y3Ecl-Z_uDWHglJy4nM8CiVg	2023-05-20 17:03:12.464642+00
mmrai3ajn828a82539ghsbbwqcooejvg	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1prltu:4fcJhCMSvYuoM2OF_J1aMFfArjnqYosDjhh-HUFghhs	2023-05-10 20:38:06.316719+00
4bv6d200i86zv3e8fp9i0ddqyh75u0vz	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pz3oM:tQr9V1ZWE6-nGUkSV8Soiv9KMoY3gx6e__hN3ChJw2M	2023-05-30 23:10:30.835605+00
9kborwg0uqd3n5s138oo4ez27znebcle	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1q0CYK:AvsyNU8Q_NSV7owW8pXe73LGPuhlWpsPuEXn_8Uz4XA	2023-06-03 02:42:40.62789+00
henlsylo90ddgyuzvrnai1s24auu68cg	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p8qEc:I7Af3cIv-q6xnxLaewQ9bKJC7ptbGvF1SDP5B5hYuW4	2023-01-06 22:09:46.702733+00
ua17bl3k7hxqdvdr29v39tzpxr3al5y1	.eJyVVGtz4jYU_SutP28S25iHmenMUpJlIYEF8wjQ6WiELRslsmQkmdhk-O-V8INkp-2033TvPb6Pc8_1uyGYjyGBvs9SKkFhERZhanTfjdKtnzgwujQl5IuRCsTB1Uw4O-IAcaNrRIxFBBkKosOGZXUc02w6rY7jdjrtjmnaTkNFCRQSlDWKHAGUCLwwTFGdFmWSQ6ACsKr-j_lQDDFR8T1MkjwhMEfccl3ra6T9tz6LFeaIOA4xCkAJljxFXwwKY6Q-nCKJ-C9TSBUwwkdEwceAcoYwxiSvvRdggn2Zcm3vpUxE9-6O7Bu3BQWaIp9RiajU9e_gXW8wifMM9tbtF5B4mXeDNtvRchHi5ttphvbIWU1I4DVPpvPs_Sbc1o2viWI-JLoCosb5XDD_eRcJFOKNcc3Or-xAMncSbFavuTfj5tS00WA_XnxHtnVMzAAPSCwWMmJ_uwEsgEgTxIsSISRC0RNirnA_caERpavK9ImX_7KNZM8oqmfQhl1ZBNIohZHO9zBR0EqZMk-0bzgpeZGY0es3sn4yGl3fBQxc273IIAfXBOWkenwJw_CjI0BEjRzULiX0EBMEcHxpr6jhs6O-ho8u9Sn0pZJRpbKLpRRe2boYIuQD0Z_0b9im3bgxnRvLXJidbtPpOtZts2FtVf_yDRPMgLjcQ0U2ECSNCpum8U71c3WoJQDhM61TU3erqOR51akaWdZt7zCrh8KyxgRsVz0jRIs710cnmYQE7GAQIaFyn-ts7-eqLRgEHAmh43_8yw_k_5xvRWHCFeV6EG2e_9TtvCL6-Tb06NqyriK6Bku8kUPbvYVmDxFX9Kf392wNADrRLHuanrbp0HpY3S8yMD020v36kZ_Wzxn0ev3wZTXy1k8z0GnlzJ9nixZ6mICt3LVfnXnz4LWHsX2_mwfp5ph7T7txPhuODu6UrL-DODhsSX9Cls5g2T9FGdyetstHsMqdPJvYYuylne1m9DwMNytTONPnZTp2x7AfbR57s4d5zxvOv82-OWkw2v--9KzD2m8vm4P4R35AcLzKo55ptVpGOZ-Smc-RLKWSJVitA1S3cj6f_wIrWgNp:1plnIP:FJtQMks-ld2-BgmtJHYiRO_SdSTxQDmwY-bgDSp-s4A	2023-04-24 08:54:41.539683+00
3llqvouvvtvb2wu57cpnewbp0frgp4nz	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pDWPx:xUFnrIrr6y-XE6CqMwbRT_mBAyvhT4QXB6tOWlki43w	2023-01-19 20:00:49.978034+00
jhm2fxcozyb909zgjx12fja47hp98bi4	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1pcaux:o-s1fmj7eIYb5a-f0EoDcZBXt2vygeYqPsgLdnvNj3I	2023-03-29 23:52:27.55902+00
5g5l2wemmktnmbc0ac2fzfdy7wt9wzpj	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pUZgq:oQSuD0_FeA0HcyQBAEv_-LRkKXdn2frNO4XkV7nHpEs	2023-03-07 20:56:44.616791+00
snqbf5nc5qra4qg926mczfvg0jqougi2	.eJxVjMsOwiAQRf-FtSHQUh4u3fsNZJgZpGogKe3K-O_apAvd3nPOfYkI21ri1nmJM4mzcFqcfscE-OC6E7pDvTWJra7LnOSuyIN2eW3Ez8vh_h0U6OVbB2OQMgzInlQaLGSkRMFMxjtO7FQerQXSGn2YxuytBlJqzMkDsvFGvD83rzj9:1pWhZF:5dcSa45pXqZn8uA6kbWiZo8Tt2Y1lFB3H_1LL5yRsIk	2023-03-13 17:45:41.264248+00
fu1ppfyuww0wpe4atf6dj8kfro83n8fx	.eJxVjEEOwiAQRe_C2pC2AwO4dO8ZyAwDUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1FnFYw6_Y5M6ZGnncidptus0zyty8h6V_RBm77Okp-Xw_07qNTqt0bTC7N31ltkYEkSTCgl44AGoBtcb1MO7D04IOiLgDPYSWfQMRAV9f4AAPM3uA:1phag2:CDEDT-Kc3XZ0EHTn0vfLuuOQpZgqI3eNGiPX_Y5Aiio	2023-04-12 18:37:42.420684+00
fhsfneezlyw4gmsilbc10neas758v030	.eJxVjEEOwiAQRe_C2pC2AwO4dO8ZyAwDUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1FnFYw6_Y5M6ZGnncidptus0zyty8h6V_RBm77Okp-Xw_07qNTqt0bTC7N31ltkYEkSTCgl44AGoBtcb1MO7D04IOiLgDPYSWfQMRAV9f4AAPM3uA:1plzM4:OXkcymu_s2UJckFI6yf4nf8l-qwfNuEYRuAHhtwOtus	2023-04-24 21:47:16.446518+00
vue9pgjm5wpzh45bvj6j5jifw979cu0v	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pjvk3:QhecRkJqVIqaBimQPBJwN-v9MObkOYUQJmya_BheTnQ	2023-04-19 05:31:31.914636+00
dm7hx6fhu1udttf8ey43s2t1zlzmcsq3	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1psGI9:hCNCIuSrOJypYwD_PS4ixV41XIaoKDe6I177XzbGISY	2023-05-12 05:05:09.608949+00
u300wnuaztggy7pxqajxaib6xsjn39j8	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1plVjz:zrq4LRoE1Ef5Cm0INaOkf81EqsEflelDI-2m6blgExE	2023-04-23 14:09:59.035415+00
6u8ccpmkxzuvxkk04n5g7awruwoowx06	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pmPMI:eKPLRDh_hJAsLAGJc_xooQAT1xq9g0DQ0X8dFKXZiVM	2023-04-26 01:33:14.997417+00
o5udrijp59aup295ulvw1idnhhrh23if	.eJxVjMEOgyAQRP-Fc2NYkSLe6o-QZVkjKcVEoZem_15tvHicNzPvI5Boqbm4N69xihwcvzAmMeSa0k04rGV2dePVxSAGAS2IC_VIT85HhSkduDmFzX9z1lvz2BPnEglLXPJ4vi6qGbd59xCjZcnQkgIm7bUyJG0ALdXdQGeRjPHaBi2Dos5o71FSrwNM1k49GfH9AewKSEE:1ppP3B:zCacZSJNSRKSG8jh002I7cAXk4EjJ-wNGMsWMaZyXjo	2023-05-04 07:49:53.039732+00
5h0evbd6e4e95tbf6l04jmd5susf2ho9	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pvLRu:Y8RYY9xqFjQaZA9N1i8UCydewHRvY7G8zhsgY5a3kl8	2023-05-20 17:11:58.129686+00
gf6ppixzauxy00cftzdic1h5fdzo0xyo	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1prmVs:Rc30Qtbhr9t-mmZRqtAASQPEgBsYSjOEOlEgzWZ5u6Q	2023-05-10 21:17:20.209625+00
lqhwduocyiiygz2nejgsh5rdbvlx31rr	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pz46m:R117EqcywuwcC73mGHzqcVT_NO-knsEGI6bkXoQPGCo	2023-05-30 23:29:32.26007+00
pyhnmxar5b5x4qnk950epum2eu8lie81	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1q0Cgm:BE4KPnn7fZ0dEVyPmX4jbrAwLA_MNl5kykib0WSomfM	2023-06-03 02:51:24.988784+00
k7143muuu85vhghlw5ihlmeu8j17rhx1	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p8qFA:tq2EwEABa73LJPFMw1C9JCx90k2RKbHNW6LpI85GPO4	2023-01-06 22:10:20.735589+00
nkdy0tbl6wjyqcr12c8y0wa3pjwqlzyt	.eJxVjMsOgjAUBf-la9NAL_Th0r3fQO6rFjWQUFgZ_11JWOj2zMx5mQG3tQxb1WUYxZxN25vT70jID512InecbrPleVqXkeyu2INWe51Fn5fD_TsoWMu3Ro8iPRMQZUixY-18BtUmKgtjjlH7EDJByylFCg6gEceMzmtwJOb9AU03OY8:1pDWQP:2IqzY87BZSonHrfcndHN_oqVf8N9tnhnSFil_w5f7Nw	2023-01-19 20:01:17.677586+00
tlt4wb7j7m19w4kpg64a5t0dcvi9xgqu	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1pcb2g:NeC8wBEOGg2WuAjs1oH98afZ0GLaxms7EyeDNc6ZuHs	2023-03-30 00:00:26.783539+00
f69wdxrdns24zm7jsbxdhnmyrvuohytj	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pUiIT:BsEZeinCEmZYYVPj2IY2LGi-BF8OoABhojdthCyMoDg	2023-03-08 06:08:09.625974+00
86ok60a4olsgssemlzwkr1i2j3hvkj40	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1ploB5:Cks8dK7Qdn5QALPsENMGtvK4hRdlPTrLMqAC4lIKKa0	2023-04-24 09:51:11.478198+00
wdqot639ijn2fizo5ryfiz3v5kn56npq	.eJxVjMsOgyAURP-FdWMAlYe79kfI5XKJpBQThW6a_nu1ceNyzsycDwPEpZXq3rSmmCg4ekHKbCot5xtz0Ors2karS4FNTEt2gR7wSeVoIOcDd6ev-2_Oeuvue6JSE0JNS3mcr4tqhm3ePYIPA1ovo5GWKOhoEJUBtFGY0XMhI7faCw9GoeI-WK1kPw46AvR6DIp9f70HR_M:1pWiX9:_P08q-K1ZW_44AWJije80wW2bQA4J6GUMw9aKutVVA0	2023-03-13 18:47:35.2262+00
y8kxyoh9didhv1yya2mu3breno51tvw1	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1phcio:luCdFcwYH9Z89Ai9a_hRjncIfA9uFMa8eUHGD8UCd8o	2023-04-12 20:48:42.867075+00
t5px3mfmau955ogx0jg45yk0edicdrw6	.eJxVjMsOwiAURP-FtSFwKeB1Z3-EXB4NxIYmAivjv9uaLnQ5Z2bOizkaPbvR0tOVyG5MSsMuv9RTeKR6VLSuB-YUwjZq59_NWTd-31OqvQTqZavz-fpTZWp591g1TZCiFFYIHw1p5ZXyKIMhgx4Jgl1kFLigRRAUE1mS1mhAfdWggL0_9AA75g:1psHHI:8lH8Jf-xlOi3aK1hrdcIY5jZns74YFt1yGrRmxl3VIU	2023-05-12 06:08:20.689915+00
5g0fkujri2do9bimlmhl6pzyugjmkvip	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pjw0O:CrK5ST77-4ugZDjq6r-o5vwndrFrB7wNYv8HiOwBoxA	2023-04-19 05:48:24.983483+00
b4039pu0v5jvnkzw649n7bztnkfc3wnp	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1plzMi:b1ADmSdZghy9H554w7PTJaVY8gXsLV1c8J3mo4dH6uo	2023-04-24 21:47:56.533031+00
2h337kifig9acbocwva6pdsdeq6ldug1	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1plbTN:DSPUNAymKBULabDrkG_Z4tfqZsHW0mnZpCba3HNoBPA	2023-04-23 20:17:13.576256+00
ccywdi7y8api1yx4e32smeg5uinulsyk	.eJxVjM0KwyAQhN_FcxEV409v7YvIullRGgxUPZW-e2PJob0MzHwz82IBRs9hNHqGsrIrk1Kzy28aAR9UJ4JtmzEHxH3Uzr-dEzd-OxzVXhB62ev9XP1dZWj5-CESiHHqShYcgNJWC4GWbNLCOFxsMqDd4q2OlEh4L6Jy0qSoJMXE3h85ez2f:1pmPUy:Wa-o-cH9t9LaKknnUpoRU1ghFCbr7AM7fby0ZgWVb-4	2023-04-26 01:42:12.462088+00
y0efn7oyx6vu3233ag15b1mz2ckrrsp3	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pvLsB:0l0fEAHRiKgwg2i8lhgPsg9RZHR7y9CfeXBAnZffEW4	2023-05-20 17:39:07.813623+00
rd3in7dvho05uxbx1rzeaac9xgoarmwj	.eJxVjMEOgyAQRP-Fc0NYcYv0Vn-ELMsaSQ0mBU9N_73aeGiP82bmvVSgrc1hq_IMOambgg7U5ZdG4oeUo6JlObAm5nUrTX83Z131fU9SWmZqeS3j-fpTzVTn3cNCXoxAxxaEMaJ1bHwCNPbqoPfEzkX0CU2y3DuMkQwPmGDyfhrYqfcHDuc82w:1ppP4D:Chj7gUk3rnq_fWGy0tnl3VWp1sfc2_qSF6SkEOWOQ1c	2023-05-04 07:50:57.439014+00
6y5rokarjn8svkfvjsvourbma3nnh27k	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1prmXs:l7TTgJDzmNmkLeWQlFxROJISuei1uJtcaOt9BquRPXY	2023-05-10 21:19:24.895673+00
qrslqincj4bx889za25zzvk5in3ddxde	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pz5WQ:JmUMi2qjby8gRZJ0Bdn_mzAv5HCru5ZJMiSUnqVqfEo	2023-05-31 01:00:06.764608+00
c6cszd3jwobvjip8qpbryorbo90h9ag3	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1q0toN:UXSLDcKagm7DY0HrhX91qZxVCcJl475eOTOgSnC5dTQ	2023-06-05 00:54:07.993727+00
6hh34pd0v25z7cmifhry49zvw9hugrar	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p8qL9:pcoLyHk2MsxWna0kfL3601IblefVQCU36uAMBEy_EzY	2023-01-06 22:16:31.626159+00
mkomxetqbraew51dx4tqbcrz7vvtn83p	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1pDWRv:OjlEx4352bzkJfk_laVKYA-kmoAI8BjfjDRbZuSsFSw	2023-01-19 20:02:51.931835+00
ulcl0l5ciki58enzx2qjr6jpnctuow4y	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1pcrhC:uIlouk2WJ3sCsO-Ewb8aFJ5UfEDBMJ177S1JcDXZLpk	2023-03-30 17:47:22.968689+00
73auubioc93bybusx6s3vfespeiyleie	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pUkJk:2l7IcTaTttpJwJnfPvqPMS5dE3xm22uU7xeRGTWdptg	2023-03-08 08:17:36.630685+00
4usczd4jbc12mjxzro1zdi0u6hgnxurb	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1ploBS:1x8H1ReArQWN8rFLszrN_2pGZ-sj7FebCkuPLZqvM90	2023-04-24 09:51:34.244895+00
o32gr4bmzsv6nd356erprqds60emrwwx	.eJxVjEsOgzAMRO-SdRUREhzTZfecAdmxU2irIPFZVb17QWLRznLem3mbnrZ16LdF534UczXRm8tvyZSeWg4iDyr3yaaprPPI9lDsSRfbTaKv2-n-HQy0DPsaMXAFDpEAWqXsJTMxBJLGxRoSQhtRY1NzqFyGhhVchezIy57kzOcLBmU4QA:1pX5te:XFejh5eJUO5UPSOv01d_QlRNhC2KgTOVH3pmHHyZw2E	2023-03-14 19:44:22.687877+00
6yv4276u16qzb0cwdqawj1i4h8n2419n	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1phcpD:2Og1cl-LR75dCcDKfyPViBMVO7r3nnuqGim0RgppqDs	2023-04-12 20:55:19.480079+00
ir85cyfoo3v48b3u9mezlp5jncci65st	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1psHKQ:FdBqktjEswLoqxtV1M8n76wZ9zl6GDy0cYwiZS-dP4s	2023-05-12 06:11:34.568518+00
8yp01gtv2sz41oqq8vj7fdazjp1m6i7c	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pjwJ3:bHa_4UlPNF2JqjJg9eL5kzhpIef4iiPcCg_dfO6UoQw	2023-04-19 06:07:41.694511+00
ek9og6fd145uu0jvtog8u5ki5ioefn6f	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1plzNz:OwJKQ8ZV5wpdjezgmR_E1Qx1m0-Gp0edlsU4pwiiy50	2023-04-24 21:49:15.256414+00
qb3zqz85vot9s9oxa2m2ej31wfxhryml	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1plc6x:rvrFhF0UMk8K-QI6UZ1rpmG-m8S_4tmvrT9k4d2p0mw	2023-04-23 20:58:07.513105+00
akqhb527uk9cqhh526njqmviq0o94z1l	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pmPVT:Dt3PcQxbHdhEFgqklIb4PwXExZFv9WhxOTLts3x3PjU	2023-04-26 01:42:43.157846+00
mc413y4lsl7x1q99bvpbn1jddlo6qleu	.eJyVVGtz6jYQ_SutP1-IbQwYZjpTHoFAAsSEhEen4xG2LCvIkq8l27gZ_nsljCG5fUz7TWd3tXv2aFcfGmceBgR4HkupcEtEGMJU635oF7M6Yl_r0pSQb1rKYeLeYJywDPsw0boaYgwRqMkQ5dYMo2nrut1qdJpN02o3mnrLNqWXAC7cS40yhw8EdN8ZpvCaFh5FAlzpAFX1f8wHI4CJ9Ecs9OsJhCEAVDf0X5Gy1z0WyZgMJjjA0HcvwSJJ4TeNggjKi7M0BFEE_J-W8i6V0QhnkLo_eKU9ABEmReWoomPsiTRRllCImHfv7kjYqJdiKLE8RgWkQjG5A3e98TwqjvvWcbp5f3AWTq2xHXpOJ5n1h5YRzh6eF-R5lzYLB1Dey3_hnVbNU6IxDxBVA1LtdCpf4eu7xIDznCVKqZ-ftu3-0nktFv1D7h0G81HG1pNBkdudxbIfzZYoPD7mi97-b18Dc5enMUzKEgEgXEoV4ETG_VUSHrK4MmslrRs65_5Brf_yWnHIKLz2pYBZIQIoSgFSGe_nMrSaXFHEyjaZX7QSmNHbHXE9Mopu5zLsE_3zmBTuLcGleyWJAEHw2eBDAoUa2ItJLkKACXRxdKZX1vBYprbls0leBZ6QE1ZN4RnJDaiwKgYJ-ST-l_3QTN1s1HSrZuorvd1tGt1Gu25Z9k7yFzkmmLn8vC-V2C4nKSoxTaO95HMzgDh2ucfU9OqKrZQyKSqmsmVxpb3H7NoUFtcYn-2rI4K0_AcaigkTgLh74CPIZe7TNdvHqaIFfD-BnCv_b__ywfyf9a4kjBMpuWpEwdPvis4B0q_7olpXyLgN0c15idcKYHbqQO9B0uGD-QYdFrss7GcWfszf4uckG4JRPgp7UztIo3WLDd-stdke2uvvIXd2hxUzG6hIxeg7m6Sv6wnbte3JKu3fr5JxYCE0Qf7-cRw_ddYOgn5gWvtXxwi2w8PTCzaNUY73cA5WCBwew7Ght3aLjX3IO9vssNqPmZPVHMvcvFExAwO0fext0Etvef8yckZW6k9D-9UcTbN3_QH8MTCmptGZikkT6UarpV36k2PmJVBcRuUYY_kcbrUrp9PpT6ltCs0:1ppP4r:y_XytnWHtrTCV3HmMTHt7BAvKDKd7XCKrAgLoIHLhOU	2023-05-04 07:51:37.456175+00
kmqja2ec2qmmbuqkx75x3wmp4aan06e4	.eJxVjMEOgjAQRP-lZ0Ngain1pj9Clt1N2khKIu2J-O-C4aDHefNmNjNSLXGsq77GJOZmOsBcfulE_NR8VDTPB26Ieam5NF_nrNfmvifNJTGVtOTHufq7irTG_Uc9wTqA22uwvWOVDp4hwbcDk-st0CMcDkEsdkYeQayKG6xOYt4f5m08PQ:1pvLse:BkDHfBBa9lwgfJ0Nlh0IfgM3M-OJ2gdPViu_72FLNgQ	2023-05-20 17:39:36.025772+00
y5xsn7vi3o2spa3qrlejb9dy3d0z5hzt	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1prmfl:sl_js7otoitprd8hPxiBp7zYfGCdsGTqL34SVFK65O4	2023-05-10 21:27:33.735011+00
2zqhtjmhivhc4mzfi0gagp31lzricon5	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pzD3x:bcKge8XzT00XxYNeIBH23oC527HCuWYFrK-DWRJ9jNQ	2023-05-31 09:03:13.070575+00
du3kcw377h20rmk9w90vlrbkjnqorbpf	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1q0tvD:S-P4SnPKQLhC9tr_B4f6ihNz58ubukerPJvQTlq3M0c	2023-06-05 01:01:11.218424+00
ew1u0twc52vzqr3pnmrqoatr8t6czyru	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p8qPC:FTZpy-hhwSgnnKnqpPy8v76pIGIjdqFbbedBrmfA0D4	2023-01-06 22:20:42.898886+00
i6839zvj67uu14r4xt42b2au7ixulead	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pDhY4:ZKunnaMOoXRy5VT5jdJps2qgMUkCaO_MCJDOEuL9uug	2023-01-20 07:53:56.668875+00
37fydm3vmwqbusp0qqvuc3ucdhw6ni52	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1pcrhT:qRpu2crCOqf2szmeCWXy6vPcnVNdyj5WjWdAbS9Uz6c	2023-03-30 17:47:39.099973+00
d2pxhqlfql7gfqlz495tk6jo2xsn5m71	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pUkWw:K1QtHOYk2rjo6D1Lz1XfBl8TKTTMq7y_nVCgL_Z02As	2023-03-08 08:31:14.635486+00
dasimmahz8mkija9bwcee78sc4xqbp90	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1plolu:0mTxdZfU7mzk19mHY3TWIEq8Ws4muQm2bmTuJgWCOsU	2023-04-24 10:29:14.179694+00
evhwzowqvmxiifi2rpievn19r4mqsbx1	.eJxVjMEOgyAQRP-Fc2NUFkRv7Y-QXVgiKcVEoZem_15tvHicNzPvI9C5peZi37zGENlbfmFMYso1pZuwWMts68arjV5MYgBxgYTuyfloMKUDN6ev-W_Oemvue-JcosMSl_w4XxfVjNu8ewJT0KhGcArIoCFNnWRgRtN5Csb0IygpQSP6vvUwEGinPLatU0GSFN8f3QZInQ:1pX7fx:n9r2k_9nw9RGYxL93c0r4mNi3VS5AZZG9IGjBD2hKDA	2023-03-14 21:38:21.258457+00
u6aqmiz4zi25hzfs4bkjbgyldo11lklg	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1phcvX:DQMRxMkc7WNHtjf4cqE17ZnKMiuP0l-itxXRl_DyGN0	2023-04-12 21:01:51.521832+00
92707ed5exp70lvzurh853rdtz6e58ry	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1psHPc:7uwpfeJsEQIsIHqik-6xfVzmQI3tkyk8z4cO-vlrCCE	2023-05-12 06:16:56.111939+00
l4yi1irupc8psefnqi0cv7h10ip0lagg	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pjwJa:oHGzbe0EDFmpRyfgHLyOIhafPAGQDK38ulE7gffbVUA	2023-04-19 06:08:14.116248+00
nv7fiplumh76gdnq67b93nfv89f4zg65	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1plzmN:T6VnrQGds1sYZBK_NhLqSlvLlTMfEhlqg74FXhScNj0	2023-04-24 22:14:27.005991+00
r8ns6win28ycss5pmiw5sa55rtlz2mwi	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pln52:Fv3GiWVC5MskUSka_5ULHfQtG1ENARWwbMYFg9ihHZA	2023-04-24 08:40:52.601515+00
fjnk8yvdspjutkvl814lyhycggp5buvq	.eJxVjM0KwyAQhN_FcxEV409v7YvIullRGgxUPZW-e2PJob0MzHwz82IBRs9hNHqGsrIrk1Kzy28aAR9UJ4JtmzEHxH3Uzr-dEzd-OxzVXhB62ev9XP1dZWj5-CESiHHqShYcgNJWC4GWbNLCOFxsMqDd4q2OlEh4L6Jy0qSoJMXE3h85ez2f:1pmPW8:vNFCg6i-Zn_4YD9hLvXOIe6PXoXpd5_BH4VnXoC4udc	2023-04-26 01:43:24.608151+00
hhccppga6y9ypb90lfs2v389bs9ur49v	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pvM2Y:lRtbGhsYO54YlDX1dv7oXz4HMA1h3sY3PuEr5iimSKI	2023-05-20 17:49:50.241116+00
2letib2jw7usr6tr4upiu6kxq9igymrs	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1ppZzL:RrCQWuAHCafaEr7EiZ186DFKf-tYOt3wnBsCod1Jzok	2023-05-04 19:30:39.821342+00
4q1j724bu53olemk4xtnxtbjjex83bw7	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1prmi8:axlCZdljVFkEdBntLnc6tF1Z5XQ0q091MT9AyRIC4AM	2023-05-10 21:30:00.997154+00
anvdi3sxlfhuwson2n85h361jt87dmqm	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pzO5K:jqolXZ_ShhulK7PJG18qQfuCX4ebfQ4ue6WQmyNWLms	2023-05-31 20:49:22.235835+00
cixgl47po7c7rbi1d2v3xe6sy6j7e6fg	.eJxVjEEOwjAMBP-SM6qS2q4LN_hI5capElGlEk1OiL9DUA9w3NndeZpJaolT3cNjSmouxvVoTr90Fn8PuVWyrg134v1Wc-m-m6Peu-snhVySl5K2fDtef6ooe2wewjMIqlMkiwRBYVkIZqHAZL3SAAoDO8vEVlkBSBFH4R4C8ajm9Qb1iTvu:1q0tzZ:Lc2GQ1dYx3Z0U79x9vjSIvIRxNoaSUPljpGXZGtR29w	2023-06-05 01:05:41.83761+00
mos3t71n87kxu0e0ckzu1wtozulxeedf	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p8qPP:JRpA01q-FEmV_WGHvwzWJzRI5yQgtGsPnh_X3x64WHU	2023-01-06 22:20:55.097921+00
q2pip2g15yiih19h69vdlppwwdka25us	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1pDtng:VvQNOnejarShUMzKOjbSSZdUBLQIFJFDaqMU3a8s46s	2023-01-20 20:58:52.180108+00
d0qpce2ecf6v5g5gxh0km9n5yrqgdymx	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1pcuwK:gJ_jc1_mqlgD6QCD4SUnCxevRZnQZe2AkJE2edag-jY	2023-03-30 21:15:12.269077+00
ahhydzg8220jtnxrvl26hg4nr2vactyg	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pUkaB:lZOL4iULCq6PK3FZjkYwL1oinNGS2PFtO0kkGbaLUzY	2023-03-08 08:34:35.183535+00
388ctp95l451qkoz8tgexycwdouxy7ww	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1plonD:yNFDNpo8O7n8A3JFsLgt4wVdx4myqyPqEJzfM9l0_A0	2023-04-24 10:30:35.139854+00
0ai0nw1wzknuht6ps04dzwknt6tclt2z	.eJxVjEEOwiAUBe_C2hD4BRGX7nsG8ssDqRqalHZlvLtt0oVu38y8twi8LiWsLc1hhLgKZ8Xpdxw4PlPdCR5c75OMU13mcZC7Ig_aZD8hvW6H-3dQuJWtzmRJddlqi-yIkLxnkDYAexWJyCAmTxfnoOhs1KZnjiDurNUwLD5fAEc3xA:1pXE0A:oG85UbNeQS6SzxyXYjFy5HsZPSGTtVses8mlHQDStjo	2023-03-15 04:23:38.439117+00
8nttpku1ul3lb0pzjj0xf0x6fp3w3ujq	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1phwIp:ew9HQeS7_KfJtUOVXAZ_r9kuqoPhylE-ElLG6abGUfw	2023-04-13 17:43:11.007521+00
7hzgbb1p4sj94i61i3czj81kv4w63kxi	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1psHPt:MV_cocokYTXuLCUmqO6xDOic75vpIgxeUFHRPG4RCc0	2023-05-12 06:17:13.856918+00
e1zk5jy4zc7hrppidtihb5lg2jvvabj3	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pkBhY:AZYRrf7KG3_najcXRJS6OUtBgdEYrTEe3Uy_kbMGMGk	2023-04-19 22:34:00.617527+00
f8x8kewjdgvgqrrbsle2dyvvldwqx3o2	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pm0Sx:GXozjd1xpS-kzeTXujKUpt817KYcVrb19lzL7emcx0U	2023-04-24 22:58:27.89223+00
voz6vpuvb0ypexk1ajad2mj7u5g9rovf	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pln6Q:QekN1XncvU7RUYpp6qavKL8uQtF9lPIws73__4-UdcA	2023-04-24 08:42:18.189598+00
rl10bbarbv4plgq7922zwpnpg6du85tb	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pmPWm:i2KS160_TW9rLRYhp-tJVMFz8cK8kp2Ht0BJOA5I7uA	2023-04-26 01:44:04.476184+00
dw1ny08b62jn7z81it6vgillcmt1j8vd	.eJxVjMEOgjAQRP-lZ0Ngain1pj9Clt1N2khKIu2J-O-C4aDHefNmNjNSLXGsq77GJOZmOsBcfulE_NR8VDTPB26Ieam5NF_nrNfmvifNJTGVtOTHufq7irTG_Uc9wTqA22uwvWOVDp4hwbcDk-st0CMcDkEsdkYeQayKG6xOYt4f5m08PQ:1pw3iS:Q6hSg0815IP_Uy7PovviJFLKq8nfgnV-6P9Sy_Q1zQo	2023-05-22 16:28:00.980228+00
g411qoc1aozna0iu01jbnbgfggfg7e1d	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1ppvlI:fs2ZrYmBHjvMMIhvECLUJ_lQp703HpKVnpCBp2Vihzk	2023-05-05 18:45:36.129606+00
8nwj5n07y9627ku288ciglsfcm1h3q44	.eJxVjMEOgyAQRP-Fc2N0KSLe2h8h6-42klJMFHpp-u_FxovHeTPzPgqJlpKyf8saHkHYywtDVGMqMV6Ux5JnXzZZfWA1qg5AneiE9JS0VxjjjptD2Pw3R701t5ok5UCYw5Lux-ukmnGbq0csgjYA1F6d7g0Jd2AJ2Nl2IDS9BujB7RsE1lAZWnCshc2gZWL1_QHDn0ej:1prmmA:xnrheEtYmPcaM6ub6adETinc-_1vDmayyTHMLAOc-Z0	2023-05-10 21:34:10.011836+00
6zwwxjdig4eziw3sobecjo7oi5hzw5mt	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1pzObl:A6-cKUshOBaUFm-GmpdxPOvDVS0qgH0IYRZY4Vt-Aeo	2023-05-31 21:22:53.453814+00
bgmwbm8wmcew4u1g6t4nmhidaz66yhh0	.eJxVjMEOgyAQRP-Fc2MQxRVv7Y-QdRciKcVEoZem_15pvHicNzPvI5BoLSnbt9uCD46te2GIYkolxpuwWPJiy-42G1hMolVaXOiM9HSpVhhjxc0pbP6bs96b-5FcyoEwhzU9ztdFteC-VA8MSvcMTLNUrSIE3UkJGkbjwYwgTY_zwNSx8Yp749krZOlIHwxMK74_1WBIIQ:1q0wGn:aRqiPrrrMhys1brdn2f3zmr8rtvZDyinyzN3e4LBgjc	2023-06-05 03:31:37.957448+00
k0gc1wfoqcjb68d12yzwocf2a42txfvl	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p933j:QfIdrcJ06-UFZZ68pVDrGzJc_U01CsG5tiZfnXLrpFY	2023-01-07 11:51:23.920093+00
crspc5b9hfat4jmeavvyrb748thnos16	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1pDuLb:RxBHCkAZKedxCLT--blETZMsMpK-1InSkFvYFlgBvj8	2023-01-20 21:33:55.630225+00
vwyhhvuhoi6bwgdn34iwkf1owv8nv06x	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1pcxUI:FkxwVvnQLSk7_W2CKMivA_a2sr-XQKSMkx_1YtuC4dw	2023-03-30 23:58:26.849304+00
zslkq0sbqqvchmanyj7j798ffolwos2s	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pUkeI:0hgo_TBUlyw3nfNUpq3oqDAwQUL_0UY76nRPelZ9maY	2023-03-08 08:38:50.61323+00
u2kgmqclaesyq5y2b4azmiyj7k7sj8um	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1plop0:zmagdTHpW7sIIWMI9zfssGvYWeTqFyiFnBZKE4_vvK0	2023-04-24 10:32:26.211445+00
4wgysbkpxahicszhn46mum646uwmo3b8	.eJxVjMEOgyAQRP-Fc2NAWCTe2h8hC7tGUoqJQi9N_73aePE4b2beR2CMSyvVv3lNU2Ly_MKUxVhazjfhsdXZt41Xn0iMYhjEBQaMTy5HgzkfuDt93X9z1lt33xOXmiLWtJTH-bqoZtzm3QOTBkOgFRk5KamUlVbyoKRzCBCBJBD2RE5pE1zoQwAjCSBAb622LL4_iqlG2Q:1pXQtJ:OXKLKmp0lxAVdRCn30PQt02o5hoJqb1bLEMH9ZBrj6w	2023-03-15 18:09:25.385619+00
c49c0xw9zx793dgy5vgtxeb7de2uq8ta	.eJxVjEEOwiAQRe_C2pC2AwO4dO8ZyAwDUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1FnFYw6_Y5M6ZGnncidptus0zyty8h6V_RBm77Okp-Xw_07qNTqt0bTC7N31ltkYEkSTCgl44AGoBtcb1MO7D04IOiLgDPYSWfQMRAV9f4AAPM3uA:1phzOy:jvki17NvHsV0e_QkKUdCDKSkeVjOYVVE__meTyLfmTk	2023-04-13 21:01:44.301086+00
ffqhcqxgf7cjep3sds04j470qssj47tg	.eJyVVGtz4jYU_SutPy-JAfOc6UwJDQ6PNcQkS51ORyNk2VaQLSPJgJPhv6-EHySd3U474w-69x7dx9G5fjcEQwRSiBDLEgkKi7KQJMbw3Sjd-kh8Y5hklH4xMoE5uJopZwfiY24MjZCxkGJDQXTYaDb7lml2rG7fGvT7vb5ptqy2ilIoJChrFDl8KDF4ZSTBdVp8khwCFYBV9Z_mwzEkVMUjmKZ5SmGOeXMwaP4eav8NYrHCHDAnAcE-KMGSZ_iLkcAYq4srLDH_ZQUTBQzJASfgY0A5AxgTmtfeCzAlSGZc25GUqRje3tKofVNQoClCLJE4kbr-Lbwd2U6cn-Doz94rSN2T28Dey-z5KSCd49sjjrD1zaG-23kzrY37mxh0G0gTxRCkugJOjPO5YP7zW6RQiCPjmp1fR3f25iHoOu2X6NuMy_sFhEsRPED6jMbWsoNtKPBi9yp_-AJEAJGlmBclAkiFoicgXOH-wYVGlK4q0yde_strpBFLcD2DNlqVRWESZjDU-e4dBa2UKfNU-6ZOyYskLLnekfWRJeH1XMDAtd2LDHJwTVBOqseXMAg-OnxM1ch-7VJCDwjFgMSX9ooaiB30Nnx0qasQSSWjSmUXSym8snUxTOkHoj_p32iZrXbDtBpm98nsDTvqM2_6rf6L6l8eCSUMiMs-VGQDQbOwsJMs3qp-rg71CEAgpnVq6m4VlTyvOlUjy7rtLWH1UETWGJ9tq2OIk2LP9dJJJiEFW-iHWKjc5zrb-7lqC_o-x0Lo-F__8gP5P-tbUZhyRbkeRJvnv3U7O5x83g09uraaVxFdgyXeyGFrcAPNEaYDMV5OgTu9WwJz2V2v7gZo4rUkZzZHy81XGtB20IjSdD7eo3DXnswXT6cJWI_XnR1w9w_mLn57ncCRB-CkvQh6YNU4bRDJn31HcJjtI9fJBtZpf_T2yFkfjxPsva2mc9sm06b17CwXyUz84XoHrxHTdG8_sJktNo89U7gLjuA49OajJ289cqfryePEyvxZdJ-l89lo69l3jiO7c_64cdb7o9nsdo1yPiUzxLEspXJKiXoOUO3K-Xz-DkEdAjo:1pkKVC:eMwtklwnWZWeXsGjFXhXooicfVpsqWf8xZtDS-yg-i4	2023-04-20 07:57:50.837559+00
44qkfh44tu2aarf2or7ujmr89pdyf762	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1psHQd:8LKiv8wn5OtDm0CNrhnCRcYtESlT05dHQo7j-vCaFQc	2023-05-12 06:17:59.354525+00
fbrgeb9oz7q65qcm8grhslfles79ro8m	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1plnC7:2NSh6ZBjoM-Qz3trChaQtOtbBE7HmZBK73nq70o3W-M	2023-04-24 08:48:11.634804+00
6bhvfrfkjxvsd3kdyqir9k2a69muj1a3	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pm1EL:-K2xd8P4qbOxMvbOrM8m8TBF-98C2XCCywexSGuS1cM	2023-04-24 23:47:25.248076+00
663g5usrwrqr1h93k19ni8eo5pwdeeu4	.eJxVjMsOgyAURP_lrhvDQ6C4qz9CLnCNpBQThW6a_nu1ceNyzsycD2AISyvVvWlNU6Lo6IUpw1Bazjdw2Ors2karSxEG4FzDhXoMTypHhTkfuDuF3X9z1lv32BOVmgLWtJTxfF1UM27z7jGy7wVFzgxjPmpU0kvpLQ8atfUWRTATj8xO1ljBMBIa5EYrYdVdCSng-wPRMkdM:1pmPYE:72-V3g8iL4DBBVMt4YGPTGjYQVVp19jFYhHJV9Rt384	2023-04-26 01:45:34.568072+00
6vdb0rflbpt4ftm4bs4p7enb84et0txe	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1pw3j7:8A5KZla7c5GzQQao8Kd3GS3Uv92QnbeyMmTAHA8hehM	2023-05-22 16:28:41.559865+00
6r96nj8n63lxq3d43nlh8iah7sjsf6lp	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1ppvlI:fs2ZrYmBHjvMMIhvECLUJ_lQp703HpKVnpCBp2Vihzk	2023-05-05 18:45:36.401098+00
s4u4251n3um6o6rpt07cpnpnudgvhce1	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1prmnX:O1P_WEWjyq-uI3ro4SpGwaualkePuTarrf3EwcFvj64	2023-05-10 21:35:35.085003+00
tk1xttilei8e6gct0cq199yn8n2lhdr4	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pzOqp:CU8R0P_pdT9ygejxRF0dHxD5zyc-tmI04BpMehc0DqA	2023-05-31 21:38:27.759057+00
vxjupk3vuo2l0p4wk9wdn6caf16l0qj2	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1q18DR:fFdBB8VjrdjNkw87tOj80PUcdyDkLOWNV7xDSPqkr08	2023-06-05 16:16:57.904399+00
cf8af5ijesa3ya5fdclp3a6ogp49rmg9	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1p93jU:vfamTJ5n1_TJM2z8bt8cswSB-ZXgfnPh5ucCkuroeAk	2023-01-07 12:34:32.405767+00
48regze1pte8xc2v5hk2qch3d5yeff9b	.eJxVjDsOwjAQBe_iGlm7-BtKes4Q7a5tHECJFCcV4u7IUgpo38y8txpp3-q4t7yOU1IX5Y06_Y5M8sxzJ-lB833RsszbOrHuij5o07cl5df1cP8OKrXaaxko-ESeInEEEIPsXAIsKE4wDAWYoxNTAnprDWJCsWcbgQGzAfX5AhgKN7A:1p9DP1:_j4NfyA-1oJS2ZzVMKfTT8jIRIQcziLf564INwy0XX4	2023-01-07 22:54:03.940487+00
ol6m1e92vndjqwaqzfeqbd0qhiw7ci5v	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pELaJ:bEhbC-MeQYVA2SrwGewLN_L5-uqS8h4imKKK0JaK0jY	2023-01-22 02:38:55.613467+00
1631e5sl93hlekappbat21bok6nvxv9j	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1pdGbL:Bxo38WXhsvYxVTgsaHSc6ClZ4XcFcL8gOgebY2mFEAw	2023-03-31 20:22:59.272808+00
4feoleaftuoridn09ucbyno84f7kjrhy	.eJxVjDEOwjAMRe-SGUW4aYLFyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izAXP43ZjSQ-sG5E711mxqdZkntptid9rttYk-L7v7d1Col2-dxwFZ0EOgBFmVUf3RSU7kvaADGgcAyJnZeXJBHUqioIRJFeiE5v0BB4M5FQ:1pUuzJ:srRKrou7tholwQxTtpoBJmq6kGARSvDL3q2pwRcDVmI	2023-03-08 19:41:13.321969+00
glp9lz2987nkbllquz370k95kjvt6e2s	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pluZq:pGHdo_uQFEGbAv1BjdbyFIi-eyDckUv9xz8ndmWIqoo	2023-04-24 16:41:10.609075+00
ty6spakq1hix3n4m5f8lak0uhjl8q1kt	.eJxVjMEOwiAQRP-FsyFLYYF40x8hC0tDY0MTgZPx321ND3qcNzPvJQKNXsJo-RkWFlfhnLj8wkjpkevR0LoeWFJK26hdfjdn3eRtT7n2JVFftno_X3-qQq3sHpw1Gkat2MCsQCkLFrJT4D0hJmRAponZK22ij1OMaIARI07WapvF-wO43Ttz:1pXQxf:27NxRc6RVRGiKdfBcSVlYAtMz2zlX4oL36vnWxzhJZ0	2023-03-15 18:13:55.246285+00
jgu9uf0dptvzjxi2jnetjhlq6ynjhl6o	.eJxVjEEOwiAQRe_C2pC2AwO4dO8ZyAwDUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1FnFYw6_Y5M6ZGnncidptus0zyty8h6V_RBm77Okp-Xw_07qNTqt0bTC7N31ltkYEkSTCgl44AGoBtcb1MO7D04IOiLgDPYSWfQMRAV9f4AAPM3uA:1pi07o:83BK9LfHM15C246MFXrP3w2f-2vuBVS7tXtniqx9qsk	2023-04-13 21:48:04.945261+00
nl57ek3up0g2z0ab9rzdcjhdvxdi1ehj	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1psVsp:Qa5iQZl5Xde4ZlzhCP8bUIZqCbA9gOu12gjwvE_wjw4	2023-05-12 21:44:03.692525+00
9w30hl6zh4a3zt4xtmuchd4stw34bbgu	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1pkSeE:WDW5xLP2n2iJdbt9JWgQ401iGnqx1DsRw1BS0ew27eQ	2023-04-20 16:39:42.125841+00
ax5hx2rd5hzmrn6gw7gktcdjgbj5mrfj	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pm3vl:gzSguVKS-V6W_yp8ASSpIH_FikrX-LkFKMynEreuGJU	2023-04-25 02:40:25.039079+00
zsgjndlpkrnyb51ijpvia6npzg0zkk4w	.eJxVjEsOAiEQBe_C2pAGGwGX7j0DgaaRUQPJfFbGuyvJLPQtX1XqJULc1hq2hecwZXEWSllx-H1TpAe3gfI9tluX1Ns6T0kORe50kdee-XnZ3b9AjUsdYSAPCZX_ziAUxwwOkyVwBn0mXzRmSKw0orLIphydJuLiVfIFTuL9AQzJN70:1pmPcU:ZBb8bgCa2DH991d2SaplyNu26iQMEsn-yDEVcB_lduA	2023-04-26 01:49:58.241417+00
totz1uqdf79smenbi6a7no6dna0m24qm	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pw3mV:UXRcWR0CIak6JRtp4LVY7dokv9XdPDVxGqNNa5TrQNA	2023-05-22 16:32:11.64717+00
vfw3nz6ob8jnl1enm4pl46vfy15sodtb	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1ppy7Z:9ytrkY_WKE1HktpfSPwViv7j7OiPjC-52OCt95um8aM	2023-05-05 21:16:45.377386+00
coug629b50of6r0ggzqjo9o49hf2z6r7	.eJxVjMEOgjAQRP-lZ0Ngain1pj9Clt1N2khKIu2J-O-C4aDHefNmNjNSLXGsq77GJOZmOsBcfulE_NR8VDTPB26Ieam5NF_nrNfmvifNJTGVtOTHufq7irTG_Uc9wTqA22uwvWOVDp4hwbcDk-st0CMcDkEsdkYeQayKG6xOYt4f5m08PQ:1pro5q:RzWh7SgRqpK2pBfnWLBrwe8J6uhA9sCiPQMNjxuAS8A	2023-05-10 22:58:34.081444+00
6dvc0qlhhx5dt8ys6wc545zkfvfhuyq2	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1pzOrC:V1V7XPz1Z8RE5tTu7kBLpjLs_YJ6LXIgpx-_IiSCutA	2023-05-31 21:38:50.73347+00
zmiv3gq27se7m6dnjkxkt2u4urcg0eap	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1q18Ei:i0UHXha6MC1FGrfJTg9XntAtva5i43B1gc8I-iNwkJ8	2023-06-05 16:18:16.561896+00
c5lhw4378vfgr2men0rxvtmfnnrsx5gk	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p9Dbb:3-h2hAtwg-JY-qYPUgN4c64HRwEhGmMXTJnjlyP6GwQ	2023-01-07 23:07:03.088107+00
u0zvg9zbic00b5mwdyti6qu53chhqzvo	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pFQrR:Wkzq5mW5ALPnunAMzRv2ibuI93qPDDMsfafBuTcGsLY	2023-01-25 02:29:05.747197+00
gojim0u9a9f1hn87cwc6dmq0jlls9l5n	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1peL8J:TBrLK7ZdbBtUVLmoBCyIJVcXFuYVCBAyeexqwyYo3DA	2023-04-03 19:25:27.166812+00
8r1w620483gg14m4j9hd9k4u2jabff5o	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pV4M1:0gWzcGTU24dBFLUAu34FQVlbX8awbz-npCUBnb0BYH0	2023-03-09 05:41:17.977368+00
8aw915i9aejj48xynya8yl44cdoffih8	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1plubX:4_WTYV8Ac50LuGhVgTSoFBjF4RocIKyyEC4dXvzqRgg	2023-04-24 16:42:55.048782+00
lwgy1qifteuefz7l39ztfh3l8ahv4nop	.eJxVjM0OgjAQhN-lZ0NK_2C56Ys02-0aGmtJpPVifHfBcOE438x8H4FESyvVv_mV7omj5yemLKbScr4Ij63Ovq388imKSQyjOMGA9OCyN5jzjrvD1_03R7121y1xqYmwpqXcjtdJNeM6bx4iRcFhQAvayWiYgLg3cggOpGVNo3YKN2YBsQeWRoEerFIUWSow4vsDz65H4g:1pXRm5:ZtnRXFfoD1A7CWHT4zEruQLXLeIUyR0MrLtBdXm5Z98	2023-03-15 19:06:01.744726+00
mlqm7ryfhbuct21prgx7o0hsuaja1z9j	.eJxVjEEOwiAQRe_C2pC2AwO4dO8ZyAwDUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1FnFYw6_Y5M6ZGnncidptus0zyty8h6V_RBm77Okp-Xw_07qNTqt0bTC7N31ltkYEkSTCgl44AGoBtcb1MO7D04IOiLgDPYSWfQMRAV9f4AAPM3uA:1pi0Pr:JGQsR1kagGZLe0wHN8pNKxVsb1xaJt5ytg5rvbqWoLo	2023-04-13 22:06:43.644023+00
xufgl7dsqaw68q37h0skgkjy9gpyam7t	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1psVx2:_kQPITd-P6GAJWYnxZmzqGWk2Ds8HVIwNu7qa67-RWg	2023-05-12 21:48:24.459458+00
gb8a71uvzziyenp17vpc9lnal8q9ad5r	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1pkTDo:GTKAJUkwi5KSQdyC-4IlGmwxf5kt5jtKIB2luS_QbTE	2023-04-20 17:16:28.387137+00
5yz7xpxukvlze4hsiz1kl2k8k3k5un8t	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pm3z9:5OCPZFUNlyew9hLzUTZifoVHmEov5h0Vq86F_751Gvs	2023-04-25 02:43:55.693801+00
tty75uqvo8nx38y0acy6ufxv9pzh83gx	.eJyNVG1vozgQ_i3H500LJKEQ6aRNs0kEidjS5nVPJ-SAAafGptgk0Cr__ewQQipt7-6bn5nxzDOPZ_yhMBoggEEQ0IJwv0aYxogogw_lYpZHFCoDUmD8TSkYzP0WZjk9oBDmykCJKY0xVESIdCuapllGX-1qD2bP6uu9rt43-8KLAeP-pUadIwQc-nuKCLymhSXPgS8coKn-ZT6YAoSFP8irdwYwLFVNt77H0noX0FREHGCOIgRD_xLK8wJ-UwhIobg2ur0mgmN0gMT_wpmhgBe59CScZ2xwf4-T7l3duBQmoIRDwmXde3A_nLppVQJvvng7GChx3hzbKbtZNB-6fLuIX83pzB-vN_YirV7-ZJbRCaQ8NBAFRQVIlNOp1vvzC2SAsSPNpSZ_jCernfU69xy8fjJmz24ezh7HQ2diFqvt0tP7j1biTBcR_q3uiPmsyGBel4gAZkKWCOUi7ov-WUKzxqfU3Fp0LtDC_36XLKEEXruSQG8QBiQuQCxTjV0R2kworzJps92LUhxR0t7h1yMlcXuuw26onQei8tsEl96lIBxE0a0hhBhyOZgXkxj4CGHoo_RMr64R0IPciluTuAoCLoapmbczEpPeYFkMYnwj_ac9UHRV73bUXkfTF6o-0B8GPe3ONKxfgj8_Ioyoz8570UjtM1zENSZFuhN8WgPIMp8FVE6uKtkKKfOqYSpa5lfaO0SvTSF-jQnprjnGkNT73pVMKAfY34EwhkzkPl2zfZwaWiAMc8iY9P_1Lx_J_1_jRsAsF4LLNiQ8_S3JvELyeVdk4xJp7Qi1zku8UgHdugPqEGKLjZ5UfW_a2Ns4oxGzEVGP8_l7yM3-1lt780dDJc7QPVZ2uOlu5o7r90ryvPH2OM1nCz5l5o-dSx6gt3xfHtfqD178nA2XkxVD89TarCbOU4cf4PopTti-3HdX1WtssjHYIH32bL-x6XpmLL2OtnPxryTa-b0eWOk_HTUGo3grEnkvw2f7ZeJNekXoJK6dTMv83TXKF7TAWw0_qJ7uqZpRv4xoTkxYkEN-mZIyQ-Il_GZNTqfTP193_9w:1pmQCz:qEWH-8oljM65-oS0i1XAwxF9_PsaIOKxK-xKz_px-Fs	2023-04-26 02:27:41.877693+00
sn2h457ezv8g8x039lt4mlnvqsej1nv4	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pqkcO:vCYaWQQxq4lIPHsZHjTE5YA3hxC_i0u0RsIJzDfYF0s	2023-05-08 01:03:48.036958+00
ksf7nqyvj5ed4gaefkmf6u46lo56lomw	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1pw3o0:BHVvKJi_JPDnPbz4M0mL6kqfzpowBShiIjAXXd0O7dA	2023-05-22 16:33:44.31511+00
9lh4r9hokyj6y0cgyhbmbz97az5ktgmb	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1proAX:rpqn0MFkm3JkkPnsnbGoEt66WKYBlNls_tcDRM_i3mo	2023-05-10 23:03:25.958317+00
7ias76e0w3l67ih92loj50tm0oncazut	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pzOrt:X91UDhaL1RlKJdczImGTSJY2U9yyLmYiE1AE85P8S8I	2023-05-31 21:39:33.403291+00
htunno7sntj2sctp23hn98bp0fr80qwg	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1q18Jw:k8nezPiKJAZnVq_hpdZg7m3aYb-poVxn4EYWKrrt7XQ	2023-06-05 16:23:40.468492+00
npergue8awotmoyxv0gcq2umhgy5xv6l	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p9Do8:Qcdnq-AZA4-pNYUX41gmF3A1MWK_3Rectw5i48enHfQ	2023-01-07 23:20:00.612056+00
w4lwhdko7khdto0c6izn78mahalv25ka	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pFQrm:kTCpsC-55z4lNfhpbcHgovMEL-mcxoq1iGkP9y2iBSo	2023-01-25 02:29:26.841399+00
lfjuq069oegygr3agoq0jmhvdldsvuo5	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1peLO5:DOH9Ufew-Kpvrc6FKg3eh0UNcSlpbww1CZjouL1nW8k	2023-04-03 19:41:45.208794+00
zuk2mowb2ssrgemiq0o23hdg7e435yht	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pV4PA:l3otBJQf5T2dj1elDJ_BVtdiYKoU1F7UcGhWOS3Lyk0	2023-03-09 05:44:32.422831+00
3tqk1lva6rvaixju2csbcomzaoo5lb3t	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1plusn:wrJCLVGKkxD6IiXsNqateN52TFV0Lv5SrXy2Tl1iKSU	2023-04-24 17:00:45.354734+00
f3yvtu0qhi3rniorofynex4ecn563ugj	.eJxVjMsOgyAURP-FdWOUl-Cu_RFy7wUiKcVEoZum_15t3LicMzPnw4BoaaW6d1hTTMG78IKU2VRazjfmoNXZtS2sLnk2sdGyC0SgZyhHAzkfuDt93X9z1lt331MoNRHUtJTH-bqoZtjm3TOoMAAG0jESB1DRjLaPKHxPymgvZVQereHcaMkHFJwUaRRoJRcCtWHfH9uESBk:1pXfY2:81E2OcWJd8FPtKfPmtDkNQU7WEqzt5ukAXME4DBpg98	2023-03-16 09:48:26.770843+00
dfeik3lnaa7c8kvshto5svma5f31fcvd	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pi1u4:q2M0icwjapPobmLejsEA9i-yMBWPN5bSKu6VlDkwi3Q	2023-04-13 23:42:00.274484+00
djcv1e5rh753wm4cjp8v7x04tk9z05qm	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1psWFW:KGeFmn8bYdHkzih_d0mN7d6_ZDJtI4durUDgpdzwdw8	2023-05-12 22:07:30.081722+00
utok0a2vk3e550bvfq1pvmmzl5o7s5eh	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pkTEE:oCECOiin1Z6dlvSoRMZAkstv1PLEwxQ8hRbj-Ar42ZE	2023-04-20 17:16:54.749087+00
itqwyri6my9x4jblljles3ttlymk25o9	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pm43t:HF3bDXPQ11rUJjhedVwJyVW5HmMLSs892q8ITSKk0iM	2023-04-25 02:48:49.46886+00
gvaugak5pi0h1z4fy990f2wnelvwmgey	.eJyNVGtz6jYQ_S3150viB5iYmc5coIQL5FISSLDT6WiELdsC2XIs-ZUM__1KGGMy07T9prO72j17tKsPhVEXQwJdl2YxBzUiNMCxMvhQzmZ5xJ4yiDNCvikZQyloYZLSHHsoVQZKQGlAkCJCpFvRNM0ye6qh9e-6Vk_vGnrvrie8BDIOzjXqHB7kCOwpjtElLSp5CoFwwKb6l_lQBDERfjet3hkkqFQ13foeSOuNSyMRkaMU-xh54BzK0wx9U2IYIXFtfH1NBAc4RzH4wplgl2ep9IScJ2xwe0tC46ZuXArj0pijmMu6t_B2OF1GVQkfHzZvuYnD-dt8Ni-NxH8YLrmzCQ530wWYbO3ZJqrWvzPL7LhSHuqKgqICipXjsdb78wskkLGCplKT3_RVhEYr2y3K3CYsfR3vVowOn51xuNo6pDjA4lGbbn78s-6YAZYlKK1L-JAwIYuPUxH3Rf8spEnjU2puLToVaOF_v0sS0hhdupJAbxCBcZDBQKaaLEVoM6G8SqRttjwrxTGN2zv8cqRx0J7rsCtqp4GoQJvg3LsUhEPfvzZ4iCAuB_NsEgPvY4IAjk706houzeVWXJvEVehyMUzNvJ2QmPQGy2KIkCvpP-2Boqu60VG7HU3fqPpAvxsY-o2pWa-CPy8wwRSw0140UgNGsqDGcRbtBJ_WAJMEMJfKyVUlWyFlWjVMRcv8QnuH6aUpzC8xHt01xwDF9b4bkgnlkIAd9ALERO7jJdvHsaEFPS9FjEn_X__ykfz_NW4ETFIhuGxDwuPfkswBxZ93RTYukdaOUOs8xysV1K0bqA4Rsdj4z63WNysweaHjcPsU7PdOVSCXoqGxi1ZTfYoXE-OlcPT9Nv-hOx26Ha2TojNTqf2krtw34tj9RbWqdtMkBC8j_OC_b_vPYNn_2TvYpbkOFiZJZvsZGDmvVAMTs2fp3f0Qlnk0jbaF_b62RnOi3Vsl0rWd9ezaNp4eenAcOIuhHayHT7P1_eN9N_PmoZrqwR9wDrrvrzmmPnn2TbIOVM2sX0Y0JybMTRE_T0mZYPESoFmT4_H4C6EaAdc:1pmQDo:nAZ8i0u6r98Ws0u1usXJyl5Em_d--hWuDL8mcY4S8GI	2023-04-26 02:28:32.628316+00
65fpjh3jqr66xe5hwk6uamceabqv52vg	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pqkdY:PU5nPIhp1-edeWHagtl6RFd1LoKYZyOp6XBjI9UQ7ms	2023-05-08 01:05:00.676007+00
myn4xl7psbf1wlx8uugop72nva515477	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pw6Az:g1yuqpEk8H3vnn3L_cKcaxAJk0LNPvwUTNM37zYu9FQ	2023-05-22 19:05:37.889981+00
23s9uv0mlqovoh2rd6c3l1e290jzc2j2	.eJxVjMEOgjAQRP-lZ0Ngain1pj9Clt1N2khKIu2J-O-C4aDHefNmNjNSLXGsq77GJOZmOsBcfulE_NR8VDTPB26Ieam5NF_nrNfmvifNJTGVtOTHufq7irTG_Uc9wTqA22uwvWOVDp4hwbcDk-st0CMcDkEsdkYeQayKG6xOYt4f5m08PQ:1proEq:C6nVrl7av6P-mefjucsKpeB1qxZmAB4aaDBTGFVPAfI	2023-05-10 23:07:52.813771+00
wen1z3ecjll6umq6994el0iow1d8q6bc	.eJxVjDEOwjAMRe-SGUW4aYLFyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izAXP43ZjSQ-sG5E711mxqdZkntptid9rttYk-L7v7d1Col2-dxwFZ0EOgBFmVUf3RSU7kvaADGgcAyJnZeXJBHUqioIRJFeiE5v0BB4M5FQ:1pzPXJ:f-OaUjs9B1PAFapXI0rZABT1ByWBs-4_1WtZJbxPOO0	2023-05-31 22:22:21.376437+00
us93eb9x3pomgb0khylv6j9ctal8rtgm	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1q18O6:IFXM8gjNbRULtgh9dUdeagzCGi7YHRKKqEbrT6XmGmM	2023-06-05 16:27:58.895638+00
ssi51k49g7jwbahvdja12n61n7r4zzqz	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1p9EGf:64xXMtXBzf6iV0kRTVUn4hZYl_Mw9WT6TCEtSrwnI6g	2023-01-07 23:49:29.375457+00
e2tbdcxlt2gzm5ug64t8fh9vrxkgxkw2	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pFabn:9nCsz__RW7dirrOYc5Yo6PHrokJZ_APTq1QvoFzJ0VI	2023-01-25 12:53:35.508056+00
2r3s1p3krqh91dfetwazzvjmh2cjvcmo	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1peLVe:fH9N7vuKVgf0pTMbgAky7Op5oUpcYhHXL2040Atu8n4	2023-04-03 19:49:34.699063+00
3f5s2jrzv7mxr7ncw7wy7ncptzzo3g92	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pV7YQ:N9UzGT_EDIoSqnwIewZuR82IEJZO4coREhWVCkn6HaM	2023-03-09 09:06:18.05536+00
hjxf6n51qv9cxeetrngc3sapiu958eni	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1plut4:6OfLC1FOEScQ5dE0VGUCYCjIkDegVjwN0MSCGtA8fmA	2023-04-24 17:01:02.679555+00
ea8hxaj6imxbn6o99xfqppbg530xfjen	.eJxVjMEOgyAQRP-Fc2MWVgt4a3-ErLBEUopJhV6a_nu18eJx3sy8jyDvl1aqe_MrxcTB8ZNSFmNpOV-Eo1Zn11Z-uRTEKAyIE5zIP7jsDeW84-7wdf_NUa_dbUtcavJU01Lux-ukmmmdNw-CBtWrGCMpSz1rMygw3gdGDd5IqT0qicCTRanQqj5KvoLFYQgRCMX3B5SeRt0:1pXsLm:3JLrd3WYWAo26lgpd_FiCPGmLBqEp5V9vNiYftAQqlw	2023-03-16 23:28:38.801801+00
fhy8kt7ch49p1hyksofzy4yv1fgqcpa1	.eJxVjDEOwjAMRe-SGUW4aYLFyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izAXP43ZjSQ-sG5E711mxqdZkntptid9rttYk-L7v7d1Col2-dxwFZ0EOgBFmVUf3RSU7kvaADGgcAyJnZeXJBHUqioIRJFeiE5v0BB4M5FQ:1pi2Of:K2lbCMpB97NowR-kvMEuT8CUAGCamkuLtQRqls1fXbk	2023-04-14 00:13:37.273826+00
5a0kwygc9dt5atv2xpus6hhwf4kr9byh	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pt6Ah:JVa_1R84_o68ZhVZEi0xY5p90DD7nQznXTJGNv_y_uc	2023-05-14 12:28:55.37784+00
prq07ngzn9rf3pnvsjf3ibxa5uyhfnwj	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pkTJe:Ze6x4XBrZadfnFeE79onyYsx5o0Kahb56gUe_u0q55A	2023-04-20 17:22:30.312939+00
pnim0hs3dfdrwoiepga5fgeh1blallep	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pm4EN:IaT33B9yoaqtOVAY3siPZsCJEdvz6Wi40-lg89ppg-8	2023-04-25 02:59:39.344881+00
qir7plpfvc252ni8l7dyocgx45g3zn9q	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pmQFw:hZLkchLp6tieJXQuRleKI_fWnCeLON_y05RU9TfCCFE	2023-04-26 02:30:44.938779+00
os213epnlokw5rvskrebxg6v5cp37cat	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pw6wL:j7U7VRYLBEm3Z3sJ9UqiiFW5rZEonULcv_BvUqHez9A	2023-05-22 19:54:33.213723+00
bein309lu9mdl4ryanbohpjpqp43iucb	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pqkvz:w0TeXMOfMJFp3wXsraT-fKcdJESOltEwckQcAGRBGTY	2023-05-08 01:24:03.980238+00
57x34x17qqj1iy8aavr9d3ghihnd2zq7	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1proRE:tfyNxwN1QoCWSYtPI8XBlII8WDjJ7QdrPYtLcVHHRnw	2023-05-10 23:20:40.283587+00
2xgovdembe1kdasch9g26hwthtl653bo	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pzY4J:5YAu6kxIyEyYmDow6diFpjwtIsMQo1DZktKwW1SblmQ	2023-06-01 07:28:59.29829+00
pz8czfm28m5u7i1616xcjauct9g0thb5	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1q19Ka:BAFruIwri7miTPE-KrO-lXZ47VTUZvtaLXAujvYU_yM	2023-06-05 17:28:24.809205+00
q55hhsozxdasz3diiyfzz9t88zu07gn6	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p9EI9:79Y_E1zZzelAh90-Ry4VbFolS9e1FQKndNwXorlFGiw	2023-01-07 23:51:01.864845+00
vo42nhsvi9xap724vzt4hleuz3ypfz03	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pFaja:JLpm3BJn2SxIGeDAqmbuQ9UsSgMUK5Dv0WT-R4n_-UM	2023-01-25 13:01:38.110299+00
i5qhqlwv15sxxgt5knlh1fcdoam0rkxm	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1peLmS:crR-SURhfOH3qoJFojZNzXRdtN2u-DpZQ-2KMmD_9wg	2023-04-03 20:06:56.804485+00
cvu6abcjx5skcitk3yhed7gz0005iwp1	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pV7fn:Wm4LbG8yIFojSIo_upqv5zgYHtcKdYdyKSfGHj7oUcg	2023-03-09 09:13:55.669361+00
l4zcvp9k5ckni50ava9i4ds58pmfv8ek	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pluwd:g_UDxpuB9XcpiKYIsGkbxmPCmtsLaGXmBI-tb8VyXvc	2023-04-24 17:04:43.709237+00
chp9vzslscty6rntlskxl7wynv4p9j5e	.eJxVjMsOwiAQRf-FtSE8CiMu3fcbyAwMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxYXcdbi9DsSpge3neQ7ttss09zWZSK5K_KgXY5z5uf1cP8OKvb6rW3SGlwyQbE3CpWG4pBDMdYP1hQCCMlyTuSBWGnlS_EOKFsoSGYYxPsD-Gs4AA:1pXtjI:547820nPpiX_AOzpQTbMINLMP-4gefF59a5vQ0C8ATk	2023-03-17 00:57:00.468746+00
ekxmqvrm2njnw2a0bje8kg0emwd3fdj7	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pteFw:EzhGpK6A5etANsiKBst5KC-wxvL3f9UOysTLwyuFFgo	2023-05-16 00:52:36.010399+00
slib8a2fujbbwfa46u9u6qclezk4rb0f	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pm4Hr:7-irSxJDwSAC0iVmfR0la6EX6IJ8TwDXq_iwXaENWMk	2023-04-25 03:03:15.554715+00
66fpwcqleqyuv2w6xucsfix4z02mzi94	.eJxVjMEOgyAQRP9lz41ZEdB6a3-ErLsQSSkmFXpp-u_VxovHmXnzPkDMS83Fvf0rhujF-SfFBGOuKV3AUS2zq6t_uSgwQosIp3Yifvi8T5TSXjeHsPkzx7w2ty35XCJTiUu-H6-TaqZ13jyWgmXVdb3RFgdupR9QWEygMMmkUBsrjH5g5A6NMkFjHwzzVW9IaxR8f-fESCw:1pkVJY:Qf4XtmctoLvDP5i3vDxqga0_oi0TYEVs5SNuuR7jEcE	2023-04-20 19:30:32.472907+00
fg6prupnn1zhz3mtnw2297el65dhhc9y	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pwCsn:L3IREcYXiPsQ32etLvh1vhbKh8aTLb1u7dYj59sOYmE	2023-05-23 02:15:17.798757+00
aimpf7h9qmfyqejcad1bglw9in63s70c	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pmQGT:nVQNGLtkdcp7BmsJsLZSd-lk2Vb_uNMSvkqUyT1aB0U	2023-04-26 02:31:17.282897+00
8uo2oisd5f8yl3hlserxhiaa779q1hdz	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pqmYB:ZjBq1U3O0tQfpVMGPemK4alMw9-s_cWWtp1_JrrndLY	2023-05-08 03:07:35.802335+00
9cyqv23glfruevuupb4u4o7qkjottspv	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pzgyD:K-Jyxwq6mQC21UV_SRdQwTTN_fjG_rSV8PVNJjgxORo	2023-06-01 16:59:17.434816+00
pqeqb931cmf9njna3s8c9txsr9iyef8n	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1proSU:LOWS7rliWAJTyEeEqldlsvX3VoGkFB9EiEYYO6B3Cso	2023-05-10 23:21:58.221199+00
y8dkupitrlx5vacxoa10zjtmt126tvme	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1q1CJO:RmApgSGjjV44jqyVKyTt23O5hw4xcVxmr7_ZL7ZlCIA	2023-06-05 20:39:22.646192+00
j3rxiaol57pupzv58lcpc3ylhgbh8bpm	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1p9EIJ:W548lcXbCvYnZEsw7WJTfPACBaNx89OjoPxHa_06wck	2023-01-07 23:51:11.136261+00
dig9ge318szkvalfzovhcc3syeomkj0x	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pClTU:t4E3EWlBrmyLM2GS4eloSt2GCAMN7NURs9BxV8vTiPM	2023-01-17 17:53:20.675623+00
uldbb5qa8z8eog0ye4ewxne3kt84yeax	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1peLn1:5-Oo5C9nMDwtjyIniR2FQmu0hj6d6bX3FjRXl69fVDY	2023-04-03 20:07:31.575281+00
2gx9avg7cbxskr7pnfbbn02qjr8cqvef	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pFakJ:7ddBOo-zcZmk9rCPX45Uvz-QICYY-HTtqNtw1ThcX4I	2023-01-25 13:02:23.235068+00
ali350bsy8bfz84cf3c3fx6qj9hdnk45	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1plv16:yt654vE-5ne2rlIgNB7YBKeNU2CEKfouIg-lBYCY8ME	2023-04-24 17:09:20.626122+00
2h595810kx0e10ybacrhy0m0w01gggnh	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pV7gR:DoPRRX0E0POHALjWxbK7BDvO-Co-_p3nlzZMmQyGhCY	2023-03-09 09:14:35.834801+00
ui8bt44n152nenv123gi6ielbprtesbx	.eJxVjEEOwiAQRe_C2pC2AwO4dO8ZyAwDUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1FnFYw6_Y5M6ZGnncidptus0zyty8h6V_RBm77Okp-Xw_07qNTqt0bTC7N31ltkYEkSTCgl44AGoBtcb1MO7D04IOiLgDPYSWfQMRAV9f4AAPM3uA:1piL7Z:1XRgo0FTzR_L_I1odultUh5zac8gaK0f_-wojqO62EQ	2023-04-14 20:13:13.551822+00
5brs4jxnzotnx2pu9pzczwq6nrzjsidu	.eJxVjE0OgyAQhe_CujFhAEF37UXIMAyRlGKi0k3Tu1cbN25e8v6-j0CiudXNv3nJKXP0_MJcxFhbKTfhsW2TbysvPkcxCgfiEgakJ9ejwVKOuDt53X9z1mt33x3XLRNuea6P83VBTbhOB8dwBLaJqAdpUxpIB2MGskpzb4PcFRQARjJSKdBGk5MuDImkdgwovj_HFEfo:1pXvWc:p4PxOBePChV73DXua45RyZy4WK9FjONg1dLqUXT7el0	2023-03-17 02:52:02.195532+00
x5t13thmiap7fko89ntbva74hps8l6xc	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1ptjr9:iVIeFkpJi4fyyygNvpbsNMipdclpGPGulSfePlY2tAk	2023-05-16 06:51:23.285412+00
waim8ti6xffsat5fcstgvoauhs8s6x38	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pkVf9:r-5IwJTq2bpzq-hTFFruEyu9lH3kmKyUC9TsKLEnC5E	2023-04-20 19:52:51.56878+00
jc3w3ycvyly93javh2nyb3fbiwk77q4m	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pm4IR:_Q56MqnlEZzxCR9NTaadtoRcxfHvgUMZmx-Q-d7i4uI	2023-04-25 03:03:51.172431+00
vfwwwchmjxydqhm05ov2l7ogjvbrrzr7	.eJxVjM0KwyAQhN_FcxEV409v7YvIullRGgxUPZW-e2PJob0MzHwz82IBRs9hNHqGsrIrk1Kzy28aAR9UJ4JtmzEHxH3Uzr-dEzd-OxzVXhB62ev9XP1dZWj5-CESiHHqShYcgNJWC4GWbNLCOFxsMqDd4q2OlEh4L6Jy0qSoJMXE3h85ez2f:1pmQIb:Y6F_hkdIKm9-e0dpOmVa8FYjRkdrZjb75nwJHcEm9Lg	2023-04-26 02:33:29.520832+00
61v7ni8j0a7tmomunkpbfx5pzx71sdpq	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pwCt0:7C2yjWETM6PaVd-lS8qrlLFMoqvxwMm5dGu8Lb5QnDI	2023-05-23 02:15:30.873022+00
bgaxz9zwda7vshsxy9hk9zz6yjgnilkc	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pqoxo:3F9kRdOolrg6O5HMPel_WIWA9ORhRCcfIzhxtPhBirY	2023-05-08 05:42:12.651985+00
h78m7ujaia4il7sqrzwcgawe584vv3lo	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1ps05L:cKHA9B6zCsG-I3rkX4wPgak0OFlaUZySw8RlfxgIzZY	2023-05-11 11:46:51.908022+00
v5xob14tfw6krwzwmlmptu6d2semgx9z	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pzhXO:VrldwEQeFPN8nqGc2n_rTLoOvDyltnAhZIsFWSW-ONs	2023-06-01 17:35:38.090661+00
7ryikruwyelbdv9l3mfgcadxohs45ltg	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1q1LhG:68TI0R09aICZavEmB8YoocAPeDyOcMyWN7hB6EHp99E	2023-06-06 06:40:38.441088+00
zlppqybeviczgw2no0dewhn1lukkuclk	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p9rxc:2p6NeUjmIJjD_v0mghgUq8ld3kZLe93NreFCYexsll8	2023-01-09 18:12:28.770097+00
kcpjwdlfk7wvctipfu0axtcvgnx0l1lm	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pG47X:a8NmnByJXEzuHlCKOcYH1TbTwbx5mP5E19DgTioARNo	2023-01-26 20:24:19.088918+00
bsmhal4hsg8tw6k94qaxxkpj1z3tbrr6	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1peLnc:zOPl1Gk3ggx1Q6fl0Bp3luuXOzlEhKdMBXB8atIGl60	2023-04-03 20:08:08.849612+00
z5icjukp7lokd4zpfweu2kuo5b2z5epw	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pV7kj:pO87ymWzUikL5UHR4ym47-xTEliRX7KyD51cQORYtds	2023-03-09 09:19:01.074982+00
icg4x1aru6cubang0byeykb4t5bk3zm9	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1plv2v:b06tSz5ro8NUypvXT-XbVErDHxnz8sY2N_gNZW1VPc0	2023-04-24 17:11:13.359533+00
sxx3sjgdzdr3obp60mwrtrg80xfxidvh	.eJxVjMEOgyAQRP9lz41RUFm8tT9CFlgiKcVEoZem_15tvHicNzPvA-TcUnMxb15jiOwNvygmmHJN6QaGaplN3Xg10cMEKOECLbkn56OhlA7cnL7mvznrrbnviXOJjkpc8uN8XVQzbfPuabXqg-is0Gpg1-lBjHJETYRsW1QDBokWnSfWHQnJFFrFSL1CjZ61gu8PnmVHsw:1pY0nR:WQO3cPOHlz67j3iVZZ720jd8Y9DQDvTiuYDNdratqzI	2023-03-17 08:29:45.101301+00
edcc82b0rxokft55vffeixsrylrycbn4	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1piMDA:bryAdgArfXnBir7GgPm6neNftfv84J1TvwholsWKkx0	2023-04-14 21:23:04.579026+00
fmp257ufsuu4sr71aaiavsqc7seln658	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pu3Tt:mfXskoq_d0IrJ2L46vQi3WtXT0KsfdK3ZLE5rYxyCL4	2023-05-17 03:48:41.578106+00
cta8gc0dgoam7k7n4fra9g5xaizq5x1l	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pkVfO:Q425WDUdkwsVhuszsOBTkrNf-Jd9pW5C1BSIB6kxISk	2023-04-20 19:53:06.751+00
nnavbcrl8ewtg8079hj1fbdv24vt9tyd	.eJxVjE0OgyAQhe8y68aAQUF37UXIMAyRlGKi0E3Tu1cbNm5e8v6-DyDRWnOxb95iiOwtvzAmmHNN6QYWa1ls3Xmz0cMMUiq4pA7pyfmsMKUz7hqw-29avXf3w3EukbDENT_a64JacF8ODrMgcqd61mgQe6WVEKRZByVGQ4MOIyozTFo5DiymSbjeyDG4XrIL8P0BFq1JBQ:1pm4JE:Cs8DJ6wJUTE5jMHzEqcRqREbaiyZP-IMESq6k_FQTrk	2023-04-25 03:04:40.28353+00
7rh1zooljejcuwmaug92jov897thmycx	.eJxVjEEOwiAQRe_C2hCYwpS6dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFchdZOXH5XT_yMpaPwoHKvkmvZt9XLrsiTNjnXEF-30_07yNRyr5NDVmwNJXA6TQEYDGh2ZMlHsgjaMqsxGqWiw4l5gJGDU4hpSOjF5ws_fjiT:1pmQOY:ujNKtvHcHby-y7xuITlLljudncyvJX92pgtSS5dU6Gg	2023-04-26 02:39:38.792083+00
a7qsr3q7hvzaphvbh95qlztblaze77yd	.eJxVjMEOgyAQRP-Fc2NYcIXtrf0RsrIYSA0mFU9N_73aeGiP82bmvVTgreWwrekZiqirAiB1-aUjx0eqR8XzfOCOY1y22rrv5qzX7ranVFuJ3MpS7-frT5V5zbuHnGhG5wmItUUzpBENTjbhpEE0yaAlChi0ZrA9yuTZk2hHAL0kY9X7A-iBO8I:1pwfBL:_QRv1Xh9LVsPcWaTXXRw6kFB82dE2De3t41gjZ_g49w	2023-05-24 08:28:19.745459+00
9l3d87xvln3m1329a48marjmg7yz3jbi	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pqpYk:q0RWYaZeQc1rM1og6zXPqZGFcQwxif0GMUIrv7oHyQQ	2023-05-08 06:20:22.916926+00
x9by7rt6r4uhgavmy0qqct3hc0f73ugv	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pzicS:_LZ5kGau12Bqiz1rCp-eICsvxdIiC4XaBgQFM-pGnjQ	2023-06-01 18:44:56.475901+00
qzba3enrjux8np93gmd0uxsm39pbmw24	.eJxVjEEOwjAMBP-SM6qS2q4LN_hI5capElGlEk1OiL9DUA9w3NndeZpJaolT3cNjSmouxvVoTr90Fn8PuVWyrg134v1Wc-m-m6Peu-snhVySl5K2fDtef6ooe2wewjMIqlMkiwRBYVkIZqHAZL3SAAoDO8vEVlkBSBFH4R4C8ajm9Qb1iTvu:1q1Li2:ED0WqKB7TbqTarHJgUfRrVUlu5MCAwBPnoTmGXvu5ao	2023-06-06 06:41:26.183381+00
d2y69pif3wt64mc5pt6bq2qwrhanzopk	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p9ryA:mTGBenV7VSt063APp6y1nh49g2U4tOvrJanULIj_A28	2023-01-09 18:13:02.677656+00
370lc2c7y9w46tz1xf4lrkvfzqzih8ax	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pG47a:NebZBKa63dVzZ0ajoL46lrVq6F0Y1RPHccH80ymWydE	2023-01-26 20:24:22.440698+00
3d1koe3h1ymay2nvh6xcupqnqhvmrfsz	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1peLrm:NNHKnwDacB1U-E2gfDXIFJqhlsDnFUSobtGBwftALTk	2023-04-03 20:12:26.161828+00
4vzvl6w4y10xd4xjhyqhjay9hosp6pch	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pV7p8:FqohUquZWOTy_88mLVA4QRo_56kv8bR6nbf1-h8P2ak	2023-03-09 09:23:34.266349+00
xhavckdpj104hcyd6u88ytwcydvxg02c	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1plv3q:EMpZgzC96PwdYIVm3fNaSYMNG5NPtUTIV8-JA7ETSyw	2023-04-24 17:12:10.212454+00
rvo42yxv5009tmdlbxuuh747fi711e4l	.eJxVjMEOgyAQRP-Fc2MURHZ7a3_ELMsaSA0mBU5N_73aeGiP82bmvdRMrca5FXnOKairAqMuv9ATPyQfDa3rgTti3lqu3Xdz1qW77UlyTUw1bfl-vv5UkUrcPT26cdGD1-is8IBWT2YCJALxPTgLiwEPHEhwIG2Elt4J0OgAIQg69f4AzJk8TQ:1pY0py:DaBsrmzv0B9BlbfVSvLEYp19cIz4Mzv_hIsRGW5wg6M	2023-03-17 08:32:22.096082+00
qtxlkvofr8u6m20xxnbiyp7nwtlvawnc	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1piMlv:WTb5Tt80BGztFHl5BsBWK-ymyCsRIqpgyrwPPm7EOq0	2023-04-14 21:58:59.112145+00
o0z7plqaqfix7fyluar3ugquw2f8iswj	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pu4mS:c2PxHQ3K1ODDEnLe9cnJE89y9anC9iHQZD1MUvYHNC4	2023-05-17 05:11:56.702718+00
d11a3hbja7yy0u3hi7clwvzuq2o0jckl	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pkjV7:2fkO-YUie1lXRn31ZbIkkySg4RPLL5i_KSVKpylcWHs	2023-04-21 10:39:25.023654+00
yxmtmti6z1x3e383ju44w6dru0sww9k6	.eJxVjM0KwyAQhN_FcxEV409v7YvIullRGgxUPZW-e2PJob0MzHwz82IBRs9hNHqGsrIrk1Kzy28aAR9UJ4JtmzEHxH3Uzr-dEzd-OxzVXhB62ev9XP1dZWj5-CESiHHqShYcgNJWC4GWbNLCOFxsMqDd4q2OlEh4L6Jy0qSoJMXE3h85ez2f:1pm4YX:Wxmn-90nNUoPGmWrMlx25ODlQbWiE8OUcWQPKoR8OMo	2023-04-25 03:20:29.978408+00
ogsh83dbtnzirh3t971zmah1qx6gr97m	.eJxVjEEOwiAQRe_C2hCYwpS6dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFchdZOXH5XT_yMpaPwoHKvkmvZt9XLrsiTNjnXEF-30_07yNRyr5NDVmwNJXA6TQEYDGh2ZMlHsgjaMqsxGqWiw4l5gJGDU4hpSOjF5ws_fjiT:1pmQPI:LfeLAzS0l9XxQ8ebTZMZPe5SBes6J6iUOP4wpHu2MfY	2023-04-26 02:40:24.360271+00
us8uwbrbvl5inh5mfjqmcg0wqs9oeyr3	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1pwr7G:CXTE-x3P-k0dqoir1cJaZjHdJlwj1_jIW8yv4aOjp9c	2023-05-24 21:12:54.997379+00
o4nx7n02d0vf08ay45611i2mgq2it0qw	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1prDWr:HFiZBVLPBfvSoLcEjWQRml4wWHuqb7U8lK_ikIYF7lw	2023-05-09 07:56:01.525172+00
1jbfq0x3dhooiuspmkdyx9fofzbiat7z	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pzigl:kDh47u5uoP6WhCMCJJToYBn18P3Gm6CSxzJjvenAjmQ	2023-06-01 18:49:23.517893+00
54kbjeb7z66f9ygda1wzxazl1khwd7ly	.eJxVjEEOwjAMBP-SM6qS2q4LN_hI5capElGlEk1OiL9DUA9w3NndeZpJaolT3cNjSmouxvVoTr90Fn8PuVWyrg134v1Wc-m-m6Peu-snhVySl5K2fDtef6ooe2wewjMIqlMkiwRBYVkIZqHAZL3SAAoDO8vEVlkBSBFH4R4C8ajm9Qb1iTvu:1q1gk7:MmpEI7HAwBIFdtvpfUijckqlYo9Sp21yzgF9ztBYtfU	2023-06-07 05:08:59.463809+00
0vi91y0xshrkowqiny9xtlbtijtccaki	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p9rzj:3taIPDvyddvFA5a4zkKFp4nqDajxB7AgJStpFtHcBGU	2023-01-09 18:14:39.350953+00
hrfl6d4o7ceplavtasg45pjcvf392u93	.eJyNU11zojAU_Su7PG874BfUp1VauzqtFW2LsrPDRAgYDSSbBEU7_vdNBKTudHf6lntycnPOzcmbxkmAAAZBQLJU-EWFSYxSrfumlbBaolDrphnG37SMQ-bXJWVki0LItK4WgQAuCdlokqQI2k3HbDeb5o1-o5tWsyNxDLjwy_7F-RAI6K8JSuG5JcwFA77cANXNH3SCCUBY7iQcsAgwcLhO4J58jxV8HZBEUlKQQMmYlYQvj5Ig4QgxKeKvzUpbCZ-ox2Ph9tI_BZzvCFOqvjLXHVnr0Q86nZn7fkYdj7zszCS_ne4gWe_ud3o-a0c5_dA54j7PKGTFFRHAHP5bnCKV6EdSPzUPuiIpPNtQRaOqMEjjDMSq391YUqtAiD1V2FBhmARAIJLWZ8R5SdK4Xhc0v5a7hQxFe79uUJpVExAgit4DIcRQqCyUkMxXhDD0UXKSV9wRkK0K4XtIHgWBQFsJCJZBZUFWMlxVrS6DGL-b9UX0tIbeaF7prStDfzbMrtHpNtrXbbPhSf1ihzAiPj9FsZq1z3EWF3WaJUuppwYApT4PCJOX60qtHCXbV0qlZXGWvUTkbAqJMycky2oZw7T4Xk2lhAiA_SUIY8hl7-O529uxkgXCkEHO1f7P__zbT-Tl9Gzo4i3kyJURNdHjLyVnA9PL76Gsq6pRh6jeLPnaXa_3kNN7Go3NuN8bDQ2949nGyg0Hfb6i5pPuPhwmz_hptgwPJLPF3FpYT4_T7fCALeY4CyEsI38OXxN9Mps-7jfOGi1-37at5nrlDAx7KnSUcuelz-PO3Uw_sIETo8wdeHYeGKODOx87wOVGy3R-wzzc5PuldZsFI9IfJP1xD3TSBx3pc2jRzWS1C7bIs4NkTTLP7kf3w5bXi1-Hjwka2ZMQoPHCszfOnNPWwNVKhzJoAYOiDEtOkXwQv_otx-PxDwqR2dI:1plv7x:92Jrh0RLCtQ_Li3nuPYELhebHR6Vqh6KJ6sgqsz4OPo	2023-04-24 17:16:25.582762+00
sb3fh4ansrszp8eq9ys221kdiqfrthfp	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1pGNUM:AJ450yO2uz5W45n9Wvpb5Crqu1uGB7gYC0fL9-u500s	2023-01-27 17:05:10.918472+00
sh14y2ogxk78s9cjckgp7179ueezt6hf	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1peLsl:uIKEl0xlpZuTGYbzV2WWT8VJUY0fQFAt2gEVG6zhJr0	2023-04-03 20:13:27.559419+00
0aq5b9pnhe9mptsney7ce9ogzyehy8jc	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pV8XX:ZUd27YNLIW_Nl3xrlch9anwocDgyhIu1KhLTLzYge7A	2023-03-09 10:09:27.114206+00
her95tl40htndyiaryrfkev8bpquz9fq	.eJxVjE0OgyAQRu_CujGCI6i79iJkBodISjFR6Kbp3YuNG5fv-3kfgc6tJWX75i34wLPlF4YoplRivAmLJS-27LzZMItJDCAuIaF7cjoajPGIm9PX_DdnvTf3SpxycJjDmh7n66JacF-qR3VECMZrx2NPRmN1EKh-hlE7A5IJUHvAQToYFLvZExK00rSVZKfE9wfc4kiR:1pY1zI:-EdXza-P0Jebg0DWaCnlQnbsGhdI61xQcwa3UTyBTLc	2023-03-17 09:46:04.687108+00
k1kz9e1g56t7c0bmnw57m3ete9u9oo86	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1pil29:xaGzfxghVZWSk0_tbArP16O-2KsiKOEHYx3fadtZTlw	2023-04-15 23:53:21.044504+00
euiluz9j9rbx7k0qxb7rct0k2cvlwm0f	.eJxVjEEOwiAURO_C2jRAS5Hu9CJk-EBKRJpYcGO8u63ppst5M_M-DERLK9W-wyvFFLwNT6TMptJyvjCLVmfb1vCyybOJCaHYiTrQI5S9Qs477g5h998c9drdthRKTYSalnI_XifVjHXePITYc-PG4AYRFAdGM-qIEULoK3nvo4HSsoeR0hmlIfsBnhR3IhoCZ98fAjFIwA:1pm80k:sDihM45gqTR9PUUBV_YC-2UizszJ1DvyRIEFwaCPCHI	2023-04-25 07:01:50.440818+00
7kmuqzs4hx6ujqsy2qiywx5v8v7sevln	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pkjfO:B8IdSEyC2aswv65IggFTnupcvOcJMZ4NF7vQuayDOak	2023-04-21 10:50:02.568604+00
cdw32b4ftgc1uaaqx27ibfqpw4tfzt9x	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pu7O2:vsFpRmvhlkwKyxUl2vN5jVDlrnRTI5xuZa1E2iMHBWM	2023-05-17 07:58:54.059593+00
dygsynf8uwmmt3clq6ya0958vbxfqk7b	.eJxVjEEOwiAQRe_C2hCYwpS6dN8zNMMAUjWQlHZlvLsh6UK3_73332KhY8_L0eK2rEFchdZOXH5XT_yMpaPwoHKvkmvZt9XLrsiTNjnXEF-30_07yNRyr5NDVmwNJXA6TQEYDGh2ZMlHsgjaMqsxGqWiw4l5gJGDU4hpSOjF5ws_fjiT:1pmQPb:54BSrL8T6-Vf7NWVYOMdN_1InVHGqIgCCLyyT-9fJ3c	2023-04-26 02:40:43.951592+00
frsz5kq0vlqtal9zoqlywm3enwn4mtdt	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1prTqc:TFCwC4ZpPve5gkEwr6qtlJq6EjgPUBVsRcXFjiXL7yQ	2023-05-10 01:21:30.664932+00
eh9z9k9yy4twep5pe1wh5u0k9f8bnq1u	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pwsrA:uLEb6rbVRJKSuXp-XBfQmoV4YnIHgZN9MjUkBcrd0Sg	2023-05-24 23:04:24.537129+00
xb6b79jo9a531igdxaa1lf1w5z86yxma	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pzik4:uIC8mM2n2-AgvhBcrA-xbGEJSH8kINAXUfMZIkfEpNI	2023-06-01 18:52:48.048969+00
z9xplf4seichje6hjlyemux1snsg5uey	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1q2EEj:Hmpmo4PQ4zNShZf8BIJsF8D659OnLNESVuYihIrd54w	2023-06-08 16:54:49.668125+00
x8a43sitms67kjiu93la8koxhnv920cg	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p9s1F:LW_ihKF4_YzB--KD6LwVpD942Z4BsMleew7Qi-FyHlw	2023-01-09 18:16:13.277699+00
8s4xxv0jlfh4sdaqmdqdzadghtqhufro	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pGWO7:XwWgETGQgZTcslZqBmFilZeZjvzdiQj-48r53nX5VO4	2023-01-28 02:35:19.609721+00
6qskktmbw6m76ml41dvt62dilc3oqnth	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1peLuP:9Nmr3LVLjxSkfcy8QJ1UfJowxUglvQLBlXehOUj52e8	2023-04-03 20:15:09.285258+00
tqmqbo8yjb865gzq7tv6ay7lixts9p2d	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pV8YF:gBQB1vFV8XB3vn-Dtt72FX3pUbWzlQ8t3iynfS70LOk	2023-03-09 10:10:11.433856+00
vnhd0nv6jsethcif2ya69u5y19srz80n	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1plv8O:4B0pReD22tdnK1dNAaWUY_6L-iy8zXLx5lxYeMwrsBM	2023-04-24 17:16:52.500969+00
sk90xuvv9wsat2ht69v8px40kgr9hijm	.eJxVjMEOgyAQRP9lz42B4gJ6a3-ELLBGUopJhV6a_nu18eJx3sy8D1AISyvVvfmVpsTR8ZNShrG0nC_gqNXZtZVfLkUYwSKcoKfw4LI3lPOOu8PX_TdHvXa3LXGpKVBNS7kfr5NqpnXePGgl9qQEaTv4STHLAclKjYyi742JwZLW1guKClEZNJMXPirSVyUHK-D7A5jTRvw:1pZBrF:5UiTGXrvCmxgtBOGeshLJMIEkmDoQ4f8aM0hQBh6iRg	2023-03-20 14:30:33.183891+00
tdgrw58sho25whje06uttrz3g4p6xkxf	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pjUJ3:xKLK4sACCkznR5wzc1Souf7ooKiRO9MvhHM_KBxIekc	2023-04-18 00:13:49.464175+00
z73lx67ai7r9i7mwwu61dibwacf7ud66	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pu7O2:vsFpRmvhlkwKyxUl2vN5jVDlrnRTI5xuZa1E2iMHBWM	2023-05-17 07:58:54.467676+00
xrc7aro3ldajrg7om9ftudqxnu5ri1ox	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pkpri:MnTq8ocCUQqlXGMuc6s__-flZ3H4uEPJQCwulyFkqk8	2023-04-21 17:27:10.354675+00
zpmyzr4yqlc3guho38uwkvzav3j10qvc	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pm81G:3tRpS2CPM08NPo1q9-3ZKAxKHW9XzhKlLPANTuukVRI	2023-04-25 07:02:22.37372+00
fycwudmqqgtf2foa2o9envipiy335jiu	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pmRgn:Tw_E6R8O6kYeQuKsJ_7aCgsxjLUcA_2bB67fkM6u1Cs	2023-04-26 04:02:33.073475+00
2sxuo1p0gmtaf98ngwlajs61dgng76ey	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1pwu4s:fRkEXr_YJEsxjXdUHmxyxVX-Gdmg_a077RXFkVBk50g	2023-05-25 00:22:38.409556+00
jnxb33y7nppgfvok6dmgrzpz6vy6mqxs	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1prYtd:Y__RJvP8yhCWY9HCZdgSKkzb_iAg_E9yAEDHl2_PnWU	2023-05-10 06:44:57.523208+00
w1wyto78vjxtis1k6qdtkklqr2r3jzzc	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pzlQX:_vAy_h3F8CvVMd_S3liYxxzEyb4vXL-ICji6G1_89VA	2023-06-01 21:44:49.902716+00
2o27dachjnfpj61lbp3gvx2srod27yt0	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1q2KJ0:0aVpOAfGYpmCoYBZBouy_W-xlBFwgevzatFjgSnINzE	2023-06-08 23:23:38.5532+00
s6k1yt7vb7yde1byktb0xfjdj7az7j8u	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p9sLl:pDevk1phXPNpO12pEKZEfCGOOvE_uJvca3Z5EUeZzoc	2023-01-09 18:37:25.255112+00
c4cadvokmuytc6pqktav51nenn2b7gae	.eJyNU2FzmzgQ_St3fG4ygIlN_Olw4jj22W7SxA2hc8MsIEC2kKgkbNOM__tJAeykk3b6Tfv2afft6unFECzGQCCOWUVl2ESEZZgawxejhfURJ8aQVoR8MiqBeHgKS862OEHcGBopxChibGMokiYYvZ7tWq7tmo7Z7_cuBypBQMiwbdAUSECicM0wRceaaC85hCoBXeuPSqECMFGpguXJOUcoB6CmZf6Tafw8ZoXiUCiQoiyqHIoCkr--KBZVeIq50vFTtpPXwg33cGhGfr-EEoTYMa6V_b2-2N_MrzfU201MbkbfXXftSH_mTC9hamG497MUL8Zu-eH0WISiKhFvWqRABPq1Ok1q0Q-1_tlOypxRdBxEB3YXEaBZBZmuOF4qaucLWZcam2qMsBgkZvR0Rx6PjGanc0MLT4K3iOO0Dk8F2nH1DiSk6VsgQQRJ7YgWUjZLMUEhLl7lNT1ittVefAupqxBLvFWA5BXSI6hIWayLdTNEyJttvzOgYZt278x0zizz0RoML5xhzzp3-mag9MsdJpiF4tWQ3bJDQaqsiWlVRErPCYCyDEXMuGpuarVqlbzulKqR5VF2hNlxKCyPnIRF3TFDtPllPa2ESSBhBEmGhKp9OFZ7OXSyIEk4EkLnv_3m-_6JYV7fDb97DLVzPYle6eE_rWeD6PsfomfXkX1y0SnZ8o2x58335aRMl4Ns5M1mqZ3lDyb04vEK3c0fRsEVjkdFbU-vn6ePq_7zLqbPy9tJ6QdeMBqtwb-0hPuEluZdsohY9BVvnCy4WoMFYz-vF89rKG_c2-jHvfu5zrNUsOvHwMvuPzPpJD7b_Fune7M2V9SHh4td4P2YpPTJyraBN60XebrfBlebOfeSuxkij3f2Ba_2M5h7l4vpYOXvg9GX5f2NvHWWq-mVnwdeOlrCjWeXk2Qw6W_YwImyaizWi-DaaEdW1os5kq199iVWTxR2_-dwOPwPUHvdKw:1plvip:rmA8Cl_hLtMXdWxw0IcLOjA4XupDtfYRMXO5sIc9mqk	2023-04-24 17:54:31.468574+00
ck20cph5duunet3psyq08bfrp5ujtiu9	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pHYyN:4tZUDgSkBF83KLdQNk1li4NLm3gEQDC7zHIEip_IzAo	2023-01-30 23:33:03.003353+00
eli5n8yse0h70tz9vmu547wa8jnyh71g	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1peMHN:okbXYiNubNik736iep_vlQAPeZgoWc7Ghs4FOVKdSgg	2023-04-03 20:38:53.02587+00
wctnnak3zgoih8oitef99k464ia27nvc	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pVFLx:dDfUplhxCr6heaZseQ___Q0oK-CYGmcgjnuXynPzzok	2023-03-09 17:25:57.23373+00
v6i53p01uyj14z1p8l5yvoz29gtm9u68	.eJxVjMsOgyAURP-FdWMA5eWu_RFyvVwjKcVEoJum_15t3LicMzPnwwBxbbn6N21xjhQ8vSAmNuaW0o15aHXxrdDmY2Ajs5pd4AT4pHw0kNKBu9PX_TdnXbr7nijXiFDjmh_n66JaoCy7x8hBoFXBSm6NCFJNAlA7abSeoXfcCewDBa5UMDg46qUCS8S1NIIPXLPvD5F5Rsc:1pZW0w:PWpCyF_I0m6GRfPzpDWWS81DMnhqCgcxn_7a2m8MFvM	2023-03-21 12:01:54.203042+00
rpvfmskbol58v8q39kuf5s741nsd0jwv	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pjVAS:DsUWuylxz1j_TNZSWVygpQgFG2kO1XkYxEgXcYJGVb0	2023-04-18 01:09:00.83391+00
mux0b5je9kq508h9oq8wmoe8ivl8ufff	.eJxVjM0KwyAQhN_FcxEV409v7YvIullRGgxUPZW-e2PJob0MzHwz82IBRs9hNHqGsrIrk1Kzy28aAR9UJ4JtmzEHxH3Uzr-dEzd-OxzVXhB62ev9XP1dZWj5-CESiHHqShYcgNJWC4GWbNLCOFxsMqDd4q2OlEh4L6Jy0qSoJMXE3h85ez2f:1pm846:j4x42Ev_TtZBM-T5PozopJFPN_9kH6VGzoZZJ03bRC8	2023-04-25 07:05:18.758499+00
1bxf3kw20dplk2bn4arjd8qq6c4qbgz7	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pkq8u:PqmUc3YzdfK3KgbVSh6qxTeK_kMbvL9iiJ_WmZiGYW0	2023-04-21 17:44:56.070404+00
4qd2znxiq0f13q6yoklvvyh90l6mx0iy	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pu7wE:l_iYz4kQyejiWiFuxFFICzyL1u-6_xTMSxFXcEr33GY	2023-05-17 08:34:14.152744+00
726tg9dbfogwqxsrc3k8sfvuhkf7i6j0	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pmVXr:xnxGNrGYP6sojh7XWq9z3_y_ISMTG1BWF9N6xAhUxtE	2023-04-26 08:09:35.529192+00
8fqvvzrjw1c9smjxbckbv2ghnvfvcb8y	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pra3A:M8kga9jiLRvb1HTDfc3Nhw8oTRYYgEY8Jm4kFGeEOSQ	2023-05-10 07:58:52.004823+00
tbzml7m1am5xpy3tu0kka4tehgs6krya	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1pwuVy:Nbwz4lhBln5Qo_TLfvXyonRTYJeyCsYaXKLVOAnr_LI	2023-05-25 00:50:38.325048+00
gy2s1tpgdtlj86yap6tjhcueoyj1lvsp	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pzlcY:PgCSfkySb-jP_6_1UN_NhZSJH7SoKCgZo3YCAHfg2iE	2023-06-01 21:57:14.121177+00
xojffnyvamejhpjrkh2kma1owq7xdbly	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1q2LUe:3EL9oAZRrXtP9iZEgZemRY4s1fo253WV4AegTYzk6uE	2023-06-09 00:39:44.869241+00
igrsrzubduwgh30vyhlv69661ack45s3	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p9sW9:_HiSnY0ZUgdH0uVaVyQslxcN1LnBdBNooivtWH-XZwA	2023-01-09 18:48:09.102671+00
yutftya7013xpz5c32d4j8ry8myv2g8e	.eJyNU9tymzAQ_ZWW5yaDsY2xn4oJdRPfb7FDp8MIEFi2QAwS-JLh3ysFMHEn7eRNe_Zo9-zq6FWixEUAA9clacTsIsIkQJHUe5VKWByRJ_WiFONvUkphYtdhnJAMeTCRepIPXOgQcpA4SRCkZlPRGpqiyS1ZVZvdDk9gQJldNigKeIBBe09QBK814YklwOYJULX-qBQMAcI8FZKdd59AuAMgkhvy90Dg9y4JOScCIeSUcboDYQi8LwvOijjuo4Tr-CtbySvhgpvnxci3S4gBpUeSCGVfN8xcmr7hgCA7nC_OUE6D58ZUvZjDbLFpJmisebtBd4M_nB5Rm6YxTIoWPsAU_ludIJXoh1o_t5N4RyJ4HUQEShVhEAUpCERFc8KplS_YORbYo8AwcQFDJKrvsOuRREF9Lmh2LTiDCfLPdl2gHFfsgAHffw94EEMmHFFC3GY-wtBG4Zu8oodLMuHF9xC_ClyGMg6wJIViBB5xi1WxaAYxfrftGwNKiqw07-TWXUNeNbSe3O615Pt2q21x_eyIMCI2fTNktWyb4jQo4igNHa6nBkAc29QlCW8uC7V8lcm5UspHZlfZDiLXoRC7cjziVMcARsUvawolhAFsO8ALIOW182u117ySBTwvgZSK_K__fN_PGObt3dDNY_Cdi0nESvPfQs8BRrc_RMwuIqV2UZ0s-ZKp66NTPIj9SSfo68aLM4qOfaO7PZ2U02MwiCfLoeGu5sPI16FlqDr7QQ-ztA0tfZ1uBrun1VpumYRndhc4p0aDKVZffVgO9w-jxXqw3o7Xs3iv_XSPWtiMn8F5MJc1zWz8TOczxeDUpz47TFsL94gDA2XT0dAyJjMv0PamdxyklhF3ny-ri_moqmELbveWYRn99iK8dBLjPFk6L-MGGKGtpfubc9vrZLPgaaxSV9_I2dQbKqul1bf6S67MepDKobn53ASy0kCnGPFHsqsflOf5H7sH3Pk:1plvtc:7bxjXWqJEYSVTtoHUTsIhlg6705J8GIyjUNjAnodQyE	2023-04-24 18:05:40.55444+00
14c7ndne96butbhsktovg2dy1kqsy6yq	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pHZ14:XSe68qvyxF9P6LLKWtxKAFf2v5aif9HDr1uuuKrr1Fk	2023-01-30 23:35:50.480047+00
efrrcupgn4ltnql9i59hlfffkvl2n3ro	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1peMLw:HUbYdz6CVy-WknphsB20k78igNjumK4KQHBRf2hgNLM	2023-04-03 20:43:36.870923+00
oywwaigjo1fqzyrklzradxqahivuufcw	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pVFS9:cZjicUtUKPs-AoLri89KB3BrLPgnBHkwMP1In0IiJk4	2023-03-09 17:32:21.176546+00
hfqpzeitry5ptgldlfkpre9kcfvhpng5	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pZaKK:NRAEQ7iLkX_8Zdrxm5uFPNkJC0YLc3ItqewrbYjcU5U	2023-03-21 16:38:12.872251+00
yt5oal403ltyra7eeqanype6438hppl3	.eJxVjMsOwiAQRf-FtSFQKg-X7vsNZBhmpGogKe3K-O_apAvd3nPOfYkI21ri1mmJcxYXEZw4_Y4J8EF1J_kO9dYktrouc5K7Ig_a5dQyPa-H-3dQoJdvrcZAnghtopyZs9WEBsk7HNjbpFATBKXtwMEZi5qJWbvgRuWVOUMS7w9KozkR:1pjc2h:_lMQm658CRDhQ2vAhl9bxB9El8Ww8635WwTLFj6B0sw	2023-04-18 08:29:27.711104+00
tn6r0salkotz94gh5bdv1c6j0jfoompt	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pm8Ns:Gyw_NKH_AxiEXVbHpWuPHFPIveQ_sqodAVdtR_ksmFU	2023-04-25 07:25:44.846819+00
ui9886wip1dyt1taxo5xgxrtriezwbvo	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pktTO:e17HDyl10WmQSYAyDl2bLaEtbXZ_qR9TddHsdganPpQ	2023-04-21 21:18:18.956961+00
rpbkkjo6e9wn989zlj62u48udyzv5mlk	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1puNCD:jJivMGFU49o-Epm3s8glC8C1c3n0de8R83rQPgFd4mY	2023-05-18 00:51:45.241138+00
sfqloh52ph1jsaa60hrbrue10jj8pxxe	.eJxVjEEOwiAURO_C2jR8WkDc2YuQ4QNpY0MTCyvj3W1NF7qcNzPvJTxanXzb0tPPUdwEkRaXXxrAj1SOCsty4A7Mayu1-27Oeuvue0qlzow6r2U8X3-qCdu0exi5ly6YFAZKWgLGGZthQGSvHGPMDtqqHk6p4LSF6gdE1jJQdgwp3h8k_z1a:1pmXFa:WxpIwKqzuD4fW0dEo1idcjZ3W-rgqhOUpyHoITgtOd8	2023-04-26 09:58:50.890604+00
g6ax3svksoy4n3ryg82lri2sxok12kom	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1priuE:3Jz3gCR4Scje5gIFP6tniBXAm2PGDUZOEZSRzhIeRyc	2023-05-10 17:26:14.589253+00
tgxmzhbdq73xey4jru7jsl3jf1ik1lzo	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pwulA:Rmb2nWK4BrvamhgEATOdPaUwLh1XNYsXDrRi5HZOvWU	2023-05-25 01:06:20.868954+00
ynytyooohhx2p6wj6c75pvf29ustyh35	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pzlct:hUijkHkfRwdMyfqrXL9QWRU5oUpEJH6dLBVZ77PDr2g	2023-06-01 21:57:35.80825+00
8ei9411cb7kzad86p6mad48jlcshgth9	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1q2NPe:upkl_jKVnUhtADLBqcrFptuYkJwxuhiQxBt1mwQG_ew	2023-06-09 02:42:42.307508+00
inwva5kh2twuk64hwp0jhg80gvdygeie	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p9sqz:6J5Qk0CpBFqaXlBCapJLZk240452qjzB6SKRowXyCPo	2023-01-09 19:09:41.390431+00
uj24ldmx9byhcokdqgzab53ci7yjxgf8	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pHZGT:8sTxShXyZyVbWw46EOKE5e84ibdOHy0kBSsG3a-AfqM	2023-01-30 23:51:45.375863+00
zpch1891xvntcnoxt2gqwrs97xwafexs	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1peMPp:OsIHyUcUWoWSwiAbu1oC6x54HICoaQxE4PdRMy68-y8	2023-04-03 20:47:37.309067+00
hmclx8pgyuz716cc75dczvbw8di88ktu	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pVFT8:wsBp7gbWlx_CZCWBEzU64xegYmSCVPxSH0gOzpZr-ZA	2023-03-09 17:33:22.274873+00
fqf7xxcpayjz4dheoosuos6v7u5p1oz3	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1plw1m:eoohu59-nwx8n8ImYw-kEl3-E8Tom6R8dukCDAku33U	2023-04-24 18:14:06.474755+00
m0kdfep9nne6p53p6telboshhphpvffa	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pZaMq:ELgYppQvV1EJZn1_J74efgaLHIIP9PbdyObm_xvt-kY	2023-03-21 16:40:48.626409+00
cgt5q2sjvi7d2d9buq37ovb42rbbgcej	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1puNjR:R2JmaepmTCo40uIXikcsKB5sJlYYP3_sJYY0cXxwXYM	2023-05-18 01:26:05.03949+00
7iilnpgud6v2bwg4dnk7yqhjpgerohfi	.eJxVjM0KwyAQhN_FcxEV409v7YvIullRGgxUPZW-e2PJob0MzHwz82IBRs9hNHqGsrIrk1Kzy28aAR9UJ4JtmzEHxH3Uzr-dEzd-OxzVXhB62ev9XP1dZWj5-CESiHHqShYcgNJWC4GWbNLCOFxsMqDd4q2OlEh4L6Jy0qSoJMXE3h85ez2f:1pm8QY:MCQHJUgsA1jpSFNDNeVFB0zacZ4QFGCaIOzla7rApGs	2023-04-25 07:28:30.856298+00
uflz77xpi57rzvkvi358865g9ui401kv	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pktXp:3ClftfRgB4QWi5IdTDz3TX-oNmOgRkGqroBhFPmFjjo	2023-04-21 21:22:53.313995+00
ud03yy5ddyhwzqa4cvnir2pl1ubmyg22	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pmgi4:Zs5hJQ0vc4jt_mM5kCHlcH3FRWVSQW9HHSqZhQ4JbQ8	2023-04-26 20:04:52.604369+00
culi1la3yub0dyky405mmj6s4jd85fdz	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pwvJm:QVQVHb5mIGqzIwTOHe1JLhMrxJbiz6Q9RIr6xQdcExs	2023-05-25 01:42:06.241757+00
cbrikubmnycet1ryot14jwr9236rsooj	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1prj2w:ELkgdTW1evOkg6T7R__SE4REuBXAmtR4cidYnyqsPVc	2023-05-10 17:35:14.663594+00
bzayrhfvyo393gxyn0a3s80np6nvb9lu	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pzlcu:Bj3wPdLghqifYtkLHjNKEuFoiI5iQK14RRltRui2G-I	2023-06-01 21:57:36.053832+00
afkfv38fp8ue53gfqnz5lpnp4fq8vos0	.eJxVjEEOwjAMBP-SM6qS2q4LN_hI5capElGlEk1OiL9DUA9w3NndeZpJaolT3cNjSmouxvVoTr90Fn8PuVWyrg134v1Wc-m-m6Peu-snhVySl5K2fDtef6ooe2wewjMIqlMkiwRBYVkIZqHAZL3SAAoDO8vEVlkBSBFH4R4C8ajm9Qb1iTvu:1q2Nx6:_28AQOt7C0xd3W_H0HfvmO1zmZUa0aqqHwTkXGpWdM8	2023-06-09 03:17:16.642369+00
by7xqul0leo5whp6rvmn7omdjsl93f1p	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p9t3W:45JwicpT72i_sOd8JxbVQpKTTmNHlsoxyz78tSi9VUA	2023-01-09 19:22:38.720779+00
dt92g2ww1idjzmv51a565qc2oqttxtcb	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1plwAs:joFmG2y5MAXbH6hUMCS8h4qmaPl03YgGuQHjQsr2NN4	2023-04-24 18:23:30.105394+00
q30uj547bpnt56syfbstz8m52prujz1x	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pJsAx:hX_sgBZe5W_z5XLKkbA_syhRA2YJLoARVxBSms99Hsw	2023-02-06 08:27:35.200102+00
x9puw481gvivptwf6alc9gbj7t9umaci	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1peMRj:eVZOXRL0HpNg_X_5dD6tcMoQsyTcKRM9D0kTBnGvWAo	2023-04-03 20:49:35.21518+00
s2j0afu0rvacy85zhxvabp93k8956c4i	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pVFUJ:ncFrd6RXXgpM4BKbEotuMJcOKlDPhDqvHxXI_qZOBvs	2023-03-09 17:34:35.835676+00
74xe8hrga3dfbf9wwdr2fppd73r1u5hr	.eJxVjMsOgyAURP-FdWMA5eWu_RFygUskpZgIdNP036uNG5dzZuZ8CHi_9tLsG7cUEwaLL0iZzKXnfCMWeltsr7jZFMhMtCIX6MA_sRwN5Hzg4fQN_81Z1-G-JywteWhpLY_zdVEtUJfdY9TIRRCSRTdGLV1kAUX0BgQNkQsRuFES6DRR5rx0jDIORioetGaoJZLvD7RvR5A:1pZc51:uwi3R90JTAm_WeXdtDX8xEjh9DyTyKvNxIs-d1l4l6Y	2023-03-21 18:30:31.629382+00
dk016lcisg10d8vc7vbaruhilsd8ysg4	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pmAXd:V99x-1wbU0xs-CPYSHtsjGlO3nq93gayOAo90wL2l0o	2023-04-25 09:43:57.213058+00
y85x3xwhsa2wvhz6sxjluxn0dm7utt5m	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1puNpU:lw4fynYXqhSfxLEeldKC7xE9MVAgRFg0ICClpujRoz8	2023-05-18 01:32:20.433036+00
dq6bwklh469kzmzrfidz0e18bppi3bi0	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pktcy:5n1yD7PbEBPW3dy8B9Ooc1LIK00g4dr-ZWAaJ6NTI-4	2023-04-21 21:28:12.749903+00
20juldyvrw6s869zq7n79cq23lceggif	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pmhIZ:Ed4fjAyEYrS9m4YMmBQ0bIYEy-LiW5MkmOCUPTvUzIo	2023-04-26 20:42:35.585565+00
t3c969xrhq96l3ax54uujzl27frynf0t	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1prj9H:g2WzoWfQW97ry-crfpidBgwVknbPLc7rq19nRYVjp4A	2023-05-10 17:41:47.65677+00
aru5nlf3y1pyzne50o9go66sq0kf7r5r	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pxL40:wc1daXkCDkjKCBes6mzSM4FEuIYhdXLJY86r8qRfKAE	2023-05-26 05:11:32.574394+00
46f7s7ytuetyzlyp13rp3a2916kkb5r1	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pzldV:i600YSAEWBNsP-uaixjWjPsqTHpKKG3-HQ-J8N7zKpc	2023-06-01 21:58:13.251236+00
w0br31u66kmr5we26zxaxcjmkkk7pum4	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1q2Nxe:nCqQFj5g7Yp-NOfmg3CB7FOy5--GDOPL7FBm60gyhv4	2023-06-09 03:17:50.943026+00
a6htxoiyvugna0wlgu25nyzparw1f1kk	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p9t3p:qkbxO7OJ90qvh6bo7ANYgANNDdThzfVRtkiheIQW23w	2023-01-09 19:22:57.028081+00
gg4d82zghsmyquujj9wjrgms4xsynahy	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pJwc5:HJK8KANCta5T9l1aycMTakWpdLrvbVD_BdO7OoaBvxA	2023-02-06 13:11:53.017616+00
59ox11ac9r6lao1zn10oys29xbndaurz	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1peMl9:qFKWfHmTpjEbe9RKjFGREwzqkKaaFYXtOeGfpqv_xq4	2023-04-03 21:09:39.691053+00
lxc375p2u6aflwhearmc85o4u7y1im87	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pVFY1:Qucl_oGGPuvsyaFUE_yhZwgaOVX3JtoVsxtwAb_8J7k	2023-03-09 17:38:25.40525+00
6gugsby9ln1ricvzepylk03gh22w2xfi	.eJxVjMEOgyAQRP-Fc2PAXUR6a3_ELMsaSA0mFU5N_73aeGiP82bmvdREraapbfKcclRXZQyoyy8NxA8pR0XLcuCOmNdWavfdnPXW3fYkpWammtdyP19_qkRb2j3Yi-4dRrBgPTCOM4uBAcJgrTBbhIii2Xoi9HEOMoIL3usQoxtYk3p_APYJPN8:1plwJc:QO9LT3kZra6dCQR6mKWrz96mKbZ54yml0OaRVo48c8U	2023-04-24 18:32:32.421737+00
jkn8q1mmlopog0yjjauflgcpcvb4ug2z	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1paiue:JuWy_Dr99Ls5Ku-wsVfwfscO0FX3auuKBaBhUelAfSg	2023-03-24 20:00:24.575766+00
233z1e8z9kolq6fjqoxbhgd28umkvtgt	.eJxVjDEOwjAMRe-SGUW4aYLFyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izAXP43ZjSQ-sG5E711mxqdZkntptid9rttYk-L7v7d1Col2-dxwFZ0EOgBFmVUf3RSU7kvaADGgcAyJnZeXJBHUqioIRJFeiE5v0BB4M5FQ:1pje0s:04vMnkpEsDIP6az5hsEWlXszkwDU1z-8VSDdMw3-47k	2023-04-18 10:35:42.896767+00
ic2zp8xy1vz5h9tozco2kcv8ns4wc3r4	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1puNwI:7-4VnruHWggREFMKViR5M74Ct0M33Lm2fLcYbvJZHEc	2023-05-18 01:39:22.924032+00
arzmthqhfre2f99uj9emi0ag1x9156wf	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pktlE:s6ZPogaWflTWMMmJKnY3-EC6diF5NmmNiijsNPhthf0	2023-04-21 21:36:44.292314+00
tiphafye4bfahgnt3wrz1fzogjvd688t	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pmGlJ:vSQT-RUxpUoLKZaYmuEMXG-GdQiPPKSTPY9PeBGPqEA	2023-04-25 16:22:29.003421+00
1i83pfvc2bl9td9rqmdur3zequpvq1vx	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pnAjs:dTJ8RV_1HMV4bQeWSCGq4zZ1uIZt9Kah5owYPi_GfFE	2023-04-28 04:08:44.191045+00
v6j02dq4wl5equg8vb9rim7dmhev3f7j	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pxPOf:j1ILeLNHrWJe_6QkfssaA5ZxTm_kUTWEEFYaf9yzbz0	2023-05-26 09:49:09.940775+00
ruu1p5knfzghk7n272m0fvqalep45me3	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1prjDc:E9DhZZJH3XVPu4ik7g_9NwH8gLgPQ1p0IMuw2yjFkxQ	2023-05-10 17:46:16.676094+00
uyknx5ryyb5482jhewwz4d86msrnao8f	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pzleF:A3-nCgxfDwRM5if3HSIbycsyFtgdFnMYw5BQC-RsJHs	2023-06-01 21:58:59.960596+00
hin5w4lyupet5izg4e4cjcvopz7fuamu	.eJxVjEEOwjAMBP-SM6qS2q4LN_hI5capElGlEk1OiL9DUA9w3NndeZpJaolT3cNjSmouxvVoTr90Fn8PuVWyrg134v1Wc-m-m6Peu-snhVySl5K2fDtef6ooe2wewjMIqlMkiwRBYVkIZqHAZL3SAAoDO8vEVlkBSBFH4R4C8ajm9Qb1iTvu:1q2SbL:3hRSYpW_XEnzs2EoZVQmruBWHXO05-COn9tlfWctOQA	2023-06-09 08:15:07.903706+00
kfjf03howkkefacgyfmyycobzdcivyqm	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p9tdA:FXYNh-0U2Pi4X_yJxD-ACNq2cz1Jum56vvMGuRfZLmw	2023-01-09 19:59:28.971395+00
fz5mrxysoicvvoye9vibyk12q8qq0iey	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pK7cQ:zWMMsuQmkbHZFTKYGkphd1Y6Sl3Ju6k-AvbxaiQxwAA	2023-02-07 00:56:58.72005+00
2o6fty5yd8xk2pybgod272dn5h9sd3du	.eJyNU9tymzAQ_ZWW5ybDxZfET_U9pg6-pWlDp8MIECBblogkMJ6M_71SABN30k7etGePds-ujl40TgMEMAgCmhHhlRGmMSJa70WrYHVEodYjGcZftIxD5jVhymiOQsi0nhaBAPqU7jRJUgTNsswb48a80Vt6p2PddmUCAy68qkFZIAQCeluKCDzXhIVgwJMJULd-rxTcA4Rlak-T8JpBmABAdEP_Giv8OqB7ySFgDyXlPkvAfg_CT2vJIhKPEJM6_srW8iq45J5O5ciXS0gB5wfKlLLPx-U8Kg45TUcxWojFbfE0nsJ87et9ZzwU1qZgzoo_gLt3p0fc41kKWdkiApjDf6tTpAp9V-vHdpImlMDzICow6wgDEmcgVhXHjqTWvhDHVGEzhWEaAIEoae6I85GSuDmXNK8RnEOGoqPXFKjGVTsQIIreAiHEUChHVJC0WYQw9ND-VV7ZI6C58uJbSF4FgUC5BATLoBpBRtJidayaQYzfbPvCgJqpm9aVbl6Z1oPR7bU7Pb113TIsV-oXB4QR9firIetlexxncRmTbO9LPQ0A0tTjAWWyua7UylWyY61UjizOsn1Ez0MhceaE1K-PMSTlL7OUEioA9nwQxpDL2qdztZdTLQuEIYOcq_yv_3zfjxjm9d3QxWPInatJ1EpPv5WeHSSXP0TNriKzcVGTrPjauN-fF-k0jZxuPOgv7f7ynvndrq0HPnf7d9huP6xEFBittn0Mtu4gT8hsYoAi1mnMnv3laBBN1svF1B2iWbLaJCYGyx_fjgvDHaytoT94fE7tTmvMyXIZBEW0mY7y9LuDNzzooLibJknOdrhgZIWtwU_-ZGfj9WS7mzujzT0_5HZ3SNzhdNieDG-MreO0NzMeTg6dOWb67eMu7heW_e3ZkrpaHSYO7sgdadVs0mMBg6LySZEi-RZe_VFOp9Mf5FnWWA:1pVFp6:Tf_NM0Msb8PXUajgg4zMMqI0mgyB1HhLtFKI4MWCZfQ	2023-03-09 17:56:04.421078+00
syffc5g2tohlzdqrtpr4yw6whyemmuwi	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1peMs5:fbxnFojW0EilJoH2ONJk-ZNkwsvfjxUg22aMOKJArXQ	2023-04-03 21:16:49.702014+00
d76d7nxugiklzt67ps5h3urskkhno84r	.eJxVjDEOwjAMRe-SGUW4aYLFyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izAXP43ZjSQ-sG5E711mxqdZkntptid9rttYk-L7v7d1Col2-dxwFZ0EOgBFmVUf3RSU7kvaADGgcAyJnZeXJBHUqioIRJFeiE5v0BB4M5FQ:1pb6S9:Qo6Qr3e8myKW9zAwRyHbURC-R27DsOXSLcNZY3udnqU	2023-03-25 21:08:33.04207+00
o2kqhc5ydvvwdyg7pex9vxldsfoe5n5y	.eJxVjMEOgyAQRP-Fc2PAXUR6a3_ELMsaSA0mFU5N_73aeGiP82bmvdREraapbfKcclRXZQyoyy8NxA8pR0XLcuCOmNdWavfdnPXW3fYkpWammtdyP19_qkRb2j3Yi-4dRrBgPTCOM4uBAcJgrTBbhIii2Xoi9HEOMoIL3usQoxtYk3p_APYJPN8:1plwJq:ppsBWkEmZxJBBvo5IVTEhBZ_yMujkvRkYzWAyIjFzvc	2023-04-24 18:32:46.041475+00
kcubew5z4axy7gw6762lzwgjxt5q4stv	.eJxVjDEOwjAMRe-SGUW4aYLFyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izAXP43ZjSQ-sG5E711mxqdZkntptid9rttYk-L7v7d1Col2-dxwFZ0EOgBFmVUf3RSU7kvaADGgcAyJnZeXJBHUqioIRJFeiE5v0BB4M5FQ:1pje1f:WwhCpxP0Af5aNI8nc4ZV6u1DKeAg_pXOYZuHZ-VVxGg	2023-04-18 10:36:31.091554+00
8gnpbb3zhaik0d4znx9d0pi9l8saa5w1	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pusME:LVgZQBh6OraGZEPWm8d7bchvWRd-zf5LMxsc5x6Iu_c	2023-05-19 10:08:10.970836+00
pizhi04w1njdmytwvizjuy0aq7htya47	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pktm1:FEbjP23A-k6a6GbOsz1V2qhBjy5Ro3Glm2tQ-ochxa0	2023-04-21 21:37:33.901204+00
64urkiax9h7aohq28psf56d8jkahowz9	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pmHNg:GgN0lCQBELAOEZr0bMj6-570y8HCqsCAFnsT_M6HltQ	2023-04-25 17:02:08.69537+00
wg6cz9dh4m9szu2kzhsayakdjhfha8is	.eJyVVG1v4jgQ_it3-by0SQgvQTrpgNJu36JAaVk4nSLjOImLY3ttBwgV_31tQoCu9k533_zMTGaeeWYmH5ZkEAMCIGQFVVGFCEsxtXof1tFsnji2erQg5ItVSCSiM-SCrXGMhNWzUsZSgiwdYtyW43Q922557a7nd7udrm27XlN7CZAqOtaocsRAoeidYYpOadFWCRBpB6ir_2M-lANMtD8DnJecgBIJx_edP1Njv4Is1zFrJHCCURwdg5Uo0BeLghzpD0OkkPgtBFQHpniNaHTp0MYE5JiUJ-shkGOoCmFwphSXvetrkjWvKgmMRJBRhagy9a_Bdf8uyMst6H_rvEd8sp000Hzx8DpNcGuzG6MMeW8BiSetne3NJn9Iv92ARigGATEVELX2-0r5z7PgQMoNE0ad358eXPE0GNKnjKCwGdKWyl_7yY1cdWCymM4XGQXN5g7yX04Ay0gWHImqRAKI1PIkWOi4n7SQGeO1zao4ndEh8SeZ_stweMYoOrVkgFsjAmhagNTkGwU6tF5UVXJjuw-OMinM6PkbdXoymp7fVdgF-cNWlNE5wbFxo4YCSXJpiBHRCsQnk977BBMU4fxAr6oB2docx6VJfwqg0ltVL90B6YWvsSmGCLnQ_dM5WK7tNht2q-E0p7bfa7V7LefK7nYWmr_aYIJZJA_nUYsdSVKkFaZFvtR8zgY9hEhCZtbWNmy1lKKsmeqW1Yn2ErNTU1idYmK2rJ8potXZmxtUTAESLUGcIqlz70_ZPvY1LRDHAklp_H_9y__k_1xzLSEXWnLTiIH7vw2dFaKfT8W0bpBzXqKz8xhvlcD1r4Ddn807w9XqtdwimK4dMg6X88CLlm-rMFvtGp7d8FrfZ8vGyO3apSP4w2u79N3n1le_Mb1d-8GG2-7i2edRfHfzfuuM4DsrhgOo2pv5cxBnXwfrl9KnXtgO_fmqjKXsrGc752XQcZ3uMvv2nDfv-rOZYKmdTIKHBR0s3emjMwK4HzYeyRgM0_mj5vjSn9y_3I7vHHUjePG9D2k58r08fqP3T2A1vAnsse2029axP71mUCB1XJUtx3ocUX0r-_3-By8-BA0:1pxlzf:eJ1n0u2QoZNDlKvILPjc8oCaGUb9nBJYanW0EXdvpyE	2023-05-27 09:56:51.097967+00
89x525noyt52wtyan23wyd3qrfyslvs2	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pnAmJ:fAt51YgXy3plvUGf25sCpwVjwKIfO_NiHxEicGkB3jQ	2023-04-28 04:11:15.224743+00
e05dhx2pphr8il9kjz8loztpa18q6mhm	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1prje9:fk-aPeNzhApJQ3qB75hNCj9aJRIkugO3Im7bj17BP5U	2023-05-10 18:13:41.473094+00
t3ce73tgmnbwbye47817gjwx815vdm9d	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pzlnH:yLjnHe7sIEoRVv_7nWO7LXgtXW0455WhAYipUT5mICI	2023-06-01 22:08:19.497475+00
724q6ym1ywm9op5bo1d1iytqhgl3xe56	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1q2Szi:AaZIO5FmxWVxE7BCnpfefFsdIxA2kraYEzJPGywybdo	2023-06-09 08:40:18.666772+00
p0op9sphx6wlrnpbgndpuihqfau6dvk0	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p9tdH:zZNbRzV7ll9ea8ZwGwOzGbAGIlzwj3Ij6ipUs6mzIvk	2023-01-09 19:59:35.628257+00
14ccal0fz7ukkdpiqt77n5h6ophkjrdo	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pKVyS:SGhXvlxDNOX5jCxCqqCj0Wq0KFFBONTns5BCahilJyQ	2023-02-08 02:57:20.637118+00
vaaaeb1h5yypadry1ktnkx4417po1rsj	.eJyNU9ty2jAQ_ZXWz03G2NzMU80lhEsIEErAnY5HtmUjKkuOJJtLhn-vFNsQOmknb9qzR7tnV0evGqc-Ahj4Pk2JcPMI0wgRrfWqFbA6okBrkRTjb1rKIXMvYcJohgLItJYWAh96lP7WJEkRNNM0mpWm0dSrer1uWg2ZwIALt2iQFwiAgO6WIgLPNeFeMODKBChbf1QKxgBhmYrpJrhlEG4AIHpF_x4p_NanseQQEENJeUg3II5B8GUuWUTiIWJSx1_ZUl4B59zTKR_5egkJ4HxHmVL2dVDfx7M152QZwyRozBz0oHenbDbZUDLcHIhurbfPy4h9OD3iLk8TyPIWIcAc_ludIhXoh1o_t5NE6oLnQVRglBEGJEpBpCr2JpJa-kIcEoUNFIapDwSi5HJHnI-URJdzTnMvgjPIUHhwLwWKcdUOBAjD90AAMRTKEQUkbRYiDF0Uv8nLe_g0U158D8mrwBcok4BgKVQjyEharIxVM4jxu21fGVAzdMO80Y0bw1xUmq1Ko1XTby295kj9Yocwoi5_M2S5bJfjNMpjksae1HMBQJK43KdMNteVWrlKdiiVypHFWbaH6HkoJM6cgHrlMYIk_2WmUkIFwK4HgghyWft0rvZ6KmWBIGCQc5X_-Z_v-xnDvL0bunoMuXM1iVrp6ZfS8xuS6x-iZleRcXHRJVnwtZ5tj_dJPwknjahtt4fbQxcv-05n5XRMp7Oo13Ztp9MMluixExwG1vChUXuxqF9_sqrV-ijzoudG_86wFvGk38jWPPbG9xt8t-argdMh8RYgYzwPdDLxBqHnTcxNe4QHtexQr63B0pqa095oUJsujgtIN8dtdf0w9-KjYxM6jHdd0R3PGMEibM-z-Y_9y_LYWzXB8XnVWwZDUDVWdKiT0bT7VH3amQNbX40m1iPeO7ZZ7dvYRPfw8c5z7J7T1YqBpfF8BkVhnn2C5AO55e85nU5_APwY28Y:1pVGAA:PQDlKWAOifjRKXuUc7ErGf6r2M98KyBPPGflAI9KeEY	2023-03-09 18:17:50.912952+00
tt4p81rgkt32avb9qhysl6xf1fa63ajt	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1plwK7:qYn7rwAh3dNt1EK3KLzYoZYJ7TEbU6_aYkECxcPnwg4	2023-04-24 18:33:03.904291+00
c8mtixkxfzckz4fzba6k9mknuwxis0lt	.eJxVjMEOgyAQRP-Fc2NWKSDe6o-QZVkjKcVEoZem_15tvHicNzPvI5Boqbm4N69xihwcvzAmMeSa0k04rGV2dePVxSAGYUFcoEd6cj4aTOnAzelr_puz3prHnjiXSFjiksfzdVHNuM27h6Q0fQtSs5mkVMidJlbkWRKwxZZAA2kwVvVB-clYSWQ6AO5D8PeOxPcHsJJICw:1pcMiO:wsQNdQ4TcmsNpeTppNEAc6zAmPbCmqtQ1UY1tFmnTeY	2023-03-29 08:42:32.934522+00
1mxlzy7ethm496xsbufqs9czl2xdh4v8	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pusME:LVgZQBh6OraGZEPWm8d7bchvWRd-zf5LMxsc5x6Iu_c	2023-05-19 10:08:10.98664+00
aw95loujbhzvnifhqbhihpernlxmzpm1	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pje2e:AOYVHC4ajo4r111r6RGIkUGybgfRqmORoa3Z4ShRsKA	2023-04-18 10:37:32.673319+00
zbcm61gsox4qgwm9jgve9w6ezxm5xlqh	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pmIM5:YqSqQ4wAi7x3JuMSCZHMFEydlmUWwGKuKf18TiWbwUk	2023-04-25 18:04:33.124067+00
btjjep8eb394tid177fq5htptb2yuiy0	.eJxVjDEOwjAMRe-SGUW4aYLFyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izAXP43ZjSQ-sG5E711mxqdZkntptid9rttYk-L7v7d1Col2-dxwFZ0EOgBFmVUf3RSU7kvaADGgcAyJnZeXJBHUqioIRJFeiE5v0BB4M5FQ:1pktnh:Va0CWgW6oMvKPRF3SwO6TkEOIqobo95U5wlJjQQz9xg	2023-04-21 21:39:17.48874+00
wyhzmjs7epclb0jrd4xkl95amxt7idm1	.eJxVjDsOgzAQRO_iOkL-YGDpkotYi3ctrDhGAjtNlLsHIhrKeTPzPgK9X2ou7s1rDJHJ8QtjEmOuKd2Ew1pmVzdeXSQxCqVAXOiE_sn5qDClAzensPlvznpr7nviXKLHEpf8OF8X1YzbvHugJ4m2H0ABSmN1x5PVNhi2QSqSQJ0kT0pbozvTWgoDDkCyB6VaYm3E9wfFs0co:1pnAmz:oSqGtdsjMadCcoUn9nSyK_hYdAS_x6GBIzVPTLNDomI	2023-04-28 04:11:57.28968+00
ovgyozdr8be3relunlufyxs4gep9yqkz	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pxm09:xoi7r5fFW6rk4Hb8KHMBukauN57tP4NaIvjCANRTPR8	2023-05-27 09:57:21.192135+00
tm4b9i2qqwcxy2smwy7ezv64aw4stx44	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1prkE5:CUynQR2uPcjK7Iqe-cbUcVzo8DrgOA0LNrsy6W5zInw	2023-05-10 18:50:49.645605+00
nqbq30cvt8pw06nzpsm49utlcwjnyijf	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pzlvT:BRTVZ3nAWmFO2EdOPwyLZZlRphHft9RPHnsV2vLZVrU	2023-06-01 22:16:47.217787+00
9wh12cb2rbmk0woebfqvgzgou0x5nz8x	.eJyVVF1z6jYQ_Sutn68TYWywmelMKRDiOCWEhEug0_EIWzYiQjKSDDgZ_nsljA2503baN53d9X6cPetPQ7AIQwKjiOVUhiUiLMXU6HwaZ7N-4tjo0JyQb0YuEA8vMONsh2PEjY6RMpYSZKgQ7TYaDdcGwLFbru25btsFwLKbykugkOG5RpkjhhKFa4YpqtOig-QwVA5YVf_HfGgDMVH-FcyyIiOwQLzheY1fU22_idhGxewQxwlGcXgOljxH3wwKN0h9OEYS8Z_GkKrAFO8QDa8dypjADSZFbT0FZjiSOdd4JWUmOre3ZNW8KSnQFEWMSkSlrn8Lb7vd6P5VokMeWDMK7gJ7ArYeyt-DUZCj5ZiOCjRNXNedg7T3i_BaZqSJYhEkugKixvFYMv91FxkUYs-4Zudn5L2N1wdsffQexO_3vtuzkn6SOfmi66_5037YzQZ9hxHwtxvAIhR5hnhZIoFEKHoSzFXcD1yIFcsqm1H2dEGnxF9o-i_LyVaMonokDawKEUjTHKY632CkQiuhyiLTNn90pkliRi_fyPrJaHp5l2FXzZ9UUYSXBOfBNRsSJsm1IUZEMRDXJqX7BBMU4s2pvbJGxHb6OK5N6lMYSaWqSnQnpARfYV0MEXLF-5dzMCxgNU3gmFbrFbgdx-44rRvPsReqf7nHBLNQnM6jIjsUJE9LTPPNUvVzMaglhCJiWrZAd6uo5EXVqRpZ1m0vMauHwrKOidmyeqaIlmevb1AyCUm4hHGKhMp9rLN9Hqu2YBxzJIT2__Ev_5P_c80VhRlXlOtBNDz-qdt5R_TrqejRNWpcRHRxnuONAlreDQTd2bzde988iKAY8WT8wcTTwBs6vba5H_tg41lv4eM7dB9_m0bmzFyNcn_GR2g3ejAX_aDdhvQNbPfNyffulr0MA999NfOESBEOPp6F3RvnTnS_7j8L1Jwu2oen7WzWn-wKudg-unDqL1Ew3wFzSF9B2u437Ufrbtbn95NetFmP74LBag976TzoQv-lO_Ff7p6HDdnnWUKtzPPybTo7bOW0jQI_ne_3oNFqGef5lMwijuRZKocMq3WE1a0cj8e_ACJxBIQ:1q2TDs:rZbffxqxox7gP8xTYlcaTs80nyiJ6cgywZRN3Hs0GV4	2023-06-09 08:54:56.963988+00
u2bmok1momlj9yjt82n549yrid9h9gqd	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p9tex:coe4HS0CFrUWHC54B2M0lo4q3SyiJPqyxpfRPqrVi4Y	2023-01-09 20:01:19.878603+00
4u22emsl6fbn6lpisohm5acvcf23y8r0	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pKtQN:3XEszTlbZzuAGTbSh5qdMFfJeiU4GweChoC--3sRIhU	2023-02-09 03:59:43.199226+00
cv4kztpl89dhpuucpffrs9zvdsxbsy0a	.eJyNU9tymzAQ_ZWW5yaDIbGxn2ocQ32JE1-SYDodRgYBsgWiQuBLhn-vFMDEnbSTGR60Zw-7Z1dHr1JKXAQwcF2SxcwpI0wCFEu9V6mCxRF5Ui_OMP4mZSmkThMmlOTIg1TqST5w4YaQncRJgiCpqqK1NEWTb-R2W-12eAKDlDlVg7KABxh0tgTF8FwTHhgFDk-AuvVHpWAEEOapiITeNYUwBCCWW_L3QODXLok4JwYR5JT7LARRBLwvC86KOe4jynX8la3lVXDJLYpy5MslJCBN94QKZV89d85Od9vxo99eraampy_a5mIZDjYjA8xHwebG2Prjfrz4cHqUOmmWQFq28AFO4b_VCVKFfqj1cztJQhLD8yAiUOoIgzjIQCAqDmecWvuCHROBjQSGiQsYInHzDzsfSRw055LmNIJzSJF_dJoC1bhiBwz4_nvAgxgy4YgK4jbzEYYOit7klT1ckgsvvof4r8BlKOcAoxkUI_CIW6yORTOI8bttXxhQUmRFvZKVK0VdtbQe_2T1WrnVbK6f7RFGxEnfDFkv20lxFpRxnEUbrqcBQJI4qUsoby4LtXyV9Fgr5SOzs-wNIuehEDtzPLKpjwGMy1emCiWEAexsgBfAlNcuztVei1oW8DwK01Tkf_7n-X7GMG_3hi4ug-9cTCJWWvwSenYwvnwhYnYRKY2LmmTFl4b9_vSQmIk_6wR634y2-9H9dsiokoTj1vB0yJZP2cCYWyQiquUFp8P2lOjyKLN1K2kr1n5lhro9eDSWUQjt_m45nGrr7dxl5t5gXbPzMLZUF20tKx-k6-c2tgenER61WH43u0msBzDLQE6CyfFJB0f_xdW8YJS9GNnz4-81NfyjrRs7FvZNBF-oazyb3U3eTfOE0cl6coqw3tYW6uTHom92dvNFi95qijK9twfygGSqrT_N48RdrO07qZqX-86lkFXeOSSI349TP56iKP4AA7Xd2A:1pVGAN:1h0NUUIO1XoZSQ4okmu-pIwXotrNv33oNoWaoQB_5wg	2023-03-09 18:18:03.266435+00
4e6hf1rv9b69jzwr97lwmfklsai36w8v	.eJxVjDEOwjAMRe-SGUW4aYLFyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izAXP43ZjSQ-sG5E711mxqdZkntptid9rttYk-L7v7d1Col2-dxwFZ0EOgBFmVUf3RSU7kvaADGgcAyJnZeXJBHUqioIRJFeiE5v0BB4M5FQ:1peNGi:PX7fiT7zi_v-Zdl20vw8aiVqIXe9pVIklnxA-QGibfg	2023-04-03 21:42:16.332851+00
pjdwrhml6az3487kvvt4xpvi759pg6zh	.eJxVjMEOgyAQRP-Fc2PAXUR6a3_ELMsaSA0mFU5N_73aeGiP82bmvdREraapbfKcclRXZQyoyy8NxA8pR0XLcuCOmNdWavfdnPXW3fYkpWammtdyP19_qkRb2j3Yi-4dRrBgPTCOM4uBAcJgrTBbhIii2Xoi9HEOMoIL3usQoxtYk3p_APYJPN8:1plwQo:2Uy9oO5jpaLlwSPaVwZzgPf4ipZWqADB7mXpRiJ5h7U	2023-04-24 18:39:58.39115+00
wn38hzzb64sueafoff4mpcfxm80rufyg	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pje62:8Up2meBspgv5nmVv4BtCFMfCp7ukCR7R8kPiOXlss3A	2023-04-18 10:41:02.140381+00
lngwia54j30lzy0xk0isiqylacrwi71o	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1putMD:A7fyNJAEiXb3ziHz3F9DGuz12NNz5NU83wuH03Y5WsE	2023-05-19 11:12:13.618989+00
6s75y9rl54mgpq6wmw1f1q5ulsajf99r	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pkuZ9:oFmjQMASFQOA5jGbl9G-pQ1LL0oJqy7-ZBgdxNIEbl4	2023-04-21 22:28:19.232088+00
in4s8zqbiugvvpi59lehezbfme5wssnn	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pmJcK:DaDoFWVrJe2Eym6Ms6hdDDFtsMdn0k2bZTU6drdmOFc	2023-04-25 19:25:24.829369+00
vwz9iuecv54kidftnomneyovzyp95cu2	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1poew0:oGe2mvUEiXEe9JsjnrKtd9i8Pqr88FSN8ZKC2NYrQqY	2023-05-02 06:35:24.491726+00
e7reip0almox833n8oe29hc7oasi2ypw	.eJyNVG1z4jYQ_iutP58TG4ODmelMnQAh4SAHNBngpqMRtizEyZIiybxl-O8nYQxJ79rrNz-7q91nn931m6N4QiCFScILpkGJKMeEOa0352S2nyR1Wqyg9JNTKCTBBQrJ1yRF0mk5mHNMkWNCrNvxvUYU1SM_qgdBs-5HN41Gs2m8FCoNTjXKHCnUCKw4YeicFm21hMA4YFX9X_OhHBJq_ArKTMJ94JvAP7E1XiU8NwFrJElGUApOkVoW6JPDYI7Mq4l5Bc2z3waIm1hM1oiBf_iMPYM5obvKUcYKkuhCWrzUWqjW9TVdBlelClalhDONmLYsruF1fD_Md9v5bAn1aNhddHjbW2wG8f52Qm7Hz5ObtTtP248TMtvPFu7oDxWFbmLV4gmktgZi7v2tcziUE_g4EwGV2nBpVfpdTnoCN4RaEYy2fbFtP_fjkMyf8MMj3szpZ7zZdufhN--nkyAKqEIgWZbIIFVGqYxIE_ejJmrJRWV2SloXdMz9Qa5fzkksOUPnliyoVYhChguIbbLO0IRWC6t3wtoehielNOHs8kafPznDl-8y7B3z44LswCXBqXGrhoZZ9t6QIoq03dOTyex_RigCJD_SK2skfG2P5L3JPIWJNttV7d8RmcWvsC2GKH2n-4ezcGpeLXC9ulsL__KbrYbf8v2roOHNDX-9IZRwoI5nUikNFC1wiVmRLwyfiwEKAVTC7e56lq2RUu4qpqZlfaa9IPzcFNHnmJQvqk-MWHn-gWXCNaRgAVOMlMl9OGd7O1S0YJpKpJT1f_2P_8r_vupKPyGN3rYLCw9_Wy7fEPt4J7Zvi_zLBl2cp3hnB2vRFfRiRCN192Wj8nXaTaNUjgcv6nOY7nEnV_5qOO0_NfrFS1jg-3TVkPvHl3rYC7884LZspv4wkHevQRYPRDiajh6iWkDk_ULUt7NOgw3owH-aCdYtBrl-dW8mIfDBE52MevF0vFvXVrrnsZFa1HptmIr-TX2c1aXLo2n3eeplz-4O3uFZP0adSTweTLqjbr1IH5d8qrU7jm5j_rrhIFhywDYi9vywHIxpzixYIpE-LclWEDMIUF3J4XD4Di2vBcI:1prkER:6n-plL-oNWZF-XWChtnrpTIDO-t6EzeBSssRWEwVSAk	2023-05-10 18:51:11.359267+00
h9k5r0uese6v4khv7e48kdqa05e8fc7q	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pyMbH:j-UWNzfak6uOqrWW7pdGhd3HSepNlr-I2Eoi9WaDwp0	2023-05-29 01:02:07.122796+00
cw1ta5yirqhta0s7t3roxj1p9x0vqta2	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pzm2j:eypGqE8Kr_fkTQS5xfrpE_lcyXoqAeCMDwrFZc8SXgI	2023-06-01 22:24:17.137652+00
xnl966hr7ax4olkoqt7a4p9azoyk5r0u	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1q2TEW:B3TJPCn2CYoiRX9Z5HmyvMQZuPLr1Z60hlsS9m1XL4A	2023-06-09 08:55:36.716431+00
q41x1rbn6kix2qqxb5vkyma0iuqoko2h	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1p9vbj:dSdv41nVGy08wSMJwh82HMsaRKL2KjuvW_PfpOJiagA	2023-01-09 22:06:07.981355+00
3o7zq6xga77hvfehk5vpz0iiro0rv1uv	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pQBs7:0dv1HNDhjuXPkkvu8_bDn8Y0jUlkuSwoufFk6gyIULU	2023-02-23 18:42:15.670081+00
t1o4m2k9bk6zv31k2zmy804aanrnx26z	.eJyNU9ty2jAQ_ZXWz03GFy6Gp9qEALkAJUwK7nQ8si0bgSw5kgyYDP9eKbYhdNJOZvygPXu8e3Z19KpxGiKAQRjSnAi_jDBNENG6r1oFqyOKtC7JMf6m5Rwy_xxmjG5RBJnW1WIQwoDSjSZJiqBZlmkbtmnrDb3VsjptmcCAC79qUBaIgID-miICTzXhXjDgywSoW39UCqYAYZlK6Sq6ZhCuACC6oX9PFH4d0lRyCEihpDzmK5CmIPoykywi8RgxqeOvbC2vgkvu8ViOfLmEDHC-o0wp-9qOhXO7sOfxPB01f2a2EXYaB6PXXo5EUKB98nR_M1jNhv0Pp0fc53kGWdkiBpjDf6tTpAr9UOvndpKtKIGnQVRg1hEGJMlBoir2x5Ja-0IUmcJGCsM0BAJRcv5HnI6UJOdzSfPPgreQobjwzwWqcdUOBIjj90AEMRTKERUkbRYjDH2Uvskre4R0q7z4HpK_glCgrQQEy6EaQUbSYnWsmkGM3237woCaqZvWlW5emdbcsLvqa1ybHdOT-sUOYUR9_mbIetk-x3lSxiRPA6nnDIAs83lImWyuK7VylayolcqRxUl2gOhpKCROnIgG9TGBpHxlllJCBcB-AKIEcln7eKr2eqxlgShikHOV__Wf5_sZw7zdG7q4DLlzNYla6fG30rOB5PKFqNlVZJ5ddE5WfK3vOA_7bJDF43biOg_BS9S2lvsRvzNd3e5v8I-BOcip51pB1EFkt_Bc8aCvO_fZhvZun5c943CHvN4SFunjxG7sPNew0x1pzrze6u6wZqPc2b6EntMcFK3dMj2IxqrtxLq5Y4WdTbejjdVYPnZGT2CIPXc6dneGbHBwrWjcD8eoGBj3Dh9Nnll_bcJpsifraNmcLVZpnCHe0WeFZQ0X4WH9HL54vT4wm73WZjLP2NBze-nEZONpkzwFDce70aqRpfVCBkVln32G5BX59fs5Ho9_AKkZ3GQ:1pVGAY:eYN87Xj_bGvoKlTeZDkU5bzeKv73P3J51AwMjtSg6vQ	2023-03-09 18:18:14.300214+00
xyhgz74wv3oq8n1l0y6kr0hcai5apzlf	.eJxVjDEOwjAMRe-SGUW4aYLFyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izAXP43ZjSQ-sG5E711mxqdZkntptid9rttYk-L7v7d1Col2-dxwFZ0EOgBFmVUf3RSU7kvaADGgcAyJnZeXJBHUqioIRJFeiE5v0BB4M5FQ:1peNK1:HOnZiKG1QKLHkaAfJcE7YYNUqMdX8FcXOvkeXpVInuA	2023-04-03 21:45:41.586779+00
gpni42pekkdbtvd4g2w4s2ov9uvens7d	.eJxVjMEOgyAQRP-Fc2PAXUR6a3_ELMsaSA0mFU5N_73aeGiP82bmvdREraapbfKcclRXZQyoyy8NxA8pR0XLcuCOmNdWavfdnPXW3fYkpWammtdyP19_qkRb2j3Yi-4dRrBgPTCOM4uBAcJgrTBbhIii2Xoi9HEOMoIL3usQoxtYk3p_APYJPN8:1plwWj:zKH8zq9eCPqO0xsLuE6qb46o3zzqOGnjXxJAuMZ6k64	2023-04-24 18:46:05.776236+00
x12xj1lfkl9vkffo4hwi82b2oveq47vz	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pjjoC:gLRk5fMDGwPBRpF8RuB1V6J1NSjMv3JBl4U3PUULSV0	2023-04-18 16:47:00.727827+00
aans8qzat5vsflqdisl1nhytg1dbsq38	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1puyOc:M8BztIWFCE8-m4rsq4V_LDOqSv7lsWUq2jbTNPs2LCc	2023-05-19 16:35:02.134054+00
rtisnir5h2dadb11le2n5moj34w76ny8	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1pkudG:A4UdnLyAlH5dyhzLrzRJl8mMZ69AvB3cGfAiyGnU7WE	2023-04-21 22:32:34.687137+00
7r7rcfu6gqp6llx386nuylmdxxol885j	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pmJcw:tqXCTIWSE6P9iJrP3SrKulZTybASsSN_8M6VWgwxY-s	2023-04-25 19:26:02.945898+00
6raczp8raivp1nn7qim2uutblmpevvqz	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pofvP:jqiF8cEkXRmAagEfZdJ6Ea6P21lsI4T5wUP_mIvsd0E	2023-05-02 07:38:51.9126+00
xdvsedohkh9nqebwstc8dv0w80lbq3wr	.eJxVjMEOgyAQRP-Fc2PQZcV6a3-ErOwaSSkmAr00_ffWxovHeTPz3oq8X2sq7iVbmIOwkyeFqMZUY7woR7UsrmbZXGA1qrYz6kQn8g9Je0Ux7rg5hM1_c9S5uf2SpBI8lbCm-_E6qRbKy-5BcwUy3LJBbRCEYZ4RJkKxqD1jDwy9bbVFq9kyALIxA9kOBO3A6vMF0rtHVA:1pyRf4:-6cTCqIxktClqIuDLfL6SMkUXFWt9PePNr7GA2F-nF0	2023-05-29 06:26:22.223246+00
qvfowfqzvwrkydp64xo4irv2ywn5ozhq	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1prkG0:Z_V-g1hOR_Vx1OUtE_c-ntsmfTxSFpP-l5KMS9gSU3w	2023-05-10 18:52:48.398928+00
l3ssd4ienyzbf8815f6r08mhuwnh9gaz	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pzm9X:YUMrp93PvbDg86xo89pgNOXzD7mFBXY_jfm2SpdpfKE	2023-06-01 22:31:19.34402+00
0j5265m2v4iv1tpshueqxwk3lff1wua6	.eJxVjMEOgyAQRP-Fc2NcJQre2h8hy-4SSSkmCr00_fdq48XjvJl5H4VES83FvWWNIQo7eWFMaso1pZtyWMvs6iari6wmBd2gLtQjPSUfFaZ04OYUNv_NWW_NfU-SSyQsccmP83VRzbjNu8cEzehbsCOAGS21Wrg3HICMNi1a0SQQeKc4omYxHqGzgtgbT3YY1PcH-o1JDA:1q2TFV:xcjyCDBnXEF0A3xY8wFZ8v-vC9QXE4UxSDeZ0FHuksI	2023-06-09 08:56:37.649476+00
rmpkjkiitsmndon4nayt2j6k1hyj1lxk	.eJxVjMEKwyAQRP_Fcwm7Kjb21v6IrJuVSIOBRk-h_15TcmgvAzNvZnYVqNU5tE1eIU_qpqy6_GaR-CnlALQsRzwQ89pKHb6dE2_DvTspNTPVvJbHufq7mmmb-w-K0BUcAoB3xqJJYnhMCS1oDR5lSjQZ9DLqLppspFFcioYwmgis3h-mWzxT:1p9vc9:Z8RNvkBD-5U-vsNwgmdPn5aT0Io5DSr-FCKvBbvNcmw	2023-01-09 22:06:33.525103+00
922ixtw7waoknv10pme7ngce9fshjlrq	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pQCj6:7Da8ylrnYbPgd4dRPh4fu-AM3AndAo6Sz6AkzMEl88o	2023-02-23 19:37:00.155367+00
l3qos4uoqs2vfo26eotl6jz333o1mqsb	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1peiVm:Ydi3OiItNXRfAeEWHAmgr5R6pblQa7dcbXREmzT00no	2023-04-04 20:23:14.392426+00
16hvqdqadhs6htrr0des5a3czm56nbsz	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pVGCl:clvnxcrM4CAsP7gxLhlZ6HhPqv0J8kYLyC9VPAPB8-4	2023-03-09 18:20:31.939191+00
23zjpneip1aum6vjlp9yujhv9iufiia5	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1plwZu:h9W7OWODCphm8kNv11tlfCp54xcoKeHfHiFHssrTr8I	2023-04-24 18:49:22.081337+00
tsr2levrg5p7x8tbib9eradtcqeqxr1n	.eJxVjcEOgyAQRP-Fc2OQJQre2h8hy7JEUoqJQi9N_73aePE4M29mPgKJllaqe_OaYuLg-IUpi6m0nG_CYauzaxuvLgUxCWvExfRITy5HgjkfdnfudX_mjLfuvisuNRHWtJTH2bpMzbjNx4P34MEoINYIxihv5aB6SZJ7D2iIBvBRSW2DtBij5R3odYDBjKNSo_j-ALVZR4I:1pjm5f:Yz8jXKYEpKn1NDecvE_kDRj5gr7MgWbcNB6L8DKL6aU	2023-04-18 19:13:11.811065+00
zone8h1q9q1e6oc9iudcpi7sjrntkuk2	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1pv2P2:zb3DLLjVWON2ZImLhUCp9Wh6JnNm2G1wFZkrcImdNjU	2023-05-19 20:51:44.854848+00
2bfz54zappzclqrueorhk1f2meylshh6	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1plGAX:-y-i9xVWbmFbXKe_JMQBk5gFXISQlPXVUrVNEkrrVos	2023-04-22 21:32:21.412869+00
bumtq7jssr4g1b180yha7jrm3a2ldmxr	.eJxVjEEOwiAQRe_C2pC2AwO4dO8ZyAwDUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1FnFYw6_Y5M6ZGnncidptus0zyty8h6V_RBm77Okp-Xw_07qNTqt0bTC7N31ltkYEkSTCgl44AGoBtcb1MO7D04IOiLgDPYSWfQMRAV9f4AAPM3uA:1pmK9Y:68qKGTEhnfni5wLCOTLdWwRQnYU0rBBrMk3eHX-olnE	2023-04-25 19:59:44.222382+00
leqefhj10qo84s71744x0oc0okj871sd	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pp2qL:mTzML3X23HYOfSB_A4LUloeXHGiPdEGxJXh9hnhdMNM	2023-05-03 08:07:09.262056+00
10fpuzy6en4nuvlns7b60eo7fr8uv6bl	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pykCl:_UTFrp00OOXEBQ70F-8egzo62UfbFaPDjQIXHv9ax8E	2023-05-30 02:14:23.670594+00
853oy2lqkz1awh7hf659d66ofwlucvd1	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1prkH5:jMEKCc3XAqRmbEkBMl6ghJS4u9Wu8wQy3OdQMB4JnxM	2023-05-10 18:53:55.50339+00
sb74f2jrc1fppgxvmh6w031b0o9zmmg8	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pzo4F:xUOFsTDSSBKBGyVWkP9wkJtUYLOvgmjq-Bnmn5_55iE	2023-06-02 00:33:59.893763+00
1cv9tcec0rootu0i2mwa5vsuyvzuc50w	.eJxVjMEOgjAQRP-lZ0NYaNqtN_2RZrpdApGURMrJ-O-C4aDHeTPzXiZiq2PcVn3GKZuroc6Zyy9NkIeWo8I8H7iByLKV2nw3Z702tz1pqZOgTku5n68_1Yh13D082IzUUvBE7IO0VnPPeSBhyy2CWlEa8k7hYbNyAnVBgZ6TBOfM-wMdaj2m:1q2TGV:Ic4cS8SZlXmARfPTnsjsRsUARoi3HLkGAplH1YyYrdY	2023-06-09 08:57:39.838749+00
u5nh5wxtuuykbbmsuw418wqc1dcirwsl	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1p9vt0:YI_zXpkZUNZqZrLJavhdwp_XT6kGymqWH0pvwNvoPvU	2023-01-09 22:23:58.343816+00
ezzun4v1j8hmmx8kkp2o1vexaog992jp	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pQD7c:K8Fv57lmQLD_ewT3ErNY12CMbqBg2vYEBL9kG5COUEo	2023-02-23 20:02:20.323149+00
8lrej1nvhfjgpbnfrxb7aftk32lxiu92	.eJxVjEEOwiAQRe_C2hA6YJm6dO8ZyAwDUjU0Ke3KeHfbpAvd_vfef6tA61LC2tIcRlEXNXTq9DsyxWeqO5EH1fuk41SXeWS9K_qgTd8mSa_r4f4dFGplqwlwsIyGojXZcUoOEliDGL3JkbN4PDtvDGaAzeFeMHcx2x6BHFhRny8Qijgw:1pf5Jp:ffH6nyG3XrLi1422-QGBo_THEDiSFMsnpzHGQmuMsV0	2023-04-05 20:44:25.271986+00
xx2r38s5avqe6y0m13cfjz5834cx18pq	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pVGTF:tMYPhK8mhYcGJdHlGneNxGhIUGxTPhOv7yDekCWLOTA	2023-03-09 18:37:33.207823+00
dypouke7qw8l4v853fl5k8nmqvyp90dn	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1plxwx:178rDt7mNl2BpFwZklevACbgBTyzN9Fpvnsu5rFF5y4	2023-04-24 20:17:15.34314+00
tjiixwrl38kkbdwllbiu05pd4jtlbxdy	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pjmDS:hmtyca6xbA3tmryQekrUs56cGqp6iJ2OTPM2Khe3Ij8	2023-04-18 19:21:14.346575+00
2vbkeu90n2wlz1t6fyrnv98mtp42nw2h	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pv2YN:sEz0xsAnoAVSgkT7CgHvXfwok9ZoMhmA0-2NVJQnUQw	2023-05-19 21:01:23.559302+00
bj3j9d2ppvika2fgfzdhjdv8w6oq6551	.eJxVjEEOwiAQRe_C2hAoMAWX7j0DmcKMVA0kpV0Z765NutDtf-_9l4i4rSVunZY4Z3EWWhlx-l0nTA-qO8p3rLcmU6vrMk9yV-RBu7y2TM_L4f4dFOzlW6O1lFEn0jxYSkCQcQyMADwFr1kpx-QIaEAOIzsPnNEReu-19caI9wdjiTlC:1plGe4:4TrSLPIvz0S9sH7f-XBraOivatgk3KoaixoAN32Zu1k	2023-04-22 22:02:52.428349+00
4pm0sbrs386w084jh0vr5ldmgpy0qirj	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pmKPo:buh7zRs7zmJphaRIqnb7tsTobO5dRejgnII9sWCEcL4	2023-04-25 20:16:32.871752+00
54unztv6p5jng5taf3ubflp221mboghk	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pp2qu:0fKJOq_fMtZv0-jeD-vecsDEeRnhXkJVVQq2lcxDOYE	2023-05-03 08:07:44.173738+00
si0aagodl0y5qkuqn0onckzg03yzs185	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pyl0Y:Dmt9RDZz6h_bAubX-D7mm1hXn-l6bBqY-_6HIVEsGzc	2023-05-30 03:05:50.572218+00
870o7gd80qxn1immj5wsxcbj30j5ivod	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1prkHz:UbDzZNL0YSNoU9f91YvQHZQ-fq_mbDx6oTcZbvIlYvI	2023-05-10 18:54:51.47648+00
bvsuvtuyfegxtq65cgkox5ql23js0syt	.eJxVjMsOwiAURP-FtSFwKeB1Z3-EXB4NxIYmAivjv9uaLnQ5Z2bOizkaPbvR0tOVyG5MSsMuv9RTeKR6VLSuB-YUwjZq59_NWTd-31OqvQTqZavz-fpTZWp591g1TZCiFFYIHw1p5ZXyKIMhgx4Jgl1kFLigRRAUE1mS1mhAfdWggL0_9AA75g:1pzoCy:fFryN9FTh-Ij5w-IghsTfxad4X9n6AgAK3TVIl9RG-M	2023-06-02 00:43:00.435064+00
mcmdz5rwu6oc8azczk82ew7hip65s9eg	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p9vtE:eIiQEWx_FmV-HzPua3UwbCOW5mLcRpqe501dXTrmxZA	2023-01-09 22:24:12.421759+00
4w5ywa7ph1yy9csooblwcsvcf4tdv8e2	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pRgbS:1ms8quFVYhLTo4HsS1UZ1gp1zOKX1AcawJXbX8qLo9c	2023-02-27 21:43:14.429442+00
n3m1munelcvrrxohktliuoylp3yaqca1	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pfQ7n:z6WMCmPTTN0v8wAV7CK7Q6qEY4GiRPWfRb8gwoIsBFo	2023-04-06 18:57:23.19499+00
2tdthdsyq8p282d1tmtxzd85cvxrmr7i	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pVGTM:fcTigbyMS_fFJR1vSmg-19dEAmoz6L7EMINy2pLZfzo	2023-03-09 18:37:40.526253+00
jppxowllsfzv07rkbdzmg5a9d3qn6438	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1ply8O:HH-Qn7llrqk63cnOykuZMSFUdYPws-2T5x60xjj3cQQ	2023-04-24 20:29:04.768724+00
itt48b5qh1r1eo6y98gexw7pvmgjsdtd	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pjmMr:2Gk08RtCUxtbc1_ASaGcmrA6b68S1TGfTUR3s9wc8TM	2023-04-18 19:30:57.600389+00
nyo3wmjh27gxiak9ewjxbs12omreg69s	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1pv2ZZ:OW6fPYgJ5Kp5L0OA6tFOkJDRMxNZTATh0k1dvKIQzHU	2023-05-19 21:02:37.666905+00
fbk26pzx0m2w839ryttdzvgzxb8ud01s	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1plGeJ:b6WoWgf-fNhvYj6qCNGOw_M_lCyXRXyxQsqk1Yzpk3Q	2023-04-22 22:03:07.49501+00
fqq699ocnk1ydbylet3axh83s7zeejzh	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pmLo4:mBEFueQdAQgnQ2dSh_hYTYN_fPK9KL_Jq0tcE0OWNRs	2023-04-25 21:45:40.20507+00
ot6j4o4x9jcrqaw9dxdj8zlakprqohlx	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pp4TR:q2ZS-73Jx1AaIwL3YMLy9uentB5HvkWizdoevGRZT60	2023-05-03 09:51:37.17596+00
jn9rf7x607r5qeaphpciblfv2i5s7utr	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pyl0r:zvo356bjsw3zgIxPNx8P2_Gx6eB6h91d8fI6XjofhB0	2023-05-30 03:06:09.917945+00
1ow1fuqbux1h2r6p4y5oiombpv0e5n8m	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1prkgG:tN8LsGo401c0NeD3XRmRVhYIPNB1-ayVyU2lk_v-W6c	2023-05-10 19:19:56.514004+00
yqq7ptknn1yptitrg4gdwgsxthky2c01	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pzvnI:dIwa-fk_FfjM9AkNocZB0OOPblD75A-KaSZbDIi1YME	2023-06-02 08:49:00.658737+00
vipmv0pa00w6ktpsjqb04b68w2dz9dxu	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p9vur:ZJiEnWXy0hUVC0wEMOdn8SJ05BBNnhgYIijwmFsImLc	2023-01-09 22:25:53.53492+00
jndf2mmvhlw256i59dc0htzvfc35xw8m	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pRloc:tx4EWVHWOFhPFraEgUOXNupNxRORMKc8qVW9YLF-tlE	2023-02-28 03:17:10.783339+00
frk72s41tz18lch43sgp7chystaoafcv	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pfQnQ:P9tiIK2zfKISPO5Fzy3ibBQkFowTopaxLYwWB7aDFqk	2023-04-06 19:40:24.347095+00
q7dhw0pz1oglpi1vqj05ilegb8e3ev4g	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pVGU3:Y2BBqQNoXpfLf27UgRM0zLGHs8zMALTMAVK9kSEnO0s	2023-03-09 18:38:23.746835+00
fggnpcshr3tnqoc6sf338y0y0he322pk	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1plyvy:nAAR2CrPqOXSW8c_I9abWDmCoyNjBXMBnE9S5cM4tlc	2023-04-24 21:20:18.844238+00
s4o8ghljpcolqb24sxg8g08mdjsdlpy8	.eJxVjMEOgyAQRP-Fc2NQAV1v7Y-Q3QUjKcVEoJem_15tvHicNzPvI5B5ranYt9_CHLyz_oUhiinVGG_CYi2LrdlvNjgxCQBxgYT89OloMMYDN6ev-W_OOjf3PflUAmMJa3qcr4tqwbzsnnHwRklGUD0TcC9JIvTGEJDpRslazcpgq5FY6YGl45Fdp0FjCx0Rie8PtQhIEA:1pjmNT:SbKv72VqO2kY0guJZpGklw6VU20VcqAFdbPpCra3XIU	2023-04-18 19:31:35.778219+00
e7sve8dwihnk5r3imogbrig93ppsg02e	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pv2vT:IjIYzusPwJ-sZWZg29xcZnboM-LoEgyMS3bqR6xyKas	2023-05-19 21:25:15.597264+00
m9mekppxxxc8m442ggjmxf62vgearo67	.eJxVjMsOwiAQRf-FtSG8QZfu-w2EmQGpGkhKuzL-uzbpQrf3nHNfLKZtrXEbeYkzsQuTwrDT7woJH7ntiO6p3TrH3tZlBr4r_KCDT53y83q4fwc1jfqtXfHkLBUXjMiIFtAGWcoZvTYmZFSOhCKppAcAT95SsFoLkEDWGYXs_QE8fThq:1plGpk:CF5jj5MtCTYn1GqbuDF11B8TUsHNK_JmdETPfy9KgeA	2023-04-22 22:14:56.211679+00
6w2ctkpfmnyphrck9n3inapdvw2fz11l	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pmM44:sAtFC1vondm112N_9fsm1WslSjtoGfCmQKa4BwtKt08	2023-04-25 22:02:12.533435+00
xhsp5wbyab3cbx0rt89t7i8gw163i1zp	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1ppIpv:EBSPcf3OygC4EL3iga9LAOAJ0AEOB79zZ0rXV8eZC9k	2023-05-04 01:11:47.956198+00
z75mfc9eze3gsh48cwjm729kolguhtju	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pyl2x:lcgFFp8xbh-L-4K3RK2sU2UcxL0viBogMQ_oUvnXTIw	2023-05-30 03:08:19.255897+00
70zrgeajeg5i5c9unpynk2lm2ygq9ysa	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1prkh2:rrmLUuFaBsA_iTnJHCL_tK9t0e8OF-H6V5Yxt_Wkmj4	2023-05-10 19:20:44.82865+00
wkl3pg8fij4f7x70xw5c8hp8afzx2zf2	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pzvuM:vhUuZSnjeyBw6ptFceZnmggq2mu8G2FoYaMre65a3c8	2023-06-02 08:56:18.3454+00
5rsm7sn5vbitcp9lnr8x109dot0i05hm	.eJxVjM0OwiAQhN-FsyEILT_e7Is0u8uSEhuaCJyM725retDjfDPzvcQMvS1zr_yccxQ3ocXllyHQg8tRwLoeWALR1kuT381ZV3nfE5eWCVreynS-_lQL1GX3YOTI1g6ITqurUcE6MqQ8WvDBWRP9QMEiKNQjATIPKfnRaRdTCgpH8f4AylM84w:1p9vyI:ZSw8C0bNjdmkupilWF6-RBjXS89QM-GPX1GY_okGC04	2023-01-09 22:29:26.007487+00
j057c29q0hdleayicetra93uyr7sx416	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pSKCL:JGOuxrwirFjkA-3SyrF7awY9bZWGnza3MPaFli1U1wo	2023-03-01 15:59:57.655251+00
6y3a8rmp2edejw11axyvv2nbkhipovo3	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pfoBn:A43Y3yIV5XOT-Uwx4fn-VsxzSVnGpBWsvGJ5XFpFNUI	2023-04-07 20:39:07.775875+00
o5mkk5c500kr85l9kvs7burctobysm8f	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pVMiv:p26xlVLMaF5OgzekU1RlUg93Ohr59u1GAvTCJuhM308	2023-03-10 01:18:09.202026+00
8d9e9yssi3siucuejlkvsndzrnaaube0	.eJxVjEEOwiAQRe_C2pC2AwO4dO8ZyAwDUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1FnFYw6_Y5M6ZGnncidptus0zyty8h6V_RBm77Okp-Xw_07qNTqt0bTC7N31ltkYEkSTCgl44AGoBtcb1MO7D04IOiLgDPYSWfQMRAV9f4AAPM3uA:1plzCO:OXyfqDFs2oS1irUSCqv97es-2UU5hoFqH25ZAugMtaQ	2023-04-24 21:37:16.416395+00
dbahn2rtvc7dslcoa0gqfkb8pfljw9fm	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pjmR4:Bk6CrBFZa9lEfVGZjE3iVdhSC77IDM4jPW31D_QXJ0w	2023-04-18 19:35:18.339509+00
3er41wbd7hutawka8otrhya5l5w53dmw	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1pv3Lw:T8Yhxw9VCoD1GTuZUNWPdaTIaE9rrPeuN4YG-OB1mV8	2023-05-19 21:52:36.864546+00
09gl992w47i98aeptt03awp6nio32bbc	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1plGq3:ql9bzI3w-V-P6bsJp5B-jlr3050PnGlbCM9IVU8Psfk	2023-04-22 22:15:15.159784+00
jale1bf3ip4jkpljxhbsbehumsrh96ty	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pmM5Z:gopZF9lDid0fb-QA0uyoitFbIyhSP68BdE8N6tpahMM	2023-04-25 22:03:45.356861+00
89dngqsi5dskumalrz9q9pjc9hkq7fl3	.eJxVjcsOgyAQRf-FdWOQl-Ku_ggZmCGSUkwUumn6762NG5f3de6bQQhrK9W9aEsxETp6QspsKi3nG3PQ6uLaTptLyCbWC84urofwoHJEkPNhdyew-3fOeO_uP0WlpgA1rWU-VxfUAvtyXFgOwEUUGr2gwUSu0Eqjg9JSeFJChDh6qQaLo9ERTZQaueZorLLke_b5AtT4R7M:1ppJPA:apEuuhcVBfqTiHlqgoB2dMPs53cuxN-oc50w7lyIeLc	2023-05-04 01:48:12.385411+00
ai1aj96na2d5ag8vi2wwhe4jtyjhhz80	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1pyoU7:s8UXxoJa_87PSK9qOuZyyC7iHtddZvIRrLYbMo45wi0	2023-05-30 06:48:35.584863+00
jerpgk17mq9bb2z9dla7mnqwvba6puxe	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1prkhY:KKS3VmKJnIGvt2dX_aL3LCyrOCNBSQ-ILQrokxF1JYc	2023-05-10 19:21:16.918937+00
8xojiaq9x1yfxlo4rutf8y5pe6h531gx	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1q045v:AtlPfdZ71REE2cQwUYXJhr3RDbgu7Sx58dIQfNJMLDE	2023-06-02 17:40:47.01979+00
2fgbcvuy6a12tcy3yk3jw6id9lyi3grf	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1p9w6S:U5ahWtI1NfQEKx0nomVIb81yjJBtksvTCXc6ocnMBQE	2023-01-09 22:37:52.427027+00
ihsor6g0dj5ow29izh7xafwp1m95ynjy	.eJxVjDEOwjAMRe-SGUW4aYLFyM4ZIjt2SAElUtNOiLtDpQ6w_vfef5lI61Li2nWOk5izAXP43ZjSQ-sG5E711mxqdZkntptid9rttYk-L7v7d1Col2-dxwFZ0EOgBFmVUf3RSU7kvaADGgcAyJnZeXJBHUqioIRJFeiE5v0BB4M5FQ:1pA7zQ:nVM21tifwGXDP5KMG_bB63myFvtFnx-lRua6ELPWX6s	2023-01-10 11:19:24.539718+00
z1twmlaw6350sfy5o2owj7l7qx2shyae	.eJxVjMsOgjAUBf-la9NAL_Th0r3fQO6rFjWQUFgZ_11JWOj2zMx5mQG3tQxb1WUYxZxN25vT70jID512InecbrPleVqXkeyu2INWe51Fn5fD_TsoWMu3Ro8iPRMQZUixY-18BtUmKgtjjlH7EDJByylFCg6gEceMzmtwJOb9AU03OY8:1pSMqV:zi3GbWYQ65mU4fYjk3OfDw8fxDGUKxRzN_YqERxM7Oc	2023-03-01 18:49:35.415378+00
lril5jkr7feq2k4yylhrdj7ngrzj2bx1	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pAPtv:SMstnFaPO_60LUbILN0kJnVXTUUQNkvrFodxFufr6ME	2023-01-11 06:26:55.155646+00
9e1catosirnokv4ic8ilp6zdbky4fmo5	.eJxVjMsOwiAQRf-FtSE8hDou3fcbyAwDUjWQlHZl_HfbpAvd3nPOfYuA61LC2tMcJhZXAVacfkfC-Ex1J_zAem8ytrrME8ldkQftcmycXrfD_Tso2MtWXyCjUokAHFiFzBpyzMqC0dYNji3ks_fRkyYdKVuTFEbyG2Y1JDbi8wULfTg3:1pfpd1:rG99CqYs6PP63gp9lzRx2QHwhxzHyH68PYox1uvHuw8	2023-04-07 22:11:19.548787+00
yqw0lfxaqhxdnu52ohtmtrm8mviad1j3	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pASqj:jd20GOyuzN6v90xw1LiRBUzKGrllp6dTHjRKH2kVNZ4	2023-01-11 09:35:49.385655+00
btvc6y143hb6rfzo55ucv24522v78d9z	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pVUUN:EkhnychcZC0kuolOVvye0yTG0k9GmV8AAHUJYkKq6Kk	2023-03-10 09:35:39.665221+00
f82sjeb7011zuewifnhg9n51dpvd9gcs	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pASsj:HEh3Agf5YBU7uAuDbgRz9jBxlWVpQ_pKhMhFmFvPiTE	2023-01-11 09:37:53.676428+00
jgc691owezdu0lkunjsda48sf8erd9tx	.eJxVjMsOwiAQRf-FtSHT4SG4dN9vIAMDUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSJhYXMQCK0-8aKT1y2xHfqd1mmea2LlOUuyIP2uU4c35eD_fvoFKv39pzcZYzlLPJNpuEaCH6hIQFjdGRQGtDyTpyblDsGJTyJSIocElpFu8PMWU3_w:1plzDZ:5rWwyvhkkCNbKgO76aGTTdIKV_03fGvi_6BzFLoXbuc	2023-04-24 21:38:29.143773+00
rcskcd2r0o5al7zz7b7c7owa5sdqp8kz	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pASvM:8FL4gSA1IErtk2dW6qa4xvFOtw23kN6CWyEEfan0y9M	2023-01-11 09:40:36.788567+00
5qjdgjfqcqqhqroqocya0cq3cpc0717v	.eJxVjDEOwjAMRe-SGUW4aVKLkZ0zRI7tkAJKpaadKu4OlTrA-t97fzOR1qXEtekcRzEXM5jT75aIn1p3IA-q98nyVJd5THZX7EGbvU2ir-vh_h0UauVb577DJOghEENWTaj-7CQzeS_ogPoOAHJOyXlyQR0KU1BCVgUa0Lw_Cxk5Gw:1pjt3Y:NmFEwmBzxLgKMBN2BRC9pBUuJRIccDLLjMPYG9jgyW0	2023-04-19 02:39:28.592278+00
cyw1srpvb4fsksq8zax64odjomi27uan	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pASw9:yipkm8Gam4fuODJxFSs2dcxz8bexknjcRMYJuuFaWpY	2023-01-11 09:41:25.426037+00
9yy2tpfubqgk5wau6zfqkuiugt1uma6u	.eJxVjcEOwjAMQ_-lZ1S1zdSl3OBHqiTLtImpk1h3Qvw7K9oBjraf7ZfJtNcp75s-8zyYq0loLr8mkzy0tISWpdmWRNa9VPtlznizt0NpqbNQnddyP1t_UxNtU3tgBgYMINoRIAZOLgbvxKlnIBSJwGNwXRpconFMegC-GyBi34fQm_cH4408HA:1pv3Qe:yct--XtvOBEwEJ4flP-9eM_6UDpaZzP43udEBJSdrJs	2023-05-19 21:57:28.244206+00
ck265mr7bs26067bm80g2eo01d1guzwt	.eJxVjDsOwyAQBe9CHSE-C4aU6X0GtCw4OIlAMnYV5e6xJRdJ-2bmvVnAbS1h63kJc2JXZoFdfseI9Mz1IOmB9d44tbouc-SHwk_a-dhSft1O9--gYC97nQG0Ns4JyoOwSnvnEFHFAUjpSRjwHsBaOUnACGl3yUdyQNHJrIxkny_faDca:1pAaTJ:14BKke-MBlz5z7RdJL5dMdCrBQol5JhEMBHCVTmsnXk	2023-01-11 17:44:09.095385+00
btqoa8i2i56ne0uvxub5usl5dwqwz0r1	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1plGq3:ql9bzI3w-V-P6bsJp5B-jlr3050PnGlbCM9IVU8Psfk	2023-04-22 22:15:15.328282+00
8v54jpeb0dto6uz5rbiwbqiakzgw2i98	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pAlej:zRJ_1XMuFMOS8wV3j3oajQ0PqiphBBxYPXk9b3uteJc	2023-01-12 05:40:41.128817+00
cwnmtjzbillikamiup5iv14rk26kowjw	.eJxVjM0KwyAQhN_FcxEV409v7YvIullRGgxUPZW-e2PJob0MzHwz82IBRs9hNHqGsrIrk1Kzy28aAR9UJ4JtmzEHxH3Uzr-dEzd-OxzVXhB62ev9XP1dZWj5-CESiHHqShYcgNJWC4GWbNLCOFxsMqDd4q2OlEh4L6Jy0qSoJMXE3h85ez2f:1pmPGc:lxWMmKqzkO3C5qVLexjVLepxrCd_wTcWhuelMY0THZU	2023-04-26 01:27:22.443022+00
jeroxk53pxch81gxidqxsvhjrff25ufo	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pAznW:v8h-eNdJcDMuL1ob_bvsTEwBEzXVNiNdbd2iA9AQ10M	2023-01-12 20:46:42.484354+00
m90eptrn6ixt56dvnhyaafz9ppsro1qn	.eJxVjDsOwjAQBe_iGln-e0NJnzNYa--CA8iR4qRC3B0ipYD2zcx7iYTbWtPWeUkTibOI4vS7ZSwPbjugO7bbLMvc1mXKclfkQbscZ-Ln5XD_Dir2-q3DQA4jacXFsjXeewfKGlDk7QBkDeZsvFN8BacjxogELitNoQSIGsT7A8TeNuc:1pBAu3:05mIpQfUoGgkwQ07ReiSgIe5jDrRrvNTDLhB0BhPI18	2023-01-13 08:38:11.46378+00
yru8ad3a0oeun8pflchi3po5842y0xax	.eJxVjM0OwiAQhN-FsyH8tMh69O4zkGVZpGogKe3J-O62SQ96mmS-b-YtAq5LCWvnOUxJXIRWWpx-24j05Lqj9MB6b5JaXeYpyl2RB-3y1hK_rof7d1Cwl209jNHBGZkGDzHzyEZlyxa8z6CdB0ORDCt2CBEIKSdKdgvAhD7rLD5fSmk6AQ:1ppJPP:ei6ofCm00njMWXAMRpSiMnrveXf0EcZfobUYO6aXIQw	2023-05-04 01:48:27.617338+00
w0plobucw9vibp83f7m0sbgep416rry4	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pBAvv:1g-LpahqFSekTBMsahYwPPA24ity_wueib18g6vy2kk	2023-01-13 08:40:07.440398+00
k1gc50vsdsae9au2sytlhvr5iegph73w	.eJxVjEEOwiAQRe_C2hAKhQGX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWQYvT75iQHrnthO_YbrOkua3LlOSuyIN2eZ05Py-H-3dQsddvbVwADo6Jik9JuwGhBINUDJAC8okgYDaFvbKgx9EjKqctWNZYgAfx_gAjdTh9:1pz3dX:cwQjY-VdrI5-E_OpFzTpk1zNxlaxbGDCEf-SSJ_NTxU	2023-05-30 22:59:19.963496+00
cm0ofizwe4ibuermjoqkyxxqum4st9vc	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pBMQ6:VuxxW7FhWn1OOLQ8midJdXoiQOS787kqf2UriK9j5FU	2023-01-13 20:56:02.316027+00
a2nj6nu0emag84d8fs8iodvbpm8nra92	.eJxVjM0OwiAQhN-FsyGUv7Le7Is0uwsGYkMToSfju9uaHvQ438x8LzHj1vO8tfScSxRXASAuv5CQH6keDS7LgSUyr1vt8rs56yZve0q1F8Ze1jqdrz9VxpZ3TxiTt4oRrGECNooUgvGegLwOip29W4-DQ2LrRlaRA0ftwOEAmojE-wPjPDyq:1prkyI:u_nVbribketQLkM76ahIDuQCOsDfSCLzf-6NbpIADas	2023-05-10 19:38:34.815562+00
aia960frodjzzj88mtb3m4te8h619db1	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pBMXu:K4Fo0rK9FwjQiHOxx8GlQBMDGTMX72hR4dGL5Q3VwoA	2023-01-13 21:04:06.775419+00
n7b62qbjnq9u74v1pov69la2r908vln7	.eJxVjDkOwjAUBe_iGlnx9yZT0nMG6y8ODiBHipMKcXeIlALaNzPvpTJua81bL0ueRJ2VV6ffjZAfpe1A7thus-a5rctEelf0Qbu-zlKel8P9O6jY67eGRAxRhCHZMUYXEwijR--T90A2coQByBljsdiCIZhhDGRscoxYRL0_2ZA3yA:1pBMiQ:cMJHak4uQs52hA7ErBCqYmPlkTaJV1WxmJ_13gx4RYk	2023-01-13 21:14:58.850999+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.django_site (id, domain, name) FROM stdin;
1	https://yogeek.shop/	yogeek.shop
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
15	google	111136841953308836051	2023-03-06 14:30:33.156593+00	2023-03-06 14:30:33.156617+00	{"id": "111136841953308836051", "email": "duiliogullo.92@gmail.com", "verified_email": true, "name": "Duilio Gullo", "given_name": "Duilio", "family_name": "Gullo", "picture": "https://lh3.googleusercontent.com/a/AGNmyxZGiLr0T10Okv7uiHmC7b5B1o4VTj-krgDZ7uPj=s96-c", "locale": "fr"}	85
16	google	101906970788249543011	2023-03-07 12:01:54.179529+00	2023-03-07 12:01:54.179559+00	{"id": "101906970788249543011", "email": "semdejonge@gmail.com", "verified_email": true, "name": "Sem De Jonge", "given_name": "Sem", "family_name": "De Jonge", "picture": "https://lh3.googleusercontent.com/a/AGNmyxaur3y9IMvUvIxLuhg4c7G6i4UouPkv3CaUFTsu=s96-c", "locale": "nl"}	86
3	google	103852129716209337959	2023-01-13 17:05:10.889535+00	2022-12-13 20:05:08.864536+00	{"id": "103852129716209337959", "email": "ahtashamfaheem8@gmail.com", "verified_email": true, "name": "Ahtasham Faheem", "given_name": "Ahtasham", "family_name": "Faheem", "picture": "https://lh3.googleusercontent.com/a/AEdFTp6OYCTWrhZ1hWecPrN4nkfLdghsPtY1pkY6972z=s96-c", "locale": "en-GB"}	4
5	google	107192078729747049536	2023-02-27 17:41:42.221479+00	2023-02-27 17:41:42.22151+00	{"id": "107192078729747049536", "email": "exzile100@gmail.com", "verified_email": true, "name": "David Teves", "given_name": "David", "family_name": "Teves", "picture": "https://lh3.googleusercontent.com/a/AGNmyxZkgVxZImdT54khWIV8Bu_P7iZWe_cVBlEzTcSB=s96-c", "locale": "en-GB"}	70
6	google	115954421560889202888	2023-02-27 18:47:35.198397+00	2023-02-27 18:47:35.198426+00	{"id": "115954421560889202888", "email": "stevie.tricks1@gmail.com", "verified_email": true, "name": "Steve Tricks", "given_name": "Steve", "family_name": "Tricks", "picture": "https://lh3.googleusercontent.com/a/AGNmyxbAjKHJjksQ5kqSXhRrBIk5FRkaxeepKpDdKoR7=s96-c", "locale": "en"}	72
7	google	109720926124699408584	2023-02-28 21:38:21.232845+00	2023-02-28 21:38:21.232874+00	{"id": "109720926124699408584", "email": "jacev021191@gmail.com", "verified_email": true, "name": "Jack Evans", "given_name": "Jack", "family_name": "Evans", "picture": "https://lh3.googleusercontent.com/a/AGNmyxbV5zWXwHTufAj1TFy_HnBiElBfUhybHoKDkydD=s96-c", "locale": "en-GB"}	74
8	google	109242542184195821310	2023-03-01 18:13:55.21684+00	2023-03-01 18:09:25.361115+00	{"id": "109242542184195821310", "email": "dsypalo54@gmail.com", "verified_email": true, "name": "\\u0414\\u043c\\u0438\\u0442\\u0440\\u0438\\u0439 \\u0421", "given_name": "\\u0414\\u043c\\u0438\\u0442\\u0440\\u0438\\u0439", "family_name": "\\u0421", "picture": "https://lh3.googleusercontent.com/a/AGNmyxZmKnbfB4X5UChtw04F7quUZkhhiNBJKDwNDFEt=s96-c", "locale": "ru"}	77
4	google	108216144342375499392	2022-12-14 07:58:19.696274+00	2022-12-14 07:58:19.696298+00	{"id": "108216144342375499392", "email": "winnerceo@gmail.com", "verified_email": true, "name": "Daldal Song", "given_name": "Daldal", "family_name": "Song", "picture": "https://lh3.googleusercontent.com/a/AEdFTp5GWWZHt6JodeBslrA1pfonbpRhAkHmvj0EqGYK=s96-c", "locale": "ko"}	6
9	google	102332847963421354940	2023-03-01 19:06:01.720726+00	2023-03-01 19:06:01.720754+00	{"id": "102332847963421354940", "email": "mkolodiychik@gmail.com", "verified_email": true, "name": "Max Kolodiychik", "given_name": "Max", "family_name": "Kolodiychik", "picture": "https://lh3.googleusercontent.com/a/AGNmyxYmCtGooDOwzwo-9hJ-SGz55QeZZ9-AMOFrACvhgg=s96-c", "locale": "en"}	78
10	google	104584832011374640250	2023-03-02 09:48:26.747306+00	2023-03-02 09:48:26.747327+00	{"id": "104584832011374640250", "email": "lodovico.venturoli@gmail.com", "verified_email": true, "name": "Lodovico Venturoli", "given_name": "Lodovico", "family_name": "Venturoli", "picture": "https://lh3.googleusercontent.com/a/AGNmyxbwtQ1QhXOvn4arg1ZQRfoDluPo3V3zcr48YpJZ3g=s96-c", "locale": "it"}	79
11	google	105555752728421247026	2023-03-02 23:28:38.778397+00	2023-03-02 23:28:38.778425+00	{"id": "105555752728421247026", "email": "jeamymax@gmail.com", "verified_email": true, "name": "Jean Maxi", "given_name": "Jean", "family_name": "Maxi", "picture": "https://lh3.googleusercontent.com/a/AGNmyxYNKrhY0F_NDnLcuhvihMX8w262bVYLSF9WUTuc=s96-c", "locale": "es-419"}	80
17	google	112256740119574994182	2023-03-07 18:30:31.605064+00	2023-03-07 18:30:31.605091+00	{"id": "112256740119574994182", "email": "edimodeborel@gmail.com", "verified_email": true, "name": "Aur\\u00e9lien Ludwig Edimo de Borel", "given_name": "Aur\\u00e9lien Ludwig", "family_name": "Edimo de Borel", "picture": "https://lh3.googleusercontent.com/a/AGNmyxbQ4btgvn6eVg12GzTlyaosNEvt-zvzgZQpHSzz=s96-c", "locale": "fr"}	87
12	google	107537289267781021382	2023-03-03 02:52:02.171878+00	2023-03-03 02:52:02.171902+00	{"id": "107537289267781021382", "email": "mahdanks45@gmail.com", "verified_email": true, "name": "Mahdan Kintara Sanie", "given_name": "Mahdan", "family_name": "Kintara Sanie", "picture": "https://lh3.googleusercontent.com/a/AGNmyxbwU1GdD8NIq8kD6G23FVucApfeyRqMNqMyN6cD=s96-c", "locale": "en"}	82
13	google	108898078443693923215	2023-03-03 08:32:22.077373+00	2023-03-03 08:29:45.078277+00	{"id": "108898078443693923215", "email": "info@gccs.be", "verified_email": true, "name": "Timothy", "given_name": "Timothy", "link": "https://plus.google.com/108898078443693923215", "picture": "https://lh3.googleusercontent.com/a/AGNmyxbjgdPY6VGBvAx845WefQAY2sp3oJ6p1qX56rknlQ=s96-c", "locale": "en-GB", "hd": "gccs.be"}	83
1	google	104740246672265967406	2023-01-05 20:02:51.906988+00	2022-12-13 20:03:38.432338+00	{"id": "104740246672265967406", "email": "aqibijaz3@gmail.com", "verified_email": true, "name": "aqib ijaz", "given_name": "aqib", "family_name": "ijaz", "picture": "https://lh3.googleusercontent.com/a/AEdFTp6P-nez-TyzDfSkS2jzLKIhK6Y9E7Set5fZx2O2=s96-c", "locale": "en"}	2
14	google	110552720518450119650	2023-03-03 09:46:04.665217+00	2023-03-03 09:46:04.665242+00	{"id": "110552720518450119650", "email": "nunotech911@gmail.com", "verified_email": true, "name": "Nuno Marques", "given_name": "Nuno", "family_name": "Marques", "picture": "https://lh3.googleusercontent.com/a/AGNmyxZSPdX8n46c6Hu5WhJclXXnjF1eXj1X0KKK2vDV=s96-c", "locale": "fr"}	84
18	google	105870909684934908751	2023-03-15 08:42:32.911256+00	2023-03-15 08:42:32.911281+00	{"id": "105870909684934908751", "email": "rami.kamar@gmail.com", "verified_email": true, "name": "Rami kamar", "given_name": "Rami", "family_name": "kamar", "picture": "https://lh3.googleusercontent.com/a/AGNmyxYdyzVfVVlfWKmv2R_O4o-iIydOLGrvQeIiEy6-hHA=s96-c", "locale": "en-GB"}	90
21	google	101878063587993866931	2023-04-06 19:30:32.44949+00	2023-04-06 19:30:32.449518+00	{"id": "101878063587993866931", "email": "musharaf42@gmail.com", "verified_email": true, "name": "Musharraf Faheem", "given_name": "Musharraf", "family_name": "Faheem", "picture": "https://lh3.googleusercontent.com/a/AGNmyxZe8E2b78Nq8nFvTkFo8d-D_pfQ8h3It1xOvaXn=s96-c", "locale": "en"}	100
20	google	103343720956044531220	2023-05-26 00:39:44.848397+00	2023-04-04 19:31:35.755031+00	{"id": "103343720956044531220", "email": "msarfaraz.meyo@gmail.com", "verified_email": true, "name": "Muhammad Sarfaraz", "given_name": "Muhammad", "family_name": "Sarfaraz", "picture": "https://lh3.googleusercontent.com/a/AAcHTtdhghWBze5wflWrrtgTf9qEhna1s21y4Pil5L4W=s96-c", "locale": "en-GB"}	99
29	google	106629399652173880838	2023-05-08 16:28:00.959795+00	2023-04-26 21:34:09.988467+00	{"id": "106629399652173880838", "email": "bcsm-f18-408@superior.edu.pk", "verified_email": true, "name": "MUHAMMAD SARFARAZ", "given_name": "MUHAMMAD", "family_name": "SARFARAZ", "picture": "https://lh3.googleusercontent.com/a/AGNmyxZYyG-nXaCMJGvctICMas0T8gWNf_s5IQLs2d8M=s96-c", "locale": "en", "hd": "superior.edu.pk"}	122
19	google	118131212703093711925	2023-05-25 16:54:49.646668+00	2023-04-04 19:13:11.788448+00	{"id": "118131212703093711925", "email": "adeelahmad31105@gmail.com", "verified_email": true, "name": "Adeel Ahmad", "given_name": "Adeel", "family_name": "Ahmad", "picture": "https://lh3.googleusercontent.com/a/AAcHTtewGmMOHWNwUomSMuhY7CBcRZ8kQOkdzgApXqZW=s96-c", "locale": "en"}	98
30	facebook	6361327510572249	2023-05-10 08:28:10.776878+00	2023-05-10 08:28:10.776901+00	{"id": "6361327510572249", "email": "yangpspider@hotmail.com", "name": "Jeongho Yang", "first_name": "Jeongho", "last_name": "Yang"}	123
26	google	114708873981438569564	2023-05-10 08:28:19.725018+00	2023-04-14 04:11:57.269017+00	{"id": "114708873981438569564", "email": "yangpspider@gmail.com", "verified_email": true, "name": "Jay Yang", "given_name": "Jay", "family_name": "Yang", "picture": "https://lh3.googleusercontent.com/a/AGNmyxZzwIfD8IRpOjeGBz94GQVLZ--h9NiIN1yUblZE_w=s96-c", "locale": "ko"}	119
31	google	104327498164721599723	2023-05-26 08:15:07.843979+00	2023-05-15 06:26:22.201752+00	{"id": "104327498164721599723", "email": "richard.geeknation@gmail.com", "verified_email": true, "name": "Richard-GeekNation Alcaide", "given_name": "Richard-GeekNation", "family_name": "Alcaide", "picture": "https://lh3.googleusercontent.com/a/AAcHTtdte6wq7NxI8Du7GSpUV8aYT0OpNIiaUp76lVf6=s96-c", "locale": "en"}	124
23	google	114214913044988692967	2023-04-12 02:33:29.506958+00	2023-04-11 03:04:40.261454+00	{"id": "114214913044988692967", "email": "alex.geeknation@gmail.com", "verified_email": true, "name": "Alexandra Roxas", "given_name": "Alexandra", "family_name": "Roxas", "picture": "https://lh3.googleusercontent.com/a/AGNmyxbzxeUxjz5UMhCCSwxvPysglz5rP0_SeZ6P1gb4=s96-c", "locale": "en"}	114
24	google	100276579031803000858	2023-04-12 09:58:50.871099+00	2023-04-11 07:01:50.418205+00	{"id": "100276579031803000858", "email": "lena.geeknation@gmail.com", "verified_email": true, "name": "Elena Grace Chichirita", "given_name": "Elena Grace", "family_name": "Chichirita", "picture": "https://lh3.googleusercontent.com/a/AGNmyxbEEJLYwZqNsMbPOGZamCaxJDauwj3fIfwFShwU=s96-c", "locale": "en"}	115
22	facebook	3328182804066397	2023-04-10 18:46:05.756963+00	2023-04-10 18:14:02.329259+00	{"id": "3328182804066397", "email": "mohd.reehaan010@gmail.com", "name": "Muhammad Rehan", "first_name": "Muhammad", "last_name": "Rehan"}	113
25	google	100924320811889184522	2023-05-19 00:43:00.413734+00	2023-04-12 01:45:34.545062+00	{"id": "100924320811889184522", "email": "buloy11@gmail.com", "verified_email": true, "name": "MrBuloy11", "given_name": "MrBuloy11", "picture": "https://lh3.googleusercontent.com/a/AGNmyxbO5ybnNsmrhHr1Bfl7AT03AUA3mzPU6K_fuKBo=s96-c", "locale": "en"}	116
27	google	111965031784952432585	2023-04-20 03:41:33.338825+00	2023-04-20 01:48:12.362906+00	{"id": "111965031784952432585", "email": "cryzsalex0129@gmail.com", "verified_email": true, "name": "Cryzsalex0129", "given_name": "Cryzsalex0129", "picture": "https://lh3.googleusercontent.com/a/AGNmyxaQLTqv6ihJqJIJx3pfLANtYTgk8GK_EWXITmyS=s96-c", "locale": "en"}	120
28	google	103104474150668869960	2023-04-20 07:50:57.419325+00	2023-04-20 07:49:53.016482+00	{"id": "103104474150668869960", "email": "maqsoodahmed15750@gmail.com", "verified_email": true, "name": "Maqsood Ahmed", "given_name": "Maqsood", "family_name": "Ahmed", "picture": "https://lh3.googleusercontent.com/a/AGNmyxaw9mSXGOeCQv9hqqP7Tu5PP1-fBdyt2IGlTzBy=s96-c", "locale": "en"}	121
33	google	107750219298267713828	2023-05-26 08:57:39.820715+00	2023-05-26 08:56:37.625037+00	{"id": "107750219298267713828", "email": "edwinkurian0915@gmail.com", "verified_email": true, "name": "Edwin Ryu", "given_name": "Edwin", "family_name": "Ryu", "picture": "https://lh3.googleusercontent.com/a/AAcHTtd8JBXn3cAoHoyDkmdCLcXbOlxfq_7IkIpAzP6C0w=s96-c", "locale": "en-GB"}	126
32	google	114195579879366989909	2023-05-22 03:31:37.935471+00	2023-05-22 03:31:37.935497+00	{"id": "114195579879366989909", "email": "geeknation.yogeek@gmail.com", "verified_email": true, "name": "Richard Alcaide", "given_name": "Richard", "family_name": "Alcaide", "picture": "https://lh3.googleusercontent.com/a/AGNmyxY9KHKL4_8afc7sSnPJ9PqnqlDeaxqwUDlGxT9f=s96-c", "locale": "fil"}	125
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
1	google	SellBuy	1054367004877-u3btp113vht9o84rirfid6934tuu3lvo.apps.googleusercontent.com	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	
2	facebook	SellBuy	828638414976952	d82a718478eb0d936ddb320107359c33	
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
1	1	1
2	2	1
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: sellbuy
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 32, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: api_activitylog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_activitylog_id_seq', 1, false);


--
-- Name: api_badge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_badge_id_seq', 1, false);


--
-- Name: api_bannerad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_bannerad_id_seq', 1, false);


--
-- Name: api_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_brand_id_seq', 18, true);


--
-- Name: api_buybadge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_buybadge_id_seq', 1, false);


--
-- Name: api_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_category_id_seq', 38, true);


--
-- Name: api_favouriteproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_favouriteproduct_id_seq', 202, true);


--
-- Name: api_generalactivitylog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_generalactivitylog_id_seq', 196, true);


--
-- Name: api_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_image_id_seq', 112, true);


--
-- Name: api_makeoffer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_makeoffer_id_seq', 23, true);


--
-- Name: api_myaddressbook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_myaddressbook_id_seq', 5, true);


--
-- Name: api_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_notification_id_seq', 207, true);


--
-- Name: api_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_order_id_seq', 3, true);


--
-- Name: api_order_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_order_products_id_seq', 3, true);


--
-- Name: api_orderpayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_orderpayment_id_seq', 3, true);


--
-- Name: api_otp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_otp_id_seq', 29, true);


--
-- Name: api_product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_product_categories_id_seq', 69, true);


--
-- Name: api_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_product_id_seq', 69, true);


--
-- Name: api_product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_product_images_id_seq', 69, true);


--
-- Name: api_promotion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_promotion_id_seq', 1, false);


--
-- Name: api_reportproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_reportproduct_id_seq', 1, false);


--
-- Name: api_reportreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_reportreview_id_seq', 1, false);


--
-- Name: api_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_review_id_seq', 1, false);


--
-- Name: api_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_room_id_seq', 37, true);


--
-- Name: api_seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_seller_id_seq', 6, true);


--
-- Name: api_user_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_user_categories_id_seq', 21, true);


--
-- Name: api_user_followers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_user_followers_id_seq', 1, false);


--
-- Name: api_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_user_groups_id_seq', 1466, true);


--
-- Name: api_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_user_id_seq', 126, true);


--
-- Name: api_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.api_user_user_permissions_id_seq', 1, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 116, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 148, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 99, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 37, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 51, true);


--
-- Name: django_rest_passwordreset_resetpasswordtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.django_rest_passwordreset_resetpasswordtoken_id_seq', 1, false);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 33, true);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 2, true);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 2, true);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: sellbuy
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: api_activitylog api_activitylog_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_activitylog
    ADD CONSTRAINT api_activitylog_pkey PRIMARY KEY (id);


--
-- Name: api_badge api_badge_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_badge
    ADD CONSTRAINT api_badge_pkey PRIMARY KEY (id);


--
-- Name: api_bannerad api_bannerad_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_bannerad
    ADD CONSTRAINT api_bannerad_pkey PRIMARY KEY (id);


--
-- Name: api_brand api_brand_name_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_brand
    ADD CONSTRAINT api_brand_name_key UNIQUE (name);


--
-- Name: api_brand api_brand_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_brand
    ADD CONSTRAINT api_brand_pkey PRIMARY KEY (id);


--
-- Name: api_brand api_brand_slug_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_brand
    ADD CONSTRAINT api_brand_slug_key UNIQUE (slug);


--
-- Name: api_buybadge api_buybadge_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_buybadge
    ADD CONSTRAINT api_buybadge_pkey PRIMARY KEY (id);


--
-- Name: api_category api_category_name_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_category
    ADD CONSTRAINT api_category_name_key UNIQUE (name);


--
-- Name: api_category api_category_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_category
    ADD CONSTRAINT api_category_pkey PRIMARY KEY (id);


--
-- Name: api_category api_category_slug_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_category
    ADD CONSTRAINT api_category_slug_key UNIQUE (slug);


--
-- Name: api_favouriteproduct api_favouriteproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_favouriteproduct
    ADD CONSTRAINT api_favouriteproduct_pkey PRIMARY KEY (id);


--
-- Name: api_generalactivitylog api_generalactivitylog_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_generalactivitylog
    ADD CONSTRAINT api_generalactivitylog_pkey PRIMARY KEY (id);


--
-- Name: api_image api_image_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_image
    ADD CONSTRAINT api_image_pkey PRIMARY KEY (id);


--
-- Name: api_makeoffer api_makeoffer_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_makeoffer
    ADD CONSTRAINT api_makeoffer_pkey PRIMARY KEY (id);


--
-- Name: api_myaddressbook api_myaddressbook_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_myaddressbook
    ADD CONSTRAINT api_myaddressbook_pkey PRIMARY KEY (id);


--
-- Name: api_notification api_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_notification
    ADD CONSTRAINT api_notification_pkey PRIMARY KEY (id);


--
-- Name: api_order api_order_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_order
    ADD CONSTRAINT api_order_pkey PRIMARY KEY (id);


--
-- Name: api_order_products api_order_products_order_id_product_id_916e551e_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_order_products
    ADD CONSTRAINT api_order_products_order_id_product_id_916e551e_uniq UNIQUE (order_id, product_id);


--
-- Name: api_order_products api_order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_order_products
    ADD CONSTRAINT api_order_products_pkey PRIMARY KEY (id);


--
-- Name: api_orderpayment api_orderpayment_order_id_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_orderpayment
    ADD CONSTRAINT api_orderpayment_order_id_key UNIQUE (order_id);


--
-- Name: api_orderpayment api_orderpayment_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_orderpayment
    ADD CONSTRAINT api_orderpayment_pkey PRIMARY KEY (id);


--
-- Name: api_otp api_otp_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_otp
    ADD CONSTRAINT api_otp_phone_number_key UNIQUE (phone_number);


--
-- Name: api_otp api_otp_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_otp
    ADD CONSTRAINT api_otp_pkey PRIMARY KEY (id);


--
-- Name: api_product_categories api_product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product_categories
    ADD CONSTRAINT api_product_categories_pkey PRIMARY KEY (id);


--
-- Name: api_product_categories api_product_categories_product_id_category_id_bac4732a_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product_categories
    ADD CONSTRAINT api_product_categories_product_id_category_id_bac4732a_uniq UNIQUE (product_id, category_id);


--
-- Name: api_product_images api_product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product_images
    ADD CONSTRAINT api_product_images_pkey PRIMARY KEY (id);


--
-- Name: api_product_images api_product_images_product_id_image_id_a39ff8e0_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product_images
    ADD CONSTRAINT api_product_images_product_id_image_id_a39ff8e0_uniq UNIQUE (product_id, image_id);


--
-- Name: api_product api_product_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product
    ADD CONSTRAINT api_product_pkey PRIMARY KEY (id);


--
-- Name: api_product api_product_slug_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product
    ADD CONSTRAINT api_product_slug_key UNIQUE (slug);


--
-- Name: api_promotion api_promotion_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_promotion
    ADD CONSTRAINT api_promotion_pkey PRIMARY KEY (id);


--
-- Name: api_reportproduct api_reportproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_reportproduct
    ADD CONSTRAINT api_reportproduct_pkey PRIMARY KEY (id);


--
-- Name: api_reportreview api_reportreview_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_reportreview
    ADD CONSTRAINT api_reportreview_pkey PRIMARY KEY (id);


--
-- Name: api_review api_review_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_review
    ADD CONSTRAINT api_review_pkey PRIMARY KEY (id);


--
-- Name: api_room api_room_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_room
    ADD CONSTRAINT api_room_pkey PRIMARY KEY (id);


--
-- Name: api_room api_room_slug_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_room
    ADD CONSTRAINT api_room_slug_key UNIQUE (slug);


--
-- Name: api_seller api_seller_email_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_seller
    ADD CONSTRAINT api_seller_email_key UNIQUE (email);


--
-- Name: api_seller api_seller_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_seller
    ADD CONSTRAINT api_seller_pkey PRIMARY KEY (id);


--
-- Name: api_user_categories api_user_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_categories
    ADD CONSTRAINT api_user_categories_pkey PRIMARY KEY (id);


--
-- Name: api_user_categories api_user_categories_user_id_category_id_65e7d283_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_categories
    ADD CONSTRAINT api_user_categories_user_id_category_id_65e7d283_uniq UNIQUE (user_id, category_id);


--
-- Name: api_user_followers api_user_followers_from_user_id_to_user_id_9571daf8_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_followers
    ADD CONSTRAINT api_user_followers_from_user_id_to_user_id_9571daf8_uniq UNIQUE (from_user_id, to_user_id);


--
-- Name: api_user_followers api_user_followers_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_followers
    ADD CONSTRAINT api_user_followers_pkey PRIMARY KEY (id);


--
-- Name: api_user_groups api_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_groups
    ADD CONSTRAINT api_user_groups_pkey PRIMARY KEY (id);


--
-- Name: api_user_groups api_user_groups_user_id_group_id_9c7ddfb5_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_groups
    ADD CONSTRAINT api_user_groups_user_id_group_id_9c7ddfb5_uniq UNIQUE (user_id, group_id);


--
-- Name: api_user api_user_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user
    ADD CONSTRAINT api_user_pkey PRIMARY KEY (id);


--
-- Name: api_user_user_permissions api_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_user_permissions
    ADD CONSTRAINT api_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: api_user_user_permissions api_user_user_permissions_user_id_permission_id_a06dd704_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_user_permissions
    ADD CONSTRAINT api_user_user_permissions_user_id_permission_id_a06dd704_uniq UNIQUE (user_id, permission_id);


--
-- Name: api_user api_user_username_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user
    ADD CONSTRAINT api_user_username_key UNIQUE (username);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_rest_passwordreset_resetpasswordtoken django_rest_passwordreset_resetpasswordtoken_key_f1b65873_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_rest_passwordreset_resetpasswordtoken
    ADD CONSTRAINT django_rest_passwordreset_resetpasswordtoken_key_f1b65873_uniq UNIQUE (key);


--
-- Name: django_rest_passwordreset_resetpasswordtoken django_rest_passwordreset_resetpasswordtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_rest_passwordreset_resetpasswordtoken
    ADD CONSTRAINT django_rest_passwordreset_resetpasswordtoken_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: api_activitylog_activity_by_id_45d244f1; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_activitylog_activity_by_id_45d244f1 ON public.api_activitylog USING btree (activity_by_id);


--
-- Name: api_activitylog_activity_for_id_7fd1f4cf; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_activitylog_activity_for_id_7fd1f4cf ON public.api_activitylog USING btree (activity_for_id);


--
-- Name: api_activitylog_product_id_65838432; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_activitylog_product_id_65838432 ON public.api_activitylog USING btree (product_id);


--
-- Name: api_bannerad_offer_id_3cffe422; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_bannerad_offer_id_3cffe422 ON public.api_bannerad USING btree (offer_id);


--
-- Name: api_bannerad_product_id_4992e23f; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_bannerad_product_id_4992e23f ON public.api_bannerad USING btree (product_id);


--
-- Name: api_bannerad_user_id_d53a713d; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_bannerad_user_id_d53a713d ON public.api_bannerad USING btree (user_id);


--
-- Name: api_brand_category_id_3d4eebce; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_brand_category_id_3d4eebce ON public.api_brand USING btree (category_id);


--
-- Name: api_brand_name_afa35a66_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_brand_name_afa35a66_like ON public.api_brand USING btree (name varchar_pattern_ops);


--
-- Name: api_brand_slug_e368d547_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_brand_slug_e368d547_like ON public.api_brand USING btree (slug varchar_pattern_ops);


--
-- Name: api_buybadge_badges_id_943d606f; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_buybadge_badges_id_943d606f ON public.api_buybadge USING btree (badges_id);


--
-- Name: api_buybadge_user_id_6e1af99f; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_buybadge_user_id_6e1af99f ON public.api_buybadge USING btree (user_id);


--
-- Name: api_category_name_4aabb41f_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_category_name_4aabb41f_like ON public.api_category USING btree (name varchar_pattern_ops);


--
-- Name: api_category_parent_id_714127a8; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_category_parent_id_714127a8 ON public.api_category USING btree (parent_id);


--
-- Name: api_category_slug_b6a34ca6_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_category_slug_b6a34ca6_like ON public.api_category USING btree (slug varchar_pattern_ops);


--
-- Name: api_favouriteproduct_product_id_cbaabfc5; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_favouriteproduct_product_id_cbaabfc5 ON public.api_favouriteproduct USING btree (product_id);


--
-- Name: api_favouriteproduct_user_id_22a7396f; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_favouriteproduct_user_id_22a7396f ON public.api_favouriteproduct USING btree (user_id);


--
-- Name: api_generalactivitylog_user_id_a3353710; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_generalactivitylog_user_id_a3353710 ON public.api_generalactivitylog USING btree (user_id);


--
-- Name: api_makeoffer_product_id_8576775b; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_makeoffer_product_id_8576775b ON public.api_makeoffer USING btree (product_id);


--
-- Name: api_makeoffer_user_id_3af5e0a9; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_makeoffer_user_id_3af5e0a9 ON public.api_makeoffer USING btree (user_id);


--
-- Name: api_myaddressbook_user_id_9883aaf9; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_myaddressbook_user_id_9883aaf9 ON public.api_myaddressbook USING btree (user_id);


--
-- Name: api_notification_receiver_id_4f55e63e; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_notification_receiver_id_4f55e63e ON public.api_notification USING btree (receiver_id);


--
-- Name: api_notification_sender_id_48a3ca87; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_notification_sender_id_48a3ca87 ON public.api_notification USING btree (sender_id);


--
-- Name: api_order_products_order_id_7a747d0c; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_order_products_order_id_7a747d0c ON public.api_order_products USING btree (order_id);


--
-- Name: api_order_products_product_id_6b091569; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_order_products_product_id_6b091569 ON public.api_order_products USING btree (product_id);


--
-- Name: api_order_user_id_52781ff0; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_order_user_id_52781ff0 ON public.api_order USING btree (user_id);


--
-- Name: api_otp_phone_number_dfb7ce0b_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_otp_phone_number_dfb7ce0b_like ON public.api_otp USING btree (phone_number varchar_pattern_ops);


--
-- Name: api_product_brand_id_c4e9b7a1; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_product_brand_id_c4e9b7a1 ON public.api_product USING btree (brand_id);


--
-- Name: api_product_categories_category_id_8dec49c0; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_product_categories_category_id_8dec49c0 ON public.api_product_categories USING btree (category_id);


--
-- Name: api_product_categories_product_id_50821535; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_product_categories_product_id_50821535 ON public.api_product_categories USING btree (product_id);


--
-- Name: api_product_images_image_id_fb1bf3bc; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_product_images_image_id_fb1bf3bc ON public.api_product_images USING btree (image_id);


--
-- Name: api_product_images_product_id_41c2c81b; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_product_images_product_id_41c2c81b ON public.api_product_images USING btree (product_id);


--
-- Name: api_product_slug_45947488_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_product_slug_45947488_like ON public.api_product USING btree (slug varchar_pattern_ops);


--
-- Name: api_product_user_id_b5580e10; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_product_user_id_b5580e10 ON public.api_product USING btree (user_id);


--
-- Name: api_reportproduct_product_id_08b988ef; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_reportproduct_product_id_08b988ef ON public.api_reportproduct USING btree (product_id);


--
-- Name: api_reportproduct_user_id_bc1e8aa1; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_reportproduct_user_id_bc1e8aa1 ON public.api_reportproduct USING btree (user_id);


--
-- Name: api_reportreview_review_id_1eff7a94; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_reportreview_review_id_1eff7a94 ON public.api_reportreview USING btree (review_id);


--
-- Name: api_reportreview_user_id_b8ef3988; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_reportreview_user_id_b8ef3988 ON public.api_reportreview USING btree (user_id);


--
-- Name: api_review_product_id_78d61c8d; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_review_product_id_78d61c8d ON public.api_review USING btree (product_id);


--
-- Name: api_review_user_id_8bf97ad4; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_review_user_id_8bf97ad4 ON public.api_review USING btree (user_id);


--
-- Name: api_room_created_by_id_75c1a1cf; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_room_created_by_id_75c1a1cf ON public.api_room USING btree (created_by_id);


--
-- Name: api_room_joined_by_id_f6442997; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_room_joined_by_id_f6442997 ON public.api_room USING btree (joined_by_id);


--
-- Name: api_room_product_id_4b3783e3; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_room_product_id_4b3783e3 ON public.api_room USING btree (product_id);


--
-- Name: api_room_slug_ca660cf4_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_room_slug_ca660cf4_like ON public.api_room USING btree (slug varchar_pattern_ops);


--
-- Name: api_seller_email_522ddd71_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_seller_email_522ddd71_like ON public.api_seller USING btree (email varchar_pattern_ops);


--
-- Name: api_seller_user_id_0fe12d5b; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_seller_user_id_0fe12d5b ON public.api_seller USING btree (user_id);


--
-- Name: api_user_categories_category_id_d1f58128; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_user_categories_category_id_d1f58128 ON public.api_user_categories USING btree (category_id);


--
-- Name: api_user_categories_user_id_1e43d7bd; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_user_categories_user_id_1e43d7bd ON public.api_user_categories USING btree (user_id);


--
-- Name: api_user_followers_from_user_id_d205fa97; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_user_followers_from_user_id_d205fa97 ON public.api_user_followers USING btree (from_user_id);


--
-- Name: api_user_followers_to_user_id_3bfaac3e; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_user_followers_to_user_id_3bfaac3e ON public.api_user_followers USING btree (to_user_id);


--
-- Name: api_user_groups_group_id_3af85785; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_user_groups_group_id_3af85785 ON public.api_user_groups USING btree (group_id);


--
-- Name: api_user_groups_user_id_a5ff39fa; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_user_groups_user_id_a5ff39fa ON public.api_user_groups USING btree (user_id);


--
-- Name: api_user_location_id; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_user_location_id ON public.api_user USING gist (location);


--
-- Name: api_user_user_permissions_permission_id_305b7fea; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_user_user_permissions_permission_id_305b7fea ON public.api_user_user_permissions USING btree (permission_id);


--
-- Name: api_user_user_permissions_user_id_f3945d65; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_user_user_permissions_user_id_f3945d65 ON public.api_user_user_permissions USING btree (user_id);


--
-- Name: api_user_username_cf4e88d2_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX api_user_username_cf4e88d2_like ON public.api_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_rest_passwordreset_resetpasswordtoken_key_f1b65873_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX django_rest_passwordreset_resetpasswordtoken_key_f1b65873_like ON public.django_rest_passwordreset_resetpasswordtoken USING btree (key varchar_pattern_ops);


--
-- Name: django_rest_passwordreset_resetpasswordtoken_user_id_e8015b11; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX django_rest_passwordreset_resetpasswordtoken_user_id_e8015b11 ON public.django_rest_passwordreset_resetpasswordtoken USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: sellbuy
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_activitylog api_activitylog_activity_by_id_45d244f1_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_activitylog
    ADD CONSTRAINT api_activitylog_activity_by_id_45d244f1_fk_api_user_id FOREIGN KEY (activity_by_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_activitylog api_activitylog_activity_for_id_7fd1f4cf_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_activitylog
    ADD CONSTRAINT api_activitylog_activity_for_id_7fd1f4cf_fk_api_user_id FOREIGN KEY (activity_for_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_activitylog api_activitylog_product_id_65838432_fk_api_product_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_activitylog
    ADD CONSTRAINT api_activitylog_product_id_65838432_fk_api_product_id FOREIGN KEY (product_id) REFERENCES public.api_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_bannerad api_bannerad_offer_id_3cffe422_fk_api_promotion_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_bannerad
    ADD CONSTRAINT api_bannerad_offer_id_3cffe422_fk_api_promotion_id FOREIGN KEY (offer_id) REFERENCES public.api_promotion(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_bannerad api_bannerad_product_id_4992e23f_fk_api_product_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_bannerad
    ADD CONSTRAINT api_bannerad_product_id_4992e23f_fk_api_product_id FOREIGN KEY (product_id) REFERENCES public.api_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_bannerad api_bannerad_user_id_d53a713d_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_bannerad
    ADD CONSTRAINT api_bannerad_user_id_d53a713d_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_brand api_brand_category_id_3d4eebce_fk_api_category_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_brand
    ADD CONSTRAINT api_brand_category_id_3d4eebce_fk_api_category_id FOREIGN KEY (category_id) REFERENCES public.api_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_buybadge api_buybadge_badges_id_943d606f_fk_api_badge_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_buybadge
    ADD CONSTRAINT api_buybadge_badges_id_943d606f_fk_api_badge_id FOREIGN KEY (badges_id) REFERENCES public.api_badge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_buybadge api_buybadge_user_id_6e1af99f_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_buybadge
    ADD CONSTRAINT api_buybadge_user_id_6e1af99f_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_category api_category_parent_id_714127a8_fk_api_category_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_category
    ADD CONSTRAINT api_category_parent_id_714127a8_fk_api_category_id FOREIGN KEY (parent_id) REFERENCES public.api_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_favouriteproduct api_favouriteproduct_product_id_cbaabfc5_fk_api_product_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_favouriteproduct
    ADD CONSTRAINT api_favouriteproduct_product_id_cbaabfc5_fk_api_product_id FOREIGN KEY (product_id) REFERENCES public.api_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_favouriteproduct api_favouriteproduct_user_id_22a7396f_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_favouriteproduct
    ADD CONSTRAINT api_favouriteproduct_user_id_22a7396f_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_generalactivitylog api_generalactivitylog_user_id_a3353710_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_generalactivitylog
    ADD CONSTRAINT api_generalactivitylog_user_id_a3353710_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_makeoffer api_makeoffer_product_id_8576775b_fk_api_product_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_makeoffer
    ADD CONSTRAINT api_makeoffer_product_id_8576775b_fk_api_product_id FOREIGN KEY (product_id) REFERENCES public.api_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_makeoffer api_makeoffer_user_id_3af5e0a9_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_makeoffer
    ADD CONSTRAINT api_makeoffer_user_id_3af5e0a9_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_myaddressbook api_myaddressbook_user_id_9883aaf9_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_myaddressbook
    ADD CONSTRAINT api_myaddressbook_user_id_9883aaf9_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_notification api_notification_receiver_id_4f55e63e_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_notification
    ADD CONSTRAINT api_notification_receiver_id_4f55e63e_fk_api_user_id FOREIGN KEY (receiver_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_notification api_notification_sender_id_48a3ca87_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_notification
    ADD CONSTRAINT api_notification_sender_id_48a3ca87_fk_api_user_id FOREIGN KEY (sender_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_order_products api_order_products_order_id_7a747d0c_fk_api_order_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_order_products
    ADD CONSTRAINT api_order_products_order_id_7a747d0c_fk_api_order_id FOREIGN KEY (order_id) REFERENCES public.api_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_order_products api_order_products_product_id_6b091569_fk_api_product_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_order_products
    ADD CONSTRAINT api_order_products_product_id_6b091569_fk_api_product_id FOREIGN KEY (product_id) REFERENCES public.api_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_order api_order_user_id_52781ff0_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_order
    ADD CONSTRAINT api_order_user_id_52781ff0_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_orderpayment api_orderpayment_order_id_b5e59eca_fk_api_order_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_orderpayment
    ADD CONSTRAINT api_orderpayment_order_id_b5e59eca_fk_api_order_id FOREIGN KEY (order_id) REFERENCES public.api_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_product api_product_brand_id_c4e9b7a1_fk_api_brand_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product
    ADD CONSTRAINT api_product_brand_id_c4e9b7a1_fk_api_brand_id FOREIGN KEY (brand_id) REFERENCES public.api_brand(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_product_categories api_product_categories_category_id_8dec49c0_fk_api_category_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product_categories
    ADD CONSTRAINT api_product_categories_category_id_8dec49c0_fk_api_category_id FOREIGN KEY (category_id) REFERENCES public.api_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_product_categories api_product_categories_product_id_50821535_fk_api_product_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product_categories
    ADD CONSTRAINT api_product_categories_product_id_50821535_fk_api_product_id FOREIGN KEY (product_id) REFERENCES public.api_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_product_images api_product_images_image_id_fb1bf3bc_fk_api_image_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product_images
    ADD CONSTRAINT api_product_images_image_id_fb1bf3bc_fk_api_image_id FOREIGN KEY (image_id) REFERENCES public.api_image(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_product_images api_product_images_product_id_41c2c81b_fk_api_product_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product_images
    ADD CONSTRAINT api_product_images_product_id_41c2c81b_fk_api_product_id FOREIGN KEY (product_id) REFERENCES public.api_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_product api_product_user_id_b5580e10_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_product
    ADD CONSTRAINT api_product_user_id_b5580e10_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_reportproduct api_reportproduct_product_id_08b988ef_fk_api_product_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_reportproduct
    ADD CONSTRAINT api_reportproduct_product_id_08b988ef_fk_api_product_id FOREIGN KEY (product_id) REFERENCES public.api_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_reportproduct api_reportproduct_user_id_bc1e8aa1_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_reportproduct
    ADD CONSTRAINT api_reportproduct_user_id_bc1e8aa1_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_reportreview api_reportreview_review_id_1eff7a94_fk_api_review_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_reportreview
    ADD CONSTRAINT api_reportreview_review_id_1eff7a94_fk_api_review_id FOREIGN KEY (review_id) REFERENCES public.api_review(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_reportreview api_reportreview_user_id_b8ef3988_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_reportreview
    ADD CONSTRAINT api_reportreview_user_id_b8ef3988_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_review api_review_product_id_78d61c8d_fk_api_product_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_review
    ADD CONSTRAINT api_review_product_id_78d61c8d_fk_api_product_id FOREIGN KEY (product_id) REFERENCES public.api_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_review api_review_user_id_8bf97ad4_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_review
    ADD CONSTRAINT api_review_user_id_8bf97ad4_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_room api_room_created_by_id_75c1a1cf_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_room
    ADD CONSTRAINT api_room_created_by_id_75c1a1cf_fk_api_user_id FOREIGN KEY (created_by_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_room api_room_joined_by_id_f6442997_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_room
    ADD CONSTRAINT api_room_joined_by_id_f6442997_fk_api_user_id FOREIGN KEY (joined_by_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_room api_room_product_id_4b3783e3_fk_api_product_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_room
    ADD CONSTRAINT api_room_product_id_4b3783e3_fk_api_product_id FOREIGN KEY (product_id) REFERENCES public.api_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_seller api_seller_user_id_0fe12d5b_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_seller
    ADD CONSTRAINT api_seller_user_id_0fe12d5b_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_categories api_user_categories_category_id_d1f58128_fk_api_category_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_categories
    ADD CONSTRAINT api_user_categories_category_id_d1f58128_fk_api_category_id FOREIGN KEY (category_id) REFERENCES public.api_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_categories api_user_categories_user_id_1e43d7bd_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_categories
    ADD CONSTRAINT api_user_categories_user_id_1e43d7bd_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_followers api_user_followers_from_user_id_d205fa97_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_followers
    ADD CONSTRAINT api_user_followers_from_user_id_d205fa97_fk_api_user_id FOREIGN KEY (from_user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_followers api_user_followers_to_user_id_3bfaac3e_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_followers
    ADD CONSTRAINT api_user_followers_to_user_id_3bfaac3e_fk_api_user_id FOREIGN KEY (to_user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_groups api_user_groups_group_id_3af85785_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_groups
    ADD CONSTRAINT api_user_groups_group_id_3af85785_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_groups api_user_groups_user_id_a5ff39fa_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_groups
    ADD CONSTRAINT api_user_groups_user_id_a5ff39fa_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_user_permissions api_user_user_permis_permission_id_305b7fea_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_user_permissions
    ADD CONSTRAINT api_user_user_permis_permission_id_305b7fea_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_user_user_permissions api_user_user_permissions_user_id_f3945d65_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.api_user_user_permissions
    ADD CONSTRAINT api_user_user_permissions_user_id_f3945d65_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_rest_passwordreset_resetpasswordtoken django_rest_password_user_id_e8015b11_fk_api_user_; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.django_rest_passwordreset_resetpasswordtoken
    ADD CONSTRAINT django_rest_password_user_id_e8015b11_fk_api_user_ FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_api_user_id; Type: FK CONSTRAINT; Schema: public; Owner: sellbuy
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_api_user_id FOREIGN KEY (user_id) REFERENCES public.api_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--


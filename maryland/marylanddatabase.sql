--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1 (Ubuntu 14.1-2.pgdg20.04+1)
-- Dumped by pg_dump version 14.1 (Ubuntu 14.1-2.pgdg20.04+1)

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: about_body; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.about_body (
    id integer NOT NULL,
    lang_name character varying(5) NOT NULL,
    title1 character varying(255),
    text1 text,
    title2 character varying(255),
    text2 text,
    button_text text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.about_body OWNER TO postgres;

--
-- Name: about_body_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.about_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.about_body_id_seq OWNER TO postgres;

--
-- Name: about_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.about_body_id_seq OWNED BY public.about_body.id;


--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id integer NOT NULL,
    lang_name character varying(5) NOT NULL,
    address character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying(100) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    role character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: contact_body; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contact_body (
    id integer NOT NULL,
    lang_name character varying(5) NOT NULL,
    title1 character varying(255) NOT NULL,
    text1 text NOT NULL,
    title2 character varying(255) NOT NULL,
    contact_name character varying(255) NOT NULL,
    contact_email character varying(255) NOT NULL,
    contact_subject character varying(255) NOT NULL,
    contact_message text NOT NULL,
    contact_button character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.contact_body OWNER TO postgres;

--
-- Name: contact_body_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contact_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_body_id_seq OWNER TO postgres;

--
-- Name: contact_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contact_body_id_seq OWNED BY public.contact_body.id;


--
-- Name: footer_titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.footer_titles (
    id integer NOT NULL,
    lang_name character varying(5) NOT NULL,
    title1 character varying(100) NOT NULL,
    title2 character varying(100) NOT NULL,
    title3 character varying(100) NOT NULL,
    title4 character varying(100) NOT NULL,
    title5 character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.footer_titles OWNER TO postgres;

--
-- Name: footer_titles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.footer_titles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.footer_titles_id_seq OWNER TO postgres;

--
-- Name: footer_titles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.footer_titles_id_seq OWNED BY public.footer_titles.id;


--
-- Name: home_body; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_body (
    id integer NOT NULL,
    lang_name character varying(5) NOT NULL,
    title1 character varying(200) NOT NULL,
    text1 text NOT NULL,
    statistica_title character varying(200) NOT NULL,
    title2 character varying(200) NOT NULL,
    text2 text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.home_body OWNER TO postgres;

--
-- Name: home_body_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_body_id_seq OWNER TO postgres;

--
-- Name: home_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_body_id_seq OWNED BY public.home_body.id;


--
-- Name: home_slider_translates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_slider_translates (
    id integer NOT NULL,
    lang_name character varying(5) NOT NULL,
    slider_id integer NOT NULL,
    title character varying(250) NOT NULL,
    text text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.home_slider_translates OWNER TO postgres;

--
-- Name: home_slider_translates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_slider_translates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_slider_translates_id_seq OWNER TO postgres;

--
-- Name: home_slider_translates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_slider_translates_id_seq OWNED BY public.home_slider_translates.id;


--
-- Name: home_sliders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.home_sliders (
    id integer NOT NULL,
    title character varying(255),
    text text,
    image_path character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.home_sliders OWNER TO postgres;

--
-- Name: home_sliders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.home_sliders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.home_sliders_id_seq OWNER TO postgres;

--
-- Name: home_sliders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.home_sliders_id_seq OWNED BY public.home_sliders.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id integer NOT NULL,
    image_path character varying(255) NOT NULL,
    role character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.languages (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    short_name character varying(10) NOT NULL,
    image_path character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.languages OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.languages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.languages_id_seq OWNER TO postgres;

--
-- Name: languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.languages_id_seq OWNED BY public.languages.id;


--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    id integer NOT NULL,
    lang_name character varying(5) NOT NULL,
    menu1 character varying(250) NOT NULL,
    menu2 character varying(250) NOT NULL,
    menu3 character varying(250) NOT NULL,
    menu4 character varying(250) NOT NULL,
    menu5 character varying(250) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menu_id_seq OWNER TO postgres;

--
-- Name: menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_id_seq OWNED BY public.menu.id;


--
-- Name: phones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phones (
    id integer NOT NULL,
    phone_number character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.phones OWNER TO postgres;

--
-- Name: phones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phones_id_seq OWNER TO postgres;

--
-- Name: phones_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.phones_id_seq OWNED BY public.phones.id;


--
-- Name: product_categorie_translates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_categorie_translates (
    id integer NOT NULL,
    lang_name character varying(5) NOT NULL,
    category_id integer NOT NULL,
    name character varying(250) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product_categorie_translates OWNER TO postgres;

--
-- Name: product_categorie_translates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_categorie_translates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categorie_translates_id_seq OWNER TO postgres;

--
-- Name: product_categorie_translates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_categorie_translates_id_seq OWNED BY public.product_categorie_translates.id;


--
-- Name: product_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_categories (
    id integer NOT NULL,
    name character varying(250) NOT NULL,
    image_path character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product_categories OWNER TO postgres;

--
-- Name: product_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_categories_id_seq OWNER TO postgres;

--
-- Name: product_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_categories_id_seq OWNED BY public.product_categories.id;


--
-- Name: product_translates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_translates (
    id integer NOT NULL,
    lang_name character varying(5) NOT NULL,
    product_id integer NOT NULL,
    title character varying(250) NOT NULL,
    text text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.product_translates OWNER TO postgres;

--
-- Name: product_translates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_translates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_translates_id_seq OWNER TO postgres;

--
-- Name: product_translates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_translates_id_seq OWNED BY public.product_translates.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    text text NOT NULL,
    image_path character varying(255) NOT NULL,
    category_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_header; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_header (
    id integer NOT NULL,
    lang_name character varying(5) NOT NULL,
    title character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.products_header OWNER TO postgres;

--
-- Name: products_header_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_header_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_header_id_seq OWNER TO postgres;

--
-- Name: products_header_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_header_id_seq OWNED BY public.products_header.id;


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: reports; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports (
    id integer NOT NULL,
    lang_name character varying(5) NOT NULL,
    report1 character varying(200) NOT NULL,
    report2 character varying(200) NOT NULL,
    report3 character varying(200) NOT NULL,
    report4 character varying(200) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.reports OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_id_seq OWNER TO postgres;

--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_id_seq OWNED BY public.reports.id;


--
-- Name: send_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.send_messages (
    id integer NOT NULL,
    name character varying(25) NOT NULL,
    email character varying(200) NOT NULL,
    title character varying(200) NOT NULL,
    message text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.send_messages OWNER TO postgres;

--
-- Name: send_messages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.send_messages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.send_messages_id_seq OWNER TO postgres;

--
-- Name: send_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.send_messages_id_seq OWNED BY public.send_messages.id;


--
-- Name: service_translates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_translates (
    id integer NOT NULL,
    lang_name character varying(5) NOT NULL,
    service_id integer NOT NULL,
    title character varying(250) NOT NULL,
    text text NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.service_translates OWNER TO postgres;

--
-- Name: service_translates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_translates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_translates_id_seq OWNER TO postgres;

--
-- Name: service_translates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_translates_id_seq OWNED BY public.service_translates.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.services (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    text text NOT NULL,
    image_path character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.services OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_id_seq OWNER TO postgres;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id integer NOT NULL,
    logo character varying(255) NOT NULL,
    logo_black character varying(255) NOT NULL,
    favicon character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    whatsapp character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO postgres;

--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- Name: statistica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statistica (
    id integer NOT NULL,
    title character varying(250) NOT NULL,
    amount integer NOT NULL,
    image_path character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.statistica OWNER TO postgres;

--
-- Name: statistica_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statistica_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statistica_id_seq OWNER TO postgres;

--
-- Name: statistica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statistica_id_seq OWNED BY public.statistica.id;


--
-- Name: statistica_translates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statistica_translates (
    id integer NOT NULL,
    lang_name character varying(5) NOT NULL,
    statistica_id integer NOT NULL,
    title character varying(250) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.statistica_translates OWNER TO postgres;

--
-- Name: statistica_translates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.statistica_translates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.statistica_translates_id_seq OWNER TO postgres;

--
-- Name: statistica_translates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.statistica_translates_id_seq OWNED BY public.statistica_translates.id;


--
-- Name: about_body id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_body ALTER COLUMN id SET DEFAULT nextval('public.about_body_id_seq'::regclass);


--
-- Name: address id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- Name: contact_body id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_body ALTER COLUMN id SET DEFAULT nextval('public.contact_body_id_seq'::regclass);


--
-- Name: footer_titles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_titles ALTER COLUMN id SET DEFAULT nextval('public.footer_titles_id_seq'::regclass);


--
-- Name: home_body id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_body ALTER COLUMN id SET DEFAULT nextval('public.home_body_id_seq'::regclass);


--
-- Name: home_slider_translates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_slider_translates ALTER COLUMN id SET DEFAULT nextval('public.home_slider_translates_id_seq'::regclass);


--
-- Name: home_sliders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_sliders ALTER COLUMN id SET DEFAULT nextval('public.home_sliders_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);


--
-- Name: languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages ALTER COLUMN id SET DEFAULT nextval('public.languages_id_seq'::regclass);


--
-- Name: menu id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu ALTER COLUMN id SET DEFAULT nextval('public.menu_id_seq'::regclass);


--
-- Name: phones id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones ALTER COLUMN id SET DEFAULT nextval('public.phones_id_seq'::regclass);


--
-- Name: product_categorie_translates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categorie_translates ALTER COLUMN id SET DEFAULT nextval('public.product_categorie_translates_id_seq'::regclass);


--
-- Name: product_categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories ALTER COLUMN id SET DEFAULT nextval('public.product_categories_id_seq'::regclass);


--
-- Name: product_translates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_translates ALTER COLUMN id SET DEFAULT nextval('public.product_translates_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: products_header id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_header ALTER COLUMN id SET DEFAULT nextval('public.products_header_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports ALTER COLUMN id SET DEFAULT nextval('public.reports_id_seq'::regclass);


--
-- Name: send_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.send_messages ALTER COLUMN id SET DEFAULT nextval('public.send_messages_id_seq'::regclass);


--
-- Name: service_translates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_translates ALTER COLUMN id SET DEFAULT nextval('public.service_translates_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- Name: statistica id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistica ALTER COLUMN id SET DEFAULT nextval('public.statistica_id_seq'::regclass);


--
-- Name: statistica_translates id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistica_translates ALTER COLUMN id SET DEFAULT nextval('public.statistica_translates_id_seq'::regclass);


--
-- Data for Name: about_body; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.about_body (id, lang_name, title1, text1, title2, text2, button_text, created_at) FROM stdin;
3	en	MARYLAND DIS TICARET LIMITED SIRKETI	<p><strong>MARYLAND DIS TIC LTD STI was established in 2020 with its experienced staff to operate in the fertilizer marketing sector and the freight transportation sector.</strong><br><strong>MARYLAND's primary strength is building and managing the complex supply chains critical to the fertilizer trade. Managed by a dedicated team of dynamic and experienced professionals, MARYLAND operates in more than 10 countries through its own offices, representatives and agents.</strong><br><strong>Maryland charters and uses vessels ranging from container ships, riverboats and supramax bulk carriers to meet the diverse logistics needs of a wide range of customers worldwide.</strong><br><strong>Basic Principles of Our Company:</strong><br><strong>- To keep customer satisfaction at the highest level and</strong><br><strong>- presenting new products,</strong><br><strong>- Always aiming for the best in the work we do,</strong><br><strong>- To follow the innovations in the sector and to be a pioneer in the sector,</strong><br><strong>- Giving importance to teamwork and R&amp;D and adapting to changing conditions,</strong><br><strong>- To be the most known, respected and reliable brand of the region by developing our trade with neighboring countries.</strong></p>	Reliable partnership	<p>We pay a great deal of attention to a professional level of our staff and therefore train them according to modern standards of qualification. Our experts will prepare all the necessary documents, and will make sure your load is at the point of destination at the time it should be. We are trusted by both major corporations and small companies. Each logistical project is created individually, according to characteristics of a task which should be done.</p>	Contact us	2022-02-01 20:11:49.498539
1	tr	MARYLAND DIŞ TICARET LIMITED ŞIRKETI	<ul><li><strong>MARYLAND DIŞ TIC LTD ŞTI gübre pazarlama sektöründe, ve yük taşımacılığı sektöründe faaliyet göstermek üzere tecrübeli kadrosuyla 2020 yılında kurulmuştur.&nbsp;</strong></li><li>MARYLAND'ın başlıca gücü, gübre ticaretinde kritik öneme sahip karmaşık tedarik zincirlerini kurmak ve yönetmektir. Dinamik ve deneyimli profesyonellerden oluşan özel bir ekip tarafından yönetilen MARYLAND, kendi ofisleri, temsilcileri ve acenteleri aracılığıyla 10'dan fazla ülkede faaliyet göstermektedir.</li><li>Maryland, dünya çapındaki geniş müşteri yelpazesinin çeşitli lojistik gereksinimlerini karşılamak için konteyner gemileri, nehir tipi gemiler ve supramax dökme yük gemileri arasında değişen gemiler kiralar ve kullanır.</li><li><strong>Firmamızın Temel İlkeleri:</strong></li><li>- Müşteri memnuniyetini üst seviyete tutmak ve</li><li>-Yeni ürünler sunmak,</li><li>- Yaptığımız işlerde daima en iyisini hedeflemek,</li><li>- Sektördeki yenilikleri takip edip sektörde öncü olmak,</li><li>- Ekip çalışmasına ve Ar-Ge'ye önem verip, değişmekte olan koşullara uyum sağlamak,</li><li>- Komşu ülkeler ile ticaretimizi geliştirerek bölgenin en bilinen, saygın ve güvenilir markası olmaktır.</li></ul>	Güvenilir ortaklik	<p>Çalışanlarımızın profesyonelliğine büyük önem veriyor, bu nedenle eğitimlerine yatırım yapıyoruz. Uzmanlarımız sizin için gerekli tüm belgeleri hazırlayacak, kargonuzun varış noktasına zamanında teslim edilmesini sağlayacaktır. Büyük şirketler ve küçük şirketler lojistik konusunda bize güveniyor. Her lojistik projesi, çözülmesi gereken özellikler ve görevler dikkate alınarak ayrı ayrı oluşturulur. <strong>Maryland</strong>, petrol ürünleri, kükürt, gübreler, çeşitli polimerler, karbamid ve potasyum tedarikçisidir.</p>	Iletişim	2022-02-01 20:08:39.490976
2	ru	 Мериландская внешняя торговая компания с огрониченной ответственностью	<p>MARYLAND DIS TIC LTD STI была основана в 2020 году со своим опытным персоналом для работы в секторе маркетинга удобрений и грузовых перевозок.<br>Основная сила MARYLAND - это построение сложных цепочек поставок, критически важных для торговли удобрениями, и управление ими. Управляемая преданной командой динамичных и опытных профессионалов, MARYLAND работает в более чем 10 странах через собственные офисы, представителей и агентов.<br>Мэриленд фрахтует и использует различные суда, от контейнеровозов до речных судов и балкеров Supramax, для удовлетворения разнообразных логистических потребностей широкого круга клиентов по всему миру.<br>Основные принципы нашей компании:<br>- Чтобы клиенты оставались довольными на высшем уровне и<br>- презентация новинок,<br>- Всегда стремясь к лучшему в своей работе,<br>- Чтобы следить за инновациями в секторе и быть пионером в этом секторе,<br>- Придание важности командной работе и НИОКР и адаптации к меняющимся условиям,<br>- Быть самым известным, уважаемым и надежным брендом в регионе, развивая нашу торговлю с соседними странами.</p>	Надёжное партнёрство	<p>Мы уделяем большое внимание профессионализму наших сотрудников, поэтому вкладываемся в их обучение. Наши специалисты подготовят для Вас все необходимые документы, проследят за тем, чтобы Ваш груз был оперативно доставлен в точку назначения.</p><p>Нам доверяют свою логистику крупные корпорации и небольшие компании. Каждый логистический проект создается индивидуально, с учетом особенностей и задач, которые необходимо решить.</p>	Связаться с нами	2022-02-01 20:11:29.805076
\.


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.address (id, lang_name, address, created_at) FROM stdin;
2	ru	Mahmutbey mahallesi, tasocagi yolu . No: 27 Express 24. Kat-7. Bagcilar Istanbul Turkey	2022-02-03 06:12:34.277174
3	tr	Mahmutbey mahallesi, tasocagi yolu . No: 27 Express 24. Kat-7. Bagcilar Istanbul Turkey	2022-02-03 06:12:45.473705
1	en	Mahmutbey mahallesi, tasocagi yolu . No: 27 Express 24. Kat-7. Bagcilar Istanbul Turkey	2022-02-03 06:12:13.620507
\.


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, username, email, password, role, created_at) FROM stdin;
b3002708-f483-470b-83a4-90aa3e31446f	admin1	admin1@gmail.com	$2a$07$5w.FJ7rCX.X0KljbL.kfTuiBqdKklC/O/nlSPPj/8R5D/s7EaH4Z6	superadmin	2022-01-28 13:23:40.978359
\.


--
-- Data for Name: contact_body; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contact_body (id, lang_name, title1, text1, title2, contact_name, contact_email, contact_subject, contact_message, contact_button, created_at) FROM stdin;
3	en	Get In Touch	<p>Contact us by any suitable for you ways</p>	Contact Details	your name	your email	subject	message	to send	2022-02-03 07:57:31.859338
1	tr	Konu	<p>Sizin için uygun herhangi bir yolla bize ulaşin</p>	Ileti	isminiz	 Email	Bağlanalım	gönder	Temasta olmak	2022-02-03 07:52:31.917602
2	ru	Тема	<p>Свяжитесь с нами любым удобным для вас способом</p>	Ваше сообщение	Имя	Электронная почта	 Контактная информация	Отправить	Будьте на связи	2022-02-03 07:54:32.08943
\.


--
-- Data for Name: footer_titles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.footer_titles (id, lang_name, title1, title2, title3, title4, title5, created_at) FROM stdin;
7	en	Our address	CONTACT US	QUICK LINKS	COPYRIGHT 2021. ALL RIGHTS RESERVED.	Design And Developed by!	2022-02-02 15:57:21.68962
6	ru	Наш адрес	Связаться с нами	Быстрые ссылки	Copyright @ 2021. All rights reserved	Design And Developed by.	2022-02-02 15:55:55.805201
1	tr	Bizim adresimiz 	Bize ulasin	Hizli Linkler	COPYRIGHT @ 2021. ALL RIGHTS RESERVED.	Design And Developed by	2022-02-02 15:50:47.547091
\.


--
-- Data for Name: home_body; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_body (id, lang_name, title1, text1, statistica_title, title2, text2, created_at) FROM stdin;
1	tr	Hizmetlerimiz	<p>Hizmetlerimiz ve hizmetimiz bir çözümdür<br>müşterinin sorunları ortaya çıkmadan önce</p>	 Yıllık satış	Ürünler	<p>Tüm en yenilikçi hizmetler ve teklifler</p>	2022-02-17 22:49:54.729367
2	ru	Наши сервисы	<p>Наши услуги и сервис - это решение проблемы клиента до её проявления</p>	Годовой объем продаж	Продукты	<p>Все самые инновационные услуги и предложения</p>	2022-02-18 17:50:56.777895
4	en	Our services	<p>Our services and service is a solution client's problems before it occurs</p>	Annual sales	Products	<p>All the most innovative services and offers</p>	2022-03-04 16:16:46.82149
\.


--
-- Data for Name: home_slider_translates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_slider_translates (id, lang_name, slider_id, title, text, created_at) FROM stdin;
73	tr	73	GÜBRELER	<p>Tarımsal üretimde <strong>bol ve kaliteli ürün elde edebilmek</strong> için gerekli girdiler arasında&nbsp;<strong> gübreler </strong>önemli bir yer tutar. İlaç, tohum, gübre, makine vb. gibi zirai girdilerin etkileri dikkate alındığında; <strong>gübrenin mahsul verimini tek başına %50-70’e kadar artırdığı</strong> tespit edilmiştir.</p>	2022-02-11 15:56:43.341628
74	ru	73	Удобрения	<p>Наши удобрения, содержащие преимущественно азот, фосфор и калий, обеспечивают легкое равномерное распределение благодаря своей гранулированной форме. Наши продукты, в их четких областях определения, используются в таких продуктах, как зерновые, бобовые, овощи, фрукты, на промышленных предприятиях в качестве стартовых и подкормочных удобрений.</p>	2022-02-11 15:56:43.343258
75	en	73	Fertilizers	<p>Our &nbsp;fertilizers that predominantly contain nitrogen, phosphorus and potassium provide easy spreading uniform distribution due to their granular forms. Our products, in their clear definition fields, are used in products such as cereals, legumes, vegetables, fruits, industrial plants as starter and top dressing fertilizer.</p>	2022-02-11 15:56:43.34403
79	tr	75	Kükürt	<p>Dünyada 55 milyon ton ticaret hacmine sahip bir endüstriyel hammadde olan kükürt, başlıca sülfürik asit, gübre, deterjan (LABSA) üretiminde kullanılmak, üzere kağıt, gıda sanayii, tarım, oto lastikleri, patlayıcı, kimya ve boya, atık su arıtımı gibi sektörlerde de kendine geniş kullanım alanı bulmaktadır.</p>	2022-02-11 16:02:12.233341
80	ru	75	Сера	<p>Объемы продаж серы в мире составляют около 55 миллионов тонн в год, сера используется при производстве серной кислоты, удобрений, моющих средств (алкилбензолсульфокислоты), бумаги, пищевых продуктов, в сельском хозяйстве, в производстве автомобильной резины, взрывчатых веществ, красок, очистке воды и других областях.&nbsp;</p>	2022-02-11 16:02:12.235206
81	en	75	Sulphur	<p>Sulphur, which is an industrial raw material with a trade volume of 55 million tons in the world, is mainly used in the production of sulfuric acid, fertilizer, detergent (LABSA), and in sectors such as paper, food industry, agriculture, auto tires, explosives, chemistry and paint, waste water treatment. finds wide use.</p><p>&nbsp;</p>	2022-02-11 16:02:12.236001
159	en	101	STRENGTH TO THE SOIL, EFFICIENCY TO THE PRODUCT	.	2022-02-18 15:19:22.637872
157	tr	101	TOPRAĞA KÜVVET, ÜRÜNE BEREKET	.	2022-02-18 15:19:22.631349
158	ru	101	ПРОЧНОСТЬ ДЛЯ ПОЧВЫ, ЭФФЕКТИВНОСТЬ ПРОДУКТА	.	2022-02-18 15:19:22.636593
\.


--
-- Data for Name: home_sliders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.home_sliders (id, title, text, image_path, created_at) FROM stdin;
101	TOPRAĞA KÜVVET, ÜRÜNE BEREKET	\N	/uploads/home_slider_images/1645359073738.jpg	2022-02-18 15:19:22.619538
73	GÜBRELER	<p>Tarımsal üretimde <strong>bol ve kaliteli ürün elde edebilmek</strong> için gerekli girdiler arasında&nbsp;<strong> gübreler </strong>önemli bir yer tutar. İlaç, tohum, gübre, makine vb. gibi zirai girdilerin etkileri dikkate alındığında; <strong>gübrenin mahsul verimini tek başına %50-70’e kadar artırdığı</strong> tespit edilmiştir.</p>	/uploads/home_slider_images/1644577003286.jpg	2022-02-11 15:56:43.337721
75	Kükürt	<p>Dünyada 55 milyon ton ticaret hacmine sahip bir endüstriyel hammadde olan kükürt, başlıca sülfürik asit, gübre, deterjan (LABSA) üretiminde kullanılmak, üzere kağıt, gıda sanayii, tarım, oto lastikleri, patlayıcı, kimya ve boya, atık su arıtımı gibi sektörlerde de kendine geniş kullanım alanı bulmaktadır.</p>	/uploads/home_slider_images/1644577332177.jpg	2022-02-11 16:02:12.225485
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, image_path, role, created_at) FROM stdin;
29	/uploads/partners/1645359606087.jpg	partner	2022-02-18 17:51:28.226162
17	/uploads/partners/1645359695555.jpg	partner	2022-02-14 17:23:55.414981
1	/uploads/partners/1645359705896.jpg	partner	2022-02-14 16:53:56.783191
30	/uploads/partners/1645359715139.jpg	partner	2022-02-20 17:21:55.142579
31	/uploads/partners/1645359722453.jpg	partner	2022-02-20 17:22:02.458225
32	/uploads/partners/1645359729270.jpg	partner	2022-02-20 17:22:09.273574
33	/uploads/partners/1645359733544.jpg	partner	2022-02-20 17:22:13.547473
18	/uploads/about_main_images/1645360097842.jpg	about_header	2022-02-14 19:58:51.726744
19	/uploads/about_main_images/1645360097853.jpg	about_body	2022-02-14 19:59:09.854676
27	/uploads/products_header_images/1645361475779.jpg	products_header	2022-02-16 16:58:38.614029
28	/uploads/contact_image/1645362529069.jpg	contact_header	2022-02-16 22:13:16.988744
49	/uploads/about_sliders/1646307181452.jpg	about_slider	2022-03-03 16:33:01.498193
50	/uploads/about_sliders/1646307207040.jpg	about_slider	2022-03-03 16:33:27.081365
51	/uploads/about_sliders/1646307231762.jpg	about_slider	2022-03-03 16:33:51.765441
54	/uploads/about_sliders/1646307318557.jpg	about_slider	2022-03-03 16:35:18.59433
55	/uploads/about_sliders/1646307344072.jpg	about_slider	2022-03-03 16:35:44.117241
56	/uploads/about_sliders/1646307395345.jpg	about_slider	2022-03-03 16:36:35.397444
57	/uploads/about_sliders/1646307426888.jpg	about_slider	2022-03-03 16:37:06.940829
58	/uploads/about_sliders/1646307463933.jpg	about_slider	2022-03-03 16:37:43.97708
59	/uploads/about_sliders/1646307477466.jpg	about_slider	2022-03-03 16:37:57.502817
60	/uploads/about_sliders/1646307507375.jpg	about_slider	2022-03-03 16:38:27.433028
61	/uploads/about_sliders/1646307531849.jpg	about_slider	2022-03-03 16:38:51.887214
62	/uploads/about_sliders/1646307550580.jpg	about_slider	2022-03-03 16:39:10.642665
63	/uploads/about_sliders/1646307603626.jpg	about_slider	2022-03-03 16:40:03.678056
64	/uploads/about_sliders/1646307630053.jpg	about_slider	2022-03-03 16:40:30.099953
65	/uploads/about_sliders/1646307664888.jpg	about_slider	2022-03-03 16:41:04.922409
66	/uploads/about_sliders/1646307695488.jpg	about_slider	2022-03-03 16:41:35.520314
67	/uploads/about_sliders/1646307712499.jpg	about_slider	2022-03-03 16:41:52.546348
68	/uploads/about_sliders/1646307742690.jpg	about_slider	2022-03-03 16:42:22.725354
69	/uploads/about_sliders/1646307775567.jpg	about_slider	2022-03-03 16:42:55.604321
70	/uploads/about_sliders/1646307792773.jpg	about_slider	2022-03-03 16:43:12.812685
71	/uploads/about_sliders/1646307957798.jpg	about_slider	2022-03-03 16:45:57.838542
72	/uploads/about_sliders/1646307986611.jpg	about_slider	2022-03-03 16:46:26.648136
73	/uploads/about_sliders/1646308030853.jpg	about_slider	2022-03-03 16:47:10.891101
74	/uploads/about_sliders/1646308056165.jpg	about_slider	2022-03-03 16:47:36.206146
75	/uploads/about_sliders/1646308119936.jpg	about_slider	2022-03-03 16:48:39.984058
76	/uploads/about_sliders/1646308142294.jpg	about_slider	2022-03-03 16:49:02.345706
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.languages (id, name, short_name, image_path, created_at) FROM stdin;
8	rusca	ru	/uploads/languages/RU_Flag.svg	2022-02-12 19:07:47.137879
9	inlisce	en	/uploads/languages/EN_Flag.svg	2022-02-12 19:10:04.572523
7	Turkce	tr	/uploads/languages/TR_Flag.svg	2022-02-12 19:07:03.203048
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (id, lang_name, menu1, menu2, menu3, menu4, menu5, created_at) FROM stdin;
3	en	Home	About us	Contact	Products	Services	2022-02-01 19:38:56.833
2	ru	Глaвнaя	O нac	Kонтaкт	Пpoдyкты	Ycлyги	2022-02-01 19:38:56.833
1	tr	 Anasayfa	Hakkimizda	Iletişim	Ürünler	Hizmetler	2022-02-01 19:38:56.833
\.


--
-- Data for Name: phones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phones (id, phone_number, created_at) FROM stdin;
1	+90 (541) 797 29 17	2022-02-03 06:16:14.535201
\.


--
-- Data for Name: product_categorie_translates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_categorie_translates (id, lang_name, category_id, name, created_at) FROM stdin;
23	tr	21	KÜKÜRT	2022-02-15 21:13:40.048683
24	ru	21	СЕРА	2022-02-15 21:13:40.051626
25	en	21	SULPHUR	2022-02-15 21:13:40.053355
28	tr	23	GÜBRELER	2022-03-04 17:05:14.002609
29	ru	23	УДОБРЕНИЯ	2022-03-04 17:05:14.005709
30	en	23	FERTILIZERS	2022-03-04 17:05:14.006964
\.


--
-- Data for Name: product_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_categories (id, name, image_path, created_at) FROM stdin;
23	GÜBRELER	/uploads/product_categories_images/1646395513987.jpg	2022-03-04 17:05:13.997636
21	KÜKÜRT	/uploads/product_categories_images/1645360686289.jpg	2022-02-15 21:13:40.040887
\.


--
-- Data for Name: product_translates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_translates (id, lang_name, product_id, title, text, created_at) FROM stdin;
22	ru	9	ГРАНУЛИРИВОННАЯ СЕРА	<p>Сера - один из богатых на Земле элементов с химическим символом S. Он известен своим ярким желтым цветом. В промышленности он широко используется в производстве серной кислоты, сельскохозяйственной, медицинской, пищевой, бумажной и резиновой промышленности. Ранее его добывали из вулканических зон на поверхности земли или в процессе бурения с использованием горячего пара. Однако в последнее время его восстанавливают в процессе нефтепереработки. С помощью технологий нефтеперерабатывающие заводы практически до нуля сокращают выбросы двуокиси серы, которая сильно загрязняет атмосферу и вызывает кислотные дожди.</p><p>MARYLAND DIŞ TICARET LIMITED IRKETI - один из самых успешных трейдеров серы во всем мире. Наш ориентированный на клиента подход помогает нам разрабатывать индивидуальные решения с учетом разнообразных требований клиентов. За годы работы мы накопили обширные знания и опыт поиска и продажи серы в разных регионах и на разных континентах. В основном мы торгуем формованной серой (гранулированной / приллированной / Пеллеты), кусковой дробленой и порошковой серой. Наш богатый опыт в поиске поставщиков и четкий контроль над логистикой помогают нам организовать бесперебойные поставки.</p>	2022-02-16 16:30:04.736056
28	tr	11	KOMPOZE GÜBRELER  (NPK)	<p>Kompoze gübreler birden fazla bitki besin maddesini bir arada bulundurmaktadır. Bu gübrelerin içerisindeki bitki besin maddeleri azot, fosfor, potasyumdur. Bunlar sırasına göre yüzde olarak söylenmektedir. Örneğin 20-20-20 terkibindeki bir kompoze gübrenin 100 kilogramında 20 kilo saf azot, 20 kilo fosfor, 20 kilo da potasyum oksit var demektir. Kompoze gübrelerin çeşitli besin maddesini içerdiği için daha az emek ve zaman harcayarak çiftçiye ekonomi ve kolaylık sağlar.</p><p>Azot (N), bitkinin büyümesine yardımcı olan ana besin maddesidir.</p><p>Fosfor (P), bitki gelişiminin ilk aşamalarında olduğu kadar olgunlaşma sırasında da sorumlu olan çok önemli bir besindir. Bitkinin kök sisteminin gelişimine yardımcı olur ve bitkinin strese karşı direncini artırır.</p><p>Potasyum (K) bu besin, mahsullerin dengeli gelişimi için bitkinin su ve besin emilimini iyileştirir. Çoğunlukla, (K) meyvelerin protein içeriğini, tat ve görünür niteliklerini iyileştirir.</p>	2022-02-20 17:47:51.080365
29	ru	11	КОМБИНИРОВАННЫЕ УДОБРЕНИЯ (NPK)	<p>Комбинированные удобрения содержат более одного питательного вещества. Эти питательные вещества в этом удобрении - азот, фосфор и калий. Они указаны в процентах последовательно. Например; 20-20-20 составных 100 кг удобрений включает 20 кг чистого азота, 20 кг чистого фосфора и 20 кг чистого оксида калия. Поскольку в состав этих сложных удобрений входят различные питательные вещества, они обеспечивают экономичное использование и удобство для фермеров, поскольку растения требуют меньше усилий и времени.</p><p>Азот (N) - это основное питательное вещество, которое помогает растению расти.</p><p>Фосфор (P) - очень важное питательное вещество, ответственное за начальные фазы развития растений, а также во время созревания. Помогает в развитии корневой системы растений и повышает устойчивость растений к стрессам.</p><p>Калий (K) - это питательное вещество, улучшающее усвоение растениями воды и питательных веществ, что способствует сбалансированному развитию сельскохозяйственных культур. В основном (K) улучшает содержание белков, вкусовые качества и визуальные качества фруктов.</p><p>&nbsp;</p>	2022-02-20 17:47:51.081236
30	en	11	COMPOUND FERTILIZERS  (NPK)	<p>Compound fertilizers contain more than one nutrient. These nutrients in this fertilizer are nitrogen, phosphor and potassium. These are stated in percentages successively. For instance; 20-20-20 composed 100 kg fertilizer includes 20 kg pure nitrogen, 20 kg pure phosphor and 20 kg pure potassium oxide. As these compound fertilizers include various nutrients, it offers economical use and ease to the farmers, as the plants will require less effort and time.</p><p><strong>Nitrogen (N)&nbsp;</strong>is the main nutrient that helps the plant to grow.</p><p><strong>Phosphorus (P)&nbsp;</strong>&nbsp;is a very important nutrient responsible during the initial phases of the plant development as well as during ripening. It helps during the development of the plant’s root system and improves the plant’s resistance to stress</p><p><strong>Potassium (K)&nbsp;</strong>&nbsp;this nutrient ameliorates the plant’s water and nutrient absorption, for a balanced development of the crops. Mostly, (K) improves the content of proteins, tasting and visible qualities of the fruits</p>	2022-02-20 17:47:51.082005
24	tr	9	GRANÜLAR KÜKÜRT	<p>Kükürt, kimyasal sembolü S olan toprakta bol miktarda bulunan elementlerden biridir. Parlak sarı rengi ile bilinir. Endüstride, sülfürik asit üretimi, tarım, tıp, gıda, kağıt ve kauçuk endüstrisinde yaygın olarak kullanılmaktadır. Daha önce, dünya yüzeyindeki volkanik bölgelerden veya sıcak hava buharı kullanılarak yapılan bir delme işleminden elde ediliyordu. Ancak son zamanlarda petrol rafinerisi sürecinden geri kazanılmaktadır. Rafineriler, teknolojinin yardımıyla atmosferi çok kirleten ve asit yağmurlarına neden olan Kükürt Dioksit emisyonunu neredeyse sıfıra indiriyor.</p><p>MARYLAND DIŞ TICARET LIMITED ŞIRKETI, dünyanın en üretken Kükürt tüccarlarından biridir. Müşteri odaklı yaklaşımımız, çeşitli müşteri gereksinimlerine özel çözümler tasarlamamıza yardımcı olur. Yıllar boyunca, coğrafyalar ve kıtalar genelinde kükürt tedarik etme ve satma konusunda kapsamlı bilgi ve deneyim edindik. Biz esas olarak Şekillendirilmiş Kükürt (Granüler/ Prilled/ Peletler), Ezilmiş Parçalar ve Toz Kükürt ticareti yapıyoruz. Lojistik üzerindeki keskin kontrolle desteklenen kaynak bulma konusundaki zengin deneyimimiz, sorunsuz teslimatlar düzenlememize yardımcı oluyor.</p>	2022-02-16 16:30:04.741216
23	en	9	GRANULAR SULPHUR	<p>Sulphur is one of the earth abundant elements with the chemical symbol S. It is known with its yellow bright color. In industry it is widely used in sulphuric acid production, agricultural, medical, food, paper&nbsp;and rubber industry. Previously it is sourced from volcanic zones on earth surface or a drilling process using hot air steam. However, recently it is recovered from oil refinery process. With the help of technology, refineries reduces Sulphur Dioxide emission, which highly pollutes atmosphere and cause acid rains, almost zero.</p><p>MARYLAND DIŞ TICARET LIMITED ŞIRKETI &nbsp;is one of the most prolific Sulphur traders globally. Our customer centric<i><strong>&nbsp;</strong></i>approach helps us design tailored solutions to the varied customer’s requirements. Over the years, we have gathered extensive knowledge and experience of&nbsp;sourcing &amp; selling sulphur across geographies and continents. We mainly trade in Formed Sulphur (Granular/ Prilled<i><strong>/</strong></i> Pellets), Crushed Lumps &amp; Powder Sulphur. Our rich experience in sourcing, aided by sharp control over logistics helps us organize smooth deliveries.</p>	2022-02-16 16:30:04.738856
36	tr	13	LUMP KÜKÜRT	<p>Müşterilerimizin çoğunluğunun bizimle uzun vadeli ilişkileri olduğu, çeşitlendirilmiş bir müşteri tabanına sahibiz. Hindistan, Çin, Güney Doğu Asya, Ürdün, Latam Afrika ve Avustralya'dan müşterilerimiz on yılı aşkın süredir bizimle birlikte. Kaynak sağlamak için Orta Doğu ve diğer coğrafyalardaki üreticilerle etkili bir şekilde stratejik ortaklıklar kurduk.</p><p>MKM TARIM İTHALATIHRACAT SANAYİ VE TİCARET LİMİTED, müşterilerimiz için verimli ve Maliyet etkin özelleştirilmiş çözümler ile birlikte katma değerli hizmetler sunan benzersiz ticaret şirketi olarak kendini tanıtmaktan onur duyar. Çeşitli kargo boyutlarını işleme ve Kükürt'ü garanti edilen süre içinde taşıma yeteneğine sahibiz. Biz, kükürt tedarik ettiğimiz ve karşılığında Gübre satın aldığımız iki yönlü ticarette aktif oyuncularız. Odak noktamız, kalıcı ilişkiler kurmak ve küresel olarak müşterilere hızlı tedarik sağlamaktır.</p>	2022-02-20 17:50:29.214743
35	en	13	POTASSIUM CHLORIDE	<p>We have a diversified customer base, with majority of customers having long term relationships with us.&nbsp;Our customers from India, China, South East Asia, Jordan, Latam&nbsp;Africa and Australia have been with us for more than a decade. For sourcing we have effectively built strategic partnerships with manufacturers in the Middle East &amp; other geographies.</p><p>MKM TARIM ITHALATIHRACAT SANAYI VE TICARET LIMITED is honored to introduce itself as unique trading company that offers value added services along with efficient &amp; Cost effective customized solutions for our customers. We have the ability to handle varied cargo sizes and transport Sulphur within the assured time. We are active players in two way trade wherein we supply sulphur and purchase Fertilizers in return. Our focus is to build enduring relationships and provide prompt supply to customers globally.</p>	2022-02-20 17:50:29.213996
34	ru	13	КОМОВАЯ СЕРА	<p>У нас есть диверсифицированная клиентская база, и большинство клиентов имеют с нами долгосрочные отношения. Наши клиенты из Индии, Китая, Юго-Восточной Азии, Иордании, Латинской Америки и Австралии работают с нами более десяти лет. В области поиска поставщиков мы эффективно установили стратегические партнерские отношения с производителями на Ближнем Востоке и в других регионах.</p><p>MKM TARIM ITHALATIHRACAT SANAYI VE TICARET LIMITED имеет честь представить себя как уникальная торговая компания, которая предлагает услуги с добавленной стоимостью наряду с эффективными и экономичными индивидуальными решениями для наших клиентов. У нас есть возможность обрабатывать грузы различных размеров и транспортировать серу в установленные сроки. Мы являемся активными участниками двусторонней торговли, когда мы поставляем серу и покупаем удобрения взамен. Наша цель - построить прочные отношения и обеспечить своевременные поставки клиентам по всему миру.</p>	2022-02-20 17:50:29.213093
37	tr	14	ÜRE	<p>Üre, en konsantre Azotlu gübredir. Toprakta önce amonyuma daha sonra nitrat formlarına dönüşen amid formunda Azot içerir. Suda kolayca çözünür.&nbsp;</p><p>Aynı zamanda, genetik materyal DNA ve RNA da dahil olmak üzere bitki ve hayvan proteinlerinin temel unsurudur ve hızlı bitki büyümesi dönemlerinde önemlidir.</p><p>• Birim alandan daha <strong>yüksek verim</strong> alınır,<br>• <strong>Ürünlerin kalitesi</strong> yükseltilir,<br>• Toprakta <strong>verimliliğin</strong> sürekliliği sağlanır ve <strong>kazanç</strong> sürekli hale getirilir,<br>• Bitkilere <strong>daha iyi bir gelişme ortamı</strong> oluşturulur,<br>• Topraktan çeşitli şekillerde uzaklaşan besinler toprağa tekrar kazandırılır.</p><p>Yüksek verimli ve kaliteli ürün yetiştirebilmek için bitki ve toprağın ihtiyacı olan gübrenin doğru seçilmesinin yanı sıra gübrelemede <strong>miktar</strong>, <strong>zaman</strong> ve <strong>uygulama</strong> <strong>şekline</strong> de dikkat edilmelidir. Dengeli ve düzenli bir gübreleme için mutlaka <strong>toprak ve yaprak analizleri</strong> yapılmalıdır.</p>	2022-03-04 18:18:54.407529
38	ru	14	КАРБАМИД	<p>Карбамид является наиболее концентрированным азотным удобрением. Он содержит азот в форме амида, который в почве превращается сначала в аммоний, а затем в нитратную форму. Он легко растворим в воде.&nbsp;</p><p>Он также является основным элементом белков растений и животных, включая генетический материал ДНК и РНК, и важен в периоды быстрого роста растений.</p><p>Помимо однокомпонентных удобрений, мы также производим комплексные удобрения, специально предназначенные для таких растений, как кукуруза, злаки, сахарная свекла, рис, хлопок, чай и т. Д., Которые содержат питательные вещества для двух или более растений. Чтобы вырастить высокопродуктивный и качественный продукт, необходимо учитывать количество, время и метод внесения удобрений, а также правильный выбор удобрения, необходимого для растения и почвы. Для сбалансированного внесения удобрений обязательно следует провести анализ почвы и листьев.</p>	2022-03-04 18:18:54.409241
39	en	14	UREA	<p>Urea is the most concentrated Nitrogen fertilizer. It contains Nitrogen in amide form, which in soil converts first into ammonium and then into nitrate forms.&nbsp; It is easily soluble in water.&nbsp;</p><p>It is also the basic element of plant and animal proteins, including the genetic material DNA and RNA, and is important in periods of rapid plant growth.&nbsp;</p><p>Beside single fertilizers, we also produce composed fertilizers specific to plants such as corn, cereals, sugar beet, paddy, cotton, tea, etc. that contains two or more plant nutrition. In order to grow highly productive and quality product, amount, timing and application method in fertilizing should be considered as well as correct selection of the fertilizer which the plant and the soil needs. For balanced fertilization, soil and leave analysis should definitly be done.</p>	2022-03-04 18:18:54.410115
40	tr	15	POTASYUM KLORÜR	<p>Potasyum Klorür, kimyasal bir bileşik olan potasyum klorür, potasyum ve klor elementlerinin birleşiminden oluşmaktadır. Kimya da sembolü KCl olarak gösterilmektedir. Beyaz kristallerden oluşan bu elementin saf hali kokusuzdur. Bir tuz olan potasyum klorür suda yüksek çözünürlüğe sahiptir. Potasyum klorür insan vücudu için önemli bir elementtir. Tüm vücut sıvılarının pH sının uygun dağılımını ve sağlıklı sinir sistemi, kas fonksiyonunu sağlamaktadır. Düşük klorür seviyesi vücut sıvılarının bazikleşmesi ve idrarda potasyum azlığına sebep olmaktadır.&nbsp;<br>Potasyum Klorür, vücutta potasyumun atılması veya normal şartlarda potasyum alınmaması durumunda ortaya çıkan potasyum eksikliğinde dışarıdan alınmaktadır. Bu şekilde piyasa da ampul formunda potasyum klorür ilaçlar bulunmaktadır. Potasyum kaybına sebep bazı hastalıklar ishal, kusma, gastrointestinal fistüller, primer ve sekonder hiperaldosteronizm, kronik protein yıkımı gibi hastalıklardır.&nbsp;</p>	2022-03-04 18:20:17.786673
41	ru	15	КАЛИЙ ХЛОРИСТЫЙ	<h4>Используется для сельского хозяйства и розничной торговли как удобрение, а также для промышленности при производстве химических продуктов.</h4><p>Хлорид калия - это химическое соединение, состоящее из хлорида калия, комбинации элементов калия и хлора. В химии его символ обозначается как KCl. В чистом виде этот элемент, состоящий из белых кристаллов, не имеет запаха. Хлорид калия, соль, хорошо растворяется в воде. Хлорид калия - незаменимый элемент для человеческого организма. Правильное распределение pH во всех жидкостях организма и здоровая нервная система обеспечивают работу мышц. Низкий уровень хлоридов вызывает ощелачивание жидкостей организма и дефицит калия в моче.<br>Хлорид калия берется извне при дефиците калия, который возникает, когда калий выбрасывается из организма или калий не поступает в нормальных условиях. Таким образом, на рынке есть препараты хлорида калия в ампульной форме. Некоторые заболевания, вызывающие потерю калия, - это диарея, рвота, желудочно-кишечные свищи, первичный и вторичный гиперальдостеронизм и хроническая деградация белков.</p><h4>&nbsp;</h4>	2022-03-04 18:20:17.788132
42	en	15	POTASSIUM CHLORIDE	<h4>It is used for agriculture and by retail trade as fertilizer and also in manufacture of chemical products.</h4><p>Potassium Chloride is a chemical compound consisting of potassium chloride, a combination of the elements potassium and chlorine. In chemistry, its symbol is shown as KCl. The pure state of this element, which consists of white crystals, is odorless. Potassium chloride, a salt, has a high solubility in water. Potassium chloride is an essential element for the human body. Proper distribution of the pH of all body fluids and a healthy nervous system ensure muscle function. Low chloride levels cause alkalinization of body fluids and potassium deficiency in the urine.<br>Potassium Chloride is taken from outside in potassium deficiency that occurs when potassium is thrown out of the body or potassium is not taken under normal conditions. In this way, there are potassium chloride drugs in ampoule form on the market. Some diseases that cause potassium loss are diarrhea, vomiting, gastrointestinal fistulas, primary and secondary hyperaldosteronism, and chronic protein degradation.&nbsp;</p>	2022-03-04 18:20:17.789111
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, title, text, image_path, category_id, created_at) FROM stdin;
9	GRANÜLAR KÜKÜRT	<p>Kükürt, kimyasal sembolü S olan toprakta bol miktarda bulunan elementlerden biridir. Parlak sarı rengi ile bilinir. Endüstride, sülfürik asit üretimi, tarım, tıp, gıda, kağıt ve kauçuk endüstrisinde yaygın olarak kullanılmaktadır. Daha önce, dünya yüzeyindeki volkanik bölgelerden veya sıcak hava buharı kullanılarak yapılan bir delme işleminden elde ediliyordu. Ancak son zamanlarda petrol rafinerisi sürecinden geri kazanılmaktadır. Rafineriler, teknolojinin yardımıyla atmosferi çok kirleten ve asit yağmurlarına neden olan Kükürt Dioksit emisyonunu neredeyse sıfıra indiriyor.</p><p>MARYLAND DIŞ TICARET LIMITED ŞIRKETI, dünyanın en üretken Kükürt tüccarlarından biridir. Müşteri odaklı yaklaşımımız, çeşitli müşteri gereksinimlerine özel çözümler tasarlamamıza yardımcı olur. Yıllar boyunca, coğrafyalar ve kıtalar genelinde kükürt tedarik etme ve satma konusunda kapsamlı bilgi ve deneyim edindik. Biz esas olarak Şekillendirilmiş Kükürt (Granüler/ Prilled/ Peletler), Ezilmiş Parçalar ve Toz Kükürt ticareti yapıyoruz. Lojistik üzerindeki keskin kontrolle desteklenen kaynak bulma konusundaki zengin deneyimimiz, sorunsuz teslimatlar düzenlememize yardımcı oluyor.</p>	/uploads/product_images/1645360826510.jpg	21	2022-02-16 16:30:04.730824
11	KOMPOZE GÜBRELER  (NPK)	<p>Kompoze gübreler birden fazla bitki besin maddesini bir arada bulundurmaktadır. Bu gübrelerin içerisindeki bitki besin maddeleri azot, fosfor, potasyumdur. Bunlar sırasına göre yüzde olarak söylenmektedir. Örneğin 20-20-20 terkibindeki bir kompoze gübrenin 100 kilogramında 20 kilo saf azot, 20 kilo fosfor, 20 kilo da potasyum oksit var demektir. Kompoze gübrelerin çeşitli besin maddesini içerdiği için daha az emek ve zaman harcayarak çiftçiye ekonomi ve kolaylık sağlar.</p><p>Azot (N), bitkinin büyümesine yardımcı olan ana besin maddesidir.</p><p>Fosfor (P), bitki gelişiminin ilk aşamalarında olduğu kadar olgunlaşma sırasında da sorumlu olan çok önemli bir besindir. Bitkinin kök sisteminin gelişimine yardımcı olur ve bitkinin strese karşı direncini artırır.</p><p>Potasyum (K) bu besin, mahsullerin dengeli gelişimi için bitkinin su ve besin emilimini iyileştirir. Çoğunlukla, (K) meyvelerin protein içeriğini, tat ve görünür niteliklerini iyileştirir.</p>	/uploads/product_images/1645361271045.jpg	21	2022-02-20 17:47:51.078679
15	POTASYUM KLORÜR	<p>Potasyum Klorür, kimyasal bir bileşik olan potasyum klorür, potasyum ve klor elementlerinin birleşiminden oluşmaktadır. Kimya da sembolü KCl olarak gösterilmektedir. Beyaz kristallerden oluşan bu elementin saf hali kokusuzdur. Bir tuz olan potasyum klorür suda yüksek çözünürlüğe sahiptir. Potasyum klorür insan vücudu için önemli bir elementtir. Tüm vücut sıvılarının pH sının uygun dağılımını ve sağlıklı sinir sistemi, kas fonksiyonunu sağlamaktadır. Düşük klorür seviyesi vücut sıvılarının bazikleşmesi ve idrarda potasyum azlığına sebep olmaktadır.&nbsp;<br>Potasyum Klorür, vücutta potasyumun atılması veya normal şartlarda potasyum alınmaması durumunda ortaya çıkan potasyum eksikliğinde dışarıdan alınmaktadır. Bu şekilde piyasa da ampul formunda potasyum klorür ilaçlar bulunmaktadır. Potasyum kaybına sebep bazı hastalıklar ishal, kusma, gastrointestinal fistüller, primer ve sekonder hiperaldosteronizm, kronik protein yıkımı gibi hastalıklardır.&nbsp;</p>	/uploads/product_images/1646400017750.jpg	23	2022-03-04 18:20:17.782958
13	LUMP KÜKÜRT	<p>Müşterilerimizin çoğunluğunun bizimle uzun vadeli ilişkileri olduğu, çeşitlendirilmiş bir müşteri tabanına sahibiz. Hindistan, Çin, Güney Doğu Asya, Ürdün, Latam Afrika ve Avustralya'dan müşterilerimiz on yılı aşkın süredir bizimle birlikte. Kaynak sağlamak için Orta Doğu ve diğer coğrafyalardaki üreticilerle etkili bir şekilde stratejik ortaklıklar kurduk.</p><p>MKM TARIM İTHALATIHRACAT SANAYİ VE TİCARET LİMİTED, müşterilerimiz için verimli ve Maliyet etkin özelleştirilmiş çözümler ile birlikte katma değerli hizmetler sunan benzersiz ticaret şirketi olarak kendini tanıtmaktan onur duyar. Çeşitli kargo boyutlarını işleme ve Kükürt'ü garanti edilen süre içinde taşıma yeteneğine sahibiz. Biz, kükürt tedarik ettiğimiz ve karşılığında Gübre satın aldığımız iki yönlü ticarette aktif oyuncularız. Odak noktamız, kalıcı ilişkiler kurmak ve küresel olarak müşterilere hızlı tedarik sağlamaktır.</p>	/uploads/product_images/1645361429179.jpg	21	2022-02-20 17:50:29.209041
14	ÜRE	<p>Üre, en konsantre Azotlu gübredir. Toprakta önce amonyuma daha sonra nitrat formlarına dönüşen amid formunda Azot içerir. Suda kolayca çözünür.&nbsp;</p><p>Aynı zamanda, genetik materyal DNA ve RNA da dahil olmak üzere bitki ve hayvan proteinlerinin temel unsurudur ve hızlı bitki büyümesi dönemlerinde önemlidir.</p><p>• Birim alandan daha <strong>yüksek verim</strong> alınır,<br>• <strong>Ürünlerin kalitesi</strong> yükseltilir,<br>• Toprakta <strong>verimliliğin</strong> sürekliliği sağlanır ve <strong>kazanç</strong> sürekli hale getirilir,<br>• Bitkilere <strong>daha iyi bir gelişme ortamı</strong> oluşturulur,<br>• Topraktan çeşitli şekillerde uzaklaşan besinler toprağa tekrar kazandırılır.</p><p>Yüksek verimli ve kaliteli ürün yetiştirebilmek için bitki ve toprağın ihtiyacı olan gübrenin doğru seçilmesinin yanı sıra gübrelemede <strong>miktar</strong>, <strong>zaman</strong> ve <strong>uygulama</strong> <strong>şekline</strong> de dikkat edilmelidir. Dengeli ve düzenli bir gübreleme için mutlaka <strong>toprak ve yaprak analizleri</strong> yapılmalıdır.</p>	/uploads/product_images/1646399934357.jpg	23	2022-03-04 18:18:54.398601
\.


--
-- Data for Name: products_header; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_header (id, lang_name, title, created_at) FROM stdin;
3	en	products	2022-02-16 16:56:40.70513
1	ru	urunler12334	2022-02-16 16:54:21.003759
2	ru	rusca	2022-02-16 16:56:24.147754
\.


--
-- Data for Name: reports; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports (id, lang_name, report1, report2, report3, report4, created_at) FROM stdin;
1	tr	Siziň hatyňyz üstünlikli ugradyldy	Hatyňyz ugradylmady	Sargydyňyz üstünlikli ugradyldy	Sargydyňyz ugradylmady	2022-02-03 06:35:04.148937
2	ru	Ваше сообщение было отправлено успешно	Ваше сообщение не может быть отправлено	Ваш заказ успешно отправлен	ваш заказ не был отправлен	2022-02-03 06:36:34.099023
3	en	Your message has been sent successfully	Your message could not be sent	Your message could not be sent	Your message could not be sent	2022-02-03 06:37:18.757433
\.


--
-- Data for Name: send_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.send_messages (id, name, email, title, message, created_at) FROM stdin;
1	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	web developer	Whats happening???	2022-03-04 19:18:14.653539
2	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	web developer	Whats happening???	2022-03-04 19:19:27.772771
3	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	web developer	Whats happening???	2022-03-04 19:19:30.175806
4	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	web developer	Whats happening???	2022-03-04 19:21:22.137198
5	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	web developer	Whats happening???	2022-03-04 19:21:56.506306
6	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	web developer	Whats happening???	2022-03-04 19:23:36.817685
7	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	web	rtyhl;	2022-03-04 19:32:20.47553
8	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	hgcgbhjkfdk	swdefaegstrh	2022-03-04 19:36:11.687843
9	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	hgcgbhjkfdk	efsgrdthgukhilj	2022-03-04 19:44:52.511087
10	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.comwer	xcv	sdafdsg	2022-03-04 19:50:53.576423
11	w2e3rt54	qwwadefsgthy@wadertry.com	sdwefeth	qsret	2022-03-05 15:47:52.558554
12	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	hgcgbhjkfdk	SADSDXGVHKKL	2022-03-05 15:53:44.64707
13	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	hgcgbhjkfdk	waesryul;	2022-03-05 15:55:51.697419
14	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.comwer	hgcgbhjkfdk	waesryul;	2022-03-05 15:57:10.070969
15	Muhammetmyrat	sadfdxgfcvjhbjn@gfchjsfd.com	hgcgbhjkfdk	waesryul;	2022-03-05 15:57:27.560318
16	Muhammetmyrat	sadfdxgfcvjhbjn@gfchjsfd.com	hgcgbhjkfdk	waesryul;	2022-03-05 15:59:11.826938
17	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	4r34r	fesgrthrytujkiuoip	2022-03-05 16:00:57.251268
18	Muhammetmyrat	bayramovmuhammetmyrat97@dsfd.com	4r34r	fesgrthrytujkiuoip	2022-03-05 16:08:43.657323
19	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	hgcgbhjkfdk	sadfgtyukiop	2022-03-05 16:13:40.169698
20	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	hgcgbhjkfdk	DSfghdkglh;k	2022-03-07 17:45:56.563981
21	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	hgcgbhjkfdk	sdzxggbn./,	2022-03-07 17:46:09.138196
22	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	hgcgbhjkfdk	sfdgxfhjvk	2022-03-07 17:52:05.150516
23	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	hgcgbhjkfdk	gcuvyiuhiojo	2022-03-07 17:52:20.198245
24	Muhammetmyrat	bayramovmuhammetmyrat97@gmail.com	hgcgbhjkfdk	cdfdgkhkk	2022-03-07 17:53:02.041679
\.


--
-- Data for Name: service_translates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_translates (id, lang_name, service_id, title, text, created_at) FROM stdin;
37	tr	18	Depa ve depolama hizmetleri	<p>Maryland, kargo ve malları depolamak için tam donanımlı depo tesislerinin kısa vadeli ve uzun vadeli kiralamasını sunar. Depolarımızda ürünler, gün boyu gözetim altında, uygun sıhhi koşullarda muhafaza edilmektedir. Maryland'in depo tesisleri, hem iç hem de dış mekanlarda malların depolanmasına ve yerleştirilmesine izin verir. Şirketimiz, hem Türkmenistan topraklarında hem de Türkiye'nin Mersin şehrinde bulunan depolarda her hacimde kargonun yerleştirilmesinde yardımcı olmaktadır. Depolama ve organizasyon, mal ve kargo gönderilerinin kabul ve sevkıyatı sürecinin uygulanması için eksiksiz bir hizmet yelpazesi sunuyoruz.</p>	2022-02-20 17:58:47.455244
38	ru	18	Склады и складские услуги	<p>Компания Maryland предлагает услуги по краткосрочной и длительной аренде складских помещений, полностью оборудованных для хранения груза и товара. На наших складах груз содержат в надлежащих санитарных условиях, под круглосуточным надзором. Складские мощности Компании Maryland позволяют складировать и размещать грузы, как в крытых помещениях, так и на открытых площадках. Наша компания помогает осуществляет помощь в размещении груза любого объёма как на территории Туркменистана, так и на складах, размещенных в Турции, город Мерсин. Мы предоставляем полный объем услуг складского хранения и организации, реализации процесса приемки и отгрузки партий товаров и грузов.</p>	2022-02-20 17:58:47.456562
39	en	18	Warehouses and warehousing services	<p>Maryland offers short-term and long-term rental of warehouse facilities fully equipped for storing cargo and goods. In our warehouses, the goods are kept in proper sanitary conditions, under round-the-clock supervision. Maryland's warehouse facilities allow warehousing and placement of goods, both indoors and outdoors. Our company helps provide assistance in the placement of cargo of any volume both on the territory of Turkmenistan and in warehouses located in Turkey, the city of Mersin. We provide a full range of services for warehousing and organization, implementation of the process of acceptance and shipment of consignments of goods and cargo.</p>	2022-02-20 17:58:47.457258
40	tr	19	Gümrük hizmetleri	<p>Maryland, gümrük kontrolünden geçmek, gerekli tüm izinlerin alınmasını organize etmek, menşe sertifikaları vermek ve müşterilerimize tam gizliliği garanti etmek için belgelerin gümrük işlemleri için hizmet vermektedir. Müşterilerimize, herhangi bir karmaşıklıktaki malların taşınması ile ilgili eksiksiz bir hizmet paketi almaları sayesinde "anahtar teslimi" lojistik sağlıyoruz.</p><p>Maryland, uluslararası taşımacılık ve gümrükleme hizmetleri sunarak, gümrük düzenlemeleri ve prosedürlerinin özelliklerini dikkate alarak optimum teslimat ve gümrükleme rotaları sağlar.</p>	2022-02-20 17:59:41.198298
41	ru	19	Таможенные услуги	<p>Компания Maryland оказывает услуги по таможенному оформлению документов для прохождения таможенного контроля, организации получения всех необходимых разрешительных документов, оформление сертификатов происхождения и гарантируем своим клиентам полную конфиденциальность. Мы предоставляем своим клиентам логистику "под ключ", благодаря чему наши заказчики получают полный пакет услуг, связанных с транспортировкой грузов любой сложности.&nbsp;</p><p>Предлагая международные транспортные услуги и таможенное оформление, Компания Maryland гарантирует оптимальные пути для поставок и таможенного оформления, учитывая особенности таможенных правил и процедур.</p>	2022-02-20 17:59:41.199381
42	en	19	Customs services	<p>Maryland provides services for customs clearance of documents for passing customs control, organizing the receipt of all necessary permits, issuing certificates of origin and guarantee our clients complete confidentiality. We provide our customers with "turnkey" logistics, thanks to which our customers receive a full package of services related to the transportation of goods of any complexity.</p><p>By offering international transport and customs clearance services, Maryland ensures optimal delivery and customs clearance routes, taking into account the specifics of customs regulations and procedures.</p>	2022-02-20 17:59:41.200061
43	tr	20	Mal taşımacılığı	<p>Maryland, en zorlu ulaşım ihtiyaçlarınızı karşılamak için ihtiyacınız olan tüm araçlara sahiptir. Büyük şirketler ve küçük şirketler lojistik konusunda bize güveniyor. Her lojistik projesi, çözülmesi gereken özellikler ve görevler dikkate alınarak ayrı ayrı oluşturulur. Maryland'in uzmanları, malların çeşitli yönlerde yüksek kaliteli nakliyesi için sağlam bir temel oluşturan en modern teknolojilere ve yazılımlara sahiptir. Kargo taşımacılığı hizmetimiz mevcut tüm taşıma türlerini kullanır: karayolu, demiryolu, hava, deniz. Malların uluslararası yönlere hızlı ve güvenilir teslimatı için vagonlar, konteynerler, kamyonlar, kargo gemileri emrimizdedir.</p>	2022-02-20 18:00:24.14383
44	ru	20	Перевозка груза	<p>Компания Maryland владеет всеми необходимыми инструментами для удовлетворения самых востребованных запросов в сфере транспортных услуг. Нам доверяют свою логистику крупные корпорации и небольшие компании. Каждый логистический проект создается индивидуально, с учетом особенностей и задач, которые необходимо решить. В распоряжении специалистов Компании Maryland самые современные технологии и программное обеспечение, которые создает прочный фундамент для качественной перевозки грузов в различные направления. Наш сервис грузоперевозок использует все доступные виды транспорта: автомобильный, железнодорожный, воздушный, морской. В нашем распоряжении вагоны, контейнера, фуры, грузовые судна для осуществления быстрой и надёжной доставки грузов в международных направлениях.&nbsp;</p>	2022-02-20 18:00:24.14535
45	en	20	Transportation of goods	<p>Maryland has all the tools you need to meet your most demanding transportation needs. Large corporations and small companies trust us with their logistics. Each logistics project is created individually, taking into account the features and tasks that need to be solved. Maryland's specialists have the most modern technologies and software at their disposal, which creates a solid foundation for high-quality transportation of goods in various directions. Our cargo transportation service uses all available types of transport: road, rail, air, sea. We have wagons, containers, trucks, cargo ships at our disposal for fast and reliable delivery of goods in international directions.</p>	2022-02-20 18:00:24.146602
46	tr	21	Komisyonluk ve kiralama	<p>Kargo lojistiği konusunda tüm imkanlara sahip olan Maryland ekibi, Hazar ve Karadeniz'de gemi kiralama hizmeti veriyor. Uzmanlarımız, müşterilerimizin yüksek kaliteli hizmet almaları sayesinde gemiler ve kargolar hakkında derinlemesine bilgi sahibidir. Maryland kiralama ekibi, sözleşmede kararlaştırılan süre içerisinde, istenen gemiyi nihai varış noktasına teslim etme yeteneğine sahiptir. Malların nakliyesi ile ilgili çalışmaların her aşamasında ticari ve hukuki konularda yardım sağlamaktayız. Tasarım ekiplerimiz kapsamlı proje koordinasyonu ve uygulaması sunar - kişisel danışmanlık, gemi ile nakliye öncesi detaylı planlama.</p>	2022-02-20 18:01:21.926025
47	ru	21	Аренда судов	<p>Команда Maryland, обладая всеми возможностями для логистики груза, предоставляет услуги фрахтования суден в Каспийском и Черном морях. Наши специалисты владеют глубокими знаниями о судах и грузах, благодаря чему наши клиенты получают высококачественное обслуживание. Команда фрахтователей Maryland имеет возможность поставить нужное судно в конечный пункт назначения в срок, обговоренном в контракте. Мы оказываем содействие в коммерческих и юридических вопросах на любом этапе выполнения работ по транспортировке груза. Наши проектные группы предлагают комплексную координацию и выполнения проекта – личную консультацию, детальное планирование до транспортировки на судне.</p>	2022-02-20 18:01:21.927184
48	en	21	Brokering and chartering	<p>The Maryland team, having all the capabilities for cargo logistics, provides vessel chartering services in the Caspian and Black Sea. Our specialists have in-depth knowledge of ships and cargoes, thanks to which our clients receive high-quality service. The Maryland charterers team has the ability to deliver the desired vessel to the final destination, within the time agreed in the contract. We provide assistance in commercial and legal matters at any stage of the work on the transportation of goods. Our design teams offer comprehensive project coordination and execution - personal consultation, detailed planning prior to transportation by ship.</p>	2022-02-20 18:01:21.927877
49	tr	22	Konteyner kiralama	<p>Maryland, uygun işbirliği koşulları ve kısa veya uzun vadeli kiralama için geniş bir konteyner modeli yelpazesi sunar. Maryland, çeşitli amaçlar için çok işlevli konteynerler kiralar - standart kuru kargo, deniz, özel, vb.&nbsp;Ürünler uluslararası standartlara uygundur, belirli bir amaç için taşıma modülleri için araçlar. Müşterilerimiz, konteynerin kullanım amacına bağlı olarak, konteynerin gerekli kullanım süresini, tipini ve tipini geniş bir yelpazeden seçebilirler. Rahat ve uzun süreli işbirliği için en avantajlı teklifleri sunuyoruz.</p>	2022-02-20 18:02:13.957939
50	ru	22	Аренда контейнеров	<p>Компания Maryland предлагает выгодные условия сотрудничества и большой выбор моделей контейнеров для кратковременной или долгосрочной аренды. Компания Maryland предоставляет в аренду многофункциональные контейнеры различного назначения – стандартные сухогрузные, морские, специализированные и тп. Продукция соответствует международным нормам, установленных для транспортных модулей определенного назначения. Наши клиенты могут выбрать необходимый срок аренды контейнера, его вид и тип из широкого ассортимента, исходя из целей использования контейнера. Мы предлагаем наиболее выгодные предложения для комфортного и долгосрочного сотрудничества.</p>	2022-02-20 18:02:13.9593
51	en	22	Container rental	<p>Maryland offers favorable terms of cooperation and a large selection of container models for short-term or long-term rental. Maryland leases multifunctional containers for various purposes - standard dry cargo, sea, specialized, etc. The products comply with international standards, vehicles for transport modules for a specific purpose. Our clients can choose the required period of use of the container, its type and type from a wide range, based on the purpose of using the container. We offer the most advantageous offers for comfortable and long-term cooperation.</p>	2022-02-20 18:02:13.960796
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.services (id, title, text, image_path, created_at) FROM stdin;
18	Depa ve depolama hizmetleri	<p>Maryland, kargo ve malları depolamak için tam donanımlı depo tesislerinin kısa vadeli ve uzun vadeli kiralamasını sunar. Depolarımızda ürünler, gün boyu gözetim altında, uygun sıhhi koşullarda muhafaza edilmektedir. Maryland'in depo tesisleri, hem iç hem de dış mekanlarda malların depolanmasına ve yerleştirilmesine izin verir. Şirketimiz, hem Türkmenistan topraklarında hem de Türkiye'nin Mersin şehrinde bulunan depolarda her hacimde kargonun yerleştirilmesinde yardımcı olmaktadır. Depolama ve organizasyon, mal ve kargo gönderilerinin kabul ve sevkıyatı sürecinin uygulanması için eksiksiz bir hizmet yelpazesi sunuyoruz.</p>	/uploads/services_images/1645361927411.jpg	2022-02-20 17:58:47.451967
19	Gümrük hizmetleri	<p>Maryland, gümrük kontrolünden geçmek, gerekli tüm izinlerin alınmasını organize etmek, menşe sertifikaları vermek ve müşterilerimize tam gizliliği garanti etmek için belgelerin gümrük işlemleri için hizmet vermektedir. Müşterilerimize, herhangi bir karmaşıklıktaki malların taşınması ile ilgili eksiksiz bir hizmet paketi almaları sayesinde "anahtar teslimi" lojistik sağlıyoruz.</p><p>Maryland, uluslararası taşımacılık ve gümrükleme hizmetleri sunarak, gümrük düzenlemeleri ve prosedürlerinin özelliklerini dikkate alarak optimum teslimat ve gümrükleme rotaları sağlar.</p>	/uploads/services_images/1645361981162.jpg	2022-02-20 17:59:41.196733
20	Mal taşımacılığı	<p>Maryland, en zorlu ulaşım ihtiyaçlarınızı karşılamak için ihtiyacınız olan tüm araçlara sahiptir. Büyük şirketler ve küçük şirketler lojistik konusunda bize güveniyor. Her lojistik projesi, çözülmesi gereken özellikler ve görevler dikkate alınarak ayrı ayrı oluşturulur. Maryland'in uzmanları, malların çeşitli yönlerde yüksek kaliteli nakliyesi için sağlam bir temel oluşturan en modern teknolojilere ve yazılımlara sahiptir. Kargo taşımacılığı hizmetimiz mevcut tüm taşıma türlerini kullanır: karayolu, demiryolu, hava, deniz. Malların uluslararası yönlere hızlı ve güvenilir teslimatı için vagonlar, konteynerler, kamyonlar, kargo gemileri emrimizdedir.</p>	/uploads/services_images/1645362024119.jpg	2022-02-20 18:00:24.14012
21	Komisyonluk ve kiralama	<p>Kargo lojistiği konusunda tüm imkanlara sahip olan Maryland ekibi, Hazar ve Karadeniz'de gemi kiralama hizmeti veriyor. Uzmanlarımız, müşterilerimizin yüksek kaliteli hizmet almaları sayesinde gemiler ve kargolar hakkında derinlemesine bilgi sahibidir. Maryland kiralama ekibi, sözleşmede kararlaştırılan süre içerisinde, istenen gemiyi nihai varış noktasına teslim etme yeteneğine sahiptir. Malların nakliyesi ile ilgili çalışmaların her aşamasında ticari ve hukuki konularda yardım sağlamaktayız. Tasarım ekiplerimiz kapsamlı proje koordinasyonu ve uygulaması sunar - kişisel danışmanlık, gemi ile nakliye öncesi detaylı planlama.</p>	/uploads/services_images/1645362081890.jpg	2022-02-20 18:01:21.922567
22	Konteyner kiralama	<p>Maryland, uygun işbirliği koşulları ve kısa veya uzun vadeli kiralama için geniş bir konteyner modeli yelpazesi sunar. Maryland, çeşitli amaçlar için çok işlevli konteynerler kiralar - standart kuru kargo, deniz, özel, vb.&nbsp;Ürünler uluslararası standartlara uygundur, belirli bir amaç için taşıma modülleri için araçlar. Müşterilerimiz, konteynerin kullanım amacına bağlı olarak, konteynerin gerekli kullanım süresini, tipini ve tipini geniş bir yelpazeden seçebilirler. Rahat ve uzun süreli işbirliği için en avantajlı teklifleri sunuyoruz.</p>	/uploads/services_images/1645362133886.jpg	2022-02-20 18:02:13.950165
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, logo, logo_black, favicon, email, whatsapp, created_at) FROM stdin;
1	/uploads/settings/logo.svg	/uploads/settings/logo-black.svg	/uploads/settings/1631108314-favicon.png	site@maryland-ltd.com	+905417972917	2022-02-02 16:04:48.390096
\.


--
-- Data for Name: statistica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statistica (id, title, amount, image_path, created_at) FROM stdin;
1	TON POTASYUM	50000	/uploads/statistica/Frame 148.svg	2022-02-18 18:41:21.226881
2	TON ÜRE	150000	/uploads/statistica/Frame 151.svg	2022-02-18 18:42:27.90958
3	TON KÜKÜRT	700000	/uploads/statistica/Frame 152.svg	2022-02-18 18:48:49.752968
\.


--
-- Data for Name: statistica_translates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statistica_translates (id, lang_name, statistica_id, title, created_at) FROM stdin;
1	tr	1	TON POTASYUM	2022-02-18 18:41:21.230468
2	ru	1	TON POTASYUM	2022-02-18 18:41:21.232004
3	en	1	TON POTASYUM	2022-02-18 18:41:21.232806
4	tr	2	TON ÜRE	2022-02-18 18:42:27.913324
5	ru	2	TON ÜRE	2022-02-18 18:42:27.914606
6	en	2	TON ÜRE	2022-02-18 18:42:27.915358
7	tr	3	TON KÜKÜRT	2022-02-18 18:48:49.760252
8	ru	3	TON KÜKÜRT	2022-02-18 18:48:49.761891
9	en	3	TON KÜKÜRT	2022-02-18 18:48:49.762653
\.


--
-- Name: about_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.about_body_id_seq', 3, true);


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 3, true);


--
-- Name: contact_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contact_body_id_seq', 3, true);


--
-- Name: footer_titles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.footer_titles_id_seq', 7, true);


--
-- Name: home_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_body_id_seq', 4, true);


--
-- Name: home_slider_translates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_slider_translates_id_seq', 165, true);


--
-- Name: home_sliders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.home_sliders_id_seq', 103, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.images_id_seq', 76, true);


--
-- Name: languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.languages_id_seq', 9, true);


--
-- Name: menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_id_seq', 3, true);


--
-- Name: phones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phones_id_seq', 7, true);


--
-- Name: product_categorie_translates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_categorie_translates_id_seq', 30, true);


--
-- Name: product_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_categories_id_seq', 23, true);


--
-- Name: product_translates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_translates_id_seq', 42, true);


--
-- Name: products_header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_header_id_seq', 3, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 15, true);


--
-- Name: reports_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_id_seq', 3, true);


--
-- Name: send_messages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.send_messages_id_seq', 24, true);


--
-- Name: service_translates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_translates_id_seq', 51, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.services_id_seq', 22, true);


--
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, true);


--
-- Name: statistica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statistica_id_seq', 3, true);


--
-- Name: statistica_translates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.statistica_translates_id_seq', 9, true);


--
-- Name: about_body about_body_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.about_body
    ADD CONSTRAINT about_body_pkey PRIMARY KEY (id);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: admins admins_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key UNIQUE (email);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: admins admins_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_username_key UNIQUE (username);


--
-- Name: contact_body contact_body_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contact_body
    ADD CONSTRAINT contact_body_pkey PRIMARY KEY (id);


--
-- Name: footer_titles footer_titles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_titles
    ADD CONSTRAINT footer_titles_pkey PRIMARY KEY (id);


--
-- Name: footer_titles footer_titles_title1_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_titles
    ADD CONSTRAINT footer_titles_title1_key UNIQUE (title1);


--
-- Name: footer_titles footer_titles_title2_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_titles
    ADD CONSTRAINT footer_titles_title2_key UNIQUE (title2);


--
-- Name: footer_titles footer_titles_title3_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_titles
    ADD CONSTRAINT footer_titles_title3_key UNIQUE (title3);


--
-- Name: footer_titles footer_titles_title4_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_titles
    ADD CONSTRAINT footer_titles_title4_key UNIQUE (title4);


--
-- Name: footer_titles footer_titles_title5_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.footer_titles
    ADD CONSTRAINT footer_titles_title5_key UNIQUE (title5);


--
-- Name: home_body home_body_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_body
    ADD CONSTRAINT home_body_pkey PRIMARY KEY (id);


--
-- Name: home_slider_translates home_slider_translates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_slider_translates
    ADD CONSTRAINT home_slider_translates_pkey PRIMARY KEY (id);


--
-- Name: home_sliders home_sliders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_sliders
    ADD CONSTRAINT home_sliders_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: languages languages_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_name_key UNIQUE (name);


--
-- Name: languages languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (short_name);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- Name: phones phones_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phones_phone_number_key UNIQUE (phone_number);


--
-- Name: phones phones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phones_pkey PRIMARY KEY (id);


--
-- Name: product_categorie_translates product_categorie_translates_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categorie_translates
    ADD CONSTRAINT product_categorie_translates_name_key UNIQUE (name);


--
-- Name: product_categorie_translates product_categorie_translates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categorie_translates
    ADD CONSTRAINT product_categorie_translates_pkey PRIMARY KEY (id);


--
-- Name: product_categories product_categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_name_key UNIQUE (name);


--
-- Name: product_categories product_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categories
    ADD CONSTRAINT product_categories_pkey PRIMARY KEY (id);


--
-- Name: product_translates product_translates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_translates
    ADD CONSTRAINT product_translates_pkey PRIMARY KEY (id);


--
-- Name: products_header products_header_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_header
    ADD CONSTRAINT products_header_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: reports reports_report1_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_report1_key UNIQUE (report1);


--
-- Name: reports reports_report2_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_report2_key UNIQUE (report2);


--
-- Name: reports reports_report3_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_report3_key UNIQUE (report3);


--
-- Name: reports reports_report4_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports
    ADD CONSTRAINT reports_report4_key UNIQUE (report4);


--
-- Name: send_messages send_messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.send_messages
    ADD CONSTRAINT send_messages_pkey PRIMARY KEY (id);


--
-- Name: service_translates service_translates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_translates
    ADD CONSTRAINT service_translates_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: statistica statistica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistica
    ADD CONSTRAINT statistica_pkey PRIMARY KEY (id);


--
-- Name: statistica_translates statistica_translates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistica_translates
    ADD CONSTRAINT statistica_translates_pkey PRIMARY KEY (id);


--
-- Name: idx_about_body_lang_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_about_body_lang_name ON public.about_body USING btree (lang_name);


--
-- Name: idx_address_lang_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_address_lang_name ON public.address USING btree (lang_name);


--
-- Name: idx_contact_body_lang_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_contact_body_lang_name ON public.contact_body USING btree (lang_name);


--
-- Name: idx_footer_titles_lang_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_footer_titles_lang_name ON public.footer_titles USING btree (lang_name);


--
-- Name: idx_home_body_lang_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_home_body_lang_name ON public.home_body USING btree (lang_name);


--
-- Name: idx_home_slider_translates_lang_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_home_slider_translates_lang_name ON public.home_slider_translates USING btree (lang_name);


--
-- Name: idx_images_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_images_role ON public.images USING btree (role);


--
-- Name: idx_menu_lang_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_menu_lang_name ON public.menu USING btree (lang_name);


--
-- Name: idx_product_categorie_translates_lang_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_categorie_translates_lang_name ON public.product_categorie_translates USING btree (lang_name);


--
-- Name: idx_product_translates_lang_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_product_translates_lang_name ON public.product_translates USING btree (lang_name);


--
-- Name: idx_products_header_lang_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_products_header_lang_name ON public.products_header USING btree (lang_name);


--
-- Name: idx_reports_lang_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_reports_lang_name ON public.reports USING btree (lang_name);


--
-- Name: idx_service_translates_lang_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_service_translates_lang_name ON public.service_translates USING btree (lang_name);


--
-- Name: idx_statistica_translates_lang_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_statistica_translates_lang_name ON public.statistica_translates USING btree (lang_name);


--
-- Name: home_body home_body_lang_name_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_body
    ADD CONSTRAINT home_body_lang_name_fk FOREIGN KEY (lang_name) REFERENCES public.languages(short_name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: home_slider_translates home_slider_translates_slider_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.home_slider_translates
    ADD CONSTRAINT home_slider_translates_slider_id_fk FOREIGN KEY (slider_id) REFERENCES public.home_sliders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_categorie_translates product_categorie_translates_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_categorie_translates
    ADD CONSTRAINT product_categorie_translates_category_id_fk FOREIGN KEY (category_id) REFERENCES public.product_categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: product_translates product_translates_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_translates
    ADD CONSTRAINT product_translates_product_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products products_category_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fk FOREIGN KEY (category_id) REFERENCES public.product_categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products_header products_header_lang_name_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_header
    ADD CONSTRAINT products_header_lang_name_fk FOREIGN KEY (lang_name) REFERENCES public.languages(short_name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: service_translates service_translates_service_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_translates
    ADD CONSTRAINT service_translates_service_id_fk FOREIGN KEY (service_id) REFERENCES public.services(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: statistica_translates statistica_translates_lang_name_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistica_translates
    ADD CONSTRAINT statistica_translates_lang_name_fk FOREIGN KEY (lang_name) REFERENCES public.languages(short_name) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: statistica_translates statistica_translates_statistica_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statistica_translates
    ADD CONSTRAINT statistica_translates_statistica_id_fk FOREIGN KEY (statistica_id) REFERENCES public.statistica(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


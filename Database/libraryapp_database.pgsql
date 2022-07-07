--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: library_staff_information; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.library_staff_information (
    id integer NOT NULL,
    staff_flag boolean,
    user_id_id integer NOT NULL
);


ALTER TABLE public.library_staff_information OWNER TO postgres;

--
-- Name: Library_Staff_information_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Library_Staff_information_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Library_Staff_information_id_seq" OWNER TO postgres;

--
-- Name: Library_Staff_information_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Library_Staff_information_id_seq" OWNED BY public.library_staff_information.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: book_id_with_amazon_ids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book_id_with_amazon_ids (
    book_id bigint,
    amazon_id character varying(100),
    amazon_url character varying(200)
);


ALTER TABLE public.book_id_with_amazon_ids OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: library_book_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.library_book_details (
    id integer NOT NULL,
    book_id bigint,
    isbn_id character varying(200),
    authors character varying(200),
    publication_year character varying(200),
    title character varying(200),
    language character varying(100),
    amazon_id character varying(100),
    amazon_link character varying(200)
);


ALTER TABLE public.library_book_details OWNER TO postgres;

--
-- Name: library_book_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.library_book_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_book_details_id_seq OWNER TO postgres;

--
-- Name: library_book_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.library_book_details_id_seq OWNED BY public.library_book_details.id;


--
-- Name: library_staff_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.library_staff_details (
    id integer NOT NULL,
    book_id bigint,
    availability character varying(20),
    book_given_date character varying(200),
    book_submission_date character varying(200),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id_id integer NOT NULL
);


ALTER TABLE public.library_staff_details OWNER TO postgres;

--
-- Name: library_staff_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.library_staff_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_staff_details_id_seq OWNER TO postgres;

--
-- Name: library_staff_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.library_staff_details_id_seq OWNED BY public.library_staff_details.id;


--
-- Name: library_user_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.library_user_details (
    id integer NOT NULL,
    book_id bigint,
    notify_me character varying(20),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id_id integer NOT NULL,
    add_remove character varying(20)
);


ALTER TABLE public.library_user_details OWNER TO postgres;

--
-- Name: library_user_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.library_user_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_user_details_id_seq OWNER TO postgres;

--
-- Name: library_user_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.library_user_details_id_seq OWNED BY public.library_user_details.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_book_details ALTER COLUMN id SET DEFAULT nextval('public.library_book_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_staff_details ALTER COLUMN id SET DEFAULT nextval('public.library_staff_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_staff_information ALTER COLUMN id SET DEFAULT nextval('public."Library_Staff_information_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_user_details ALTER COLUMN id SET DEFAULT nextval('public.library_user_details_id_seq'::regclass);


--
-- Name: Library_Staff_information_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Library_Staff_information_id_seq"', 2, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
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
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add library_ data	7	add_library_data
26	Can change library_ data	7	change_library_data
27	Can delete library_ data	7	delete_library_data
28	Can view library_ data	7	view_library_data
29	Can add library_ user_ data	8	add_library_user_data
30	Can change library_ user_ data	8	change_library_user_data
31	Can delete library_ user_ data	8	delete_library_user_data
32	Can view library_ user_ data	8	view_library_user_data
33	Can add library_ staff_ data	9	add_library_staff_data
34	Can change library_ staff_ data	9	change_library_staff_data
35	Can delete library_ staff_ data	9	delete_library_staff_data
36	Can view library_ staff_ data	9	view_library_staff_data
37	Can add library_ staff_information	10	add_library_staff_information
38	Can change library_ staff_information	10	change_library_staff_information
39	Can delete library_ staff_information	10	delete_library_staff_information
40	Can view library_ staff_information	10	view_library_staff_information
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$FNfoT7JUbqbx$8FNc3/t8v7qvS3ZgcwLDa2m529kQiL8G246jZgGt+x0=	2022-06-24 00:51:22.488735+05:30	t	admin			admin@cognizant.com	t	t	2022-06-23 15:08:40.687682+05:30
3	pbkdf2_sha256$150000$xqRGbMyLl0S0$ydLToL9FffpjYjBVjP6T4FloFIJA9RpIpa9lkqheikw=	2022-06-24 14:43:49.857444+05:30	f	libstaff@lib.com	libstaff			f	t	2022-06-24 00:52:27+05:30
2	pbkdf2_sha256$150000$A30KG3zZBN4G$T7IBxcAtIo01GlGfku8jRsgqcr9WAt8o2BLJAb55Gp8=	2022-06-24 14:44:16.139262+05:30	f	sasi@lib.com	Sasi			f	t	2022-06-23 16:32:53+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: book_id_with_amazon_ids; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book_id_with_amazon_ids (book_id, amazon_id, amazon_url) FROM stdin;
256683	1416914285	https://www.amazon.com/Cassandra-Clare/dp/1416914285
22557272	1594633665	https://www.amazon.com/Paula-Hawkins/dp/1594633665
7445	074324754X	https://www.amazon.com/Jeannette-Walls/dp/074324754X
11857408	1612130585	https://www.amazon.com/E.L.-James/dp/1612130585
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-06-23 16:32:53.544059+05:30	2	sasi@lib.com	1	[{"added": {}}]	4	1
2	2022-06-23 16:33:22.508811+05:30	2	sasi@lib.com	2	[{"changed": {"fields": ["first_name"]}}]	4	1
3	2022-06-24 00:52:27.90543+05:30	3	libstaff@lib.com	1	[{"added": {}}]	4	1
4	2022-06-24 00:52:42.703231+05:30	3	libstaff@lib.com	2	[{"changed": {"fields": ["first_name"]}}]	4	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 4, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	Libapp	library_data
8	Libapp	library_user_data
9	Libapp	library_staff_data
10	Libapp	library_staff_information
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-06-23 15:05:54.804942+05:30
2	auth	0001_initial	2022-06-23 15:05:55.19889+05:30
3	admin	0001_initial	2022-06-23 15:05:56.145355+05:30
4	admin	0002_logentry_remove_auto_add	2022-06-23 15:05:56.291484+05:30
5	admin	0003_logentry_add_action_flag_choices	2022-06-23 15:05:56.328368+05:30
6	contenttypes	0002_remove_content_type_name	2022-06-23 15:05:56.377121+05:30
7	auth	0002_alter_permission_name_max_length	2022-06-23 15:05:56.401928+05:30
8	auth	0003_alter_user_email_max_length	2022-06-23 15:05:56.426284+05:30
9	auth	0004_alter_user_username_opts	2022-06-23 15:05:56.454991+05:30
10	auth	0005_alter_user_last_login_null	2022-06-23 15:05:56.484593+05:30
11	auth	0006_require_contenttypes_0002	2022-06-23 15:05:56.501779+05:30
12	auth	0007_alter_validators_add_error_messages	2022-06-23 15:05:56.547607+05:30
13	auth	0008_alter_user_username_max_length	2022-06-23 15:05:56.634394+05:30
14	auth	0009_alter_user_last_name_max_length	2022-06-23 15:05:56.657091+05:30
15	auth	0010_alter_group_name_max_length	2022-06-23 15:05:56.674837+05:30
16	auth	0011_update_proxy_permissions	2022-06-23 15:05:56.701996+05:30
17	sessions	0001_initial	2022-06-23 15:05:56.81813+05:30
18	Libapp	0001_initial	2022-06-23 16:49:06.782032+05:30
19	Libapp	0002_library_user_data	2022-06-23 19:18:33.877414+05:30
20	Libapp	0003_library_user_data_add_remove	2022-06-23 20:51:47.244034+05:30
21	Libapp	0004_library_staff_data	2022-06-24 00:02:29.655799+05:30
22	Libapp	0005_library_staff_information	2022-06-24 00:45:56.733227+05:30
23	Libapp	0006_auto_20220623_1919	2022-06-24 00:49:49.015397+05:30
24	Libapp	0007_auto_20220624_0847	2022-06-24 14:17:34.662337+05:30
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 24, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
qzhuii75wbp91kxalj7xxmeei25jnj12	ODgzNWExOWRlMjI5MmY2NzUzZWE4YjM5ZjlkMjU0ODczZTA5Mjk5YTp7fQ==	2022-07-07 16:35:24.626139+05:30
jhs17bxduong4e2hq92cw0cdri0i0eue	NGFmYmNjNTQwZWIwYzRmZmNiMzJlNzc0ZTUwNzNiNGRhNmNkYjlhODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxYjM3YzA4MTJiODk4MGM0ODI5ZTIyYTc5M2I3ODRjZjNmMzZhOWIxIn0=	2022-07-08 14:44:16.155243+05:30
\.


--
-- Data for Name: library_book_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.library_book_details (id, book_id, isbn_id, authors, publication_year, title, language, amazon_id, amazon_link) FROM stdin;
1	2767052	439023483	Suzanne Collins	2008	The Hunger Games	eng	\N	\N
2	3	439554934	J.K. Rowling, Mary GrandPré	1997	Harry Potter and the Philosopher's Stone	eng	\N	\N
3	41865	316015849	Stephenie Meyer	2005	Twilight	en-US	\N	\N
4	2657	61120081	Harper Lee	1960	To Kill a Mockingbird	eng	\N	\N
5	4671	743273567	F. Scott Fitzgerald	1925	The Great Gatsby	eng	\N	\N
6	11870085	525478817	John Green	2012	The Fault in Our Stars	eng	\N	\N
7	5907	618260307	J.R.R. Tolkien	1937	The Hobbit or There and Back Again	en-US	\N	\N
8	5107	316769177	J.D. Salinger	1951	The Catcher in the Rye	eng	\N	\N
9	960	1416524797	Dan Brown	2000	Angels & Demons 	en-CA	\N	\N
10	1885	679783261	Jane Austen	1813	Pride and Prejudice	eng	\N	\N
11	77203	1594480001	Khaled Hosseini	2003	The Kite Runner 	eng	\N	\N
12	13335037	62024035	Veronica Roth	2011	Divergent	eng	\N	\N
13	5470	451524934	George Orwell, Erich Fromm, Celâl Üster	1949	Nineteen Eighty-Four	eng	\N	\N
14	7613	452284244	George Orwell	1945	Animal Farm: A Fairy Story	eng	\N	\N
15	48855	553296981	Anne Frank, Eleanor Roosevelt, B.M. Mooyaart-Doubleday	1947	Het Achterhuis: Dagboekbrieven 14 juni 1942 - 1 augustus 1944	eng	\N	\N
16	2429135	307269752	Stieg Larsson, Reg Keeland	2005	Män som hatar kvinnor	eng	\N	\N
17	6148028	439023491	Suzanne Collins	2009	Catching Fire	eng	\N	\N
18	5	043965548X	J.K. Rowling, Mary GrandPré, Rufus Beck	1999	Harry Potter and the Prisoner of Azkaban	eng	\N	\N
19	34	618346252	J.R.R. Tolkien	1954	 The Fellowship of the Ring	eng	\N	\N
20	7260188	439023513	Suzanne Collins	2010	Mockingjay	eng	\N	\N
21	2	439358078	J.K. Rowling, Mary GrandPré	2003	Harry Potter and the Order of the Phoenix	eng	\N	\N
22	12232938	316166685	Alice Sebold	2002	The Lovely Bones	eng	\N	\N
23	15881	439064864	J.K. Rowling, Mary GrandPré	1998	Harry Potter and the Chamber of Secrets	eng	\N	\N
24	6	439139600	J.K. Rowling, Mary GrandPré	2000	Harry Potter and the Goblet of Fire	eng	\N	\N
25	136251	545010225	J.K. Rowling, Mary GrandPré	2007	Harry Potter and the Deathly Hallows	eng	\N	\N
26	968	307277674	Dan Brown	2003	The Da Vinci Code	eng	\N	\N
27	1	439785960	J.K. Rowling, Mary GrandPré	2005	Harry Potter and the Half-Blood Prince	eng	\N	\N
28	7624	140283331	William Golding	1954	Lord of the Flies 	eng	\N	\N
29	18135	743477111	William Shakespeare, Robert           Jackson	1595	An Excellent conceited Tragedie of Romeo and Juliet	eng	\N	\N
30	19288043	297859382	Gillian Flynn	2012	Gone Girl	eng	\N	\N
31	4667024	399155341	Kathryn Stockett	2009	The Help	eng	\N	\N
32	890	142000671	John Steinbeck	1937	Of Mice and Men 	eng	\N	\N
33	929	739326228	Arthur Golden	1997	Memoirs of a Geisha	eng	\N	\N
34	10818853	1612130291	E.L. James	2011	Fifty Shades of Grey	eng	\N	\N
35	865	61122416	Paulo Coelho, Alan R. Clarke	1988	O Alquimista	eng	\N	\N
36	3636	385732554	Lois Lowry	1993	The Giver	eng	\N	\N
37	100915	60764899	C.S. Lewis	1950	The Lion, the Witch and the Wardrobe	eng	\N	\N
38	18619684	965818675	Audrey Niffenegger	2003	The Time Traveler's Wife	eng	\N	\N
39	13496	553588486	George R.R. Martin	1996	A Game of Thrones	eng	\N	\N
40	19501	143038419	Elizabeth Gilbert	2006	Eat, pray, love: one woman's search for everything across Italy, India and Indonesia	eng	\N	\N
41	28187	786838655	Rick Riordan	2005	The Lightning Thief	eng	\N	\N
42	1934	451529308	Louisa May Alcott	1868	Little Women	en-US	\N	\N
43	10210	142437204	Charlotte Brontë, Michael Mason	1847	Jane Eyre	eng	\N	\N
44	15931	553816713	Nicholas Sparks	1996	The Notebook	eng	\N	\N
45	4214	770430074	Yann Martel	2001	Life of Pi	\N	\N	\N
46	43641	1565125606	Sara Gruen	2006	Water for Elephants	eng	\N	\N
47	19063	375831002	Markus Zusak	2005	The Book Thief	eng	\N	\N
48	4381	307347974	Ray Bradbury	1953	Fahrenheit 451	spa	\N	\N
49	49041	316160199	Stephenie Meyer	2006	New Moon (Twilight, #2)	eng	\N	\N
50	30119	60513039	Shel Silverstein	1974	Where the Sidewalk Ends: The Poems and Drawings of Shel Silverstein	eng	\N	\N
52	428263	316160202	Stephenie Meyer	2007	Eclipse	en-US	\N	\N
53	113436	375826696	Christopher Paolini	2002	Eragon	en-US	\N	\N
54	386162	345391802	Douglas Adams	1979	The Hitchhiker's Guide to the Galaxy	en-US	\N	\N
55	5129	60929871	Aldous Huxley	1932	Brave New World	eng	\N	\N
56	1162543	031606792X	Stephenie Meyer	2008	Breaking Dawn	en-US	\N	\N
57	37435	142001740	Sue Monk Kidd	2001	The Secret Life of Bees	en-US	\N	\N
58	2956	142437174	Mark Twain, John Seelye, Guy Cardwell	1884	The Adventures of Huckleberry Finn	eng	\N	\N
59	24178	64410935	E.B. White, Garth Williams, Rosemary Wells	1952	Charlotte's Web	eng	\N	\N
60	1618	1400032717	Mark Haddon	2003	The Curious Incident of the Dog in the Night-Time	eng	\N	\N
62	119322	679879242	Philip Pullman	1995	Northern Lights	eng	\N	\N
63	6185	393978893	Emily Brontë, Richard J. Dunn	1847	Wuthering Heights	eng	\N	\N
64	10917	743454537	Jodi Picoult	2004	My Sister's Keeper	eng	\N	\N
65	4981	385333846	Kurt Vonnegut Jr.	1969	Slaughterhouse-Five, or The Children's Crusade: A Duty-Dance with Death 	eng	\N	\N
66	18405	446675539	Margaret Mitchell	1936	Gone with the Wind	eng	\N	\N
67	128029	1594489505	Khaled Hosseini	2007	A Thousand Splendid Suns	eng	\N	\N
68	22628	671027344	Stephen Chbosky	1999	The Perks of Being a Wallflower	eng	\N	\N
69	11735983	7442912	Veronica Roth	2012	Insurgent	eng	\N	\N
70	375802	812550706	Orson Scott Card	1985	Ender's Game	eng	\N	\N
71	18490	141439475	Mary Wollstonecraft Shelley, Percy Bysshe Shelley, Maurice Hindle	1818	Frankenstein; or, The Modern Prometheus	eng	\N	\N
72	11588	450040186	Stephen King	1977	The Shining	eng	\N	\N
73	1656001	316068047	Stephenie Meyer	2008	The Host	en-US	\N	\N
74	99561	142402516	John Green	2005	Looking for Alaska	eng	\N	\N
75	227443	014028009X	Helen Fielding	1996	\N	eng	\N	\N
76	14935	141439661	Jane Austen, Tony Tanner, Ros Ballaster	1811	Sense and Sensibility	eng	\N	\N
77	38709	439244196	Louis Sachar, Louis Sachar	1998	Holes	eng	\N	\N
78	5139	307275558	Lauren Weisberger	2003	The Devil Wears Prada	eng	\N	\N
79	1381	143039954	Homer, Robert Fagles, E.V. Rieu, Frédéric Mugler, Bernard Knox	-720	Ὀδύσσεια	eng	\N	\N
80	157993	156012197	Antoine de Saint-Exupéry, Richard Howard, Dom Marcos Barbosa, Melina Karakosta	1946	Le Petit Prince	eng	\N	\N
82	1845	385486804	Jon Krakauer	1996	Into the Wild	eng	\N	\N
83	1953	141439602	Charles Dickens, Richard Maxwell, Hablot Knight Browne	1859	A Tale of Two Cities	eng	\N	\N
84	6424171	030734813X	Michael Crichton	1990	Jurassic Park	spa	\N	\N
85	370493	60256656	Shel Silverstein	1964	The Giving Tree	eng	\N	\N
86	32542	385338600	John Grisham	1989	A Time to Kill	eng	\N	\N
87	1617	374500010	Elie Wiesel, Marion Wiesel	1958	Un di Velt Hot Geshvign	eng	\N	\N
88	6442769	014241493X	John Green	2008	Paper Towns	en-US	\N	\N
89	21787	345418263	William Goldman	1973	The Princess Bride	en-US	\N	\N
90	231804	014038572X	S.E. Hinton	1967	The Outsiders	en-US	\N	\N
91	6186357	385737947	James Dashner	2009	The Maze Runner	eng	\N	\N
92	1202	61234001	Steven D. Levitt, Stephen J. Dubner	2005	Freakonomics: A Rogue Economist Explores the Hidden Side of Everything	en-US	\N	\N
93	2998	517189607	Frances Hodgson Burnett	1911	The Secret Garden	eng	\N	\N
94	320	60531045	Gabriel García Márquez, Gregory Rabassa	1967	Cien años de soledad	eng	\N	\N
95	5297	375751513	Oscar Wilde, Jeffrey Eugenides	1891	The Picture of Dorian Gray	eng	\N	\N
96	13536860	345803507	E.L. James	2012	Fifty Shades Freed	eng	\N	\N
97	17245	393970124	Bram Stoker, Nina Auerbach, David J. Skal	1897	Dracula	eng	\N	\N
98	5060378	307269981	Stieg Larsson, Reg Keeland	2006	Flickan som lekte med elden	eng	\N	\N
51	256683	1416914285	Cassandra Clare	2007	City of Bones	eng	1416914285	https://www.amazon.com/Cassandra-Clare/dp/1416914285
61	22557272	1594633665	Paula Hawkins	2015	The Girl on the Train	eng	1594633665	https://www.amazon.com/Paula-Hawkins/dp/1594633665
81	7445	074324754X	Jeannette Walls	2005	The Glass Castle	eng	074324754X	https://www.amazon.com/Jeannette-Walls/dp/074324754X
99	11857408	1612130585	E.L. James	2011	Fifty Shades Darker	eng	1612130585	https://www.amazon.com/E.L.-James/dp/1612130585
\.


--
-- Name: library_book_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.library_book_details_id_seq', 99, true);


--
-- Data for Name: library_staff_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.library_staff_details (id, book_id, availability, book_given_date, book_submission_date, created_at, updated_at, user_id_id) FROM stdin;
4	2767052	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
6	5470	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
7	41865	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
8	113436	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
9	227443	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
10	11870085	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
12	7260188	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
13	6442769	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
14	10917	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
15	7624	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
17	5139	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
18	3636	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
19	4981	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
20	18490	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
21	1381	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
22	13496	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
23	119322	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
24	11588	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
25	28187	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
26	320	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
27	929	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
28	12232938	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
29	428263	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
30	30119	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
31	15931	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
32	13335037	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
33	1202	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
34	5907	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
35	4671	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
36	968	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
37	2429135	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
38	22557272	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
39	1617	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
40	1934	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
41	18405	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
42	77203	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
43	1656001	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
44	48855	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
46	10210	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
47	5107	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
48	11735983	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
49	7445	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
50	7613	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
51	960	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
52	34	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
53	19501	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
54	2956	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
55	370493	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
56	256683	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
57	19288043	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
58	375802	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
59	4381	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
60	49041	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
61	4214	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
62	231804	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
63	13536860	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
64	6185	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
65	136251	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
66	17245	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
67	1953	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
68	43641	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
69	2998	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
70	6148028	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
71	38709	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
72	157993	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
73	865	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
74	2657	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
75	1885	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
76	32542	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
77	5	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
78	1162543	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
79	14935	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
80	6186357	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
81	24178	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
82	1618	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
83	128029	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
84	890	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
85	19063	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
86	18135	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
87	6424171	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
88	22628	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
89	100915	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
90	5129	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
91	37435	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
92	10818853	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
93	18619684	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
94	21787	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
95	4667024	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
96	99561	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
97	15881	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
98	1845	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
99	11857408	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
100	386162	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
101	5060378	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
102	5297	\N	\N	\N	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:40:44.099892+05:30	2
5	2	on	2022-06-21	2022-06-23	2022-06-23 23:40:44.099892+05:30	2022-06-24 01:39:55.647326+05:30	3
45	6		2022-06-20		2022-06-23 23:40:44.099892+05:30	2022-06-24 01:39:55.544237+05:30	3
16	3	on	2022-06-23	2022-06-23	2022-06-23 23:40:44.099892+05:30	2022-06-24 02:40:35.041221+05:30	3
11	1	on			2022-06-23 23:40:44.099892+05:30	2022-06-24 03:53:28.710351+05:30	3
\.


--
-- Name: library_staff_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.library_staff_details_id_seq', 102, true);


--
-- Data for Name: library_staff_information; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.library_staff_information (id, staff_flag, user_id_id) FROM stdin;
2	t	3
\.


--
-- Data for Name: library_user_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.library_user_details (id, book_id, notify_me, created_at, updated_at, user_id_id, add_remove) FROM stdin;
7	1	on	2022-06-23 23:40:44.099892+05:30	2022-06-23 23:45:20.610937+05:30	2	
9	2	on	2022-06-23 23:45:20.664857+05:30	2022-06-23 23:45:20.687241+05:30	2	
8	6		2022-06-23 23:45:20.628826+05:30	2022-06-23 23:47:01.505903+05:30	2	on
10	3		2022-06-23 23:45:20.721797+05:30	2022-06-24 11:43:00.354695+05:30	2	on
\.


--
-- Name: library_user_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.library_user_details_id_seq', 10, true);


--
-- Name: Library_Staff_information_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_staff_information
    ADD CONSTRAINT "Library_Staff_information_pkey" PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: library_book_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_book_details
    ADD CONSTRAINT library_book_details_pkey PRIMARY KEY (id);


--
-- Name: library_staff_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_staff_details
    ADD CONSTRAINT library_staff_details_pkey PRIMARY KEY (id);


--
-- Name: library_user_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_user_details
    ADD CONSTRAINT library_user_details_pkey PRIMARY KEY (id);


--
-- Name: Library_Staff_information_user_id_id_ffcf6f3b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "Library_Staff_information_user_id_id_ffcf6f3b" ON public.library_staff_information USING btree (user_id_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: library_staff_details_user_id_id_ea875dce; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX library_staff_details_user_id_id_ea875dce ON public.library_staff_details USING btree (user_id_id);


--
-- Name: library_user_details_user_id_id_d55b59fe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX library_user_details_user_id_id_d55b59fe ON public.library_user_details USING btree (user_id_id);


--
-- Name: Library_Staff_information_user_id_id_ffcf6f3b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_staff_information
    ADD CONSTRAINT "Library_Staff_information_user_id_id_ffcf6f3b_fk_auth_user_id" FOREIGN KEY (user_id_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: library_staff_details_user_id_id_ea875dce_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_staff_details
    ADD CONSTRAINT library_staff_details_user_id_id_ea875dce_fk_auth_user_id FOREIGN KEY (user_id_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: library_user_details_user_id_id_d55b59fe_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.library_user_details
    ADD CONSTRAINT library_user_details_user_id_id_d55b59fe_fk_auth_user_id FOREIGN KEY (user_id_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


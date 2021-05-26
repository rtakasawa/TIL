--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: suketa
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO suketa;

--
-- Name: blogs; Type: TABLE; Schema: public; Owner: suketa
--

CREATE TABLE public.blogs (
    id bigint NOT NULL,
    title character varying,
    content text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.blogs OWNER TO suketa;

--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: public; Owner: suketa
--

CREATE SEQUENCE public.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blogs_id_seq OWNER TO suketa;

--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: suketa
--

ALTER SEQUENCE public.blogs_id_seq OWNED BY public.blogs.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: suketa
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO suketa;

--
-- Name: scores; Type: TABLE; Schema: public; Owner: suketa
--

CREATE TABLE public.scores (
    id bigint NOT NULL,
    name character varying,
    subject character varying,
    score integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.scores OWNER TO suketa;

--
-- Name: scores_id_seq; Type: SEQUENCE; Schema: public; Owner: suketa
--

CREATE SEQUENCE public.scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scores_id_seq OWNER TO suketa;

--
-- Name: scores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: suketa
--

ALTER SEQUENCE public.scores_id_seq OWNED BY public.scores.id;


--
-- Name: blogs id; Type: DEFAULT; Schema: public; Owner: suketa
--

ALTER TABLE ONLY public.blogs ALTER COLUMN id SET DEFAULT nextval('public.blogs_id_seq'::regclass);


--
-- Name: scores id; Type: DEFAULT; Schema: public; Owner: suketa
--

ALTER TABLE ONLY public.scores ALTER COLUMN id SET DEFAULT nextval('public.scores_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: suketa
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2021-05-25 02:59:21.701528	2021-05-25 02:59:21.701528
\.


--
-- Data for Name: blogs; Type: TABLE DATA; Schema: public; Owner: suketa
--

COPY public.blogs (id, title, content, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: suketa
--

COPY public.schema_migrations (version) FROM stdin;
20210525025857
20210525030048
\.


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: suketa
--

COPY public.scores (id, name, subject, score, created_at, updated_at) FROM stdin;
1	nakai	English	65	2021-05-25 03:01:01.780279	2021-05-25 03:01:01.780279
2	nakai	Math	70	2021-05-25 03:01:01.783148	2021-05-25 03:01:01.783148
3	nakai	Science	40	2021-05-25 03:01:01.784915	2021-05-25 03:01:01.784915
4	nakai	Music	95	2021-05-25 03:01:01.786528	2021-05-25 03:01:01.786528
5	kimura	English	55	2021-05-25 03:01:01.788417	2021-05-25 03:01:01.788417
6	kimura	Math	65	2021-05-25 03:01:01.790191	2021-05-25 03:01:01.790191
7	kimura	Science	75	2021-05-25 03:01:01.791987	2021-05-25 03:01:01.791987
8	kimura	Music	60	2021-05-25 03:01:01.793756	2021-05-25 03:01:01.793756
9	kusanagi	English	50	2021-05-25 03:01:01.795344	2021-05-25 03:01:01.795344
10	kusanagi	Math	90	2021-05-25 03:01:01.796799	2021-05-25 03:01:01.796799
11	kusanagi	Science	85	2021-05-25 03:01:01.798627	2021-05-25 03:01:01.798627
12	kusanagi	Music	75	2021-05-25 03:01:01.800561	2021-05-25 03:01:01.800561
13	inagaki	English	30	2021-05-25 03:01:01.802279	2021-05-25 03:01:01.802279
14	inagaki	Math	90	2021-05-25 03:01:01.803836	2021-05-25 03:01:01.803836
15	inagaki	Science	90	2021-05-25 03:01:01.805233	2021-05-25 03:01:01.805233
16	inagaki	Music	80	2021-05-25 03:01:01.806646	2021-05-25 03:01:01.806646
17	katori	English	40	2021-05-25 03:01:01.80821	2021-05-25 03:01:01.80821
18	katori	Math	80	2021-05-25 03:01:01.809923	2021-05-25 03:01:01.809923
19	katori	Science	75	2021-05-25 03:01:01.811687	2021-05-25 03:01:01.811687
20	katori	Music	70	2021-05-25 03:01:01.813527	2021-05-25 03:02:17.793433
21	DIVE	English	90	2021-05-25 03:03:35.951216	2021-05-25 03:03:35.951216
\.


--
-- Name: blogs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: suketa
--

SELECT pg_catalog.setval('public.blogs_id_seq', 1, false);


--
-- Name: scores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: suketa
--

SELECT pg_catalog.setval('public.scores_id_seq', 21, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: suketa
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: public; Owner: suketa
--

ALTER TABLE ONLY public.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: suketa
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: suketa
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


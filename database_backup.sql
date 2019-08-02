--
-- PostgreSQL database dump
--

-- Dumped from database version 11.4
-- Dumped by pg_dump version 11.4

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

SET default_with_oids = false;

--
-- Name: project; Type: TABLE; Schema: public; Owner: taebum
--

CREATE TABLE public.project (
    id integer NOT NULL,
    title character varying NOT NULL
);


ALTER TABLE public.project OWNER TO taebum;

--
-- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: taebum
--

CREATE SEQUENCE public.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.project_id_seq OWNER TO taebum;

--
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taebum
--

ALTER SEQUENCE public.project_id_seq OWNED BY public.project.id;


--
-- Name: volunteer; Type: TABLE; Schema: public; Owner: taebum
--

CREATE TABLE public.volunteer (
    id integer NOT NULL,
    project_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.volunteer OWNER TO taebum;

--
-- Name: volunteer_id_seq; Type: SEQUENCE; Schema: public; Owner: taebum
--

CREATE SEQUENCE public.volunteer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.volunteer_id_seq OWNER TO taebum;

--
-- Name: volunteer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: taebum
--

ALTER SEQUENCE public.volunteer_id_seq OWNED BY public.volunteer.id;


--
-- Name: project id; Type: DEFAULT; Schema: public; Owner: taebum
--

ALTER TABLE ONLY public.project ALTER COLUMN id SET DEFAULT nextval('public.project_id_seq'::regclass);


--
-- Name: volunteer id; Type: DEFAULT; Schema: public; Owner: taebum
--

ALTER TABLE ONLY public.volunteer ALTER COLUMN id SET DEFAULT nextval('public.volunteer_id_seq'::regclass);


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: taebum
--

COPY public.project (id, title) FROM stdin;
\.


--
-- Data for Name: volunteer; Type: TABLE DATA; Schema: public; Owner: taebum
--

COPY public.volunteer (id, project_id, name) FROM stdin;
\.


--
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taebum
--

SELECT pg_catalog.setval('public.project_id_seq', 1, false);


--
-- Name: volunteer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: taebum
--

SELECT pg_catalog.setval('public.volunteer_id_seq', 1, false);


--
-- Name: project project_pk; Type: CONSTRAINT; Schema: public; Owner: taebum
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pk PRIMARY KEY (id);


--
-- Name: volunteer volunteer_pk; Type: CONSTRAINT; Schema: public; Owner: taebum
--

ALTER TABLE ONLY public.volunteer
    ADD CONSTRAINT volunteer_pk PRIMARY KEY (id);


--
-- Name: volunteer volunteer_fk0; Type: FK CONSTRAINT; Schema: public; Owner: taebum
--

ALTER TABLE ONLY public.volunteer
    ADD CONSTRAINT volunteer_fk0 FOREIGN KEY (project_id) REFERENCES public.project(id);


--
-- PostgreSQL database dump complete
--


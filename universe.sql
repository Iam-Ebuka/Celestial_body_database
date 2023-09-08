
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_types text,
    galaxy_shapes character varying(40),
    designation character varying(40)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: metaroids; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.metaroids (
    metaroids_id integer NOT NULL,
    gravity integer,
    galaxy_id integer,
    wormhole boolean DEFAULT false NOT NULL,
    name character varying(23) DEFAULT 'rock'::character varying
);


ALTER TABLE public.metaroids OWNER TO freecodecamp;

--
-- Name: metaroids_metaroids_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.metaroids_metaroids_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metaroids_metaroids_id_seq OWNER TO freecodecamp;

--
-- Name: metaroids_metaroids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.metaroids_metaroids_id_seq OWNED BY public.metaroids.metaroids_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_planet_km integer,
    size_of_moon_in_km numeric(8,2),
    orbital_period_in_days numeric(8,2),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    distance_from_earth integer,
    number_of_moon integer,
    size_of_planet numeric(4,1),
    is_spherical boolean,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    color character varying(40),
    temperature_in_kelvin numeric(8,1),
    class text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: metaroids metaroids_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.metaroids ALTER COLUMN metaroids_id SET DEFAULT nextval('public.metaroids_metaroids_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Black Eye', 'Coma Berenices', 'like an eye', 'Evil Eye Galaxy, M64, NGC 4826');
INSERT INTO public.galaxy VALUES (2, 'Butterfly', 'Virgo', 'Butterfly wings', 'NGC 4567');
INSERT INTO public.galaxy VALUES (3, 'Ciger', 'Ursa Major', 'Cigar', 'NGC 3034');
INSERT INTO public.galaxy VALUES (4, 'Comet', 'Sculptor', 'Comet', 'VCC 1217');
INSERT INTO public.galaxy VALUES (5, 'Milkyway', NULL, 'A band of light', NULL);
INSERT INTO public.galaxy VALUES (6, 'Tadpole', 'Draco', 'Tadpole', 'NGC 5055');


--
-- Data for Name: metaroids; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.metaroids VALUES (1, 17, NULL, false, 'rock');
INSERT INTO public.metaroids VALUES (2, 18, NULL, false, 'rock');
INSERT INTO public.metaroids VALUES (3, 19, NULL, false, 'rock');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'luna', 384400, 3475.10, 27.30, 2);
INSERT INTO public.moon VALUES (2, 'Deimos', 23460, 12.40, 1.70, 3);
INSERT INTO public.moon VALUES (3, 'Adrastea', 128980, 416.10, 0.30, 6);
INSERT INTO public.moon VALUES (4, 'Aitne', 23547000, 3.00, 736.00, 6);
INSERT INTO public.moon VALUES (5, 'Callisto', 1883000, 4800.10, 16.70, 6);
INSERT INTO public.moon VALUES (6, 'Carpo', 17100000, 3.20, 456.50, 6);
INSERT INTO public.moon VALUES (7, 'Chaldene', 23179000, 3.80, 741.00, 6);
INSERT INTO public.moon VALUES (8, 'Cyllene', 24000000, 2.10, 737.80, 6);
INSERT INTO public.moon VALUES (9, 'Elara', 11737000, 80.10, 259.70, 6);
INSERT INTO public.moon VALUES (10, 'Eurydome', 670900, 3126.10, 3.60, 6);
INSERT INTO public.moon VALUES (11, 'Canymede', 1070000, 5276.10, 7.20, 6);
INSERT INTO public.moon VALUES (12, 'Harpalyke', 21105000, 4.30, 595.20, 6);
INSERT INTO public.moon VALUES (13, 'Hegemone', 24514095, 3.10, 781.60, 6);
INSERT INTO public.moon VALUES (14, 'Helike', 10972830, 4.20, 2333.80, 6);
INSERT INTO public.moon VALUES (15, 'Hermippe', 21252000, 4.10, 630.10, 6);
INSERT INTO public.moon VALUES (16, 'Kale', 23124000, 2.10, 609.10, 6);
INSERT INTO public.moon VALUES (17, 'Leda', 11094000, 10.10, 238.70, 6);
INSERT INTO public.moon VALUES (18, 'Aigir', 20735000, 6.10, 116.50, 4);
INSERT INTO public.moon VALUES (19, 'Ariel', 191240, 1160.20, 2.50, 7);
INSERT INTO public.moon VALUES (20, 'Despina', 62000, 160.20, 0.40, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Venus', 40, NULL, 460.2, true, false, 3);
INSERT INTO public.planet VALUES (2, 'Earth', NULL, 1, 510.1, true, true, 3);
INSERT INTO public.planet VALUES (3, 'Mars', 56, 2, 144.4, true, false, 3);
INSERT INTO public.planet VALUES (4, 'Saturn', 43, 62, 42.7, true, false, 3);
INSERT INTO public.planet VALUES (5, 'Neptune', 56, 14, 7.6, true, false, 3);
INSERT INTO public.planet VALUES (6, 'Jupiter', 592, 67, 61.4, true, false, 3);
INSERT INTO public.planet VALUES (7, 'Uranus', 287, 27, 8.1, true, false, 3);
INSERT INTO public.planet VALUES (8, 'Mercury', 83, NULL, 74.8, true, false, 3);
INSERT INTO public.planet VALUES (9, 'Eris', NULL, 1, NULL, true, false, 1);
INSERT INTO public.planet VALUES (10, 'Haumea', NULL, 2, NULL, true, false, 4);
INSERT INTO public.planet VALUES (11, 'Pluto', 51099, 5, 423.4, true, false, 3);
INSERT INTO public.planet VALUES (12, 'Gliese', 192000, NULL, 33.1, true, false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Rigel', 'Blue', 25000.2, 'O', 5);
INSERT INTO public.star VALUES (2, 'Sirius', 'Blue-White', 10000.3, 'F', 5);
INSERT INTO public.star VALUES (3, 'Sun', 'Yellow', 6000.2, 'G', 5);
INSERT INTO public.star VALUES (4, 'Aldebaran', 'Orange', 4000.1, 'K', 5);
INSERT INTO public.star VALUES (6, 'Spica', 'Blue', 25000.1, 'O', 5);
INSERT INTO public.star VALUES (5, 'Antares', 'Red', 3000.0, 'M', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: metaroids_metaroids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.metaroids_metaroids_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_designation_key UNIQUE (designation);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: metaroids metaroids_gravity_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.metaroids
    ADD CONSTRAINT metaroids_gravity_key UNIQUE (gravity);


--
-- Name: metaroids metaroids_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.metaroids
    ADD CONSTRAINT metaroids_pkey PRIMARY KEY (metaroids_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    diameter_in_km integer,
    is_potentially_hazardous boolean,
    age_in_millions_of_years numeric
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years numeric,
    has_life boolean,
    number_of_stars integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    description text NOT NULL,
    is_spherical boolean,
    age_in_millions_of_years numeric,
    diameter_in_km integer
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    description text NOT NULL,
    has_life boolean,
    age_in_millions_of_years numeric,
    planet_types character varying(30)
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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years numeric,
    is_spherical boolean,
    temperature integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'The largest object in the asteroid belt', 940, false, 4500);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'One of the largest asteroids in the solar system', 525, false, 4500);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'A large asteroid in the asteroid belt', 512, false, 4500);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, true, 200000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy to the Milky Way', 10000, false, 1000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A spiral galaxy in the Local Group', 10000, false, 40000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'A famous spiral galaxy', 13000, false, 100000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'A galaxy with a bright central bulge', 13000, false, 80000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'A large face-on spiral galaxy', 13000, false, 100000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Earth natural satellite', true, 4500, 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'One of the two moons of Mars', false, 4500, 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'The smaller moon of Mars', false, 4500, 12);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'A volcanic moon of Jupiter', true, 4500, 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'An icy moon of Jupiter', true, 4500, 3122);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'The largest moon in the solar system', true, 4500, 5268);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'An ancient moon of Jupiter', true, 4500, 4821);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'A moon with a thick atmosphere', true, 4500, 5150);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 'A moon of Saturn', true, 4500, 1528);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 'A two-toned moon of Saturn', true, 4500, 1469);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 'An icy moon of Saturn', true, 4500, 1123);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 'A moon with a large impact crater', true, 4500, 1062);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 'An icy moon with water plumes', true, 4500, 504);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 'A moon with a large crater', true, 4500, 396);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 'A moon of Uranus', true, 4500, 471);
INSERT INTO public.moon VALUES (16, 'Ariel', 7, 'An icy moon of Uranus', true, 4500, 1158);
INSERT INTO public.moon VALUES (17, 'Umbriel', 7, 'A dark moon of Uranus', true, 4500, 1169);
INSERT INTO public.moon VALUES (18, 'Titania', 7, 'The largest moon of Uranus', true, 4500, 1578);
INSERT INTO public.moon VALUES (19, 'Oberon', 7, 'An outer moon of Uranus', true, 4500, 1523);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 'The largest moon of Neptune', true, 4500, 2707);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'The smallest planet in our solar system', false, 4500, 'Terrestrial');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'The hottest planet in our solar system', false, 4500, 'Terrestrial');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Our home planet', true, 4500, 'Terrestrial');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'The red planet', false, 4500, 'Terrestrial');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'The largest planet in our solar system', false, 4500, 'Gas Giant');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'A gas giant with prominent rings', false, 4500, 'Gas Giant');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'An ice giant with a tilted rotation axis', false, 4500, 'Ice Giant');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'The farthest known planet in our solar system', false, 4500, 'Ice Giant');
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 'An exoplanet orbiting Proxima Centauri', false, 5000, 'Terrestrial');
INSERT INTO public.planet VALUES (10, 'Vega b', 6, 'A fictional example of an exoplanet', false, 1000, 'Gas Giant');
INSERT INTO public.planet VALUES (11, 'Sirius b', 2, 'A fictional example of an exoplanet', false, 2000, 'Terrestrial');
INSERT INTO public.planet VALUES (12, 'Rigel b', 5, 'A fictional example of an exoplanet', false, 3000, 'Gas Giant');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'The star at the center of our solar system', 4600, true, 5500);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'The brightest star in the night sky', 242, true, 9940);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'A red supergiant star', 10, true, 3500);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'The closest star to the Sun', 4850, true, 3042);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 'A blue supergiant star', 8, true, 11000);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'A bright star in the constellation Lyra', 455, true, 9600);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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


--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: alien; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.alien (
    alien_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years numeric NOT NULL,
    multicellular boolean NOT NULL,
    intelligent boolean NOT NULL,
    distance_from_earth numeric NOT NULL,
    number_of_stars integer,
    civilization_type integer,
    planet_id integer
);


ALTER TABLE public.alien OWNER TO freecodecamp;

--
-- Name: alien_alien_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.alien_alien_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alien_alien_id_seq OWNER TO freecodecamp;

--
-- Name: alien_alien_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.alien_alien_id_seq OWNED BY public.alien.alien_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth numeric NOT NULL,
    number_of_stars integer,
    highest_civilization_type integer
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth numeric NOT NULL,
    number_of_stars integer,
    highest_civilization_type integer,
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth numeric NOT NULL,
    number_of_stars integer,
    highest_civilization_type integer,
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
    name character varying(50) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years numeric NOT NULL,
    distance_from_earth numeric NOT NULL,
    number_of_stars integer,
    highest_civilization_type integer,
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
-- Name: alien alien_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alien ALTER COLUMN alien_id SET DEFAULT nextval('public.alien_alien_id_seq'::regclass);


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
-- Data for Name: alien; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.alien VALUES (110, 'Zogglar', 'Insectoid creatures', 300, true, true, 10, 1, 1, 1);
INSERT INTO public.alien VALUES (111, 'Gravorex', 'Rock-like beings', 150, false, true, 20, 2, 2, 2);
INSERT INTO public.alien VALUES (112, 'Quilnix', 'Jellyfish-like aliens', 450, true, false, 30, 1, 1, 3);
INSERT INTO public.alien VALUES (113, 'Xandrax', 'Reptilian humanoids', 200, true, true, 40, 3, 3, 4);
INSERT INTO public.alien VALUES (114, 'Velnorians', 'Advanced aquatic race', 500, true, true, 50, 1, 2, 5);
INSERT INTO public.alien VALUES (115, 'Sparxan', 'Insect-like aliens', 300, true, true, 60, 2, 1, 6);
INSERT INTO public.alien VALUES (116, 'Nivarian', 'Avian creatures', 400, true, true, 70, 3, 3, 7);
INSERT INTO public.alien VALUES (117, 'Cydonians', 'Robotic race', 600, false, true, 80, 1, 2, 8);
INSERT INTO public.alien VALUES (118, 'Lunari', 'Lunar-dwelling beings', 100, false, false, 90, 2, 1, 9);
INSERT INTO public.alien VALUES (119, 'Epsiloni', 'Energy-based life forms', 800, false, true, 100, 1, 3, 10);
INSERT INTO public.alien VALUES (120, 'Zentari', 'Sentient plants', 700, true, true, 110, 2, 2, 11);
INSERT INTO public.alien VALUES (121, 'Draconia', 'Lizard-like creatures', 400, true, true, 120, 3, 1, 12);
INSERT INTO public.alien VALUES (122, 'Kelthori', 'Four-armed beings', 300, true, true, 130, 1, 3, 1);
INSERT INTO public.alien VALUES (123, 'Nebulan', 'Gas-based life forms', 500, false, true, 140, 2, 2, 2);
INSERT INTO public.alien VALUES (124, 'Vardoria', 'Hive-minded race', 200, true, true, 150, 1, 1, 3);
INSERT INTO public.alien VALUES (125, 'Andromed', 'Energy beings', 600, false, true, 160, 3, 3, 4);
INSERT INTO public.alien VALUES (126, 'Tauria', 'Bull-like beings', 400, true, false, 170, 1, 2, 5);
INSERT INTO public.alien VALUES (127, 'Aquaria', 'Water-based aliens', 300, true, true, 180, 2, 1, 6);
INSERT INTO public.alien VALUES (128, 'Orionit', 'Lion-like creatures', 700, true, true, 190, 3, 3, 7);
INSERT INTO public.alien VALUES (129, 'Centauri', 'Centaur-like race', 800, true, true, 200, 1, 2, 8);
INSERT INTO public.alien VALUES (130, 'Pyrocli', 'Fire-dwelling beings', 150, false, true, 210, 2, 1, 9);
INSERT INTO public.alien VALUES (131, 'Flerion', 'Gas-based entities', 300, false, false, 220, 3, 2, 10);
INSERT INTO public.alien VALUES (132, 'Vesperi', 'Insectoid creatures', 250, true, true, 230, 2, 2, 11);
INSERT INTO public.alien VALUES (133, 'Libraria', 'Book-loving aliens', 400, true, true, 240, 1, 1, 12);
INSERT INTO public.alien VALUES (134, 'Caelia', 'Winged beings', 600, true, true, 250, 2, 3, 1);
INSERT INTO public.alien VALUES (135, 'Canids', 'Canine-like creatures', 350, true, true, 260, 3, 2, 2);
INSERT INTO public.alien VALUES (136, 'Epsilon', 'Energy-based life forms', 800, false, true, 270, 1, 1, 3);
INSERT INTO public.alien VALUES (137, 'Velnor', 'Advanced aquatic race', 500, true, true, 280, 2, 3, 4);
INSERT INTO public.alien VALUES (138, 'Aquari', 'Water-based aliens', 300, true, true, 290, 1, 2, 5);
INSERT INTO public.alien VALUES (139, 'Nebula', 'Gas-based life forms', 400, false, true, 300, 2, 1, 6);
INSERT INTO public.alien VALUES (140, 'Zoggl', 'Insectoid creatures', 300, true, true, 310, 3, 3, 7);
INSERT INTO public.alien VALUES (141, 'Gravor', 'Rock-like beings', 150, false, true, 320, 1, 2, 8);
INSERT INTO public.alien VALUES (142, 'Tauri', 'Bull-like beings', 400, true, false, 330, 2, 1, 9);
INSERT INTO public.alien VALUES (143, 'Xandr', 'Reptilian humanoids', 200, true, true, 340, 3, 3, 10);
INSERT INTO public.alien VALUES (144, 'Vardo', 'Hive-minded race', 200, true, true, 350, 1, 2, 11);
INSERT INTO public.alien VALUES (145, 'Zenta', 'Sentient plants', 700, true, true, 360, 2, 1, 12);
INSERT INTO public.alien VALUES (146, 'Nivar', 'Avian creatures', 400, true, true, 370, 3, 3, 1);
INSERT INTO public.alien VALUES (147, 'Cydon', 'Robotic race', 600, false, true, 380, 1, 2, 2);
INSERT INTO public.alien VALUES (148, 'Nova', 'Insect-like aliens', 300, true, true, 390, 2, 1, 3);
INSERT INTO public.alien VALUES (149, 'Kelthor', 'Four-armed beings', 300, true, true, 400, 3, 3, 4);
INSERT INTO public.alien VALUES (150, 'Libra', 'Book-loving aliens', 400, true, true, 410, 1, 2, 5);
INSERT INTO public.alien VALUES (151, 'Orion', 'Lion-like creatures', 700, true, true, 420, 2, 1, 6);
INSERT INTO public.alien VALUES (152, 'Centau', 'Centaur-like race', 800, true, true, 430, 3, 2, 8);
INSERT INTO public.alien VALUES (153, 'Pyroc', 'Fire-dwelling beings', 150, false, true, 440, 1, 1, 9);
INSERT INTO public.alien VALUES (154, 'Draco', 'Lizard-like creatures', 400, true, true, 450, 2, 1, 10);
INSERT INTO public.alien VALUES (155, 'Vesper', 'Insectoid creatures', 250, true, true, 460, 3, 3, 11);
INSERT INTO public.alien VALUES (156, 'Fleri', 'Gas-based entities', 300, false, false, 470, 2, 2, 12);
INSERT INTO public.alien VALUES (157, 'Andro', 'Energy beings', 600, false, true, 480, 1, 1, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy with spiral arms', true, false, 10000, 100000, 200000, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Largest nearby galaxy, spiral structure', true, false, 10000, 2537000, 1000000, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Smaller spiral galaxy near Andromeda', false, false, 4000, 3000000, 40000, NULL);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Giant elliptical galaxy with black hole', false, false, 6000, 53000000, 100000, NULL);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Irregular galaxy companion to Milky Way', false, false, 1000, 163000, 30000, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Spiral galaxy with a bright nucleus and dust lane', false, false, 9000, 29000000, 100000, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Earth natural satellite', false, true, 4600, 0, NULL, NULL, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Martian moon', false, true, 4600, 0, NULL, NULL, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Martian moon', false, true, 4600, 0, NULL, NULL, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Largest moon in the solar system', false, true, 4600, 0, NULL, NULL, 3);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Moon of Jupiter', false, true, 4600, 0, NULL, NULL, 4);
INSERT INTO public.moon VALUES (6, 'Titan', 'Largest moon of Saturn', false, true, 4600, 0, NULL, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Triton', 'Neptune largest moon', false, true, 4600, 0, NULL, NULL, 6);
INSERT INTO public.moon VALUES (8, 'Io', 'One of Jupiter Galilean moons', false, true, 4600, 0, NULL, NULL, 4);
INSERT INTO public.moon VALUES (9, 'Europa', 'One of Jupiter Galilean moons', false, true, 4600, 0, NULL, NULL, 4);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'Moon of Saturn with subsurface oceans', false, true, 4600, 0, NULL, NULL, 5);
INSERT INTO public.moon VALUES (11, 'Charon', 'Pluto largest moon', false, true, 4600, 0, NULL, NULL, 7);
INSERT INTO public.moon VALUES (12, 'Phoebe', 'Moon of Saturn with retrograde orbit', false, true, 4600, 0, NULL, NULL, 5);
INSERT INTO public.moon VALUES (13, 'Miranda', 'One of Uranus five major moons', false, true, 4600, 0, NULL, NULL, 8);
INSERT INTO public.moon VALUES (14, 'Oberon', 'Moon of Uranus', false, true, 4600, 0, NULL, NULL, 8);
INSERT INTO public.moon VALUES (15, 'Ariel', 'Moon of Uranus', false, true, 4600, 0, NULL, NULL, 8);
INSERT INTO public.moon VALUES (16, 'Titania', 'Moon of Uranus', false, true, 4600, 0, NULL, NULL, 8);
INSERT INTO public.moon VALUES (17, 'Rhea', 'Moon of Saturn', false, true, 4600, 0, NULL, NULL, 5);
INSERT INTO public.moon VALUES (18, 'Dione', 'Moon of Saturn', false, true, 4600, 0, NULL, NULL, 5);
INSERT INTO public.moon VALUES (19, 'Hyperion', 'Moon of Saturn', false, true, 4600, 0, NULL, NULL, 5);
INSERT INTO public.moon VALUES (20, 'Iapetus', 'Moon of Saturn with distinctive two-tone color', false, true, 4600, 0, NULL, NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet', true, true, 4600, 0, NULL, NULL, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The red planet', false, true, 4600, 0, NULL, NULL, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 'The hottest planet in our solar system', false, true, 4600, 0, NULL, NULL, 3);
INSERT INTO public.planet VALUES (4, 'Jupiter', 'The largest planet in our solar system', false, false, 4600, 0, NULL, NULL, 4);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Known for its stunning rings', false, false, 4600, 0, NULL, NULL, 5);
INSERT INTO public.planet VALUES (6, 'Neptune', 'The farthest planet from the Sun', false, false, 4600, 0, NULL, NULL, 6);
INSERT INTO public.planet VALUES (7, 'Kepler-186f', 'An exoplanet in the habitable zone', true, true, 1, 500, NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'Gliese 581g', 'Another potentially habitable exoplanet', true, true, 5, 20, NULL, NULL, 2);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1d', 'Part of the TRAPPIST-1 star system', true, true, 4, 39, NULL, NULL, 3);
INSERT INTO public.planet VALUES (10, 'HD 40307g', 'A super-Earth exoplanet', false, true, 5, 42, NULL, NULL, 4);
INSERT INTO public.planet VALUES (11, 'Mercury', 'Closest planet to the Sun', false, true, 4600, 0, NULL, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Uranus', 'Seventh planet from the Sun', false, true, 4600, 0, NULL, NULL, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our closest star, source of light and energy', false, true, 4600, 0, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 'Brightest star in the night sky', false, true, 240, 8, NULL, NULL, 2);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 'Closest star system to Earth', false, true, 600, 4, NULL, NULL, 3);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red supergiant in Orions shoulder', false, false, 8, 0, NULL, NULL, 4);
INSERT INTO public.star VALUES (5, 'Vega', 'Bright star in the Lyra constellation', false, true, 455, 25, NULL, NULL, 5);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Closest known star to the Sun', false, true, 5, 4, NULL, NULL, 1);


--
-- Name: alien_alien_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.alien_alien_id_seq', 157, true);


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
-- Name: alien alien_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alien
    ADD CONSTRAINT alien_name_key UNIQUE (name);


--
-- Name: alien alien_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alien
    ADD CONSTRAINT alien_pkey PRIMARY KEY (alien_id);


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
-- Name: alien alien_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.alien
    ADD CONSTRAINT alien_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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


--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 4, 2);
INSERT INTO public.games VALUES (2, 5, 2);
INSERT INTO public.games VALUES (3, 3, 2);
INSERT INTO public.games VALUES (4, 3, 2);
INSERT INTO public.games VALUES (5, 929, 3);
INSERT INTO public.games VALUES (6, 748, 3);
INSERT INTO public.games VALUES (7, 727, 4);
INSERT INTO public.games VALUES (8, 69, 4);
INSERT INTO public.games VALUES (9, 384, 3);
INSERT INTO public.games VALUES (10, 121, 3);
INSERT INTO public.games VALUES (11, 180, 3);
INSERT INTO public.games VALUES (12, 431, 5);
INSERT INTO public.games VALUES (13, 554, 5);
INSERT INTO public.games VALUES (14, 4, 6);
INSERT INTO public.games VALUES (15, 584, 6);
INSERT INTO public.games VALUES (16, 175, 5);
INSERT INTO public.games VALUES (17, 989, 5);
INSERT INTO public.games VALUES (18, 623, 5);
INSERT INTO public.games VALUES (19, 831, 7);
INSERT INTO public.games VALUES (20, 745, 7);
INSERT INTO public.games VALUES (21, 536, 8);
INSERT INTO public.games VALUES (22, 982, 8);
INSERT INTO public.games VALUES (23, 773, 7);
INSERT INTO public.games VALUES (24, 844, 7);
INSERT INTO public.games VALUES (25, 99, 7);
INSERT INTO public.games VALUES (26, 580, 9);
INSERT INTO public.games VALUES (27, 49, 9);
INSERT INTO public.games VALUES (28, 944, 10);
INSERT INTO public.games VALUES (29, 700, 10);
INSERT INTO public.games VALUES (30, 306, 9);
INSERT INTO public.games VALUES (31, 290, 9);
INSERT INTO public.games VALUES (32, 115, 9);
INSERT INTO public.games VALUES (33, 2, 11);
INSERT INTO public.games VALUES (34, 9, 12);
INSERT INTO public.games VALUES (35, 717, 12);
INSERT INTO public.games VALUES (36, 580, 13);
INSERT INTO public.games VALUES (37, 333, 13);
INSERT INTO public.games VALUES (38, 732, 12);
INSERT INTO public.games VALUES (39, 894, 12);
INSERT INTO public.games VALUES (40, 143, 12);
INSERT INTO public.games VALUES (41, 943, 14);
INSERT INTO public.games VALUES (42, 691, 14);
INSERT INTO public.games VALUES (43, 48, 15);
INSERT INTO public.games VALUES (44, 583, 15);
INSERT INTO public.games VALUES (45, 580, 14);
INSERT INTO public.games VALUES (46, 510, 14);
INSERT INTO public.games VALUES (47, 889, 14);
INSERT INTO public.games VALUES (48, 502, 16);
INSERT INTO public.games VALUES (49, 335, 16);
INSERT INTO public.games VALUES (50, 665, 17);
INSERT INTO public.games VALUES (51, 364, 17);
INSERT INTO public.games VALUES (52, 732, 16);
INSERT INTO public.games VALUES (53, 578, 16);
INSERT INTO public.games VALUES (54, 964, 16);
INSERT INTO public.games VALUES (55, 647, 18);
INSERT INTO public.games VALUES (56, 34, 18);
INSERT INTO public.games VALUES (57, 679, 19);
INSERT INTO public.games VALUES (58, 788, 19);
INSERT INTO public.games VALUES (59, 255, 18);
INSERT INTO public.games VALUES (60, 602, 18);
INSERT INTO public.games VALUES (61, 752, 18);
INSERT INTO public.games VALUES (62, 6, 1);
INSERT INTO public.games VALUES (63, 767, 20);
INSERT INTO public.games VALUES (64, 429, 20);
INSERT INTO public.games VALUES (65, 449, 21);
INSERT INTO public.games VALUES (66, 307, 21);
INSERT INTO public.games VALUES (67, 810, 20);
INSERT INTO public.games VALUES (68, 413, 20);
INSERT INTO public.games VALUES (69, 504, 20);
INSERT INTO public.games VALUES (70, 8, 1);
INSERT INTO public.games VALUES (71, 826, 22);
INSERT INTO public.games VALUES (72, 667, 22);
INSERT INTO public.games VALUES (73, 401, 23);
INSERT INTO public.games VALUES (74, 703, 23);
INSERT INTO public.games VALUES (75, 518, 22);
INSERT INTO public.games VALUES (76, 226, 22);
INSERT INTO public.games VALUES (77, 407, 22);
INSERT INTO public.games VALUES (78, 303, 24);
INSERT INTO public.games VALUES (79, 128, 24);
INSERT INTO public.games VALUES (80, 338, 25);
INSERT INTO public.games VALUES (81, 517, 25);
INSERT INTO public.games VALUES (82, 213, 24);
INSERT INTO public.games VALUES (83, 366, 24);
INSERT INTO public.games VALUES (84, 261, 24);
INSERT INTO public.games VALUES (85, 229, 33);
INSERT INTO public.games VALUES (86, 419, 33);
INSERT INTO public.games VALUES (87, 666, 34);
INSERT INTO public.games VALUES (88, 714, 34);
INSERT INTO public.games VALUES (89, 638, 33);
INSERT INTO public.games VALUES (90, 280, 33);
INSERT INTO public.games VALUES (91, 481, 33);
INSERT INTO public.games VALUES (92, 12, 2);
INSERT INTO public.games VALUES (93, 166, 35);
INSERT INTO public.games VALUES (94, 20, 35);
INSERT INTO public.games VALUES (95, 243, 36);
INSERT INTO public.games VALUES (96, 260, 36);
INSERT INTO public.games VALUES (97, 560, 35);
INSERT INTO public.games VALUES (98, 56, 35);
INSERT INTO public.games VALUES (99, 224, 35);
INSERT INTO public.games VALUES (100, 789, 37);
INSERT INTO public.games VALUES (101, 73, 37);
INSERT INTO public.games VALUES (102, 57, 38);
INSERT INTO public.games VALUES (103, 17, 38);
INSERT INTO public.games VALUES (104, 782, 37);
INSERT INTO public.games VALUES (105, 86, 37);
INSERT INTO public.games VALUES (106, 171, 37);
INSERT INTO public.games VALUES (107, 77, 39);
INSERT INTO public.games VALUES (108, 273, 39);
INSERT INTO public.games VALUES (109, 112, 40);
INSERT INTO public.games VALUES (110, 54, 40);
INSERT INTO public.games VALUES (111, 352, 39);
INSERT INTO public.games VALUES (112, 669, 39);
INSERT INTO public.games VALUES (113, 55, 39);
INSERT INTO public.games VALUES (114, 780, 41);
INSERT INTO public.games VALUES (115, 123, 41);
INSERT INTO public.games VALUES (116, 708, 42);
INSERT INTO public.games VALUES (117, 892, 42);
INSERT INTO public.games VALUES (118, 883, 41);
INSERT INTO public.games VALUES (119, 75, 41);
INSERT INTO public.games VALUES (120, 442, 41);
INSERT INTO public.games VALUES (121, 716, 43);
INSERT INTO public.games VALUES (122, 717, 43);
INSERT INTO public.games VALUES (123, 863, 44);
INSERT INTO public.games VALUES (124, 528, 44);
INSERT INTO public.games VALUES (125, 494, 43);
INSERT INTO public.games VALUES (126, 308, 43);
INSERT INTO public.games VALUES (127, 390, 43);
INSERT INTO public.games VALUES (128, 558, 45);
INSERT INTO public.games VALUES (129, 208, 45);
INSERT INTO public.games VALUES (130, 256, 46);
INSERT INTO public.games VALUES (131, 738, 46);
INSERT INTO public.games VALUES (132, 352, 45);
INSERT INTO public.games VALUES (133, 291, 45);
INSERT INTO public.games VALUES (134, 910, 45);
INSERT INTO public.games VALUES (135, 761, 47);
INSERT INTO public.games VALUES (136, 889, 47);
INSERT INTO public.games VALUES (137, 839, 48);
INSERT INTO public.games VALUES (138, 954, 48);
INSERT INTO public.games VALUES (139, 874, 47);
INSERT INTO public.games VALUES (140, 606, 47);
INSERT INTO public.games VALUES (141, 507, 47);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'dheeraj');
INSERT INTO public.users VALUES (2, 'Test');
INSERT INTO public.users VALUES (3, 'user_1736420559467');
INSERT INTO public.users VALUES (4, 'user_1736420559466');
INSERT INTO public.users VALUES (5, 'user_1736420817580');
INSERT INTO public.users VALUES (6, 'user_1736420817579');
INSERT INTO public.users VALUES (7, 'user_1736420899437');
INSERT INTO public.users VALUES (8, 'user_1736420899436');
INSERT INTO public.users VALUES (9, 'user_1736420961886');
INSERT INTO public.users VALUES (10, 'user_1736420961885');
INSERT INTO public.users VALUES (11, 'Test1');
INSERT INTO public.users VALUES (12, 'user_1736421092205');
INSERT INTO public.users VALUES (13, 'user_1736421092204');
INSERT INTO public.users VALUES (14, 'user_1736421252456');
INSERT INTO public.users VALUES (15, 'user_1736421252455');
INSERT INTO public.users VALUES (16, 'user_1736421274501');
INSERT INTO public.users VALUES (17, 'user_1736421274500');
INSERT INTO public.users VALUES (18, 'user_1736421357172');
INSERT INTO public.users VALUES (19, 'user_1736421357171');
INSERT INTO public.users VALUES (20, 'user_1736421456698');
INSERT INTO public.users VALUES (21, 'user_1736421456697');
INSERT INTO public.users VALUES (22, 'user_1736421633898');
INSERT INTO public.users VALUES (23, 'user_1736421633897');
INSERT INTO public.users VALUES (24, 'user_1736421696065');
INSERT INTO public.users VALUES (25, 'user_1736421696064');
INSERT INTO public.users VALUES (26, 'user_1736421838015');
INSERT INTO public.users VALUES (28, 'user_1736421838014');
INSERT INTO public.users VALUES (33, 'user_1736421949185');
INSERT INTO public.users VALUES (34, 'user_1736421949184');
INSERT INTO public.users VALUES (35, 'user_1736422153170');
INSERT INTO public.users VALUES (36, 'user_1736422153169');
INSERT INTO public.users VALUES (37, 'user_1736422238369');
INSERT INTO public.users VALUES (38, 'user_1736422238368');
INSERT INTO public.users VALUES (39, 'user_1736422564988');
INSERT INTO public.users VALUES (40, 'user_1736422564987');
INSERT INTO public.users VALUES (41, 'user_1736422571201');
INSERT INTO public.users VALUES (42, 'user_1736422571200');
INSERT INTO public.users VALUES (43, 'user_1736422575783');
INSERT INTO public.users VALUES (44, 'user_1736422575782');
INSERT INTO public.users VALUES (45, 'user_1736422578305');
INSERT INTO public.users VALUES (46, 'user_1736422578304');
INSERT INTO public.users VALUES (47, 'user_1736422580699');
INSERT INTO public.users VALUES (48, 'user_1736422580698');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 141, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 48, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


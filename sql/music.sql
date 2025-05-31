--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
-- SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: music; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA music;


ALTER SCHEMA music OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: artist; Type: TABLE; Schema: music; Owner: postgres
--

CREATE TABLE music.artist (
    name character varying(50) NOT NULL,
    dateofbirth date
);


ALTER TABLE music.artist OWNER TO postgres;

--
-- Name: song; Type: TABLE; Schema: music; Owner: postgres
--

CREATE TABLE music.song (
    title character varying(50) NOT NULL,
    artistname character varying(50) NOT NULL,
    length bigint
);


ALTER TABLE music.song OWNER TO postgres;

--
-- Name: COLUMN song.length; Type: COMMENT; Schema: music; Owner: postgres
--

COMMENT ON COLUMN music.song.length IS 'in seconds';


--
-- Data for Name: artist; Type: TABLE DATA; Schema: music; Owner: postgres
--

INSERT INTO music.artist VALUES
  ('Bic Runga', '1976-01-13'),
  ('Billy Bragg', '1957-12-20');


--
-- Data for Name: song; Type: TABLE DATA; Schema: music; Owner: postgres
--

INSERT INTO music.song VALUES
  ('Drive', 'Bic Runga', 167),
  ('Listening for the Weather', 'Bic Runga', 209),
  ('She''s Got a New Spell', 'Billy Bragg', 206),
  ('Waiting for the Great Leap Forwards', 'Billy Bragg', 275);


--
-- Name: artist idx_17404_primary; Type: CONSTRAINT; Schema: music; Owner: postgres
--

ALTER TABLE ONLY music.artist
    ADD CONSTRAINT idx_17404_primary PRIMARY KEY (name);


--
-- Name: song idx_17407_primary; Type: CONSTRAINT; Schema: music; Owner: postgres
--

ALTER TABLE ONLY music.song
    ADD CONSTRAINT idx_17407_primary PRIMARY KEY (title, artistname);


--
-- Name: idx_17407_artistnamefk; Type: INDEX; Schema: music; Owner: postgres
--

CREATE INDEX idx_17407_artistnamefk ON music.song USING btree (artistname);


--
-- Name: song artistnamefk; Type: FK CONSTRAINT; Schema: music; Owner: postgres
--

ALTER TABLE ONLY music.song
    ADD CONSTRAINT artistnamefk FOREIGN KEY (artistname) REFERENCES music.artist(name) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13 (Debian 15.13-0+deb12u1)
-- Dumped by pg_dump version 15.13 (Debian 15.13-0+deb12u1)

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
-- Name: carlislemenuitems; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA carlislemenuitems;


ALTER SCHEMA carlislemenuitems OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: item; Type: TABLE; Schema: carlislemenuitems; Owner: postgres
--

CREATE TABLE carlislemenuitems.item (
    id character varying(3) NOT NULL,
    name character varying(18) DEFAULT NULL::character varying,
    restaurant_id integer NOT NULL
);


ALTER TABLE carlislemenuitems.item OWNER TO postgres;

--
-- Name: restaurant; Type: TABLE; Schema: carlislemenuitems; Owner: postgres
--

CREATE TABLE carlislemenuitems.restaurant (
    id integer NOT NULL,
    name character varying(14) DEFAULT NULL::character varying,
    address character varying(36) DEFAULT NULL::character varying
);


ALTER TABLE carlislemenuitems.restaurant OWNER TO postgres;

--
-- Data for Name: item; Type: TABLE DATA; Schema: carlislemenuitems; Owner: postgres
--

INSERT INTO carlislemenuitems.item VALUES
  ('18', 'pad thai', 23),
  ('18', 'ebi tempura', 49),
  ('18V', 'vegetable pad thai', 23),
  ('23', 'temaki dinner', 49),
  ('6', 'miso ramen', 23),
  ('8', 'tantan ramen', 23),
  ('D4', 'mabo tofu', 23);


--
-- Data for Name: restaurant; Type: TABLE DATA; Schema: carlislemenuitems; Owner: postgres
--

INSERT INTO carlislemenuitems.restaurant VALUES
  (23, 'Issei Carlisle', '54 W High St, Carlisle, PA 17013'),
  (49, 'Mt Fuji', '149 N Hanover St, Carlisle, PA 17013');


--
-- Name: item idx_17464_primary; Type: CONSTRAINT; Schema: carlislemenuitems; Owner: postgres
--

ALTER TABLE ONLY carlislemenuitems.item
    ADD CONSTRAINT idx_17464_primary PRIMARY KEY (id, restaurant_id);


--
-- Name: restaurant idx_17468_primary; Type: CONSTRAINT; Schema: carlislemenuitems; Owner: postgres
--

ALTER TABLE ONLY carlislemenuitems.restaurant
    ADD CONSTRAINT idx_17468_primary PRIMARY KEY (id);


--
-- Name: idx_17464_restaurant_fk; Type: INDEX; Schema: carlislemenuitems; Owner: postgres
--

CREATE INDEX idx_17464_restaurant_fk ON carlislemenuitems.item USING btree (restaurant_id);


--
-- Name: item restaurant_fk; Type: FK CONSTRAINT; Schema: carlislemenuitems; Owner: postgres
--

ALTER TABLE ONLY carlislemenuitems.item
    ADD CONSTRAINT restaurant_fk FOREIGN KEY (restaurant_id) REFERENCES carlislemenuitems.restaurant(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--


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
-- Name: carlislefood; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA carlislefood;


ALTER SCHEMA carlislefood OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: allinfo; Type: TABLE; Schema: carlislefood; Owner: postgres
--

CREATE TABLE carlislefood.allinfo (
    item_code character varying(9) NOT NULL,
    item_name character varying(18) DEFAULT NULL::character varying,
    restaurant_code character varying(15) NOT NULL,
    restaurant_name character varying(15) DEFAULT NULL::character varying,
    restaurant_address character varying(36) DEFAULT NULL::character varying
);


ALTER TABLE carlislefood.allinfo OWNER TO postgres;

--
-- Name: menu_items; Type: TABLE; Schema: carlislefood; Owner: postgres
--

CREATE TABLE carlislefood.menu_items (
    item_code character varying(9) NOT NULL,
    item_name character varying(18) DEFAULT NULL::character varying,
    restaurant_code character varying(15) NOT NULL
);


ALTER TABLE carlislefood.menu_items OWNER TO postgres;

--
-- Name: restaurants; Type: TABLE; Schema: carlislefood; Owner: postgres
--

CREATE TABLE carlislefood.restaurants (
    restaurant_code character varying(15) NOT NULL,
    restaurant_name character varying(15) DEFAULT NULL::character varying,
    restaurant_address character varying(36) DEFAULT NULL::character varying
);


ALTER TABLE carlislefood.restaurants OWNER TO postgres;

--
-- Data for Name: allinfo; Type: TABLE DATA; Schema: carlislefood; Owner: postgres
--

INSERT INTO carlislefood.allinfo VALUES
  ('18', 'pad thai', 'IC', 'Issei Carlisle', '54 W High St, Carlisle, PA 17013'),
  ('18', 'ebi tempura', 'MF', 'Mt Fuji', '149 N Hanover St, Carlisle, PA 17013'),
  ('18V', 'vegetable pad thai', 'IC', 'Issei Carlisle', '54 W High St, Carlisle, PA 17013'),
  ('23', 'temaki dinner', 'MF', 'Mt Fuji', '149 N Hanover St, Carlisle, PA 17013'),
  ('6', 'miso ramen', 'IC', 'Issei Carlisle', '54 W High St, Carlisle, PA 17013'),
  ('8', 'tantan ramen', 'IC', 'Issei Carlisle', '54 W High St, Carlisle, PA 17013'),
  ('D4', 'mabo tofu', 'IC', 'Issei Carlisle', '54 W High St, Carlisle, PA 17013');


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: carlislefood; Owner: postgres
--

INSERT INTO carlislefood.menu_items VALUES
  ('18', 'pad thai', 'IC'),
  ('18', 'ebi tempura', 'MF'),
  ('18V', 'vegetable pad thai', 'IC'),
  ('23', 'temaki dinner', 'MF'),
  ('6', 'miso ramen', 'IC'),
  ('8', 'tantan ramen', 'IC'),
  ('D4', 'mabo tofu', 'IC');


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: carlislefood; Owner: postgres
--

INSERT INTO carlislefood.restaurants VALUES
  ('IC', 'Issei Carlisle', '54 W High St, Carlisle, PA 17013'),
  ('MF', 'Mt Fuji', '149 N Hanover St, Carlisle, PA 17013');


--
-- Name: allinfo idx_17431_primary; Type: CONSTRAINT; Schema: carlislefood; Owner: postgres
--

ALTER TABLE ONLY carlislefood.allinfo
    ADD CONSTRAINT idx_17431_primary PRIMARY KEY (item_code, restaurant_code);


--
-- Name: menu_items idx_17437_primary; Type: CONSTRAINT; Schema: carlislefood; Owner: postgres
--

ALTER TABLE ONLY carlislefood.menu_items
    ADD CONSTRAINT idx_17437_primary PRIMARY KEY (item_code, restaurant_code);


--
-- Name: restaurants idx_17441_primary; Type: CONSTRAINT; Schema: carlislefood; Owner: postgres
--

ALTER TABLE ONLY carlislefood.restaurants
    ADD CONSTRAINT idx_17441_primary PRIMARY KEY (restaurant_code);


--
-- Name: idx_17437_restaurant_fk; Type: INDEX; Schema: carlislefood; Owner: postgres
--

CREATE INDEX idx_17437_restaurant_fk ON carlislefood.menu_items USING btree (restaurant_code);


--
-- Name: menu_items restaurant_fk; Type: FK CONSTRAINT; Schema: carlislefood; Owner: postgres
--

ALTER TABLE ONLY carlislefood.menu_items
    ADD CONSTRAINT restaurant_fk FOREIGN KEY (restaurant_code) REFERENCES carlislefood.restaurants(restaurant_code) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--


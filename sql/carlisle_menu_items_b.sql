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
-- Name: carlisle_menu_items_b; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA carlisle_menu_items_b;


ALTER SCHEMA carlisle_menu_items_b OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: item; Type: TABLE; Schema: carlisle_menu_items_b; Owner: postgres
--

CREATE TABLE carlisle_menu_items_b.item (
    id character varying(3) NOT NULL,
    name character varying(18) DEFAULT NULL::character varying,
    restaurant_id integer NOT NULL
);


ALTER TABLE carlisle_menu_items_b.item OWNER TO postgres;

--
-- Name: restaurant; Type: TABLE; Schema: carlisle_menu_items_b; Owner: postgres
--

CREATE TABLE carlisle_menu_items_b.restaurant (
    id integer NOT NULL,
    name character varying(14) DEFAULT NULL::character varying,
    address character varying(36) DEFAULT NULL::character varying
);


ALTER TABLE carlisle_menu_items_b.restaurant OWNER TO postgres;

--
-- Data for Name: item; Type: TABLE DATA; Schema: carlisle_menu_items_b; Owner: postgres
--

INSERT INTO carlisle_menu_items_b.item VALUES
  ('18', 'pad thai', 23),
  ('18', 'ebi tempura', 49),
  ('18V', 'vegetable pad thai', 23),
  ('23', 'temaki dinner', 49),
  ('6', 'miso ramen', 23),
  ('8', 'tantan ramen', 23),
  ('D4', 'mabo tofu', 23);


--
-- Data for Name: restaurant; Type: TABLE DATA; Schema: carlisle_menu_items_b; Owner: postgres
--

INSERT INTO carlisle_menu_items_b.restaurant VALUES
  (23, 'Issei Carlisle', '54 W High St, Carlisle, PA 17013'),
  (49, 'Mt Fuji', '149 N Hanover St, Carlisle, PA 17013'),
  (77, 'Hamilton', '55 W High St, Carlisle, PA 17013');


--
-- Name: item idx_17489_primary; Type: CONSTRAINT; Schema: carlisle_menu_items_b; Owner: postgres
--

ALTER TABLE ONLY carlisle_menu_items_b.item
    ADD CONSTRAINT idx_17489_primary PRIMARY KEY (id, restaurant_id);


--
-- Name: restaurant idx_17493_primary; Type: CONSTRAINT; Schema: carlisle_menu_items_b; Owner: postgres
--

ALTER TABLE ONLY carlisle_menu_items_b.restaurant
    ADD CONSTRAINT idx_17493_primary PRIMARY KEY (id);


--
-- Name: idx_17489_restaurant_fk; Type: INDEX; Schema: carlisle_menu_items_b; Owner: postgres
--

CREATE INDEX idx_17489_restaurant_fk ON carlisle_menu_items_b.item USING btree (restaurant_id);


--
-- Name: item restaurant_fk; Type: FK CONSTRAINT; Schema: carlisle_menu_items_b; Owner: postgres
--

ALTER TABLE ONLY carlisle_menu_items_b.item
    ADD CONSTRAINT restaurant_fk FOREIGN KEY (restaurant_id) REFERENCES carlisle_menu_items_b.restaurant(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--


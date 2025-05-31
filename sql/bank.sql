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
-- Name: bank; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA bank;


ALTER SCHEMA bank OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts; Type: TABLE; Schema: bank; Owner: postgres
--

CREATE TABLE bank.accounts (
    account_number bigint NOT NULL,
    balance numeric(15,2) NOT NULL
);


ALTER TABLE bank.accounts OWNER TO postgres;

--
-- Data for Name: accounts; Type: TABLE DATA; Schema: bank; Owner: postgres
--

INSERT INTO bank.accounts VALUES
  (111, 100.00),
  (222, 200.00);


--
-- Name: accounts idx_17348_primary; Type: CONSTRAINT; Schema: bank; Owner: postgres
--

ALTER TABLE ONLY bank.accounts
    ADD CONSTRAINT idx_17348_primary PRIMARY KEY (account_number);


--
-- PostgreSQL database dump complete
--


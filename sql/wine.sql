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
-- Name: wine; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA wine;


ALTER SCHEMA wine OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: po_line; Type: TABLE; Schema: wine; Owner: postgres
--

CREATE TABLE wine.po_line (
    ponr character(7) NOT NULL,
    prodnr character(6) NOT NULL,
    quantity bigint
);


ALTER TABLE wine.po_line OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: wine; Owner: postgres
--

CREATE TABLE wine.product (
    prodnr character(6) NOT NULL,
    prodname character varying(60) NOT NULL,
    prodtype character varying(10) DEFAULT NULL::character varying,
    available_quantity bigint
);


ALTER TABLE wine.product OWNER TO postgres;

--
-- Name: purchase_order; Type: TABLE; Schema: wine; Owner: postgres
--

CREATE TABLE wine.purchase_order (
    ponr character(7) NOT NULL,
    podate date,
    supnr character(4) NOT NULL
);


ALTER TABLE wine.purchase_order OWNER TO postgres;

--
-- Name: supplier; Type: TABLE; Schema: wine; Owner: postgres
--

CREATE TABLE wine.supplier (
    supnr character(4) NOT NULL,
    supname character varying(40) NOT NULL,
    supaddress character varying(50) DEFAULT NULL::character varying,
    supcity character varying(20) DEFAULT NULL::character varying,
    supstatus smallint
);


ALTER TABLE wine.supplier OWNER TO postgres;

--
-- Name: supplies; Type: TABLE; Schema: wine; Owner: postgres
--

CREATE TABLE wine.supplies (
    supnr character(4) NOT NULL,
    prodnr character(6) NOT NULL,
    purchase_price double precision,
    deliv_period bigint
);


ALTER TABLE wine.supplies OWNER TO postgres;

--
-- Name: COLUMN supplies.purchase_price; Type: COMMENT; Schema: wine; Owner: postgres
--

COMMENT ON COLUMN wine.supplies.purchase_price IS 'PURCHASE_PRICE IN EUR';


--
-- Name: COLUMN supplies.deliv_period; Type: COMMENT; Schema: wine; Owner: postgres
--

COMMENT ON COLUMN wine.supplies.deliv_period IS 'DELIV_PERIOD IN DAYS';


--
-- Data for Name: po_line; Type: TABLE DATA; Schema: wine; Owner: postgres
--

INSERT INTO wine.po_line VALUES
  ('1511   ', '0212  ', 2),
  ('1511   ', '0345  ', 4),
  ('1511   ', '0783  ', 1),
  ('1511   ', '0856  ', 9),
  ('1512   ', '0178  ', 3),
  ('1512   ', '0639  ', 13),
  ('1512   ', '0885  ', 3),
  ('1512   ', '0977  ', 10),
  ('1513   ', '0295  ', 9),
  ('1513   ', '0668  ', 7),
  ('1514   ', '0185  ', 2),
  ('1514   ', '0306  ', 9),
  ('1514   ', '0847  ', 9),
  ('1514   ', '0900  ', 2),
  ('1523   ', '0347  ', 1),
  ('1523   ', '0783  ', 2),
  ('1523   ', '0900  ', 3),
  ('1523   ', '0915  ', 13),
  ('1523   ', '0977  ', 1),
  ('1537   ', '0386  ', 8),
  ('1537   ', '0632  ', 2),
  ('1537   ', '0657  ', 7),
  ('1537   ', '0766  ', 2),
  ('1538   ', '0178  ', 6),
  ('1538   ', '0212  ', 15),
  ('1560   ', '0766  ', 1),
  ('1560   ', '0795  ', 3),
  ('1560   ', '0900  ', 9),
  ('1577   ', '0212  ', 6),
  ('1577   ', '0668  ', 9),
  ('1594   ', '0306  ', 2);


--
-- Data for Name: product; Type: TABLE DATA; Schema: wine; Owner: postgres
--

INSERT INTO wine.product VALUES
  ('0119  ', 'Chateau Miraval, Cotes de Provence Rose, 2015', 'rose', 126),
  ('0154  ', 'Chateau Haut Brion, 2008', 'red', 111),
  ('0178  ', 'Meerdael, Methode Traditionnelle Chardonnay, 2014', 'sparkling', 136),
  ('0185  ', 'Chateau Petrus, 1975', 'red', 5),
  ('0199  ', 'Jacques Selosse, Brut Initial, 2012', 'sparkling', 96),
  ('0212  ', 'Billecart-Salmon, Brut Réserve, 2014', 'sparkling', 141),
  ('0219  ', 'Marques de Caceres, Rioja Crianza, 2010', 'red', 0),
  ('0238  ', 'Cos d''Estournel, Saint - Estephe, 2006', 'red', 50),
  ('0265  ', 'Chateau Sociando-Mallet, Haut-Medoc, 1998', 'red', 17),
  ('0289  ', 'Chateau Saint Estève de Neri, 2015', 'rose', 126),
  ('0295  ', 'Chateau Pape Clement, Pessac-Léognan, 2001', 'red', 75),
  ('0300  ', 'Chateau des Rontets, Chardonnay, Birbettes', 'white', 64),
  ('0306  ', 'Chateau Coupe Roses, Granaxa, 2011', 'red', 57),
  ('0327  ', 'Chateau La Croix Saint-Michel, 2011', 'red', 87),
  ('0331  ', 'Chateau La Commanderie, Lalande-de-Pomerol, 1998', 'red', 3),
  ('0345  ', 'Vascosassetti, Brunello di Montalcino, 2004', 'red', 64),
  ('0347  ', 'Chateau Corbin-Despagne, Saint-Emilion, 2005', 'red', 145),
  ('0384  ', 'Dominio de Pingus, Ribera del Duero, Tempranillo, 2006', 'red', 38),
  ('0386  ', 'Chateau Haut-Bailly, Pessac-Leognan, Grand Cru Classe, 1968', 'red', 118),
  ('0404  ', 'Chateau Haut-Cadet, Saint-Emilion, 1997', 'red', 115),
  ('0468  ', 'Domaine Trapet Père & Fils, Gevrey-Chambertin, 2008', 'red', 43),
  ('0474  ', 'Chateau De La Tour, Clos-Vougeot, Grand cru, 2008', 'red', 147),
  ('0494  ', 'Veuve-Cliquot, Brut, 2012', 'sparkling', 1),
  ('0523  ', 'Chateau Andron Blanquet, Saint Estephe, 1979', 'red', 13),
  ('0632  ', 'Meneghetti, Chardonnay, 2010', 'white', 83),
  ('0637  ', 'Moët & Chandon, Rosé, Imperial, 2014', 'sparkling', 121),
  ('0639  ', 'Chateau Mouton-Rotshild, Pauillac, 2007', 'red', 35),
  ('0657  ', 'Le Brun Servenay, Brut, 2008', 'sparkling', 34),
  ('0668  ', 'Gallo Family Vineyards, Grenache, 2014', 'rose', 95),
  ('0760  ', 'Chateau Talbot, Saint-Julien, Grand Cru Classe, 2002', 'red', 92),
  ('0766  ', 'GH Mum, Brut, 2012', 'sparkling', 68),
  ('0783  ', 'Clos D''Opleeuw, Chardonnay, 2012', 'white', 8),
  ('0795  ', 'Casa Silva, Los Lingues, Carmenere, 2012', 'red', 105),
  ('0832  ', 'Conde de Hervías, Rioja, 2004', 'red', 121),
  ('0838  ', 'Piper Heidseck, Brut, 2014', 'sparkling', 108),
  ('0847  ', 'Seresin, Merlot, 1999', 'red', 41),
  ('0856  ', 'Domaine Chandon de Briailles, Savigny-Les-Beaune, 2006', 'red', 93),
  ('0885  ', 'Chateau Margaux, Grand Cru Classé, 1956', 'red', 147),
  ('0899  ', 'Trimbach, Riesling, 1989', 'white', 142),
  ('0900  ', 'Chateau Cheval Blanc, Saint Emilion, Grand Cru Classé, 1972', 'red', 45),
  ('0915  ', 'Champagne Boizel, Brut, Réserve, 2010', 'sparkling', 76),
  ('0977  ', 'Chateau Batailley, Grand Cru Classé, 1975', 'red', 21);


--
-- Data for Name: purchase_order; Type: TABLE DATA; Schema: wine; Owner: postgres
--

INSERT INTO wine.purchase_order VALUES
  ('1511   ', '2015-03-24', '37  '),
  ('1512   ', '2015-04-10', '94  '),
  ('1513   ', '2015-04-11', '37  '),
  ('1514   ', '2015-04-12', '32  '),
  ('1523   ', '2015-04-19', '37  '),
  ('1537   ', '2015-04-27', '69  '),
  ('1538   ', '2015-05-01', '68  '),
  ('1560   ', '2015-05-05', '32  '),
  ('1577   ', '2015-05-10', '37  '),
  ('1594   ', '2015-05-13', '37  ');


--
-- Data for Name: supplier; Type: TABLE DATA; Schema: wine; Owner: postgres
--

INSERT INTO wine.supplier VALUES
  ('21  ', 'Deliwines', '240, Avenue of the Americas', 'New York', 20),
  ('32  ', 'Best Wines', '660, Market Street', 'San Francisco', 90),
  ('37  ', 'Ad Fundum', '82, Wacker Drive', 'Chicago', 95),
  ('52  ', 'Spirits & co.', '928, Strip', 'Las Vegas', NULL),
  ('68  ', 'The Wine Depot', '132, Montgomery Street', 'San Francisco', 10),
  ('69  ', 'Vinos del Mundo', '4, Collins Avenue', 'Miami', 92),
  ('84  ', 'Wine Trade Logistics', '1002, Rhode Island Avenue', 'Washington', 92),
  ('94  ', 'The Wine Crate', '330, McKinney Avenue', 'Dallas', 75);


--
-- Data for Name: supplies; Type: TABLE DATA; Schema: wine; Owner: postgres
--

INSERT INTO wine.supplies VALUES
  ('21  ', '0119  ', 15.99, 1),
  ('21  ', '0178  ', NULL, NULL),
  ('21  ', '0289  ', 17.99, 1),
  ('21  ', '0327  ', 56, 6),
  ('21  ', '0347  ', 16, 2),
  ('21  ', '0384  ', 55, 2),
  ('21  ', '0386  ', 58.99, 2),
  ('21  ', '0468  ', 14.99, 5),
  ('21  ', '0668  ', 6, 1),
  ('32  ', '0154  ', 21, 4),
  ('32  ', '0474  ', 40, 1),
  ('32  ', '0494  ', 15, 2),
  ('32  ', '0657  ', 44.99, 4),
  ('32  ', '0760  ', 52, 3),
  ('32  ', '0832  ', 20, 2),
  ('37  ', '0178  ', 16.99, 4),
  ('37  ', '0185  ', 32.99, 3),
  ('37  ', '0468  ', 14, 1),
  ('37  ', '0795  ', 20.99, 3),
  ('68  ', '0178  ', 17.99, 5),
  ('68  ', '0212  ', 27.99, 6),
  ('68  ', '0300  ', 19, 1),
  ('68  ', '0327  ', 56.99, 4),
  ('68  ', '0468  ', 15.99, 4),
  ('68  ', '0637  ', 81, 2),
  ('68  ', '0639  ', 5, 5),
  ('68  ', '0668  ', 6.99, 3),
  ('68  ', '0760  ', 52.99, 2),
  ('69  ', '0178  ', 16.99, NULL),
  ('69  ', '0199  ', 32, 4),
  ('69  ', '0347  ', 18, 4),
  ('69  ', '0783  ', 7, 3),
  ('69  ', '0795  ', 20.99, 1),
  ('69  ', '0832  ', 21, 4),
  ('69  ', '0977  ', 34.99, 1),
  ('84  ', '0185  ', 33, 5),
  ('84  ', '0300  ', 21, 2),
  ('84  ', '0306  ', 25, 2),
  ('84  ', '0347  ', 18, 4),
  ('84  ', '0468  ', 15, 2),
  ('84  ', '0494  ', 15.99, 2),
  ('84  ', '0832  ', 20.99, 6),
  ('84  ', '0915  ', 84, 3),
  ('94  ', '0154  ', 22, 2),
  ('94  ', '0178  ', 18, 6),
  ('94  ', '0185  ', 32.99, 1),
  ('94  ', '0199  ', 30.99, 1),
  ('94  ', '0474  ', 39.99, 2),
  ('94  ', '0523  ', 20.99, 3),
  ('94  ', '0632  ', 15.99, 2),
  ('94  ', '0899  ', 15, 1);


--
-- Name: po_line idx_16453_primary; Type: CONSTRAINT; Schema: wine; Owner: postgres
--

ALTER TABLE ONLY wine.po_line
    ADD CONSTRAINT idx_16453_primary PRIMARY KEY (ponr, prodnr);


--
-- Name: product idx_16456_primary; Type: CONSTRAINT; Schema: wine; Owner: postgres
--

ALTER TABLE ONLY wine.product
    ADD CONSTRAINT idx_16456_primary PRIMARY KEY (prodnr);


--
-- Name: purchase_order idx_16460_primary; Type: CONSTRAINT; Schema: wine; Owner: postgres
--

ALTER TABLE ONLY wine.purchase_order
    ADD CONSTRAINT idx_16460_primary PRIMARY KEY (ponr);


--
-- Name: supplier idx_16463_primary; Type: CONSTRAINT; Schema: wine; Owner: postgres
--

ALTER TABLE ONLY wine.supplier
    ADD CONSTRAINT idx_16463_primary PRIMARY KEY (supnr);


--
-- Name: supplies idx_16468_primary; Type: CONSTRAINT; Schema: wine; Owner: postgres
--

ALTER TABLE ONLY wine.supplies
    ADD CONSTRAINT idx_16468_primary PRIMARY KEY (supnr, prodnr);


--
-- Name: idx_16453_prodnr; Type: INDEX; Schema: wine; Owner: postgres
--

CREATE INDEX idx_16453_prodnr ON wine.po_line USING btree (prodnr);


--
-- Name: idx_16456_uc1; Type: INDEX; Schema: wine; Owner: postgres
--

CREATE UNIQUE INDEX idx_16456_uc1 ON wine.product USING btree (prodname);


--
-- Name: idx_16460_supnr; Type: INDEX; Schema: wine; Owner: postgres
--

CREATE INDEX idx_16460_supnr ON wine.purchase_order USING btree (supnr);


--
-- Name: idx_16468_prodnr; Type: INDEX; Schema: wine; Owner: postgres
--

CREATE INDEX idx_16468_prodnr ON wine.supplies USING btree (prodnr);


--
-- Name: po_line po_line_ibfk_1; Type: FK CONSTRAINT; Schema: wine; Owner: postgres
--

ALTER TABLE ONLY wine.po_line
    ADD CONSTRAINT po_line_ibfk_1 FOREIGN KEY (ponr) REFERENCES wine.purchase_order(ponr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: po_line po_line_ibfk_2; Type: FK CONSTRAINT; Schema: wine; Owner: postgres
--

ALTER TABLE ONLY wine.po_line
    ADD CONSTRAINT po_line_ibfk_2 FOREIGN KEY (prodnr) REFERENCES wine.product(prodnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: purchase_order purchase_order_ibfk_1; Type: FK CONSTRAINT; Schema: wine; Owner: postgres
--

ALTER TABLE ONLY wine.purchase_order
    ADD CONSTRAINT purchase_order_ibfk_1 FOREIGN KEY (supnr) REFERENCES wine.supplier(supnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supplies supplies_ibfk_1; Type: FK CONSTRAINT; Schema: wine; Owner: postgres
--

ALTER TABLE ONLY wine.supplies
    ADD CONSTRAINT supplies_ibfk_1 FOREIGN KEY (supnr) REFERENCES wine.supplier(supnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supplies supplies_ibfk_2; Type: FK CONSTRAINT; Schema: wine; Owner: postgres
--

ALTER TABLE ONLY wine.supplies
    ADD CONSTRAINT supplies_ibfk_2 FOREIGN KEY (prodnr) REFERENCES wine.product(prodnr) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


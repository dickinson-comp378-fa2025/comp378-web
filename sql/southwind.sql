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
-- Name: southwind; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA southwind;


ALTER SCHEMA southwind OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: customers; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.customers (
    id bigint NOT NULL,
    company character varying(50) DEFAULT NULL::character varying,
    last_name character varying(50) DEFAULT NULL::character varying,
    first_name character varying(50) DEFAULT NULL::character varying,
    email_address character varying(50) DEFAULT NULL::character varying,
    job_title character varying(50) DEFAULT NULL::character varying,
    business_phone character varying(25) DEFAULT NULL::character varying,
    home_phone character varying(25) DEFAULT NULL::character varying,
    mobile_phone character varying(25) DEFAULT NULL::character varying,
    fax_number character varying(25) DEFAULT NULL::character varying,
    address text,
    city character varying(50) DEFAULT NULL::character varying,
    state_province character varying(50) DEFAULT NULL::character varying,
    zip_postal_code character varying(15) DEFAULT NULL::character varying,
    country_region character varying(50) DEFAULT NULL::character varying,
    web_page text,
    notes text,
    attachments bytea
);


ALTER TABLE southwind.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: southwind; Owner: postgres
--

CREATE SEQUENCE southwind.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE southwind.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: southwind; Owner: postgres
--

ALTER SEQUENCE southwind.customers_id_seq OWNED BY southwind.customers.id;


--
-- Name: employee_privileges; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.employee_privileges (
    employee_id bigint NOT NULL,
    privilege_id bigint NOT NULL
);


ALTER TABLE southwind.employee_privileges OWNER TO postgres;

--
-- Name: employees; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.employees (
    id bigint NOT NULL,
    company character varying(50) DEFAULT NULL::character varying,
    last_name character varying(50) DEFAULT NULL::character varying,
    first_name character varying(50) DEFAULT NULL::character varying,
    email_address character varying(50) DEFAULT NULL::character varying,
    job_title character varying(50) DEFAULT NULL::character varying,
    business_phone character varying(25) DEFAULT NULL::character varying,
    home_phone character varying(25) DEFAULT NULL::character varying,
    mobile_phone character varying(25) DEFAULT NULL::character varying,
    fax_number character varying(25) DEFAULT NULL::character varying,
    address text,
    city character varying(50) DEFAULT NULL::character varying,
    state_province character varying(50) DEFAULT NULL::character varying,
    zip_postal_code character varying(15) DEFAULT NULL::character varying,
    country_region character varying(50) DEFAULT NULL::character varying,
    web_page text,
    notes text,
    attachments bytea
);


ALTER TABLE southwind.employees OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: southwind; Owner: postgres
--

CREATE SEQUENCE southwind.employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE southwind.employees_id_seq OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: southwind; Owner: postgres
--

ALTER SEQUENCE southwind.employees_id_seq OWNED BY southwind.employees.id;


--
-- Name: inventory_transaction_types; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.inventory_transaction_types (
    id smallint NOT NULL,
    type_name character varying(50) NOT NULL
);


ALTER TABLE southwind.inventory_transaction_types OWNER TO postgres;

--
-- Name: inventory_transactions; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.inventory_transactions (
    id bigint NOT NULL,
    transaction_type smallint NOT NULL,
    transaction_created_date timestamp with time zone,
    transaction_modified_date timestamp with time zone,
    product_id bigint NOT NULL,
    quantity bigint NOT NULL,
    purchase_order_id bigint,
    customer_order_id bigint,
    comments character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE southwind.inventory_transactions OWNER TO postgres;

--
-- Name: inventory_transactions_id_seq; Type: SEQUENCE; Schema: southwind; Owner: postgres
--

CREATE SEQUENCE southwind.inventory_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE southwind.inventory_transactions_id_seq OWNER TO postgres;

--
-- Name: inventory_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: southwind; Owner: postgres
--

ALTER SEQUENCE southwind.inventory_transactions_id_seq OWNED BY southwind.inventory_transactions.id;


--
-- Name: invoices; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.invoices (
    id bigint NOT NULL,
    order_id bigint,
    invoice_date timestamp with time zone,
    due_date timestamp with time zone,
    tax numeric(19,4) DEFAULT 0.0000,
    shipping numeric(19,4) DEFAULT 0.0000,
    amount_due numeric(19,4) DEFAULT 0.0000
);


ALTER TABLE southwind.invoices OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: southwind; Owner: postgres
--

CREATE SEQUENCE southwind.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE southwind.invoices_id_seq OWNER TO postgres;

--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: southwind; Owner: postgres
--

ALTER SEQUENCE southwind.invoices_id_seq OWNED BY southwind.invoices.id;


--
-- Name: order_details; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.order_details (
    id bigint NOT NULL,
    order_id bigint NOT NULL,
    product_id bigint,
    quantity numeric(18,4) DEFAULT 0.0000 NOT NULL,
    unit_price numeric(19,4) DEFAULT 0.0000,
    discount double precision DEFAULT '0'::double precision NOT NULL,
    status_id bigint,
    date_allocated timestamp with time zone,
    purchase_order_id bigint,
    inventory_id bigint
);


ALTER TABLE southwind.order_details OWNER TO postgres;

--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: southwind; Owner: postgres
--

CREATE SEQUENCE southwind.order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE southwind.order_details_id_seq OWNER TO postgres;

--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: southwind; Owner: postgres
--

ALTER SEQUENCE southwind.order_details_id_seq OWNED BY southwind.order_details.id;


--
-- Name: order_details_status; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.order_details_status (
    id bigint NOT NULL,
    status_name character varying(50) NOT NULL
);


ALTER TABLE southwind.order_details_status OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.orders (
    id bigint NOT NULL,
    employee_id bigint,
    customer_id bigint,
    order_date timestamp with time zone,
    shipped_date timestamp with time zone,
    shipper_id bigint,
    ship_name character varying(50) DEFAULT NULL::character varying,
    ship_address text,
    ship_city character varying(50) DEFAULT NULL::character varying,
    ship_state_province character varying(50) DEFAULT NULL::character varying,
    ship_zip_postal_code character varying(50) DEFAULT NULL::character varying,
    ship_country_region character varying(50) DEFAULT NULL::character varying,
    shipping_fee numeric(19,4) DEFAULT 0.0000,
    taxes numeric(19,4) DEFAULT 0.0000,
    payment_type character varying(50) DEFAULT NULL::character varying,
    paid_date timestamp with time zone,
    notes text,
    tax_rate double precision DEFAULT '0'::double precision,
    tax_status_id smallint,
    status_id smallint DEFAULT '0'::smallint
);


ALTER TABLE southwind.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: southwind; Owner: postgres
--

CREATE SEQUENCE southwind.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE southwind.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: southwind; Owner: postgres
--

ALTER SEQUENCE southwind.orders_id_seq OWNED BY southwind.orders.id;


--
-- Name: orders_status; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.orders_status (
    id smallint NOT NULL,
    status_name character varying(50) NOT NULL
);


ALTER TABLE southwind.orders_status OWNER TO postgres;

--
-- Name: orders_tax_status; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.orders_tax_status (
    id smallint NOT NULL,
    tax_status_name character varying(50) NOT NULL
);


ALTER TABLE southwind.orders_tax_status OWNER TO postgres;

--
-- Name: privileges; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.privileges (
    id bigint NOT NULL,
    privilege_name character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE southwind.privileges OWNER TO postgres;

--
-- Name: privileges_id_seq; Type: SEQUENCE; Schema: southwind; Owner: postgres
--

CREATE SEQUENCE southwind.privileges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE southwind.privileges_id_seq OWNER TO postgres;

--
-- Name: privileges_id_seq; Type: SEQUENCE OWNED BY; Schema: southwind; Owner: postgres
--

ALTER SEQUENCE southwind.privileges_id_seq OWNED BY southwind.privileges.id;


--
-- Name: products; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.products (
    supplier_ids text,
    id bigint NOT NULL,
    product_code character varying(25) DEFAULT NULL::character varying,
    product_name character varying(50) DEFAULT NULL::character varying,
    description text,
    standard_cost numeric(19,4) DEFAULT 0.0000,
    list_price numeric(19,4) DEFAULT 0.0000 NOT NULL,
    reorder_level bigint,
    target_level bigint,
    quantity_per_unit character varying(50) DEFAULT NULL::character varying,
    discontinued boolean DEFAULT false NOT NULL,
    minimum_reorder_quantity bigint,
    category character varying(50) DEFAULT NULL::character varying,
    attachments bytea
);


ALTER TABLE southwind.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: southwind; Owner: postgres
--

CREATE SEQUENCE southwind.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE southwind.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: southwind; Owner: postgres
--

ALTER SEQUENCE southwind.products_id_seq OWNED BY southwind.products.id;


--
-- Name: purchase_order_details; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.purchase_order_details (
    id bigint NOT NULL,
    purchase_order_id bigint NOT NULL,
    product_id bigint,
    quantity numeric(18,4) NOT NULL,
    unit_cost numeric(19,4) NOT NULL,
    date_received timestamp with time zone,
    posted_to_inventory boolean DEFAULT false NOT NULL,
    inventory_id bigint
);


ALTER TABLE southwind.purchase_order_details OWNER TO postgres;

--
-- Name: purchase_order_details_id_seq; Type: SEQUENCE; Schema: southwind; Owner: postgres
--

CREATE SEQUENCE southwind.purchase_order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE southwind.purchase_order_details_id_seq OWNER TO postgres;

--
-- Name: purchase_order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: southwind; Owner: postgres
--

ALTER SEQUENCE southwind.purchase_order_details_id_seq OWNED BY southwind.purchase_order_details.id;


--
-- Name: purchase_order_status; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.purchase_order_status (
    id bigint NOT NULL,
    status character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE southwind.purchase_order_status OWNER TO postgres;

--
-- Name: purchase_orders; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.purchase_orders (
    id bigint NOT NULL,
    supplier_id bigint,
    created_by bigint,
    submitted_date timestamp with time zone,
    creation_date timestamp with time zone,
    status_id bigint DEFAULT '0'::bigint,
    expected_date timestamp with time zone,
    shipping_fee numeric(19,4) DEFAULT 0.0000 NOT NULL,
    taxes numeric(19,4) DEFAULT 0.0000 NOT NULL,
    payment_date timestamp with time zone,
    payment_amount numeric(19,4) DEFAULT 0.0000,
    payment_method character varying(50) DEFAULT NULL::character varying,
    notes text,
    approved_by bigint,
    approved_date timestamp with time zone,
    submitted_by bigint
);


ALTER TABLE southwind.purchase_orders OWNER TO postgres;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE; Schema: southwind; Owner: postgres
--

CREATE SEQUENCE southwind.purchase_orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE southwind.purchase_orders_id_seq OWNER TO postgres;

--
-- Name: purchase_orders_id_seq; Type: SEQUENCE OWNED BY; Schema: southwind; Owner: postgres
--

ALTER SEQUENCE southwind.purchase_orders_id_seq OWNED BY southwind.purchase_orders.id;


--
-- Name: sales_reports; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.sales_reports (
    group_by character varying(50) NOT NULL,
    display character varying(50) DEFAULT NULL::character varying,
    title character varying(50) DEFAULT NULL::character varying,
    filter_row_source text,
    "default" boolean DEFAULT false NOT NULL
);


ALTER TABLE southwind.sales_reports OWNER TO postgres;

--
-- Name: shippers; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.shippers (
    id bigint NOT NULL,
    company character varying(50) DEFAULT NULL::character varying,
    last_name character varying(50) DEFAULT NULL::character varying,
    first_name character varying(50) DEFAULT NULL::character varying,
    email_address character varying(50) DEFAULT NULL::character varying,
    job_title character varying(50) DEFAULT NULL::character varying,
    business_phone character varying(25) DEFAULT NULL::character varying,
    home_phone character varying(25) DEFAULT NULL::character varying,
    mobile_phone character varying(25) DEFAULT NULL::character varying,
    fax_number character varying(25) DEFAULT NULL::character varying,
    address text,
    city character varying(50) DEFAULT NULL::character varying,
    state_province character varying(50) DEFAULT NULL::character varying,
    zip_postal_code character varying(15) DEFAULT NULL::character varying,
    country_region character varying(50) DEFAULT NULL::character varying,
    web_page text,
    notes text,
    attachments bytea
);


ALTER TABLE southwind.shippers OWNER TO postgres;

--
-- Name: shippers_id_seq; Type: SEQUENCE; Schema: southwind; Owner: postgres
--

CREATE SEQUENCE southwind.shippers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE southwind.shippers_id_seq OWNER TO postgres;

--
-- Name: shippers_id_seq; Type: SEQUENCE OWNED BY; Schema: southwind; Owner: postgres
--

ALTER SEQUENCE southwind.shippers_id_seq OWNED BY southwind.shippers.id;


--
-- Name: strings; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.strings (
    string_id bigint NOT NULL,
    string_data character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE southwind.strings OWNER TO postgres;

--
-- Name: strings_string_id_seq; Type: SEQUENCE; Schema: southwind; Owner: postgres
--

CREATE SEQUENCE southwind.strings_string_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE southwind.strings_string_id_seq OWNER TO postgres;

--
-- Name: strings_string_id_seq; Type: SEQUENCE OWNED BY; Schema: southwind; Owner: postgres
--

ALTER SEQUENCE southwind.strings_string_id_seq OWNED BY southwind.strings.string_id;


--
-- Name: suppliers; Type: TABLE; Schema: southwind; Owner: postgres
--

CREATE TABLE southwind.suppliers (
    id bigint NOT NULL,
    company character varying(50) DEFAULT NULL::character varying,
    last_name character varying(50) DEFAULT NULL::character varying,
    first_name character varying(50) DEFAULT NULL::character varying,
    email_address character varying(50) DEFAULT NULL::character varying,
    job_title character varying(50) DEFAULT NULL::character varying,
    business_phone character varying(25) DEFAULT NULL::character varying,
    home_phone character varying(25) DEFAULT NULL::character varying,
    mobile_phone character varying(25) DEFAULT NULL::character varying,
    fax_number character varying(25) DEFAULT NULL::character varying,
    address text,
    city character varying(50) DEFAULT NULL::character varying,
    state_province character varying(50) DEFAULT NULL::character varying,
    zip_postal_code character varying(15) DEFAULT NULL::character varying,
    country_region character varying(50) DEFAULT NULL::character varying,
    web_page text,
    notes text,
    attachments bytea
);


ALTER TABLE southwind.suppliers OWNER TO postgres;

--
-- Name: suppliers_id_seq; Type: SEQUENCE; Schema: southwind; Owner: postgres
--

CREATE SEQUENCE southwind.suppliers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE southwind.suppliers_id_seq OWNER TO postgres;

--
-- Name: suppliers_id_seq; Type: SEQUENCE OWNED BY; Schema: southwind; Owner: postgres
--

ALTER SEQUENCE southwind.suppliers_id_seq OWNED BY southwind.suppliers.id;


--
-- Name: customers id; Type: DEFAULT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.customers ALTER COLUMN id SET DEFAULT nextval('southwind.customers_id_seq'::regclass);


--
-- Name: employees id; Type: DEFAULT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.employees ALTER COLUMN id SET DEFAULT nextval('southwind.employees_id_seq'::regclass);


--
-- Name: inventory_transactions id; Type: DEFAULT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.inventory_transactions ALTER COLUMN id SET DEFAULT nextval('southwind.inventory_transactions_id_seq'::regclass);


--
-- Name: invoices id; Type: DEFAULT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.invoices ALTER COLUMN id SET DEFAULT nextval('southwind.invoices_id_seq'::regclass);


--
-- Name: order_details id; Type: DEFAULT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.order_details ALTER COLUMN id SET DEFAULT nextval('southwind.order_details_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.orders ALTER COLUMN id SET DEFAULT nextval('southwind.orders_id_seq'::regclass);


--
-- Name: privileges id; Type: DEFAULT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.privileges ALTER COLUMN id SET DEFAULT nextval('southwind.privileges_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.products ALTER COLUMN id SET DEFAULT nextval('southwind.products_id_seq'::regclass);


--
-- Name: purchase_order_details id; Type: DEFAULT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.purchase_order_details ALTER COLUMN id SET DEFAULT nextval('southwind.purchase_order_details_id_seq'::regclass);


--
-- Name: purchase_orders id; Type: DEFAULT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.purchase_orders ALTER COLUMN id SET DEFAULT nextval('southwind.purchase_orders_id_seq'::regclass);


--
-- Name: shippers id; Type: DEFAULT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.shippers ALTER COLUMN id SET DEFAULT nextval('southwind.shippers_id_seq'::regclass);


--
-- Name: strings string_id; Type: DEFAULT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.strings ALTER COLUMN string_id SET DEFAULT nextval('southwind.strings_string_id_seq'::regclass);


--
-- Name: suppliers id; Type: DEFAULT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.suppliers ALTER COLUMN id SET DEFAULT nextval('southwind.suppliers_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.customers VALUES
  (1, 'Company A', 'Bedecs', 'Anna', NULL, 'Owner', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 1st Street', 'Seattle', 'WA', '99999', 'USA', NULL, NULL, '\x'),
  (2, 'Company B', 'Gratacos Solsona', 'Antonio', NULL, 'Owner', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 2nd Street', 'Boston', 'MA', '99999', 'USA', NULL, NULL, '\x'),
  (3, 'Company C', 'Axen', 'Thomas', NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 3rd Street', 'Los Angelas', 'CA', '99999', 'USA', NULL, NULL, '\x'),
  (4, 'Company D', 'Lee', 'Christina', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 4th Street', 'New York', 'NY', '99999', 'USA', NULL, NULL, '\x'),
  (5, 'Company E', 'O’Donnell', 'Martin', NULL, 'Owner', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 5th Street', 'Minneapolis', 'MN', '99999', 'USA', NULL, NULL, '\x'),
  (6, 'Company F', 'Pérez-Olaeta', 'Francisco', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', NULL, NULL, '\x'),
  (7, 'Company G', 'Xie', 'Ming-Yang', NULL, 'Owner', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 7th Street', 'Boise', 'ID', '99999', 'USA', NULL, NULL, '\x'),
  (8, 'Company H', 'Andersen', 'Elizabeth', NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 8th Street', 'Portland', 'OR', '99999', 'USA', NULL, NULL, '\x'),
  (9, 'Company I', 'Mortensen', 'Sven', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 9th Street', 'Salt Lake City', 'UT', '99999', 'USA', NULL, NULL, '\x'),
  (10, 'Company J', 'Wacker', 'Roland', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', NULL, NULL, '\x'),
  (11, 'Company K', 'Krschne', 'Peter', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 11th Street', 'Miami', 'FL', '99999', 'USA', NULL, NULL, '\x'),
  (12, 'Company L', 'Edwards', 'John', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '123 12th Street', 'Las Vegas', 'NV', '99999', 'USA', NULL, NULL, '\x'),
  (13, 'Company M', 'Ludick', 'Andre', NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 13th Street', 'Memphis', 'TN', '99999', 'USA', NULL, NULL, '\x'),
  (14, 'Company N', 'Grilo', 'Carlos', NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 14th Street', 'Denver', 'CO', '99999', 'USA', NULL, NULL, '\x'),
  (15, 'Company O', 'Kupkova', 'Helena', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 15th Street', 'Honolulu', 'HI', '99999', 'USA', NULL, NULL, '\x'),
  (16, 'Company P', 'Goldschmidt', 'Daniel', NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 16th Street', 'San Francisco', 'CA', '99999', 'USA', NULL, NULL, '\x'),
  (17, 'Company Q', 'Bagel', 'Jean Philippe', NULL, 'Owner', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 17th Street', 'Seattle', 'WA', '99999', 'USA', NULL, NULL, '\x'),
  (18, 'Company R', 'Autier Miconi', 'Catherine', NULL, 'Purchasing Representative', '(123)555-0100', NULL, NULL, '(123)555-0101', '456 18th Street', 'Boston', 'MA', '99999', 'USA', NULL, NULL, '\x'),
  (19, 'Company S', 'Eggerer', 'Alexander', NULL, 'Accounting Assistant', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 19th Street', 'Los Angelas', 'CA', '99999', 'USA', NULL, NULL, '\x'),
  (20, 'Company T', 'Li', 'George', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 20th Street', 'New York', 'NY', '99999', 'USA', NULL, NULL, '\x'),
  (21, 'Company U', 'Tham', 'Bernard', NULL, 'Accounting Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 21th Street', 'Minneapolis', 'MN', '99999', 'USA', NULL, NULL, '\x'),
  (22, 'Company V', 'Ramos', 'Luciana', NULL, 'Purchasing Assistant', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 22th Street', 'Milwaukee', 'WI', '99999', 'USA', NULL, NULL, '\x'),
  (23, 'Company W', 'Entin', 'Michael', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 23th Street', 'Portland', 'OR', '99999', 'USA', NULL, NULL, '\x'),
  (24, 'Company X', 'Hasselberg', 'Jonas', NULL, 'Owner', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 24th Street', 'Salt Lake City', 'UT', '99999', 'USA', NULL, NULL, '\x'),
  (25, 'Company Y', 'Rodman', 'John', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 25th Street', 'Chicago', 'IL', '99999', 'USA', NULL, NULL, '\x'),
  (26, 'Company Z', 'Liu', 'Run', NULL, 'Accounting Assistant', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 26th Street', 'Miami', 'FL', '99999', 'USA', NULL, NULL, '\x'),
  (27, 'Company AA', 'Toh', 'Karen', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 27th Street', 'Las Vegas', 'NV', '99999', 'USA', NULL, NULL, '\x'),
  (28, 'Company BB', 'Raghav', 'Amritansh', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', NULL, NULL, '\x'),
  (29, 'Company CC', 'Lee', 'Soo Jung', NULL, 'Purchasing Manager', '(123)555-0100', NULL, NULL, '(123)555-0101', '789 29th Street', 'Denver', 'CO', '99999', 'USA', NULL, NULL, '\x');


--
-- Data for Name: employee_privileges; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.employee_privileges VALUES
  (2, 2);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.employees VALUES
  (1, 'Southwind Traders', 'Freehafer', 'Nancy', 'nancy@southwindtraders.com', 'Sales Representative', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 1st Avenue', 'Seattle', 'WA', '99999', 'USA', '#http://southwindtraders.com#', NULL, '\x'),
  (2, 'Southwind Traders', 'Cencini', 'Andrew', 'andrew@southwindtraders.com', 'Vice President, Sales', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 2nd Avenue', 'Bellevue', 'WA', '99999', 'USA', 'http://southwindtraders.com#http://southwindtraders.com/#', 'Joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales.', '\x'),
  (3, 'Southwind Traders', 'Kotas', 'Jan', 'jan@southwindtraders.com', 'Sales Representative', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 3rd Avenue', 'Redmond', 'WA', '99999', 'USA', 'http://southwindtraders.com#http://southwindtraders.com/#', 'Was hired as a sales associate and was promoted to sales representative.', '\x'),
  (4, 'Southwind Traders', 'Sergienko', 'Mariya', 'mariya@southwindtraders.com', 'Sales Representative', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 4th Avenue', 'Kirkland', 'WA', '99999', 'USA', 'http://southwindtraders.com#http://southwindtraders.com/#', NULL, '\x'),
  (5, 'Southwind Traders', 'Thorpe', 'Steven', 'steven@southwindtraders.com', 'Sales Manager', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 5th Avenue', 'Seattle', 'WA', '99999', 'USA', 'http://southwindtraders.com#http://southwindtraders.com/#', 'Joined the company as a sales representative and was promoted to sales manager.  Fluent in French.', '\x'),
  (6, 'Southwind Traders', 'Neipper', 'Michael', 'michael@southwindtraders.com', 'Sales Representative', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 6th Avenue', 'Redmond', 'WA', '99999', 'USA', 'http://southwindtraders.com#http://southwindtraders.com/#', 'Fluent in Japanese and can read and write French, Portuguese, and Spanish.', '\x'),
  (7, 'Southwind Traders', 'Zare', 'Robert', 'robert@southwindtraders.com', 'Sales Representative', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 7th Avenue', 'Seattle', 'WA', '99999', 'USA', 'http://southwindtraders.com#http://southwindtraders.com/#', NULL, '\x'),
  (8, 'Southwind Traders', 'Giussani', 'Laura', 'laura@southwindtraders.com', 'Sales Coordinator', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 8th Avenue', 'Redmond', 'WA', '99999', 'USA', 'http://southwindtraders.com#http://southwindtraders.com/#', 'Reads and writes French.', '\x'),
  (9, 'Southwind Traders', 'Hellung-Larsen', 'Anne', 'anne@southwindtraders.com', 'Sales Representative', '(123)555-0100', '(123)555-0102', NULL, '(123)555-0103', '123 9th Avenue', 'Seattle', 'WA', '99999', 'USA', 'http://southwindtraders.com#http://southwindtraders.com/#', 'Fluent in French and German.', '\x');


--
-- Data for Name: inventory_transaction_types; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.inventory_transaction_types VALUES
  (1, 'Purchased'),
  (2, 'Sold'),
  (3, 'On Hold'),
  (4, 'Waste');


--
-- Data for Name: inventory_transactions; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.inventory_transactions VALUES
  (35, 1, '2006-03-22 16:02:28+00', '2006-03-22 16:02:28+00', 80, 75, NULL, NULL, NULL),
  (36, 1, '2006-03-22 16:02:48+00', '2006-03-22 16:02:48+00', 72, 40, NULL, NULL, NULL),
  (37, 1, '2006-03-22 16:03:04+00', '2006-03-22 16:03:04+00', 52, 100, NULL, NULL, NULL),
  (38, 1, '2006-03-22 16:03:09+00', '2006-03-22 16:03:09+00', 56, 120, NULL, NULL, NULL),
  (39, 1, '2006-03-22 16:03:14+00', '2006-03-22 16:03:14+00', 57, 80, NULL, NULL, NULL),
  (40, 1, '2006-03-22 16:03:40+00', '2006-03-22 16:03:40+00', 6, 100, NULL, NULL, NULL),
  (41, 1, '2006-03-22 16:03:47+00', '2006-03-22 16:03:47+00', 7, 40, NULL, NULL, NULL),
  (42, 1, '2006-03-22 16:03:54+00', '2006-03-22 16:03:54+00', 8, 40, NULL, NULL, NULL),
  (43, 1, '2006-03-22 16:04:02+00', '2006-03-22 16:04:02+00', 14, 40, NULL, NULL, NULL),
  (44, 1, '2006-03-22 16:04:07+00', '2006-03-22 16:04:07+00', 17, 40, NULL, NULL, NULL),
  (45, 1, '2006-03-22 16:04:12+00', '2006-03-22 16:04:12+00', 19, 20, NULL, NULL, NULL),
  (46, 1, '2006-03-22 16:04:17+00', '2006-03-22 16:04:17+00', 20, 40, NULL, NULL, NULL),
  (47, 1, '2006-03-22 16:04:20+00', '2006-03-22 16:04:20+00', 21, 20, NULL, NULL, NULL),
  (48, 1, '2006-03-22 16:04:24+00', '2006-03-22 16:04:24+00', 40, 120, NULL, NULL, NULL),
  (49, 1, '2006-03-22 16:04:28+00', '2006-03-22 16:04:28+00', 41, 40, NULL, NULL, NULL),
  (50, 1, '2006-03-22 16:04:31+00', '2006-03-22 16:04:31+00', 48, 100, NULL, NULL, NULL),
  (51, 1, '2006-03-22 16:04:38+00', '2006-03-22 16:04:38+00', 51, 40, NULL, NULL, NULL),
  (52, 1, '2006-03-22 16:04:41+00', '2006-03-22 16:04:41+00', 74, 20, NULL, NULL, NULL),
  (53, 1, '2006-03-22 16:04:45+00', '2006-03-22 16:04:45+00', 77, 60, NULL, NULL, NULL),
  (54, 1, '2006-03-22 16:05:07+00', '2006-03-22 16:05:07+00', 3, 100, NULL, NULL, NULL),
  (55, 1, '2006-03-22 16:05:11+00', '2006-03-22 16:05:11+00', 4, 40, NULL, NULL, NULL),
  (56, 1, '2006-03-22 16:05:14+00', '2006-03-22 16:05:14+00', 5, 40, NULL, NULL, NULL),
  (57, 1, '2006-03-22 16:05:26+00', '2006-03-22 16:05:26+00', 65, 40, NULL, NULL, NULL),
  (58, 1, '2006-03-22 16:05:32+00', '2006-03-22 16:05:32+00', 66, 80, NULL, NULL, NULL),
  (59, 1, '2006-03-22 16:05:47+00', '2006-03-22 16:05:47+00', 1, 40, NULL, NULL, NULL),
  (60, 1, '2006-03-22 16:05:51+00', '2006-03-22 16:05:51+00', 34, 60, NULL, NULL, NULL),
  (61, 1, '2006-03-22 16:06:00+00', '2006-03-22 16:06:00+00', 43, 100, NULL, NULL, NULL),
  (62, 1, '2006-03-22 16:06:03+00', '2006-03-22 16:06:03+00', 81, 125, NULL, NULL, NULL),
  (63, 2, '2006-03-22 16:07:56+00', '2006-03-24 11:03:00+00', 80, 30, NULL, NULL, NULL),
  (64, 2, '2006-03-22 16:08:19+00', '2006-03-22 16:08:59+00', 7, 10, NULL, NULL, NULL),
  (65, 2, '2006-03-22 16:08:29+00', '2006-03-22 16:08:59+00', 51, 10, NULL, NULL, NULL),
  (66, 2, '2006-03-22 16:08:37+00', '2006-03-22 16:08:59+00', 80, 10, NULL, NULL, NULL),
  (67, 2, '2006-03-22 16:09:46+00', '2006-03-22 16:10:27+00', 1, 15, NULL, NULL, NULL),
  (68, 2, '2006-03-22 16:10:06+00', '2006-03-22 16:10:27+00', 43, 20, NULL, NULL, NULL),
  (69, 2, '2006-03-22 16:11:39+00', '2006-03-24 11:00:55+00', 19, 20, NULL, NULL, NULL),
  (70, 2, '2006-03-22 16:11:56+00', '2006-03-24 10:59:41+00', 48, 10, NULL, NULL, NULL),
  (71, 2, '2006-03-22 16:12:29+00', '2006-03-24 10:57:38+00', 8, 17, NULL, NULL, NULL),
  (72, 1, '2006-03-24 10:41:30+00', '2006-03-24 10:41:30+00', 81, 200, NULL, NULL, NULL),
  (73, 2, '2006-03-24 10:41:33+00', '2006-03-24 10:41:42+00', 81, 200, NULL, NULL, 'Fill Back Ordered product, Order #40'),
  (74, 1, '2006-03-24 10:53:13+00', '2006-03-24 10:53:13+00', 48, 100, NULL, NULL, NULL),
  (75, 2, '2006-03-24 10:53:16+00', '2006-03-24 10:55:46+00', 48, 100, NULL, NULL, 'Fill Back Ordered product, Order #39'),
  (76, 1, '2006-03-24 10:53:36+00', '2006-03-24 10:53:36+00', 43, 300, NULL, NULL, NULL),
  (77, 2, '2006-03-24 10:53:39+00', '2006-03-24 10:56:57+00', 43, 300, NULL, NULL, 'Fill Back Ordered product, Order #38'),
  (78, 1, '2006-03-24 10:54:04+00', '2006-03-24 10:54:04+00', 41, 200, NULL, NULL, NULL),
  (79, 2, '2006-03-24 10:54:07+00', '2006-03-24 10:58:40+00', 41, 200, NULL, NULL, 'Fill Back Ordered product, Order #36'),
  (80, 1, '2006-03-24 10:54:33+00', '2006-03-24 10:54:33+00', 19, 30, NULL, NULL, NULL),
  (81, 2, '2006-03-24 10:54:35+00', '2006-03-24 11:02:02+00', 19, 30, NULL, NULL, 'Fill Back Ordered product, Order #33'),
  (82, 1, '2006-03-24 10:54:58+00', '2006-03-24 10:54:58+00', 34, 100, NULL, NULL, NULL),
  (83, 2, '2006-03-24 10:55:02+00', '2006-03-24 11:03:00+00', 34, 100, NULL, NULL, 'Fill Back Ordered product, Order #30'),
  (84, 2, '2006-03-24 14:48:15+00', '2006-04-04 11:41:14+00', 6, 10, NULL, NULL, NULL),
  (85, 2, '2006-03-24 14:48:23+00', '2006-04-04 11:41:14+00', 4, 10, NULL, NULL, NULL),
  (86, 3, '2006-03-24 14:49:16+00', '2006-03-24 14:49:16+00', 80, 20, NULL, NULL, NULL),
  (87, 3, '2006-03-24 14:49:20+00', '2006-03-24 14:49:20+00', 81, 50, NULL, NULL, NULL),
  (88, 3, '2006-03-24 14:50:09+00', '2006-03-24 14:50:09+00', 1, 25, NULL, NULL, NULL),
  (89, 3, '2006-03-24 14:50:14+00', '2006-03-24 14:50:14+00', 43, 25, NULL, NULL, NULL),
  (90, 3, '2006-03-24 14:50:18+00', '2006-03-24 14:50:18+00', 81, 25, NULL, NULL, NULL),
  (91, 2, '2006-03-24 14:51:03+00', '2006-04-04 11:09:24+00', 40, 50, NULL, NULL, NULL),
  (92, 2, '2006-03-24 14:55:03+00', '2006-04-04 11:06:56+00', 21, 20, NULL, NULL, NULL),
  (93, 2, '2006-03-24 14:55:39+00', '2006-04-04 11:06:13+00', 5, 25, NULL, NULL, NULL),
  (94, 2, '2006-03-24 14:55:52+00', '2006-04-04 11:06:13+00', 41, 30, NULL, NULL, NULL),
  (95, 2, '2006-03-24 14:56:09+00', '2006-04-04 11:06:13+00', 40, 30, NULL, NULL, NULL),
  (96, 3, '2006-03-30 16:46:34+00', '2006-03-30 16:46:34+00', 34, 12, NULL, NULL, NULL),
  (97, 3, '2006-03-30 17:23:27+00', '2006-03-30 17:23:27+00', 34, 10, NULL, NULL, NULL),
  (98, 3, '2006-03-30 17:24:33+00', '2006-03-30 17:24:33+00', 34, 1, NULL, NULL, NULL),
  (99, 2, '2006-04-03 13:50:08+00', '2006-04-03 13:50:15+00', 48, 10, NULL, NULL, NULL),
  (100, 1, '2006-04-04 11:00:54+00', '2006-04-04 11:00:54+00', 57, 100, NULL, NULL, NULL),
  (101, 2, '2006-04-04 11:00:56+00', '2006-04-04 11:08:49+00', 57, 100, NULL, NULL, 'Fill Back Ordered product, Order #46'),
  (102, 1, '2006-04-04 11:01:14+00', '2006-04-04 11:01:14+00', 34, 50, NULL, NULL, NULL),
  (103, 1, '2006-04-04 11:01:35+00', '2006-04-04 11:01:35+00', 43, 250, NULL, NULL, NULL),
  (104, 3, '2006-04-04 11:01:37+00', '2006-04-04 11:01:37+00', 43, 300, NULL, NULL, 'Fill Back Ordered product, Order #41'),
  (105, 1, '2006-04-04 11:01:55+00', '2006-04-04 11:01:55+00', 8, 25, NULL, NULL, NULL),
  (106, 2, '2006-04-04 11:01:58+00', '2006-04-04 11:07:37+00', 8, 25, NULL, NULL, 'Fill Back Ordered product, Order #48'),
  (107, 1, '2006-04-04 11:02:17+00', '2006-04-04 11:02:17+00', 34, 300, NULL, NULL, NULL),
  (108, 2, '2006-04-04 11:02:19+00', '2006-04-04 11:08:14+00', 34, 300, NULL, NULL, 'Fill Back Ordered product, Order #47'),
  (109, 1, '2006-04-04 11:02:37+00', '2006-04-04 11:02:37+00', 19, 25, NULL, NULL, NULL),
  (110, 2, '2006-04-04 11:02:39+00', '2006-04-04 11:41:14+00', 19, 10, NULL, NULL, 'Fill Back Ordered product, Order #42'),
  (111, 1, '2006-04-04 11:02:56+00', '2006-04-04 11:02:56+00', 19, 10, NULL, NULL, NULL),
  (112, 2, '2006-04-04 11:02:58+00', '2006-04-04 11:07:37+00', 19, 25, NULL, NULL, 'Fill Back Ordered product, Order #48'),
  (113, 1, '2006-04-04 11:03:12+00', '2006-04-04 11:03:12+00', 72, 50, NULL, NULL, NULL),
  (114, 2, '2006-04-04 11:03:14+00', '2006-04-04 11:08:49+00', 72, 50, NULL, NULL, 'Fill Back Ordered product, Order #46'),
  (115, 1, '2006-04-04 11:03:38+00', '2006-04-04 11:03:38+00', 41, 50, NULL, NULL, NULL),
  (116, 2, '2006-04-04 11:03:39+00', '2006-04-04 11:09:24+00', 41, 50, NULL, NULL, 'Fill Back Ordered product, Order #45'),
  (117, 2, '2006-04-04 11:04:55+00', '2006-04-04 11:05:04+00', 34, 87, NULL, NULL, NULL),
  (118, 2, '2006-04-04 11:35:50+00', '2006-04-04 11:35:54+00', 51, 30, NULL, NULL, NULL),
  (119, 2, '2006-04-04 11:35:51+00', '2006-04-04 11:35:54+00', 7, 30, NULL, NULL, NULL),
  (120, 2, '2006-04-04 11:36:15+00', '2006-04-04 11:36:21+00', 17, 40, NULL, NULL, NULL),
  (121, 2, '2006-04-04 11:36:39+00', '2006-04-04 11:36:47+00', 6, 90, NULL, NULL, NULL),
  (122, 2, '2006-04-04 11:37:06+00', '2006-04-04 11:37:09+00', 4, 30, NULL, NULL, NULL),
  (123, 2, '2006-04-04 11:37:45+00', '2006-04-04 11:37:49+00', 48, 40, NULL, NULL, NULL),
  (124, 2, '2006-04-04 11:38:07+00', '2006-04-04 11:38:11+00', 48, 40, NULL, NULL, NULL),
  (125, 2, '2006-04-04 11:38:27+00', '2006-04-04 11:38:32+00', 41, 10, NULL, NULL, NULL),
  (126, 2, '2006-04-04 11:38:48+00', '2006-04-04 11:38:53+00', 43, 5, NULL, NULL, NULL),
  (127, 2, '2006-04-04 11:39:12+00', '2006-04-04 11:39:29+00', 40, 40, NULL, NULL, NULL),
  (128, 2, '2006-04-04 11:39:50+00', '2006-04-04 11:39:53+00', 8, 20, NULL, NULL, NULL),
  (129, 2, '2006-04-04 11:40:13+00', '2006-04-04 11:40:16+00', 80, 15, NULL, NULL, NULL),
  (130, 2, '2006-04-04 11:40:32+00', '2006-04-04 11:40:38+00', 74, 20, NULL, NULL, NULL),
  (131, 2, '2006-04-04 11:41:39+00', '2006-04-04 11:41:45+00', 72, 40, NULL, NULL, NULL),
  (132, 2, '2006-04-04 11:42:17+00', '2006-04-04 11:42:26+00', 3, 50, NULL, NULL, NULL),
  (133, 2, '2006-04-04 11:42:24+00', '2006-04-04 11:42:26+00', 8, 3, NULL, NULL, NULL),
  (134, 2, '2006-04-04 11:42:48+00', '2006-04-04 11:43:08+00', 20, 40, NULL, NULL, NULL),
  (135, 2, '2006-04-04 11:43:05+00', '2006-04-04 11:43:08+00', 52, 40, NULL, NULL, NULL),
  (136, 3, '2006-04-25 17:04:05+00', '2006-04-25 17:04:57+00', 56, 110, NULL, NULL, NULL);


--
-- Data for Name: invoices; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.invoices VALUES
  (5, 31, '2006-03-22 16:08:59+00', NULL, 0.0000, 0.0000, 0.0000),
  (6, 32, '2006-03-22 16:10:27+00', NULL, 0.0000, 0.0000, 0.0000),
  (7, 40, '2006-03-24 10:41:41+00', NULL, 0.0000, 0.0000, 0.0000),
  (8, 39, '2006-03-24 10:55:46+00', NULL, 0.0000, 0.0000, 0.0000),
  (9, 38, '2006-03-24 10:56:57+00', NULL, 0.0000, 0.0000, 0.0000),
  (10, 37, '2006-03-24 10:57:38+00', NULL, 0.0000, 0.0000, 0.0000),
  (11, 36, '2006-03-24 10:58:40+00', NULL, 0.0000, 0.0000, 0.0000),
  (12, 35, '2006-03-24 10:59:41+00', NULL, 0.0000, 0.0000, 0.0000),
  (13, 34, '2006-03-24 11:00:55+00', NULL, 0.0000, 0.0000, 0.0000),
  (14, 33, '2006-03-24 11:02:02+00', NULL, 0.0000, 0.0000, 0.0000),
  (15, 30, '2006-03-24 11:03:00+00', NULL, 0.0000, 0.0000, 0.0000),
  (16, 56, '2006-04-03 13:50:15+00', NULL, 0.0000, 0.0000, 0.0000),
  (17, 55, '2006-04-04 11:05:04+00', NULL, 0.0000, 0.0000, 0.0000),
  (18, 51, '2006-04-04 11:06:13+00', NULL, 0.0000, 0.0000, 0.0000),
  (19, 50, '2006-04-04 11:06:56+00', NULL, 0.0000, 0.0000, 0.0000),
  (20, 48, '2006-04-04 11:07:37+00', NULL, 0.0000, 0.0000, 0.0000),
  (21, 47, '2006-04-04 11:08:14+00', NULL, 0.0000, 0.0000, 0.0000),
  (22, 46, '2006-04-04 11:08:49+00', NULL, 0.0000, 0.0000, 0.0000),
  (23, 45, '2006-04-04 11:09:24+00', NULL, 0.0000, 0.0000, 0.0000),
  (24, 79, '2006-04-04 11:35:54+00', NULL, 0.0000, 0.0000, 0.0000),
  (25, 78, '2006-04-04 11:36:21+00', NULL, 0.0000, 0.0000, 0.0000),
  (26, 77, '2006-04-04 11:36:47+00', NULL, 0.0000, 0.0000, 0.0000),
  (27, 76, '2006-04-04 11:37:09+00', NULL, 0.0000, 0.0000, 0.0000),
  (28, 75, '2006-04-04 11:37:49+00', NULL, 0.0000, 0.0000, 0.0000),
  (29, 74, '2006-04-04 11:38:11+00', NULL, 0.0000, 0.0000, 0.0000),
  (30, 73, '2006-04-04 11:38:32+00', NULL, 0.0000, 0.0000, 0.0000),
  (31, 72, '2006-04-04 11:38:53+00', NULL, 0.0000, 0.0000, 0.0000),
  (32, 71, '2006-04-04 11:39:29+00', NULL, 0.0000, 0.0000, 0.0000),
  (33, 70, '2006-04-04 11:39:53+00', NULL, 0.0000, 0.0000, 0.0000),
  (34, 69, '2006-04-04 11:40:16+00', NULL, 0.0000, 0.0000, 0.0000),
  (35, 67, '2006-04-04 11:40:38+00', NULL, 0.0000, 0.0000, 0.0000),
  (36, 42, '2006-04-04 11:41:14+00', NULL, 0.0000, 0.0000, 0.0000),
  (37, 60, '2006-04-04 11:41:45+00', NULL, 0.0000, 0.0000, 0.0000),
  (38, 63, '2006-04-04 11:42:26+00', NULL, 0.0000, 0.0000, 0.0000),
  (39, 58, '2006-04-04 11:43:08+00', NULL, 0.0000, 0.0000, 0.0000);


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.order_details VALUES
  (27, 30, 34, 100.0000, 14.0000, 0, 2, NULL, 96, 83),
  (28, 30, 80, 30.0000, 3.5000, 0, 2, NULL, NULL, 63),
  (29, 31, 7, 10.0000, 30.0000, 0, 2, NULL, NULL, 64),
  (30, 31, 51, 10.0000, 53.0000, 0, 2, NULL, NULL, 65),
  (31, 31, 80, 10.0000, 3.5000, 0, 2, NULL, NULL, 66),
  (32, 32, 1, 15.0000, 18.0000, 0, 2, NULL, NULL, 67),
  (33, 32, 43, 20.0000, 46.0000, 0, 2, NULL, NULL, 68),
  (34, 33, 19, 30.0000, 9.2000, 0, 2, NULL, 97, 81),
  (35, 34, 19, 20.0000, 9.2000, 0, 2, NULL, NULL, 69),
  (36, 35, 48, 10.0000, 12.7500, 0, 2, NULL, NULL, 70),
  (37, 36, 41, 200.0000, 9.6500, 0, 2, NULL, 98, 79),
  (38, 37, 8, 17.0000, 40.0000, 0, 2, NULL, NULL, 71),
  (39, 38, 43, 300.0000, 46.0000, 0, 2, NULL, 99, 77),
  (40, 39, 48, 100.0000, 12.7500, 0, 2, NULL, 100, 75),
  (41, 40, 81, 200.0000, 2.9900, 0, 2, NULL, 101, 73),
  (42, 41, 43, 300.0000, 46.0000, 0, 1, NULL, 102, 104),
  (43, 42, 6, 10.0000, 25.0000, 0, 2, NULL, NULL, 84),
  (44, 42, 4, 10.0000, 22.0000, 0, 2, NULL, NULL, 85),
  (45, 42, 19, 10.0000, 9.2000, 0, 2, NULL, 103, 110),
  (46, 43, 80, 20.0000, 3.5000, 0, 1, NULL, NULL, 86),
  (47, 43, 81, 50.0000, 2.9900, 0, 1, NULL, NULL, 87),
  (48, 44, 1, 25.0000, 18.0000, 0, 1, NULL, NULL, 88),
  (49, 44, 43, 25.0000, 46.0000, 0, 1, NULL, NULL, 89),
  (50, 44, 81, 25.0000, 2.9900, 0, 1, NULL, NULL, 90),
  (51, 45, 41, 50.0000, 9.6500, 0, 2, NULL, 104, 116),
  (52, 45, 40, 50.0000, 18.4000, 0, 2, NULL, NULL, 91),
  (53, 46, 57, 100.0000, 19.5000, 0, 2, NULL, 105, 101),
  (54, 46, 72, 50.0000, 34.8000, 0, 2, NULL, 106, 114),
  (55, 47, 34, 300.0000, 14.0000, 0, 2, NULL, 107, 108),
  (56, 48, 8, 25.0000, 40.0000, 0, 2, NULL, 108, 106),
  (57, 48, 19, 25.0000, 9.2000, 0, 2, NULL, 109, 112),
  (59, 50, 21, 20.0000, 10.0000, 0, 2, NULL, NULL, 92),
  (60, 51, 5, 25.0000, 21.3500, 0, 2, NULL, NULL, 93),
  (61, 51, 41, 30.0000, 9.6500, 0, 2, NULL, NULL, 94),
  (62, 51, 40, 30.0000, 18.4000, 0, 2, NULL, NULL, 95),
  (66, 56, 48, 10.0000, 12.7500, 0, 2, NULL, 111, 99),
  (67, 55, 34, 87.0000, 14.0000, 0, 2, NULL, NULL, 117),
  (68, 79, 7, 30.0000, 30.0000, 0, 2, NULL, NULL, 119),
  (69, 79, 51, 30.0000, 53.0000, 0, 2, NULL, NULL, 118),
  (70, 78, 17, 40.0000, 39.0000, 0, 2, NULL, NULL, 120),
  (71, 77, 6, 90.0000, 25.0000, 0, 2, NULL, NULL, 121),
  (72, 76, 4, 30.0000, 22.0000, 0, 2, NULL, NULL, 122),
  (73, 75, 48, 40.0000, 12.7500, 0, 2, NULL, NULL, 123),
  (74, 74, 48, 40.0000, 12.7500, 0, 2, NULL, NULL, 124),
  (75, 73, 41, 10.0000, 9.6500, 0, 2, NULL, NULL, 125),
  (76, 72, 43, 5.0000, 46.0000, 0, 2, NULL, NULL, 126),
  (77, 71, 40, 40.0000, 18.4000, 0, 2, NULL, NULL, 127),
  (78, 70, 8, 20.0000, 40.0000, 0, 2, NULL, NULL, 128),
  (79, 69, 80, 15.0000, 3.5000, 0, 2, NULL, NULL, 129),
  (80, 67, 74, 20.0000, 10.0000, 0, 2, NULL, NULL, 130),
  (81, 60, 72, 40.0000, 34.8000, 0, 2, NULL, NULL, 131),
  (82, 63, 3, 50.0000, 10.0000, 0, 2, NULL, NULL, 132),
  (83, 63, 8, 3.0000, 40.0000, 0, 2, NULL, NULL, 133),
  (84, 58, 20, 40.0000, 81.0000, 0, 2, NULL, NULL, 134),
  (85, 58, 52, 40.0000, 7.0000, 0, 2, NULL, NULL, 135),
  (86, 80, 56, 10.0000, 38.0000, 0, 1, NULL, NULL, 136),
  (90, 81, 81, 0.0000, 2.9900, 0, 5, NULL, NULL, NULL),
  (91, 81, 56, 0.0000, 38.0000, 0, 0, NULL, NULL, NULL);


--
-- Data for Name: order_details_status; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.order_details_status VALUES
  (0, 'None'),
  (1, 'Allocated'),
  (2, 'Invoiced'),
  (3, 'Shipped'),
  (4, 'On Order'),
  (5, 'No Stock');


--
-- Data for Name: orders; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.orders VALUES
  (30, 9, 27, '2006-01-15 00:00:00+00', '2006-01-22 00:00:00+00', 2, 'Karen Toh', '789 27th Street', 'Las Vegas', 'NV', '99999', 'USA', 200.0000, 0.0000, 'Check', '2006-01-15 00:00:00+00', NULL, 0, NULL, 3),
  (31, 3, 4, '2006-01-20 00:00:00+00', '2006-01-22 00:00:00+00', 1, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', 5.0000, 0.0000, 'Credit Card', '2006-01-20 00:00:00+00', NULL, 0, NULL, 3),
  (32, 4, 12, '2006-01-22 00:00:00+00', '2006-01-22 00:00:00+00', 2, 'John Edwards', '123 12th Street', 'Las Vegas', 'NV', '99999', 'USA', 5.0000, 0.0000, 'Credit Card', '2006-01-22 00:00:00+00', NULL, 0, NULL, 3),
  (33, 6, 8, '2006-01-30 00:00:00+00', '2006-01-31 00:00:00+00', 3, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', 50.0000, 0.0000, 'Credit Card', '2006-01-30 00:00:00+00', NULL, 0, NULL, 3),
  (34, 9, 4, '2006-02-06 00:00:00+00', '2006-02-07 00:00:00+00', 3, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', 4.0000, 0.0000, 'Check', '2006-02-06 00:00:00+00', NULL, 0, NULL, 3),
  (35, 3, 29, '2006-02-10 00:00:00+00', '2006-02-12 00:00:00+00', 2, 'Soo Jung Lee', '789 29th Street', 'Denver', 'CO', '99999', 'USA', 7.0000, 0.0000, 'Check', '2006-02-10 00:00:00+00', NULL, 0, NULL, 3),
  (36, 4, 3, '2006-02-23 00:00:00+00', '2006-02-25 00:00:00+00', 2, 'Thomas Axen', '123 3rd Street', 'Los Angelas', 'CA', '99999', 'USA', 7.0000, 0.0000, 'Cash', '2006-02-23 00:00:00+00', NULL, 0, NULL, 3),
  (37, 8, 6, '2006-03-06 00:00:00+00', '2006-03-09 00:00:00+00', 2, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', 12.0000, 0.0000, 'Credit Card', '2006-03-06 00:00:00+00', NULL, 0, NULL, 3),
  (38, 9, 28, '2006-03-10 00:00:00+00', '2006-03-11 00:00:00+00', 3, 'Amritansh Raghav', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', 10.0000, 0.0000, 'Check', '2006-03-10 00:00:00+00', NULL, 0, NULL, 3),
  (39, 3, 8, '2006-03-22 00:00:00+00', '2006-03-24 00:00:00+00', 3, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', 5.0000, 0.0000, 'Check', '2006-03-22 00:00:00+00', NULL, 0, NULL, 3),
  (40, 4, 10, '2006-03-24 00:00:00+00', '2006-03-24 00:00:00+00', 2, 'Roland Wacker', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', 9.0000, 0.0000, 'Credit Card', '2006-03-24 00:00:00+00', NULL, 0, NULL, 3),
  (41, 1, 7, '2006-03-24 00:00:00+00', NULL, NULL, 'Ming-Yang Xie', '123 7th Street', 'Boise', 'ID', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0),
  (42, 1, 10, '2006-03-24 00:00:00+00', '2006-04-07 00:00:00+00', 1, 'Roland Wacker', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 2),
  (43, 1, 11, '2006-03-24 00:00:00+00', NULL, 3, 'Peter Krschne', '123 11th Street', 'Miami', 'FL', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0),
  (44, 1, 1, '2006-03-24 00:00:00+00', NULL, NULL, 'Anna Bedecs', '123 1st Street', 'Seattle', 'WA', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0),
  (45, 1, 28, '2006-04-07 00:00:00+00', '2006-04-07 00:00:00+00', 3, 'Amritansh Raghav', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', 40.0000, 0.0000, 'Credit Card', '2006-04-07 00:00:00+00', NULL, 0, NULL, 3),
  (46, 7, 9, '2006-04-05 00:00:00+00', '2006-04-05 00:00:00+00', 1, 'Sven Mortensen', '123 9th Street', 'Salt Lake City', 'UT', '99999', 'USA', 100.0000, 0.0000, 'Check', '2006-04-05 00:00:00+00', NULL, 0, NULL, 3),
  (47, 6, 6, '2006-04-08 00:00:00+00', '2006-04-08 00:00:00+00', 2, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', 300.0000, 0.0000, 'Credit Card', '2006-04-08 00:00:00+00', NULL, 0, NULL, 3),
  (48, 4, 8, '2006-04-05 00:00:00+00', '2006-04-05 00:00:00+00', 2, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', 50.0000, 0.0000, 'Check', '2006-04-05 00:00:00+00', NULL, 0, NULL, 3),
  (50, 9, 25, '2006-04-05 00:00:00+00', '2006-04-05 00:00:00+00', 1, 'John Rodman', '789 25th Street', 'Chicago', 'IL', '99999', 'USA', 5.0000, 0.0000, 'Cash', '2006-04-05 00:00:00+00', NULL, 0, NULL, 3),
  (51, 9, 26, '2006-04-05 00:00:00+00', '2006-04-05 00:00:00+00', 3, 'Run Liu', '789 26th Street', 'Miami', 'FL', '99999', 'USA', 60.0000, 0.0000, 'Credit Card', '2006-04-05 00:00:00+00', NULL, 0, NULL, 3),
  (55, 1, 29, '2006-04-05 00:00:00+00', '2006-04-05 00:00:00+00', 2, 'Soo Jung Lee', '789 29th Street', 'Denver', 'CO', '99999', 'USA', 200.0000, 0.0000, 'Check', '2006-04-05 00:00:00+00', NULL, 0, NULL, 3),
  (56, 2, 6, '2006-04-03 00:00:00+00', '2006-04-03 00:00:00+00', 3, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', 0.0000, 0.0000, 'Check', '2006-04-03 00:00:00+00', NULL, 0, NULL, 3),
  (57, 9, 27, '2006-04-22 00:00:00+00', '2006-04-22 00:00:00+00', 2, 'Karen Toh', '789 27th Street', 'Las Vegas', 'NV', '99999', 'USA', 200.0000, 0.0000, 'Check', '2006-04-22 00:00:00+00', NULL, 0, NULL, 0),
  (58, 3, 4, '2006-04-22 00:00:00+00', '2006-04-22 00:00:00+00', 1, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', 5.0000, 0.0000, 'Credit Card', '2006-04-22 00:00:00+00', NULL, 0, NULL, 3),
  (59, 4, 12, '2006-04-22 00:00:00+00', '2006-04-22 00:00:00+00', 2, 'John Edwards', '123 12th Street', 'Las Vegas', 'NV', '99999', 'USA', 5.0000, 0.0000, 'Credit Card', '2006-04-22 00:00:00+00', NULL, 0, NULL, 0),
  (60, 6, 8, '2006-04-30 00:00:00+00', '2006-04-30 00:00:00+00', 3, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', 50.0000, 0.0000, 'Credit Card', '2006-04-30 00:00:00+00', NULL, 0, NULL, 3),
  (61, 9, 4, '2006-04-07 00:00:00+00', '2006-04-07 00:00:00+00', 3, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', 4.0000, 0.0000, 'Check', '2006-04-07 00:00:00+00', NULL, 0, NULL, 0),
  (62, 3, 29, '2006-04-12 00:00:00+00', '2006-04-12 00:00:00+00', 2, 'Soo Jung Lee', '789 29th Street', 'Denver', 'CO', '99999', 'USA', 7.0000, 0.0000, 'Check', '2006-04-12 00:00:00+00', NULL, 0, NULL, 0),
  (63, 4, 3, '2006-04-25 00:00:00+00', '2006-04-25 00:00:00+00', 2, 'Thomas Axen', '123 3rd Street', 'Los Angelas', 'CA', '99999', 'USA', 7.0000, 0.0000, 'Cash', '2006-04-25 00:00:00+00', NULL, 0, NULL, 3),
  (64, 8, 6, '2006-05-09 00:00:00+00', '2006-05-09 00:00:00+00', 2, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', 12.0000, 0.0000, 'Credit Card', '2006-05-09 00:00:00+00', NULL, 0, NULL, 0),
  (65, 9, 28, '2006-05-11 00:00:00+00', '2006-05-11 00:00:00+00', 3, 'Amritansh Raghav', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', 10.0000, 0.0000, 'Check', '2006-05-11 00:00:00+00', NULL, 0, NULL, 0),
  (66, 3, 8, '2006-05-24 00:00:00+00', '2006-05-24 00:00:00+00', 3, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', 5.0000, 0.0000, 'Check', '2006-05-24 00:00:00+00', NULL, 0, NULL, 0),
  (67, 4, 10, '2006-05-24 00:00:00+00', '2006-05-24 00:00:00+00', 2, 'Roland Wacker', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', 9.0000, 0.0000, 'Credit Card', '2006-05-24 00:00:00+00', NULL, 0, NULL, 3),
  (68, 1, 7, '2006-05-24 00:00:00+00', NULL, NULL, 'Ming-Yang Xie', '123 7th Street', 'Boise', 'ID', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0),
  (69, 1, 10, '2006-05-24 00:00:00+00', NULL, 1, 'Roland Wacker', '123 10th Street', 'Chicago', 'IL', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0),
  (70, 1, 11, '2006-05-24 00:00:00+00', NULL, 3, 'Peter Krschne', '123 11th Street', 'Miami', 'FL', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0),
  (71, 1, 1, '2006-05-24 00:00:00+00', NULL, 3, 'Anna Bedecs', '123 1st Street', 'Seattle', 'WA', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0),
  (72, 1, 28, '2006-06-07 00:00:00+00', '2006-06-07 00:00:00+00', 3, 'Amritansh Raghav', '789 28th Street', 'Memphis', 'TN', '99999', 'USA', 40.0000, 0.0000, 'Credit Card', '2006-06-07 00:00:00+00', NULL, 0, NULL, 3),
  (73, 7, 9, '2006-06-05 00:00:00+00', '2006-06-05 00:00:00+00', 1, 'Sven Mortensen', '123 9th Street', 'Salt Lake City', 'UT', '99999', 'USA', 100.0000, 0.0000, 'Check', '2006-06-05 00:00:00+00', NULL, 0, NULL, 3),
  (74, 6, 6, '2006-06-08 00:00:00+00', '2006-06-08 00:00:00+00', 2, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', 300.0000, 0.0000, 'Credit Card', '2006-06-08 00:00:00+00', NULL, 0, NULL, 3),
  (75, 4, 8, '2006-06-05 00:00:00+00', '2006-06-05 00:00:00+00', 2, 'Elizabeth Andersen', '123 8th Street', 'Portland', 'OR', '99999', 'USA', 50.0000, 0.0000, 'Check', '2006-06-05 00:00:00+00', NULL, 0, NULL, 3),
  (76, 9, 25, '2006-06-05 00:00:00+00', '2006-06-05 00:00:00+00', 1, 'John Rodman', '789 25th Street', 'Chicago', 'IL', '99999', 'USA', 5.0000, 0.0000, 'Cash', '2006-06-05 00:00:00+00', NULL, 0, NULL, 3),
  (77, 9, 26, '2006-06-05 00:00:00+00', '2006-06-05 00:00:00+00', 3, 'Run Liu', '789 26th Street', 'Miami', 'FL', '99999', 'USA', 60.0000, 0.0000, 'Credit Card', '2006-06-05 00:00:00+00', NULL, 0, NULL, 3),
  (78, 1, 29, '2006-06-05 00:00:00+00', '2006-06-05 00:00:00+00', 2, 'Soo Jung Lee', '789 29th Street', 'Denver', 'CO', '99999', 'USA', 200.0000, 0.0000, 'Check', '2006-06-05 00:00:00+00', NULL, 0, NULL, 3),
  (79, 2, 6, '2006-06-23 00:00:00+00', '2006-06-23 00:00:00+00', 3, 'Francisco Pérez-Olaeta', '123 6th Street', 'Milwaukee', 'WI', '99999', 'USA', 0.0000, 0.0000, 'Check', '2006-06-23 00:00:00+00', NULL, 0, NULL, 3),
  (80, 2, 4, '2006-04-25 17:03:55+00', NULL, NULL, 'Christina Lee', '123 4th Street', 'New York', 'NY', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0),
  (81, 2, 3, '2006-04-25 17:26:53+00', NULL, NULL, 'Thomas Axen', '123 3rd Street', 'Los Angelas', 'CA', '99999', 'USA', 0.0000, 0.0000, NULL, NULL, NULL, 0, NULL, 0);


--
-- Data for Name: orders_status; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.orders_status VALUES
  (0, 'New'),
  (1, 'Invoiced'),
  (2, 'Shipped'),
  (3, 'Closed');


--
-- Data for Name: orders_tax_status; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.orders_tax_status VALUES
  (0, 'Tax Exempt'),
  (1, 'Taxable');


--
-- Data for Name: privileges; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.privileges VALUES
  (2, 'Purchase Approvals');


--
-- Data for Name: products; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.products VALUES
  ('4', 1, 'NWTB-1', 'Southwind Traders Chai', NULL, 13.5000, 18.0000, 10, 40, '10 boxes x 20 bags', false, 10, 'Beverages', '\x'),
  ('10', 3, 'NWTCO-3', 'Southwind Traders Syrup', NULL, 7.5000, 10.0000, 25, 100, '12 - 550 ml bottles', false, 25, 'Condiments', '\x'),
  ('10', 4, 'NWTCO-4', 'Southwind Traders Cajun Seasoning', NULL, 16.5000, 22.0000, 10, 40, '48 - 6 oz jars', false, 10, 'Condiments', '\x'),
  ('10', 5, 'NWTO-5', 'Southwind Traders Olive Oil', NULL, 16.0125, 21.3500, 10, 40, '36 boxes', false, 10, 'Oil', '\x'),
  ('2;6', 6, 'NWTJP-6', 'Southwind Traders Boysenberry Spread', NULL, 18.7500, 25.0000, 25, 100, '12 - 8 oz jars', false, 25, 'Jams, Preserves', '\x'),
  ('2', 7, 'NWTDFN-7', 'Southwind Traders Dried Pears', NULL, 22.5000, 30.0000, 10, 40, '12 - 1 lb pkgs.', false, 10, 'Dried Fruit & Nuts', '\x'),
  ('8', 8, 'NWTS-8', 'Southwind Traders Curry Sauce', NULL, 30.0000, 40.0000, 10, 40, '12 - 12 oz jars', false, 10, 'Sauces', '\x'),
  ('2;6', 14, 'NWTDFN-14', 'Southwind Traders Walnuts', NULL, 17.4375, 23.2500, 10, 40, '40 - 100 g pkgs.', false, 10, 'Dried Fruit & Nuts', '\x'),
  ('6', 17, 'NWTCFV-17', 'Southwind Traders Fruit Cocktail', NULL, 29.2500, 39.0000, 10, 40, '15.25 OZ', false, 10, 'Canned Fruit & Vegetables', '\x'),
  ('1', 19, 'NWTBGM-19', 'Southwind Traders Chocolate Biscuits Mix', NULL, 6.9000, 9.2000, 5, 20, '10 boxes x 12 pieces', false, 5, 'Baked Goods & Mixes', '\x'),
  ('2;6', 20, 'NWTJP-6', 'Southwind Traders Marmalade', NULL, 60.7500, 81.0000, 10, 40, '30 gift boxes', false, 10, 'Jams, Preserves', '\x'),
  ('1', 21, 'NWTBGM-21', 'Southwind Traders Scones', NULL, 7.5000, 10.0000, 5, 20, '24 pkgs. x 4 pieces', false, 5, 'Baked Goods & Mixes', '\x'),
  ('4', 34, 'NWTB-34', 'Southwind Traders Beer', NULL, 10.5000, 14.0000, 15, 60, '24 - 12 oz bottles', false, 15, 'Beverages', '\x'),
  ('7', 40, 'NWTCM-40', 'Southwind Traders Crab Meat', NULL, 13.8000, 18.4000, 30, 120, '24 - 4 oz tins', false, 30, 'Canned Meat', '\x'),
  ('6', 41, 'NWTSO-41', 'Southwind Traders Clam Chowder', NULL, 7.2375, 9.6500, 10, 40, '12 - 12 oz cans', false, 10, 'Soups', '\x'),
  ('3;4', 43, 'NWTB-43', 'Southwind Traders Coffee', NULL, 34.5000, 46.0000, 25, 100, '16 - 500 g tins', false, 25, 'Beverages', '\x'),
  ('10', 48, 'NWTCA-48', 'Southwind Traders Chocolate', NULL, 9.5625, 12.7500, 25, 100, '10 pkgs', false, 25, 'Candy', '\x'),
  ('2', 51, 'NWTDFN-51', 'Southwind Traders Dried Apples', NULL, 39.7500, 53.0000, 10, 40, '50 - 300 g pkgs.', false, 10, 'Dried Fruit & Nuts', '\x'),
  ('1', 52, 'NWTG-52', 'Southwind Traders Long Grain Rice', NULL, 5.2500, 7.0000, 25, 100, '16 - 2 kg boxes', false, 25, 'Grains', '\x'),
  ('1', 56, 'NWTP-56', 'Southwind Traders Gnocchi', NULL, 28.5000, 38.0000, 30, 120, '24 - 250 g pkgs.', false, 30, 'Pasta', '\x'),
  ('1', 57, 'NWTP-57', 'Southwind Traders Ravioli', NULL, 14.6250, 19.5000, 20, 80, '24 - 250 g pkgs.', false, 20, 'Pasta', '\x'),
  ('8', 65, 'NWTS-65', 'Southwind Traders Hot Pepper Sauce', NULL, 15.7875, 21.0500, 10, 40, '32 - 8 oz bottles', false, 10, 'Sauces', '\x'),
  ('8', 66, 'NWTS-66', 'Southwind Traders Tomato Sauce', NULL, 12.7500, 17.0000, 20, 80, '24 - 8 oz jars', false, 20, 'Sauces', '\x'),
  ('5', 72, 'NWTD-72', 'Southwind Traders Mozzarella', NULL, 26.1000, 34.8000, 10, 40, '24 - 200 g pkgs.', false, 10, 'Dairy products', '\x'),
  ('2;6', 74, 'NWTDFN-74', 'Southwind Traders Almonds', NULL, 7.5000, 10.0000, 5, 20, '5 kg pkg.', false, 5, 'Dried Fruit & Nuts', '\x'),
  ('10', 77, 'NWTCO-77', 'Southwind Traders Mustard', NULL, 9.7500, 13.0000, 15, 60, '12 boxes', false, 15, 'Condiments', '\x'),
  ('2', 80, 'NWTDFN-80', 'Southwind Traders Dried Plums', NULL, 3.0000, 3.5000, 50, 75, '1 lb bag', false, 25, 'Dried Fruit & Nuts', '\x'),
  ('3', 81, 'NWTB-81', 'Southwind Traders Green Tea', NULL, 2.0000, 2.9900, 100, 125, '20 bags per box', false, 25, 'Beverages', '\x'),
  ('1', 82, 'NWTC-82', 'Southwind Traders Granola', NULL, 2.0000, 4.0000, 20, 100, NULL, false, NULL, 'Cereal', '\x'),
  ('9', 83, 'NWTCS-83', 'Southwind Traders Potato Chips', NULL, 0.5000, 1.8000, 30, 200, NULL, false, NULL, 'Chips, Snacks', '\x'),
  ('1', 85, 'NWTBGM-85', 'Southwind Traders Brownie Mix', NULL, 9.0000, 12.4900, 10, 20, '3 boxes', false, 5, 'Baked Goods & Mixes', '\x'),
  ('1', 86, 'NWTBGM-86', 'Southwind Traders Cake Mix', NULL, 10.5000, 15.9900, 10, 20, '4 boxes', false, 5, 'Baked Goods & Mixes', '\x'),
  ('7', 87, 'NWTB-87', 'Southwind Traders Tea', NULL, 2.0000, 4.0000, 20, 50, '100 count per box', false, NULL, 'Beverages', '\x'),
  ('6', 88, 'NWTCFV-88', 'Southwind Traders Pears', NULL, 1.0000, 1.3000, 10, 40, '15.25 OZ', false, NULL, 'Canned Fruit & Vegetables', '\x'),
  ('6', 89, 'NWTCFV-89', 'Southwind Traders Peaches', NULL, 1.0000, 1.5000, 10, 40, '15.25 OZ', false, NULL, 'Canned Fruit & Vegetables', '\x'),
  ('6', 90, 'NWTCFV-90', 'Southwind Traders Pineapple', NULL, 1.0000, 1.8000, 10, 40, '15.25 OZ', false, NULL, 'Canned Fruit & Vegetables', '\x'),
  ('6', 91, 'NWTCFV-91', 'Southwind Traders Cherry Pie Filling', NULL, 1.0000, 2.0000, 10, 40, '15.25 OZ', false, NULL, 'Canned Fruit & Vegetables', '\x'),
  ('6', 92, 'NWTCFV-92', 'Southwind Traders Green Beans', NULL, 1.0000, 1.2000, 10, 40, '14.5 OZ', false, NULL, 'Canned Fruit & Vegetables', '\x'),
  ('6', 93, 'NWTCFV-93', 'Southwind Traders Corn', NULL, 1.0000, 1.2000, 10, 40, '14.5 OZ', false, NULL, 'Canned Fruit & Vegetables', '\x'),
  ('6', 94, 'NWTCFV-94', 'Southwind Traders Peas', NULL, 1.0000, 1.5000, 10, 40, '14.5 OZ', false, NULL, 'Canned Fruit & Vegetables', '\x'),
  ('7', 95, 'NWTCM-95', 'Southwind Traders Tuna Fish', NULL, 0.5000, 2.0000, 30, 50, '5 oz', false, NULL, 'Canned Meat', '\x'),
  ('7', 96, 'NWTCM-96', 'Southwind Traders Smoked Salmon', NULL, 2.0000, 4.0000, 30, 50, '5 oz', false, NULL, 'Canned Meat', '\x'),
  ('1', 97, 'NWTC-82', 'Southwind Traders Hot Cereal', NULL, 3.0000, 5.0000, 50, 200, NULL, false, NULL, 'Cereal', '\x'),
  ('6', 98, 'NWTSO-98', 'Southwind Traders Vegetable Soup', NULL, 1.0000, 1.8900, 100, 200, NULL, false, NULL, 'Soups', '\x'),
  ('6', 99, 'NWTSO-99', 'Southwind Traders Chicken Soup', NULL, 1.0000, 1.9500, 100, 200, NULL, false, NULL, 'Soups', '\x');


--
-- Data for Name: purchase_order_details; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.purchase_order_details VALUES
  (238, 90, 1, 40.0000, 14.0000, '2006-01-22 00:00:00+00', true, 59),
  (239, 91, 3, 100.0000, 8.0000, '2006-01-22 00:00:00+00', true, 54),
  (240, 91, 4, 40.0000, 16.0000, '2006-01-22 00:00:00+00', true, 55),
  (241, 91, 5, 40.0000, 16.0000, '2006-01-22 00:00:00+00', true, 56),
  (242, 92, 6, 100.0000, 19.0000, '2006-01-22 00:00:00+00', true, 40),
  (243, 92, 7, 40.0000, 22.0000, '2006-01-22 00:00:00+00', true, 41),
  (244, 92, 8, 40.0000, 30.0000, '2006-01-22 00:00:00+00', true, 42),
  (245, 92, 14, 40.0000, 17.0000, '2006-01-22 00:00:00+00', true, 43),
  (246, 92, 17, 40.0000, 29.0000, '2006-01-22 00:00:00+00', true, 44),
  (247, 92, 19, 20.0000, 7.0000, '2006-01-22 00:00:00+00', true, 45),
  (248, 92, 20, 40.0000, 61.0000, '2006-01-22 00:00:00+00', true, 46),
  (249, 92, 21, 20.0000, 8.0000, '2006-01-22 00:00:00+00', true, 47),
  (250, 90, 34, 60.0000, 10.0000, '2006-01-22 00:00:00+00', true, 60),
  (251, 92, 40, 120.0000, 14.0000, '2006-01-22 00:00:00+00', true, 48),
  (252, 92, 41, 40.0000, 7.0000, '2006-01-22 00:00:00+00', true, 49),
  (253, 90, 43, 100.0000, 34.0000, '2006-01-22 00:00:00+00', true, 61),
  (254, 92, 48, 100.0000, 10.0000, '2006-01-22 00:00:00+00', true, 50),
  (255, 92, 51, 40.0000, 40.0000, '2006-01-22 00:00:00+00', true, 51),
  (256, 93, 52, 100.0000, 5.0000, '2006-01-22 00:00:00+00', true, 37),
  (257, 93, 56, 120.0000, 28.0000, '2006-01-22 00:00:00+00', true, 38),
  (258, 93, 57, 80.0000, 15.0000, '2006-01-22 00:00:00+00', true, 39),
  (259, 91, 65, 40.0000, 16.0000, '2006-01-22 00:00:00+00', true, 57),
  (260, 91, 66, 80.0000, 13.0000, '2006-01-22 00:00:00+00', true, 58),
  (261, 94, 72, 40.0000, 26.0000, '2006-01-22 00:00:00+00', true, 36),
  (262, 92, 74, 20.0000, 8.0000, '2006-01-22 00:00:00+00', true, 52),
  (263, 92, 77, 60.0000, 10.0000, '2006-01-22 00:00:00+00', true, 53),
  (264, 95, 80, 75.0000, 3.0000, '2006-01-22 00:00:00+00', true, 35),
  (265, 90, 81, 125.0000, 2.0000, '2006-01-22 00:00:00+00', true, 62),
  (266, 96, 34, 100.0000, 10.0000, '2006-01-22 00:00:00+00', true, 82),
  (267, 97, 19, 30.0000, 7.0000, '2006-01-22 00:00:00+00', true, 80),
  (268, 98, 41, 200.0000, 7.0000, '2006-01-22 00:00:00+00', true, 78),
  (269, 99, 43, 300.0000, 34.0000, '2006-01-22 00:00:00+00', true, 76),
  (270, 100, 48, 100.0000, 10.0000, '2006-01-22 00:00:00+00', true, 74),
  (271, 101, 81, 200.0000, 2.0000, '2006-01-22 00:00:00+00', true, 72),
  (272, 102, 43, 300.0000, 34.0000, NULL, false, NULL),
  (273, 103, 19, 10.0000, 7.0000, '2006-04-17 00:00:00+00', true, 111),
  (274, 104, 41, 50.0000, 7.0000, '2006-04-06 00:00:00+00', true, 115),
  (275, 105, 57, 100.0000, 15.0000, '2006-04-05 00:00:00+00', true, 100),
  (276, 106, 72, 50.0000, 26.0000, '2006-04-05 00:00:00+00', true, 113),
  (277, 107, 34, 300.0000, 10.0000, '2006-04-05 00:00:00+00', true, 107),
  (278, 108, 8, 25.0000, 30.0000, '2006-04-05 00:00:00+00', true, 105),
  (279, 109, 19, 25.0000, 7.0000, '2006-04-05 00:00:00+00', true, 109),
  (280, 110, 43, 250.0000, 34.0000, '2006-04-10 00:00:00+00', true, 103),
  (281, 90, 1, 40.0000, 14.0000, NULL, false, NULL),
  (282, 92, 19, 20.0000, 7.0000, NULL, false, NULL),
  (283, 111, 34, 50.0000, 10.0000, '2006-04-04 00:00:00+00', true, 102),
  (285, 91, 3, 50.0000, 8.0000, NULL, false, NULL),
  (286, 91, 4, 40.0000, 16.0000, NULL, false, NULL),
  (288, 140, 85, 10.0000, 9.0000, NULL, false, NULL),
  (289, 141, 6, 10.0000, 18.7500, NULL, false, NULL),
  (290, 142, 1, 1.0000, 13.5000, NULL, false, NULL),
  (292, 146, 20, 40.0000, 60.0000, NULL, false, NULL),
  (293, 146, 51, 40.0000, 39.0000, NULL, false, NULL),
  (294, 147, 40, 120.0000, 13.0000, NULL, false, NULL),
  (295, 148, 72, 40.0000, 26.0000, NULL, false, NULL);


--
-- Data for Name: purchase_order_status; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.purchase_order_status VALUES
  (0, 'New'),
  (1, 'Submitted'),
  (2, 'Approved'),
  (3, 'Closed');


--
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.purchase_orders VALUES
  (90, 1, 2, '2006-01-14 00:00:00+00', '2006-01-22 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-01-22 00:00:00+00', 2),
  (91, 3, 2, '2006-01-14 00:00:00+00', '2006-01-22 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-01-22 00:00:00+00', 2),
  (92, 2, 2, '2006-01-14 00:00:00+00', '2006-01-22 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-01-22 00:00:00+00', 2),
  (93, 5, 2, '2006-01-14 00:00:00+00', '2006-01-22 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-01-22 00:00:00+00', 2),
  (94, 6, 2, '2006-01-14 00:00:00+00', '2006-01-22 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-01-22 00:00:00+00', 2),
  (95, 4, 2, '2006-01-14 00:00:00+00', '2006-01-22 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-01-22 00:00:00+00', 2),
  (96, 1, 5, '2006-01-14 00:00:00+00', '2006-01-22 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #30', 2, '2006-01-22 00:00:00+00', 5),
  (97, 2, 7, '2006-01-14 00:00:00+00', '2006-01-22 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #33', 2, '2006-01-22 00:00:00+00', 7),
  (98, 2, 4, '2006-01-14 00:00:00+00', '2006-01-22 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #36', 2, '2006-01-22 00:00:00+00', 4),
  (99, 1, 3, '2006-01-14 00:00:00+00', '2006-01-22 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #38', 2, '2006-01-22 00:00:00+00', 3),
  (100, 2, 9, '2006-01-14 00:00:00+00', '2006-01-22 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #39', 2, '2006-01-22 00:00:00+00', 9),
  (101, 1, 2, '2006-01-14 00:00:00+00', '2006-01-22 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #40', 2, '2006-01-22 00:00:00+00', 2),
  (102, 1, 1, '2006-03-24 00:00:00+00', '2006-03-24 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #41', 2, '2006-04-04 00:00:00+00', 1),
  (103, 2, 1, '2006-03-24 00:00:00+00', '2006-03-24 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #42', 2, '2006-04-04 00:00:00+00', 1),
  (104, 2, 1, '2006-03-24 00:00:00+00', '2006-03-24 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #45', 2, '2006-04-04 00:00:00+00', 1),
  (105, 5, 7, '2006-03-24 00:00:00+00', '2006-03-24 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, 'Check', 'Purchase generated based on Order #46', 2, '2006-04-04 00:00:00+00', 7),
  (106, 6, 7, '2006-03-24 00:00:00+00', '2006-03-24 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #46', 2, '2006-04-04 00:00:00+00', 7),
  (107, 1, 6, '2006-03-24 00:00:00+00', '2006-03-24 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #47', 2, '2006-04-04 00:00:00+00', 6),
  (108, 2, 4, '2006-03-24 00:00:00+00', '2006-03-24 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #48', 2, '2006-04-04 00:00:00+00', 4),
  (109, 2, 4, '2006-03-24 00:00:00+00', '2006-03-24 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #48', 2, '2006-04-04 00:00:00+00', 4),
  (110, 1, 3, '2006-03-24 00:00:00+00', '2006-03-24 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #49', 2, '2006-04-04 00:00:00+00', 3),
  (111, 1, 2, '2006-03-31 00:00:00+00', '2006-03-31 00:00:00+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, 'Purchase generated based on Order #56', 2, '2006-04-04 00:00:00+00', 2),
  (140, 6, NULL, '2006-04-25 00:00:00+00', '2006-04-25 16:40:51+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-04-25 16:41:33+00', 2),
  (141, 8, NULL, '2006-04-25 00:00:00+00', '2006-04-25 17:10:35+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, 2, '2006-04-25 17:10:55+00', 2),
  (142, 8, NULL, '2006-04-25 00:00:00+00', '2006-04-25 17:18:29+00', 2, NULL, 0.0000, 0.0000, NULL, 0.0000, 'Check', NULL, 2, '2006-04-25 17:18:51+00', 2),
  (146, 2, 2, '2006-04-26 18:26:37+00', '2006-04-26 18:26:37+00', 1, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, NULL, NULL, 2),
  (147, 7, 2, '2006-04-26 18:33:28+00', '2006-04-26 18:33:28+00', 1, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, NULL, NULL, 2),
  (148, 5, 2, '2006-04-26 18:33:52+00', '2006-04-26 18:33:52+00', 1, NULL, 0.0000, 0.0000, NULL, 0.0000, NULL, NULL, NULL, NULL, 2);


--
-- Data for Name: sales_reports; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.sales_reports VALUES
  ('Category', 'Category', 'Sales By Category', 'SELECT DISTINCT [Category] FROM [products] ORDER BY [Category];', false),
  ('country_region', 'Country/Region', 'Sales By Country', 'SELECT DISTINCT [country_region] FROM [customers Extended] ORDER BY [country_region];', false),
  ('Customer ID', 'Customer', 'Sales By Customer', 'SELECT DISTINCT [Company] FROM [customers Extended] ORDER BY [Company];', false),
  ('employee_id', 'Employee', 'Sales By Employee', 'SELECT DISTINCT [Employee Name] FROM [employees Extended] ORDER BY [Employee Name];', false),
  ('Product ID', 'Product', 'Sales by Product', 'SELECT DISTINCT [Product Name] FROM [products] ORDER BY [Product Name];', true);


--
-- Data for Name: shippers; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.shippers VALUES
  (1, 'Shipping Company A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123 Any Street', 'Memphis', 'TN', '99999', 'USA', NULL, NULL, '\x'),
  (2, 'Shipping Company B', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123 Any Street', 'Memphis', 'TN', '99999', 'USA', NULL, NULL, '\x'),
  (3, 'Shipping Company C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123 Any Street', 'Memphis', 'TN', '99999', 'USA', NULL, NULL, '\x');


--
-- Data for Name: strings; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.strings VALUES
  (2, 'Southwind Traders'),
  (3, 'Cannot remove posted inventory!'),
  (4, 'Back ordered product filled for Order #|'),
  (5, 'Discounted price below cost!'),
  (6, 'Insufficient inventory.'),
  (7, 'Insufficient inventory. Do you want to create a purchase order?'),
  (8, 'Purchase orders were successfully created for | products'),
  (9, 'There are no products below their respective reorder levels'),
  (10, 'Must specify customer name!'),
  (11, 'Restocking will generate purchase orders for all products below desired inventory levels.  Do you want to continue?'),
  (12, 'Cannot create purchase order.  No suppliers listed for specified product'),
  (13, 'Discounted price is below cost!'),
  (14, 'Do you want to continue?'),
  (15, 'Order is already invoiced. Do you want to print the invoice?'),
  (16, 'Order does not contain any line items'),
  (17, 'Cannot create invoice!  Inventory has not been allocated for each specified product.'),
  (18, 'Sorry, there are no sales in the specified time period'),
  (19, 'Product successfully restocked.'),
  (21, 'Product does not need restocking! Product is already at desired inventory level.'),
  (22, 'Product restocking failed!'),
  (23, 'Invalid login specified!'),
  (24, 'Must first select reported!'),
  (25, 'Changing supplier will remove purchase line items, continue?'),
  (26, 'Purchase orders were successfully submitted for | products.  Do you want to view the restocking report?'),
  (27, 'There was an error attempting to restock inventory levels.'),
  (28, '| product(s) were successfully restocked.  Do you want to view the restocking report?'),
  (29, 'You cannot remove purchase line items already posted to inventory!'),
  (30, 'There was an error removing one or more purchase line items.'),
  (31, 'You cannot modify quantity for purchased product already received or posted to inventory.'),
  (32, 'You cannot modify price for purchased product already received or posted to inventory.'),
  (33, 'Product has been successfully posted to inventory.'),
  (34, 'Sorry, product cannot be successfully posted to inventory.'),
  (35, 'There are orders with this product on back order.  Would you like to fill them now?'),
  (36, 'Cannot post product to inventory without specifying received date!'),
  (37, 'Do you want to post received product to inventory?'),
  (38, 'Initialize purchase, orders, and inventory data?'),
  (39, 'Must first specify employee name!'),
  (40, 'Specified user must be logged in to approve purchase!'),
  (41, 'Purchase order must contain completed line items before it can be approved'),
  (42, 'Sorry, you do not have permission to approve purchases.'),
  (43, 'Purchase successfully approved'),
  (44, 'Purchase cannot be approved'),
  (45, 'Purchase successfully submitted for approval'),
  (46, 'Purchase cannot be submitted for approval'),
  (47, 'Sorry, purchase order does not contain line items'),
  (48, 'Do you want to cancel this order?'),
  (49, 'Canceling an order will permanently delete the order.  Are you sure you want to cancel?'),
  (100, 'Your order was successfully canceled.'),
  (101, 'Cannot cancel an order that has items received and posted to inventory.'),
  (102, 'There was an error trying to cancel this order.'),
  (103, 'The invoice for this order has not yet been created.'),
  (104, 'Shipping information is not complete.  Please specify all shipping information and try again.'),
  (105, 'Cannot mark as shipped.  Order must first be invoiced!'),
  (106, 'Cannot cancel an order that has already shipped!'),
  (107, 'Must first specify salesperson!'),
  (108, 'Order is now marked closed.'),
  (109, 'Order must first be marked shipped before closing.'),
  (110, 'Must first specify payment information!'),
  (111, 'There was an error attempting to restock inventory levels.  | product(s) were successfully restocked.'),
  (112, 'You must supply a Unit Cost.'),
  (113, 'Fill back ordered product, Order #|'),
  (114, 'Purchase generated based on Order #|');


--
-- Data for Name: suppliers; Type: TABLE DATA; Schema: southwind; Owner: postgres
--

INSERT INTO southwind.suppliers VALUES
  (1, 'Supplier A', 'Andersen', 'Elizabeth A.', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\x'),
  (2, 'Supplier B', 'Weiler', 'Cornelia', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\x'),
  (3, 'Supplier C', 'Kelley', 'Madeleine', NULL, 'Sales Representative', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\x'),
  (4, 'Supplier D', 'Sato', 'Naoki', NULL, 'Marketing Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\x'),
  (5, 'Supplier E', 'Hernandez-Echevarria', 'Amaya', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\x'),
  (6, 'Supplier F', 'Hayakawa', 'Satomi', NULL, 'Marketing Assistant', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\x'),
  (7, 'Supplier G', 'Glasson', 'Stuart', NULL, 'Marketing Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\x'),
  (8, 'Supplier H', 'Dunton', 'Bryn Paul', NULL, 'Sales Representative', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\x'),
  (9, 'Supplier I', 'Sandberg', 'Mikael', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\x'),
  (10, 'Supplier J', 'Sousa', 'Luis', NULL, 'Sales Manager', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '\x');


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: southwind; Owner: postgres
--

SELECT pg_catalog.setval('southwind.customers_id_seq', 29, true);


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: southwind; Owner: postgres
--

SELECT pg_catalog.setval('southwind.employees_id_seq', 9, true);


--
-- Name: inventory_transactions_id_seq; Type: SEQUENCE SET; Schema: southwind; Owner: postgres
--

SELECT pg_catalog.setval('southwind.inventory_transactions_id_seq', 136, true);


--
-- Name: invoices_id_seq; Type: SEQUENCE SET; Schema: southwind; Owner: postgres
--

SELECT pg_catalog.setval('southwind.invoices_id_seq', 39, true);


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: southwind; Owner: postgres
--

SELECT pg_catalog.setval('southwind.order_details_id_seq', 91, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: southwind; Owner: postgres
--

SELECT pg_catalog.setval('southwind.orders_id_seq', 81, true);


--
-- Name: privileges_id_seq; Type: SEQUENCE SET; Schema: southwind; Owner: postgres
--

SELECT pg_catalog.setval('southwind.privileges_id_seq', 2, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: southwind; Owner: postgres
--

SELECT pg_catalog.setval('southwind.products_id_seq', 99, true);


--
-- Name: purchase_order_details_id_seq; Type: SEQUENCE SET; Schema: southwind; Owner: postgres
--

SELECT pg_catalog.setval('southwind.purchase_order_details_id_seq', 295, true);


--
-- Name: purchase_orders_id_seq; Type: SEQUENCE SET; Schema: southwind; Owner: postgres
--

SELECT pg_catalog.setval('southwind.purchase_orders_id_seq', 148, true);


--
-- Name: shippers_id_seq; Type: SEQUENCE SET; Schema: southwind; Owner: postgres
--

SELECT pg_catalog.setval('southwind.shippers_id_seq', 3, true);


--
-- Name: strings_string_id_seq; Type: SEQUENCE SET; Schema: southwind; Owner: postgres
--

SELECT pg_catalog.setval('southwind.strings_string_id_seq', 114, true);


--
-- Name: suppliers_id_seq; Type: SEQUENCE SET; Schema: southwind; Owner: postgres
--

SELECT pg_catalog.setval('southwind.suppliers_id_seq', 10, true);


--
-- Name: customers idx_17515_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.customers
    ADD CONSTRAINT idx_17515_primary PRIMARY KEY (id);


--
-- Name: employees idx_17535_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.employees
    ADD CONSTRAINT idx_17535_primary PRIMARY KEY (id);


--
-- Name: employee_privileges idx_17554_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.employee_privileges
    ADD CONSTRAINT idx_17554_primary PRIMARY KEY (employee_id, privilege_id);


--
-- Name: inventory_transactions idx_17558_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.inventory_transactions
    ADD CONSTRAINT idx_17558_primary PRIMARY KEY (id);


--
-- Name: inventory_transaction_types idx_17563_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.inventory_transaction_types
    ADD CONSTRAINT idx_17563_primary PRIMARY KEY (id);


--
-- Name: invoices idx_17567_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.invoices
    ADD CONSTRAINT idx_17567_primary PRIMARY KEY (id);


--
-- Name: orders idx_17575_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.orders
    ADD CONSTRAINT idx_17575_primary PRIMARY KEY (id);


--
-- Name: orders_status idx_17591_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.orders_status
    ADD CONSTRAINT idx_17591_primary PRIMARY KEY (id);


--
-- Name: orders_tax_status idx_17594_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.orders_tax_status
    ADD CONSTRAINT idx_17594_primary PRIMARY KEY (id);


--
-- Name: order_details idx_17598_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.order_details
    ADD CONSTRAINT idx_17598_primary PRIMARY KEY (id);


--
-- Name: order_details_status idx_17605_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.order_details_status
    ADD CONSTRAINT idx_17605_primary PRIMARY KEY (id);


--
-- Name: privileges idx_17609_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.privileges
    ADD CONSTRAINT idx_17609_primary PRIMARY KEY (id);


--
-- Name: products idx_17615_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.products
    ADD CONSTRAINT idx_17615_primary PRIMARY KEY (id);


--
-- Name: purchase_orders idx_17629_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.purchase_orders
    ADD CONSTRAINT idx_17629_primary PRIMARY KEY (id);


--
-- Name: purchase_order_details idx_17641_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.purchase_order_details
    ADD CONSTRAINT idx_17641_primary PRIMARY KEY (id);


--
-- Name: purchase_order_status idx_17646_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.purchase_order_status
    ADD CONSTRAINT idx_17646_primary PRIMARY KEY (id);


--
-- Name: sales_reports idx_17650_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.sales_reports
    ADD CONSTRAINT idx_17650_primary PRIMARY KEY (group_by);


--
-- Name: shippers idx_17659_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.shippers
    ADD CONSTRAINT idx_17659_primary PRIMARY KEY (id);


--
-- Name: strings idx_17679_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.strings
    ADD CONSTRAINT idx_17679_primary PRIMARY KEY (string_id);


--
-- Name: suppliers idx_17685_primary; Type: CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.suppliers
    ADD CONSTRAINT idx_17685_primary PRIMARY KEY (id);


--
-- Name: idx_17515_city; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17515_city ON southwind.customers USING btree (city);


--
-- Name: idx_17515_company; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17515_company ON southwind.customers USING btree (company);


--
-- Name: idx_17515_first_name; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17515_first_name ON southwind.customers USING btree (first_name);


--
-- Name: idx_17515_last_name; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17515_last_name ON southwind.customers USING btree (last_name);


--
-- Name: idx_17515_state_province; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17515_state_province ON southwind.customers USING btree (state_province);


--
-- Name: idx_17515_zip_postal_code; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17515_zip_postal_code ON southwind.customers USING btree (zip_postal_code);


--
-- Name: idx_17535_city; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17535_city ON southwind.employees USING btree (city);


--
-- Name: idx_17535_company; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17535_company ON southwind.employees USING btree (company);


--
-- Name: idx_17535_first_name; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17535_first_name ON southwind.employees USING btree (first_name);


--
-- Name: idx_17535_last_name; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17535_last_name ON southwind.employees USING btree (last_name);


--
-- Name: idx_17535_state_province; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17535_state_province ON southwind.employees USING btree (state_province);


--
-- Name: idx_17535_zip_postal_code; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17535_zip_postal_code ON southwind.employees USING btree (zip_postal_code);


--
-- Name: idx_17554_employee_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17554_employee_id ON southwind.employee_privileges USING btree (employee_id);


--
-- Name: idx_17554_privilege_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17554_privilege_id ON southwind.employee_privileges USING btree (privilege_id);


--
-- Name: idx_17554_privilege_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17554_privilege_id_2 ON southwind.employee_privileges USING btree (privilege_id);


--
-- Name: idx_17558_customer_order_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17558_customer_order_id ON southwind.inventory_transactions USING btree (customer_order_id);


--
-- Name: idx_17558_customer_order_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17558_customer_order_id_2 ON southwind.inventory_transactions USING btree (customer_order_id);


--
-- Name: idx_17558_product_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17558_product_id ON southwind.inventory_transactions USING btree (product_id);


--
-- Name: idx_17558_product_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17558_product_id_2 ON southwind.inventory_transactions USING btree (product_id);


--
-- Name: idx_17558_purchase_order_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17558_purchase_order_id ON southwind.inventory_transactions USING btree (purchase_order_id);


--
-- Name: idx_17558_purchase_order_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17558_purchase_order_id_2 ON southwind.inventory_transactions USING btree (purchase_order_id);


--
-- Name: idx_17558_transaction_type; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17558_transaction_type ON southwind.inventory_transactions USING btree (transaction_type);


--
-- Name: idx_17567_fk_invoices_orders1_idx; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17567_fk_invoices_orders1_idx ON southwind.invoices USING btree (order_id);


--
-- Name: idx_17567_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17567_id ON southwind.invoices USING btree (id);


--
-- Name: idx_17567_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17567_id_2 ON southwind.invoices USING btree (id);


--
-- Name: idx_17575_customer_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17575_customer_id ON southwind.orders USING btree (customer_id);


--
-- Name: idx_17575_customer_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17575_customer_id_2 ON southwind.orders USING btree (customer_id);


--
-- Name: idx_17575_employee_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17575_employee_id ON southwind.orders USING btree (employee_id);


--
-- Name: idx_17575_employee_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17575_employee_id_2 ON southwind.orders USING btree (employee_id);


--
-- Name: idx_17575_fk_orders_orders_status1; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17575_fk_orders_orders_status1 ON southwind.orders USING btree (status_id);


--
-- Name: idx_17575_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17575_id ON southwind.orders USING btree (id);


--
-- Name: idx_17575_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17575_id_2 ON southwind.orders USING btree (id);


--
-- Name: idx_17575_id_3; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17575_id_3 ON southwind.orders USING btree (id);


--
-- Name: idx_17575_ship_zip_postal_code; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17575_ship_zip_postal_code ON southwind.orders USING btree (ship_zip_postal_code);


--
-- Name: idx_17575_shipper_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17575_shipper_id ON southwind.orders USING btree (shipper_id);


--
-- Name: idx_17575_shipper_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17575_shipper_id_2 ON southwind.orders USING btree (shipper_id);


--
-- Name: idx_17575_tax_status; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17575_tax_status ON southwind.orders USING btree (tax_status_id);


--
-- Name: idx_17598_fk_order_details_order_details_status1_idx; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17598_fk_order_details_order_details_status1_idx ON southwind.order_details USING btree (status_id);


--
-- Name: idx_17598_fk_order_details_orders1_idx; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17598_fk_order_details_orders1_idx ON southwind.order_details USING btree (order_id);


--
-- Name: idx_17598_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17598_id ON southwind.order_details USING btree (id);


--
-- Name: idx_17598_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17598_id_2 ON southwind.order_details USING btree (id);


--
-- Name: idx_17598_id_3; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17598_id_3 ON southwind.order_details USING btree (id);


--
-- Name: idx_17598_id_4; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17598_id_4 ON southwind.order_details USING btree (id);


--
-- Name: idx_17598_id_5; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17598_id_5 ON southwind.order_details USING btree (id);


--
-- Name: idx_17598_inventory_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17598_inventory_id ON southwind.order_details USING btree (inventory_id);


--
-- Name: idx_17598_product_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17598_product_id ON southwind.order_details USING btree (product_id);


--
-- Name: idx_17598_product_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17598_product_id_2 ON southwind.order_details USING btree (product_id);


--
-- Name: idx_17598_purchase_order_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17598_purchase_order_id ON southwind.order_details USING btree (purchase_order_id);


--
-- Name: idx_17615_product_code; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17615_product_code ON southwind.products USING btree (product_code);


--
-- Name: idx_17629_created_by; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17629_created_by ON southwind.purchase_orders USING btree (created_by);


--
-- Name: idx_17629_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE UNIQUE INDEX idx_17629_id ON southwind.purchase_orders USING btree (id);


--
-- Name: idx_17629_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17629_id_2 ON southwind.purchase_orders USING btree (id);


--
-- Name: idx_17629_status_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17629_status_id ON southwind.purchase_orders USING btree (status_id);


--
-- Name: idx_17629_supplier_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17629_supplier_id ON southwind.purchase_orders USING btree (supplier_id);


--
-- Name: idx_17629_supplier_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17629_supplier_id_2 ON southwind.purchase_orders USING btree (supplier_id);


--
-- Name: idx_17641_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17641_id ON southwind.purchase_order_details USING btree (id);


--
-- Name: idx_17641_inventory_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17641_inventory_id ON southwind.purchase_order_details USING btree (inventory_id);


--
-- Name: idx_17641_inventory_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17641_inventory_id_2 ON southwind.purchase_order_details USING btree (inventory_id);


--
-- Name: idx_17641_product_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17641_product_id ON southwind.purchase_order_details USING btree (product_id);


--
-- Name: idx_17641_product_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17641_product_id_2 ON southwind.purchase_order_details USING btree (product_id);


--
-- Name: idx_17641_purchase_order_id; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17641_purchase_order_id ON southwind.purchase_order_details USING btree (purchase_order_id);


--
-- Name: idx_17641_purchase_order_id_2; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17641_purchase_order_id_2 ON southwind.purchase_order_details USING btree (purchase_order_id);


--
-- Name: idx_17659_city; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17659_city ON southwind.shippers USING btree (city);


--
-- Name: idx_17659_company; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17659_company ON southwind.shippers USING btree (company);


--
-- Name: idx_17659_first_name; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17659_first_name ON southwind.shippers USING btree (first_name);


--
-- Name: idx_17659_last_name; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17659_last_name ON southwind.shippers USING btree (last_name);


--
-- Name: idx_17659_state_province; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17659_state_province ON southwind.shippers USING btree (state_province);


--
-- Name: idx_17659_zip_postal_code; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17659_zip_postal_code ON southwind.shippers USING btree (zip_postal_code);


--
-- Name: idx_17685_city; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17685_city ON southwind.suppliers USING btree (city);


--
-- Name: idx_17685_company; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17685_company ON southwind.suppliers USING btree (company);


--
-- Name: idx_17685_first_name; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17685_first_name ON southwind.suppliers USING btree (first_name);


--
-- Name: idx_17685_last_name; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17685_last_name ON southwind.suppliers USING btree (last_name);


--
-- Name: idx_17685_state_province; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17685_state_province ON southwind.suppliers USING btree (state_province);


--
-- Name: idx_17685_zip_postal_code; Type: INDEX; Schema: southwind; Owner: postgres
--

CREATE INDEX idx_17685_zip_postal_code ON southwind.suppliers USING btree (zip_postal_code);


--
-- Name: employee_privileges fk_employee_privileges_employees1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.employee_privileges
    ADD CONSTRAINT fk_employee_privileges_employees1 FOREIGN KEY (employee_id) REFERENCES southwind.employees(id);


--
-- Name: employee_privileges fk_employee_privileges_privileges1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.employee_privileges
    ADD CONSTRAINT fk_employee_privileges_privileges1 FOREIGN KEY (privilege_id) REFERENCES southwind.privileges(id);


--
-- Name: inventory_transactions fk_inventory_transactions_inventory_transaction_types1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.inventory_transactions
    ADD CONSTRAINT fk_inventory_transactions_inventory_transaction_types1 FOREIGN KEY (transaction_type) REFERENCES southwind.inventory_transaction_types(id);


--
-- Name: inventory_transactions fk_inventory_transactions_orders1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.inventory_transactions
    ADD CONSTRAINT fk_inventory_transactions_orders1 FOREIGN KEY (customer_order_id) REFERENCES southwind.orders(id);


--
-- Name: inventory_transactions fk_inventory_transactions_products1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.inventory_transactions
    ADD CONSTRAINT fk_inventory_transactions_products1 FOREIGN KEY (product_id) REFERENCES southwind.products(id);


--
-- Name: inventory_transactions fk_inventory_transactions_purchase_orders1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.inventory_transactions
    ADD CONSTRAINT fk_inventory_transactions_purchase_orders1 FOREIGN KEY (purchase_order_id) REFERENCES southwind.purchase_orders(id);


--
-- Name: invoices fk_invoices_orders1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.invoices
    ADD CONSTRAINT fk_invoices_orders1 FOREIGN KEY (order_id) REFERENCES southwind.orders(id);


--
-- Name: order_details fk_order_details_order_details_status1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.order_details
    ADD CONSTRAINT fk_order_details_order_details_status1 FOREIGN KEY (status_id) REFERENCES southwind.order_details_status(id);


--
-- Name: order_details fk_order_details_orders1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.order_details
    ADD CONSTRAINT fk_order_details_orders1 FOREIGN KEY (order_id) REFERENCES southwind.orders(id);


--
-- Name: order_details fk_order_details_products1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.order_details
    ADD CONSTRAINT fk_order_details_products1 FOREIGN KEY (product_id) REFERENCES southwind.products(id);


--
-- Name: orders fk_orders_customers; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.orders
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES southwind.customers(id);


--
-- Name: orders fk_orders_employees1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.orders
    ADD CONSTRAINT fk_orders_employees1 FOREIGN KEY (employee_id) REFERENCES southwind.employees(id);


--
-- Name: orders fk_orders_orders_status1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.orders
    ADD CONSTRAINT fk_orders_orders_status1 FOREIGN KEY (status_id) REFERENCES southwind.orders_status(id);


--
-- Name: orders fk_orders_orders_tax_status1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.orders
    ADD CONSTRAINT fk_orders_orders_tax_status1 FOREIGN KEY (tax_status_id) REFERENCES southwind.orders_tax_status(id);


--
-- Name: orders fk_orders_shippers1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.orders
    ADD CONSTRAINT fk_orders_shippers1 FOREIGN KEY (shipper_id) REFERENCES southwind.shippers(id);


--
-- Name: purchase_order_details fk_purchase_order_details_inventory_transactions1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.purchase_order_details
    ADD CONSTRAINT fk_purchase_order_details_inventory_transactions1 FOREIGN KEY (inventory_id) REFERENCES southwind.inventory_transactions(id);


--
-- Name: purchase_order_details fk_purchase_order_details_products1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.purchase_order_details
    ADD CONSTRAINT fk_purchase_order_details_products1 FOREIGN KEY (product_id) REFERENCES southwind.products(id);


--
-- Name: purchase_order_details fk_purchase_order_details_purchase_orders1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.purchase_order_details
    ADD CONSTRAINT fk_purchase_order_details_purchase_orders1 FOREIGN KEY (purchase_order_id) REFERENCES southwind.purchase_orders(id);


--
-- Name: purchase_orders fk_purchase_orders_employees1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.purchase_orders
    ADD CONSTRAINT fk_purchase_orders_employees1 FOREIGN KEY (created_by) REFERENCES southwind.employees(id);


--
-- Name: purchase_orders fk_purchase_orders_purchase_order_status1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.purchase_orders
    ADD CONSTRAINT fk_purchase_orders_purchase_order_status1 FOREIGN KEY (status_id) REFERENCES southwind.purchase_order_status(id);


--
-- Name: purchase_orders fk_purchase_orders_suppliers1; Type: FK CONSTRAINT; Schema: southwind; Owner: postgres
--

ALTER TABLE ONLY southwind.purchase_orders
    ADD CONSTRAINT fk_purchase_orders_suppliers1 FOREIGN KEY (supplier_id) REFERENCES southwind.suppliers(id);


--
-- PostgreSQL database dump complete
--


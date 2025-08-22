# Detailed schedule




## Class 1

* Overview of the course. 
* Discussion of: why do we need databases?
* Sign up for account at [Supabase](https://supabase.com/), create new organization and project
* Importing the `wine` database:
  - open [wine.sql](../sql/wine.sql) in browser or text editor – you will be copying and pasting the contents of this file into Supabase.
  - in Supabase:
    * on left toolbar, open SQL Editor, create new snippet
    * paste in the content of `wine.sql`, hit Run
* Querying the `wine` database in Supabase:
  - in SQL Editor, hit `+` to create new snippet
  - Run the following query 
  ```sql
  set search_path to wine;
  select * from supplier;
  ```
  - for a more interesting example, try 
  ```sql 
  select * from supplier where supcity='San Francisco';
  ```
* Play around with the wine database (actually known as a _schema_, not a _database_, in Postgres):
  - on left toolbar, open Table Editor, switch to `wine` schema, click on the `supplier` table
    * Play around with sorting columns, editing data etc.
    * Check out some of the other tables
  - on left toolbar, open Database, switch to `wine` schema
    * Try to understand some of the structure, drag things around, look at the icons at the bottom to figure out things like "primary key", "nullable" etc

* [chapter 1 textbook slides](https://www.pdbmbook.com/vault/Chapter%20Fundamental%20Concepts%20of%20Database%20Management.pdf/access): especially slides 4-13, 17-18, 21

* Before next time, install on your own computer:
  - [PostgreSQL](https://www.postgresql.org/download/)
  - [DBeaver](https://dbeaver.io/) (Community version)
  - Play around with these if you get a chance. Can you figure out how to install a copy of the wine database?


----
Last modified: Mon Jun 02 19:33:17 UTC 2025 by jmac.

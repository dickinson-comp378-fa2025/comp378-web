# Detailed schedule

## Class 4

Main topic for today: relations and keys.
* Whiteboard notes: [relations-and-keys.svg](class04/relations-and-keys.svg)
* see also the textbook slides for chapter 6





## Class 3

Preliminary discussion of the mathematical motion of a
_relation_. Whiteboard notes provided:
[relation-overview.svg](class03/relation-overview.svg)

Main topic for today: the EER model (_enhanced_ ER model).
* We continue with [textbook slides for chapter
  3](https://lms.dickinson.edu/mod/folder/view.php?id=1362590).
  - Note the methodology on slide 45. This will be useful for
    homework.


## Class 2

Key concepts from chapters 1 and 2:
* *transaction*: see textbook section 1.5.6
* *ACID* properties of transactions: see textbook section 1.5.6
* Different types of database management systems (DBMS): hierarchical,
  network, relational, object-oriented, XML, no-SQL. See textbook
  section 2.2.1. In this course, we focus almost exclusively on the
  relational approach, which is the most fundamental.
  
Main topic for today: the ER model.
* See textbook slides for chapter 3

SQL topics: `select`, `from`, `distinct`, `as`, `where`, `and`, `between`, `in`, `like`, `is null`. See 7.3.1.1.

Try to get DBeaver/Postgres working on your own machine. Supabase is a good alternative if you can't get it working.


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

* [chapter 1 textbook slides](https://lms.dickinson.edu/mod/folder/view.php?id=1362590): especially slides 4-13, 17-18, 21

* Before next time, install on your own computer:
  - [PostgreSQL](https://www.postgresql.org/download/)
  - [DBeaver](https://dbeaver.io/) (Community version)
  - Play around with these if you get a chance. Can you figure out how to install a copy of the wine database?


----
Last modified: Mon Jun 02 19:33:17 UTC 2025 by jmac.

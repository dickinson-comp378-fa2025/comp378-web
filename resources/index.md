# Detailed schedule

## Class 11

<!-- Exam review notes: [exam-review.pptx](class11/exam-review.pptx) -->

Exam review notes: [normalization-example.pdf](class11/normalization-example.pdf)

## Class 10

Main topic for today: defining indexes and views. 

Demos:
* [privileges](class10/privileges-demo.md)
* [indexes](class10/index-demo.md)
* [views](class10/views-demo.md)

Most of the class session will be devoted to a lab on these topics: [views-and-indexes-lab.docx](class10/views-and-indexes-lab.docx). 
* The lab requires use of the [Southwind](../sql/southwind.sql) database.
* A solution is available, but don't look at it until after class: [views-and-indexes-lab-solution.docx](class10/views-and-indexes-lab-solution.docx).



## Class 9

Main topic for today: SQL statements `exists`, `union`, `intersect`, `except`, `insert into`, `delete from`, `update`

Notes: 
1. `insert`, `delete`, and `update` are good examples of
   transactions. By default, in Postgres, any single statement will be
   treated as a transaction.
1. This is a good time to start using a good editor that can autoformat your SQL. It will make your SQL much easier to read. VSCode has good SQL extensions. In DBeaver, use Format SQL (Ctrl+Shift+F).
1. It's also a good time to start commenting your SQL code. Lines
   beginning with two dashes (`--`) are treated as comments.

The class will consist of some demos of the above SQL statements followed by free lab time for working on homework assignments and asking questions. Example code: [sql-examples.sql](class09/sql-examples.sql)



## Class 8

Main topic for today: database joins
* Whiteboard notes: [08-joins-whiteboard.svg](class08/08-joins-whiteboard.svg)
* Example databases: 
  - [carlisle_menu_items.sql](../sql/carlisle_menu_items.sql)
  - [carlisle_menu_items_b.sql](../sql/carlisle_menu_items_b.sql)


## Class 7

Most of this class will be devoted to an ungraded but required lab activity to learn about creating and altering database tables within DBeaver:
* [table-creation-lab.docx](class07/table-creation-lab.docx)

If you don't have access to DBEaver, you can use Supabase&mdash;but many of the instructions will not apply directly, and you'll need to figure out some of the techniques on your own.

Most of the class will be asynchronous as individuals work on the lab. Please post questions, suggestions, and advice on our [Teams channel](https://teams.microsoft.com/l/channel/19%3A803236e908df48dd95545caf4e88554d%40thread.tacv2/class%2010%20lab?groupId=162cbdef-318a-4838-b41f-857638354f97&tenantId=6232b055-76b9-4c13-9b88-b562ae7db6fb). There is also a Teams meeting on that channel. You can join the meeting any time to get real-time help from the instructor.


## Class 6

Warmup exercise for functional dependencies and normalization: 
* [review-func-dep.xlsx](class06/review-func-dep.xlsx) -- Make sure you are on the "unnormalized" sheet. The "normalized" sheet contains the solution. Don't look at that yet!
* Also available as SQL: [carlislefood.sql](../sql/carlislefood.sql)


Take the ungraded [quiz on functional dependencies and normalization](https://forms.office.com/r/GKkF8DfJtA).

Main topic for today: converting ER model to relational model.
* we use the textbook slides for chapter 6 again; we go over slides 49-62 and 74-77 in class.

In the remaining time we will explore Zip code example, a classic example that cannot be put into BCNF.


## Class 5

In the first few minutes of class, we will try to memorize the [definitions on relations and keys](./definitions.md) covered last time. Then we will do the following ungraded quiz:
* [quiz on relations and keys](https://forms.office.com/Pages/ResponsePage.aspx?id=VbAyYrl2E0ybiLVirn22-2zFL4dI9oNMmoALudp-AK9UNEgyODZYVVpVNVNCS1BKODNVQ0I5Q0JPVS4u). (Does not affect your grade, but demonstrates your understanding.)

Main topic for today: database normalization
* Whiteboard notes: [05-normalization.svg](class05/05-normalization.svg)
* See also the textbook slides for chapter 6


## Class 4

Main topic for today: relations and keys.
* Whiteboard notes: [relations-and-keys.svg](class04/relations-and-keys.svg) (open in browser) 
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

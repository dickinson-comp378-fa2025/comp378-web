# Detailed schedule

## Final presentations

Final presentations will begin on Saturday December 20 at 9:00am. All presentations will be remote via Zoom at [https://zoom.us/my/johnmaccormick](https://zoom.us/my/johnmaccormick) (Meeting ID: 398 215 6590). The order was determined randomly, and the schedule is as follows:


| Time | Presenters |
| :--- | :--- |
| 9:00am | John and Son |
| 9:15am | Phu |
| 9:30am | Tayyaba |
| 9:45am | Anne |
| 10:00am | Linh and Quang |
| 10:15am | Zach |
| 10:30am | _Break_ |
| 10:45am | Nam and Harrison |
| 11:00am | Shaik and Ifrad |
| 11:15am | Adacus and Spencer |
| 11:30am | Fej |
| 11:45am | Minh |


## Class 28

Optional exam 3

## Class 27

1. Informal discussion of NoSQL databases (Ch 11 of PDBM), based on
   abbreviated version of the textbook authors' Chapter 11 slides:
   [pdbm-ch11-abbrev.pptx](class27/pdbm-ch11-abbrev.pptx)
1. quick demo of MongoDB
1. free time to consult on final projects


## Class 26

Informal mini-lecture: SQL injection attacks
* example code: [sql-injection.zip](class26/sql-injection.zip)

Remainder of time to work on final projects



## Class 25

1. [Course evaluations](https://dickinson.campuslabs.com/eval-home/direct/2939206).
1. free time to consult on final projects: [https://zoom.us/my/johnmaccormick](https://zoom.us/my/johnmaccormick)

## Class 24

Topics for today:
1. Quickly cover write ahead logging, two-phase commit, and two-phase locking
   * see [recovery-example.docx](class21/recovery-example.docx) and [2-phase-locking.pdf](class21/2-phase-locking.pdf)
1. Further understand concurrency problems, continuing from the previous class meeting
   * see whiteboard notes from last time: [concurrency-whiteboard.png](class20/concurrency-whiteboard.png), [concurrency-whiteboard.pptx](class20/concurrency-whiteboard.pptx)
   * see [concurrency-examples.pdf](class21/concurrency-examples.pdf)
   


## Class 23

midterm exam 2

## Class 22

exam review

## Class 21

Discussion of Sweeney (1997). Possible relevant links:
* [Netflix Cancels Contest After Concerns Are Raised About Privacy](https://www.nytimes.com/2010/03/13/technology/13netflix.html) (NYtimes, March 2010)
* [Cynthia Dwork: How to Force Our Machines to Play Fair](https://www.youtube.com/watch?v=VLOMcNYasHQ) on YouTube. Professor Dwork is one of the inventors of differential privacy.
* [Differential privacy](https://en.wikipedia.org/wiki/Differential_privacy) on Wikipedia
* Papers discussed in mini-lecture before discussion:
  - Sweeney, L. (1997). Weaving technology and policy together to maintain confidentiality. *The Journal of Law, Medicine & Ethics*, *25*(2-3), 98-110.  [PDF available via Sage Journals](https://journals.sagepub.com/doi/10.1111/j.1748-720X.1997.tb01885.x) (and also on Moodle)

  - Sweeney, L. (2000). Simple demographics often identify people uniquely. *Health (San Francisco)*, *671*(2000), 1-34.  [PDF available via Data Privacy Lab](https://dataprivacylab.org/projects/identifiability/paper1.pdf)

  - Sweeney, L. (2013). Discrimination in online ad delivery. *Communications of the ACM*, *56*(5), 44-54.   [arXiv version](https://arxiv.org/abs/1301.6822)

  - Narayanan, A., & Shmatikov, V. (2008, May). Robust de-anonymization of large sparse datasets. In *2008 IEEE Symposium on Security and Privacy (sp 2008)* (pp. 111-125). IEEE. [PDF available via arXiv](https://arxiv.org/pdf/cs/0610105)

  - Dwork, C. (2006, July). Differential privacy. In *International colloquium on automata, languages, and programming* (pp. 1-12). Berlin, Heidelberg: Springer Berlin Heidelberg. [PDF available via Microsoft Research](https://www.microsoft.com/en-us/research/publication/differential-privacy/) | [Springer Link](https://link.springer.com/chapter/10.1007/11787006_1)



## Class 20

Main topic for today: database concurrency and locking
* whiteboard notes: [concurrency-whiteboard.pptx](class20/concurrency-whiteboard.pptx)
* Java files:
  - [QueryExecutor.java](../java/QueryExecutor.java)
  - [SlowTransfer.java](../java/SlowTransfer.java)
  - [TransactionDemo.java](../java/TransactionDemo.java)
  - [WithdrawMoney.java](../java/WithdrawMoney.java)
  - [Wait.java](../java/Wait.java)
* Bank database: [bank.sql](../sql/bank.sql)

There is a fun minilab that goes with this topic, but we do not have time to work on it in class. The instructor will demonstrate most of the programs, but you are encouraged to try them on your own also. Try the version that does not have accompanying explanations first, then look at the version that includes explanations:
* Transaction and locking minilab:
  - [without explanations](class20/demos-without-explanations.md)
  - [with explanations](class20/demos-with-explanations.md)


## Classes 18 and 19

Research paper presentations

## Class 17

Classic paper discussion of Brin \& Page (1998)


## Class 16

Announcement: preliminary [RP2 presentation schedule](../hw/rp2-paper-presentation/rp2-presentation-schedule.md) is available -- contact instructor with any questions or concerns.

Main topic for today: query optimization and join algorithms
* whiteboard notes: [join-algs-whiteboard.svg](class16/join-algs-whiteboard.svg)
* handout on join algorithms: 
  - as [Excel workbook](class16/join-examples.xlsx) (solutions are on the second sheet of this workbook)
  - as [PDF](class16/join-examples.pdf)


## Class 15

* Results of the midsemester feedback

Main topic for today: B-trees.
* [Visualization](https://www.cs.usfca.edu/~galles/visualization/BTree.html) by David Galles at UCSF. Set maximum degree to 5. This corresponds to what we call an order 2/4 tree. 
* Handout: [btree-handout.docx](class15/btree-handout.docx)
  - handout solution: [btree-handout-solution.pptx](class15/btree-handout-solution.pptx)
* Whiteboard notes:
  - [Part 1](class15/btrees-whiteboard-part1.svg)
  - [Part 2](class15/btrees-whiteboard-part2.svg)


## Class 14

1. Please take the [midsemester survey](https://forms.office.com/r/rmKYCQ2gTB).
1. Exam discussion
1. Overview of how to read a research paper:
   1. Read abstract, introduction, and conclusion.
   1. Examine figures and captions of figures. Try to understand the
      main ideas and results presented.
   1. Read the main body of the paper, skipping any technical material
      that is too difficult to understand.
1. Meetings with student teams for RP assignents as needed


## Class 13

Main topic for today: JDBC. See the [Using JDBC](../jdbc.md) web page (also available from a direct link on the main course webpage).

In-class activities:
  1. Quick overview of relevant slides from textbook materials: slides
     30-40 from Chapter 15 powerpoint. Example file [DbDemo.java](../java/DbDemo.java) could be useful here.
  2. Interactive minilab: implement a Java program that can access the
     `wine` database. Follow the instructions on the [Using
     JDBC](../jdbc.md) web page.
  3. Remainder of time is available to work on assignments RP1 and/or CC4.

## Class 12

Exam 1

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

# Detailed schedule

## Final presentations

Random order of final presentations:
1. Son
1. Alyssa
1. Katie
1. Evan
1. William
1. Billy+Leo
1. Pamela
1. Han
1. Sophia
1. Khanh
1. John+Leah
1. Amir
1. Zeki


## Class 28

1. Review of course learning objectives
1. Complete [course
   evaluations](https://dickinson.campuslabs.com/eval-home/direct/9247753)
   if you haven't already done so.
1. free time to consult on final projects


## Class 27

1. Informal discussion of NoSQL databases (Ch 11 of PDBM), based on
   abbreviated version of the textbook authors' Chapter 11 slides:
   [pdbm-ch11-abbrev.pptx](class27/pdbm-ch11-abbrev.pptx)
1. free time to consult on final projects


## Class 26

Meet at the HUB Social Hall for the Civic Engagement poster session,
1:30pm. Browse posters (especially computer science senior seminar
projects) until 2 PM, then return to Tome for regular class (database
security demo).

Database security demo (demonstrates a security flaw known as [SQL injection](https://en.wikipedia.org/wiki/SQL_injection)):
* visit [http://localhost/bank.php](http://localhost/bank.php), put any amount into the 'Amount to deposit' box, and this exact string into the 'Account number' box: `111' or 'xyz'='xyz`
  - what happened and why?
* install the files [bank-insecure.php](../php/bank-insecure.php) and [depositMoney-insecure.php](../php/depositMoney-insecure.php) into `xampp/htdocs`
* visit [http://localhost/bank-insecure.php](http://localhost/bank-insecure.php), put any amount into the 'Amount to deposit' box, and this exact string into the 'Account number' box: `111; drop table accounts;`
  - what happened and why?


## Class 25

1. [Course evaluations](https://dickinson.campuslabs.com/eval-home/direct/9247753).
1. exam discussion
1. free time to consult on final projects


## Class 24

Midterm exam 2.

## Class 23

1. [PHP demo](../php) (optional info for final project)
2. exam review: [exam review whiteboard](class23/exam-review.png)

## Class 22

Discussion of Sweeney (1997). Possible relevant link:
* [Netflix Cancels Contest After Concerns Are Raised About Privacy](https://www.nytimes.com/2010/03/13/technology/13netflix.html) (NYtimes, March 2010)
* [Cynthia Dwork: How to Force Our Machines to Play Fair](https://www.youtube.com/watch?v=VLOMcNYasHQ) on YouTube. Professor Dwork is one of the inventors of differential privacy.
* [Differential privacy](https://en.wikipedia.org/wiki/Differential_privacy) on Wikipedia


## Class 21

Topics for today:
1. Quickly cover write ahead logging, two-phase commit, and two-phase locking
   * see [recovery-example.docx](class21/recovery-example.docx) and [2-phase-locking.pdf](class21/2-phase-locking.pdf)
1. Finish understanding concurrency problems, continuing from the previous class meeting
   * see whiteboard notes from last time: [concurrency-whiteboard.png](class20/concurrency-whiteboard.png), [concurrency-whiteboard.pptx](class20/concurrency-whiteboard.pptx)
   * see [concurrency-examples.pdf](class21/concurrency-examples.pdf) - we did not have time to go over this in class, but these examples are similar to the homework questions and exam questions, so I do recommend studying them.
   
Notes are now also available from the online [COMP378 OneNote notebook](https://dickinson0-my.sharepoint.com/:o:/g/personal/jmac_dickinson_edu/Etm6Aj0x2xlOjhUCdJi3QVABCpJ5UnV9aBtGdPfXk4pXtg).




## Class 20

Main topic for today: database concurrency and locking
* whiteboard notes: [concurrency-whiteboard.png](class20/concurrency-whiteboard.png), [concurrency-whiteboard.pptx](class20/concurrency-whiteboard.pptx)
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

Main topic for today: query optimization and join algorithms
* whiteboard notes: [join-algs-whiteboard.svg](class16/join-algs-whiteboard.svg)
* handout on join algorithms: 
  - as [Excel workbook](class16/join-examples.xlsx) (solutions are on the second sheet of this workbook)
  - as [PDF](class16/join-examples.pdf)

## Class 15

[Results of the midsemester feedback](class15/comp378-midsem-sp2022.pptx) are available.

Main topic for today: B-trees.
* [Visualization](https://www.cs.usfca.edu/~galles/visualization/BTree.html) by David Galles at UCSF. Set maximum degree to 5. This corresponds to what we call an order 2/4 tree. 
* Handout: [btree-handout.docx](class15/btree-handout.docx)
  - handout solution: [btree-handout-solution.pptx](class15/btree-handout-solution.pptx)
* Whiteboard notes:
  - [Part 1](class15/btrees-whiteboard-part1.svg)
  - [Part 2](class15/btrees-whiteboard-part2.svg)

## Class 14

1. Please take the [midsemester survey](https://forms.office.com/Pages/ResponsePage.aspx?id=VbAyYrl2E0ybiLVirn22-2zFL4dI9oNMmoALudp-AK9URUZXN0tHWjhLNjFLTldHM0Q0WDVCRk8xTS4u).
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
     30-40 from [Chapter 15 Database
     APIs.ppt](https://www.pdbmbook.com/vault/Chapter%20Database%20APIs.pdf/access)
  2. Interactive minilab: implement a Java program that can access the
     `wine` database. Follow the instructions on the [Using
     JDBC](../jdbc.md) web page.
  3. Remainder of time is available to work on assignments RP1 and/or CC4.


## Class 12

The take-home exam begins at the start of class today. Please contact
the instructor via email or Teams with any questions.



## Class 11

Exam review notes: [exam-review.pptx](class11/exam-review.pptx)

## Class 10

Main topic for today: defining indexes and views.

Most of the class session will be devoted to a lab on these topics: [views-and-indexes-lab.docx](class10/views-and-indexes-lab.docx)

The lab requires use of the [Southwind](../sql/southwind.sql) database.

## Class 9

Main topic for today: SQL statements `exists`, `union`, `intersect`, `except`, `insert into`, `delete from`, `update`, `alter table`

Notes: 
1. `intersect` and `except` are not available in MySQL. You should be
   aware of these but we will not use them.
1. `insert`, `delete`, and `update` are good examples of
   transactions. By default, in MySQL, any single statement will be
   treated as a transaction.
1. This is a good time to start using the Format button in
   phpMyAdmin. It will make your SQL much easier to read.
1. It's also a good time to start commenting your SQL code. Lines
   beginning with two dashes (`--`) are treated as comments.

The class will consist of some demos of the above SQL statements
followed by free lab time for working on homework assignments and
asking questions.




## Class 8

Main topic for today: database joins
* Whiteboard notes: [08-joins-whiteboard.svg](class08/08-joins-whiteboard.svg)
* Example databases: 
  - [CarlisleMenuItems.sql](../sql/CarlisleMenuItems.sql)
  - [CarlisleMenuItemB.sql](../sql/CarlisleMenuItemsB.sql)


## Class 7

Most of this class will be devoted to an ungraded but required lab
activity to learn about creating and altering database tables within
phpMyAdmin:
* [table-creation-lab.docx](class07/table-creation-lab.docx)

If you don't have access to XAMPP, a great way to practice with
phpMyAdmin is to use the online demo server at
[phpmyadmin.net](https://demo.phpmyadmin.net/master-config/). Note
that this is a public server so your work can be viewed, altered, or
deleted by others.

## Class 6

Warmup exercise for functional dependencies and normalization: 
* [review-func-dep.xlsx](class06/review-func-dep.xlsx)
* corresponding database: [carlislefood.sql](class06/carlislefood.sql)

Main topic for today: converting ER model to relational model.
* [textbook slides for chapter 6](https://www.pdbmbook.com/vault/Chapter%20Relational%20Databases.pdf/access) again; we go over slides 49-62 and 74-77 in class.

## Class 5

Please take the [quiz on relations and
keys](https://forms.office.com/Pages/ResponsePage.aspx?id=VbAyYrl2E0ybiLVirn22-2zFL4dI9oNMmoALudp-AK9UNEgyODZYVVpVNVNCS1BKODNVQ0I5Q0JPVS4u).
(Does not affect your grade, but demonstrates your understanding.)

Announcement: important departmental event on Thursday evening --
[fireside chat with Reshma
Saujani](https://www.dickinson.edu/events/event/16906/girls_who_code_a_fireside_chat_with_founder_reshma_saujani),
founder and CEO of Girls Who Code. 7pm in Stern Great Room, or via
[Zoom](https://www.dickinson.edu/events/event/16906/girls_who_code_a_fireside_chat_with_founder_reshma_saujani). To
celebrate the importance and relevance of this event to our
discipline, I am offering some extra credit for attending: if you
attend the fireside chat, you can top up any Core Content homework
assignment of your choice to 100% (provided you made a reasonable
attempt at the assignment).


Main topic for today: database normalization
* Whiteboard notes: [05-normalization.svg](class05/05-normalization.svg)
* [textbook slides for chapter
  6](https://www.pdbmbook.com/vault/Chapter%20Relational%20Databases.pdf/access)
  again



## Class 4

Main topic for today: relations and keys.
* Whiteboard notes: [relations-and-keys.svg](class04/relations-and-keys.svg)
* [textbook slides for chapter
  6](https://www.pdbmbook.com/vault/Chapter%20Relational%20Databases.pdf/access)


## Class 3

Preliminary discussion of the mathematical motion of a
_relation_. Whiteboard notes provided:
[relation-overview.svg](class03/relation-overview.svg)

Main topic for today: the EER model (_enhanced_ ER model).
* We continue with [textbook slides for chapter
  3](https://www.pdbmbook.com/vault/Chapter%20Conceptual%20Data%20Modeling%20using%20EER%20and%20UML.pdf/access).
  - Note the methodology on slide 45. This will be useful for
    homework.


## Class 2

Key concepts from chapters 1 and 2:
* *transaction*: see textbook section 1.5.6
* *ACID* properties of transactions: see textbook section 1.5.6
* Different types of database management systems (DBMS): hierarchical,
  network, relational, object-oriented, XML, no-SQL. See textbook
  section 2.2.1. In this course, we focus almost exclusively on the
  relational approach, which is dominant in practice.
  
Main topic for today: the ER model.
* See [textbook slides for chapter 3](https://www.pdbmbook.com/vault/Chapter%20Conceptual%20Data%20Modeling%20using%20EER%20and%20UML.pdf/access).

SQL topics: select, from, distinct, as, where, and, between, in, like, is null. See 7.3.1.1.



## Class 1

* Overview of the course. 
* Discussion of: why do we need databases?
* Instructions on XAMPP installation:
  - The recommended database software for this course is the XAMPP
    package. This can be downloaded and installed on Windows, Linux,
    and MacOS from the [XAMPP web
    page](https://www.apachefriends.org/index.html) at
    apachefriends.org.
  - If desired, you can use the iMacs in Tome with XAMPP. You will
    need to create a virtual machine on one of the iMacs then use
    XAMPP within that virtual machine. A virtual machine image is
    provided to help you with this. Details:
	  * Download the VM image file, [comp378VM.ova](https://dickinson0-my.sharepoint.com/:u:/g/personal/jmac_dickinson_edu/EQSsBh04sspDoldjO7RoU6sBZ5k0QlMb444-a0REQrPdXA?e=JTfYUd)
	  * Open the VirtualBox app, then choose File &#124; Import Appliance and pick `comp378VM.ova`
	  * The [username and password for this virtual
        machine](https://lms.dickinson.edu/mod/page/view.php?id=1080082)
        are available on Moodle.
* accessing phpMyAdmin:
  - on Windows
    - Run XAMPP control panel as administrator
    - Start Apache and MySQL
    - Click on Admin for MySQL
  - on Ubuntu
    - open Terminal, enter `sudo /opt/lampp/manager-linux-x64.run`
    - on Manage Servers tab, choose Start All
    - open FireFox, visit http://localhost, click on phpMyAdmin (top right)
* importing the `wine` database:
  - download [wine.sql](../sql/wine.sql)
  - in phpMyAdmin:
    * click the Home icon, then New
	* enter `wine` as database name, click Create
	* click Import &#124; Choose File, then select `wine.sql`
	* click Go (bottom right)
* querying the `wine` database (Do this in your own phpMyAdmin or at
  the [textbook online playground](https://www.pdbmbook.com/playground)):
  - click on SQL
  - enter `SELECT * FROM supplier`, click Go (bottom right)
  - for a more interesting example, try `SELECT * FROM supplier WHERE supcity='San Francisco'`

* [chapter 1 textbook slides](https://www.pdbmbook.com/vault/Chapter%20Fundamental%20Concepts%20of%20Database%20Management.pdf/access): especially slides 4-13, 17-18, 21

----
Last modified: Tue May 10 17:43:54 UTC 2022 by jmac.

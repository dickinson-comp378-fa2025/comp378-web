# Final project assignments

The goal of the final project is to design and implement a database
and to implement a computer program that interacts with the
database. You are free to choose the topic and content of the database
and the functionality of the computer program. The concept of computer
program will be interpreted broadly and could include some dynamic
webpages that interact with your database. High-level requirements
are as follows.

* The database should be designed using an EER model; it should
  contain some nontrivial entity types and relationship types.
* The database schema should be constructed using relation notation,
  as in section 6.1.5 of the textbook.
* The database should be implemented in MySQL.
* The computer program should demonstrate some interesting properties
  or capabilities of the database. 
  - Most likely, it will be written in Java and will employ JDBC.
  - **Alternatively, you can learn a little PHP and make some dynamic
    webpages that interact with your database. For some instructions
    and a demo, please go to the [PHP demo page](../php/index.md).** [Added 4/16/2022]
* The final project can be completed individually or in teams of
  two. However, if you worked with a partner for the RP1 and RP2
  assignments, you may not work with the same partner again. If you
  would like a partner but do not have a specific person in mind, the
  instructor will try to find one for you.
* An approximate guideline for the amount of effort to be devoted to
  the project is at least 20 hours of work.
  - We will be devoting the last two weeks of class time and homework
    time to the final project. (Exception: There will be some short
    mini-lectures during class time in the last two weeks, covering
    optional topics for which there is no assigned reading or
    homework.)  Therefore, the final project should represent about 20
    hours of work during class time and homework time in the last two
    weeks of the semester, plus additional time during the exam
    period.
  - If working in a team of two, both members of the team will receive
    the same grade. Exception: If there is a severe imbalance between
    contributions of team members, this should be discussed as early
    as possible with the instructor.
  - The expectation for total amount and quality of work will be
    higher for a team of two compared to individuals working alone.
* Optionally, you might consider using one or more advanced techniques
  in your project. These may include: transactions, prepared
  statements, stored procedures, or triggers. Additional reading of
  the textbook and/or MySQL documentation may be required for this.

If you have a particular interest in pursuing a project that does not
meet the above requirements, feel free to discuss it with the
instructor. (For example, if would like to employ a NoSQL database,
the instructor will probably allow it&mdash;but you must obtain
permission before starting.) One goal of the project is that you
should work on a project that you are excited about, so do please
discuss your ideas with the instructor.

The final project consists of four graded assignments labeled
FP1-FP4. Each assignment is described separately below. Assignments
should be submitted to Moodle. Submission of multiple files is
permitted. Any appropriate file types and formats may be used. If
working in a team, only one member of the team should submit to
Moodle.



## FP1 (30 points)

Submit a project proposal to Moodle. Describe the proposed content of
the database and any ideas you may already have for the
design. Describe some ideas of what functionality the computer program
may have. The length of the proposal should be 300-500 words, although
longer proposals will not be penalized. Images, figures, or diagrams
may be included, but are not required.


## FP2 (60 points)

Submit docments explaining the current design and content of your
database and the status of the project. This should include:
* an ER or EER model, together with any necessary annotations;
* the database schema in relation notation (as in section 6.1.5 of the textbook);
* an SQL file consisting of a dump of the current version of your database;
* a brief status report explaining what has been achieved so far and
  what are the major steps remaining to complete the
  project&mdash;this should be 100-200 words in length, although
  longer reports will not be penalized.
  
Note that assignment FP2 is just a snapshot of the current design. You
are permitted to change the design and content of your database after
submitting FP2.

## FP3 (120 points)

Give a presentation describing your project. The presentation should
be approximately 10 minutes in length, with up to five minutes of
questions from the audience afterwards. If at all possible, the
presentation should include a live demo of your computer program
interacting with your database. You must submit a copy of your slides
to Moodle before the final presentations begin.

The grading of the presentation will be based on the quality of the
presentation itself, not the underlying merit of the project. The
underlying merit of the project will be graded in FP4.

To achieve an excellent grade, your presentation should excel on the
following aspects. It should:
* meet the target length of ten minutes, plus or minus two minutes;
* clearly explain the design and content of your database;
* clearly demonstrate the functionality of your computer program
  interacting with your database;
* use clear and engaging visual materials (slides and/or whiteboard);
* employ large fonts that are very easy for the audience to read and
  use only a small number of words on every slide so that every word
  can be read by the audience;
* be delivered in a clear, engaging, and fluent voice;
* be delivered without reading verbatim from notes or slides (it is a
  good idea to use notes&mdash;just don't read from them word for
  word).
  

## FP4 (1000 points)

Submit docments explaining the current design and content of your
database and the status of the project. This should include:
* an ER or EER model, together with any necessary annotations;
* the database schema in relation notation (as in section 6.1.5 of the textbook);
* an SQL file consisting of a dump of your database;
* the source code of your computer program;
* an _experience report_, described in more detail below.

### The FP4 experience report

Your experience report should be 500-2000 words in length. It is not a
formal report, but rather a description of your experience in
completing the project. You can shape the report according to your own
experience, but it would be a good idea to include some or all of the
following:
* a description of how to run your computer program and what the
  computer program does;
* descriptions of any interesting features of your database design and
  computer program;
* descriptions of any difficulties you faced during the project and
  how you overcame them;
* descriptions of additional features that you would like to add if
  you had more time;
* discussion of social, legal, and ethical issues that could arise if
  your database application were released publicly and had a large
  number of users.
  
You can format the report in any reasonable fashion. Feel free to use
bullet points, diagrams, and figures as appropriate. Clarity,
technical correctness, and grammatical correctness are important.
  
### FP4 grading

It is not possible to provide a formal rubric due to the widely
varying nature of final projects. However, points will be awarded in
three categories of roughly equal weight.
* Creativity: Is the database design and content interesting? Does it
  demonstrate creativity in how to represent complex relationships
  between entities? Does the computer program do something
  interesting? Does the experience report note some interesting
  aspects of the project, such as surprising results, challenges
  encountered, and social/legal/ethical issues? Does the project use
  any advanced techniques, such as transactions, prepared statements,
  stored procedures, or triggers?
* Effort: Is the total amount of effort commensurate with two weeks of
  course work? Does the length of the SQL and Java code represent an
  appropriate amount of work? Does the experience report convey an
  appropriate amount of work?
* Technical correctness and quality: Is the EER design correct? Is the
  translation into relation notation correct? Is the SQL code correct?
  Is the Java code correct? Is the SQL code and Java code commented
  appropriately? Does the experience report convey its ideas clearly,
  with correct grammar and technically correct statements?

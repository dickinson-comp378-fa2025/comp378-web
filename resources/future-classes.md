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
































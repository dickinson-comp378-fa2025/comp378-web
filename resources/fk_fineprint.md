# The fine print about foreign keys

Recall our formal definition of foreign keys:

Let _R_ and _S_ be relation schemas, such that:
* _A_ is a column in _R_;
* _B_ is a column in _S_;
* _B_ has a uniquess constraint.
Then _A_ is a _foreign key referring to B_ if the values of _A_ are constrained to be a subset of _B_.

Ouch&mdash;if you think about it carefully enough, you'll realize this definition doesn't even make sense. In our formal definition of relation schema, we say _R_ is a subset of possible relations on one set of columns and _S_ is a subset of possible relations on another set of columns. There is no room in this definition for the two schemas to interact via a constraint. Don't worry about it. We are trying to avoid too much abstract mathematics. BUT, if you care about it, here is a way to define a foreign key constraint properly. First, we add another level of abstraction. Given relation schemas _R, S, ..._, we say a _database schema on R, S, ..._ is a relation schema on _R, S, ..._  &mdash;  yes, a database schema is just a schema of schemas. It's a collection of all possible tuples of tables. A single element of the database schema is a particular choice of rows for each table; call this a _realization_ of the database schema. We can easily define a foreign key constraint for the database schema stating that, given a realization with tables _r_ in _R_ and _s_ in _S_, column _A_ in _r_ must be a subset of column _B_ in _s_. As I said, it's best not to worry about it.  

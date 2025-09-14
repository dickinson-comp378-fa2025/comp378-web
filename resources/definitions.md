# Definitions to memorize

Memorize everything in **bold**.

### _Relation_ on sets _A_, _B_:  
**Subset of the Cartesian product _A_ x _B_**
* That is, a collection of tuples (_a_, _b_) where _a_ is in _A_ and _b_ is in _B_. 
* If there are more sets, e.g. _A_, _B_, _C_, _D_, then use longer tuples, e.g. (_a_, _b_, _c_, _d_)
* We can also refer to a relation as a _table_.
* The sets _A_, _B_, ... are also called _columns_.
* The tuples (_a_, _b_, ...) are also called _rows_.

### _Relation schema_ on sets _A_, _B_, _C_,... : 
**A collection of constraints on the possible tuples**
* The most common type of constraint is a _uniqueness constraint_, stating that the values from a given column or collection of columns must be unique.
* Another common type of constraint is a _foreign key constraint_, which is defined later. It is actually a constraint that applies simultaneously to a combination of two relation schemas.
* Formally, a relation schema is a subset of all possible relations on the sets _A_, _B_, _C_,...

### _Superkey_ of a relation schema:
**Any collection of columns whose values are guaranteed to be unique**
* Could be a superset of unique columns, e.g. if _A_ contains unique values then _AB_ is a superkey (and _A_ is also a superkey).

### _Key_ of a relation schema: 
**A minimal superkey**
* i.e. Deleting any column loses uniqueness

### _Candidate key_ of a relation schema: 
**Same as a key**
* The word _candidate_ emphasizes that there can be more than one key

### _Primary key_ (PK) of a relation schema: 
**A single key designated as the primary key by the database designer**
* In a relational database, every table should have a primary key (although there are a few rare exceptions).

### _Alternate key_ of a relation schema: 
**A key that is not the primary key**

### _Foreign key_ of a relation _R_ referring to relation _S_: 
**Short definition (memorize this): _A_ in _R_ is a foreign key referring to _B_ in _S_ if the values of _A_ are a subset of _B_.**

Formal definition (understand this):
Let _R_ and _S_ be relation schemas, such that:
* _A_ is a column in _R_;
* _B_ is a column in _S_;
* _B_ has a uniquess constraint.

Then _A_ is a _foreign key referring to B_ if the values of _A_ are constrained to be a subset of _B_. There is some [fine print](fk_fineprint.md), which you can ignore.

### _Prime column_ of a relation schema: 

**A column that is part of a key.**

### _Functional dependency_ in a relation schema: 

**_A-->B_ is a _functional dependency_ if the mapping from _A_ to _B_ is always a function.**
* That is, in every tuple (_a,b_), the value of _a_ uniquely determines the value of _b_.

### Boyce-Codd normal form (BCNF) for a relation schema:

**The left hand side of every functional dependency is a superkey.**
* This rules out a lot of redundancy because it means that any functional dependency in a table can't have repeated rows&mdash;the left hand side is a superkey so its values are unique.


### Third normal form (3NF) for a relation schema:
**For every functional dependency, either:**
* **the left hand side is a superkey; or**
* **the right hand side is a prime column.**

Important fact: Any relation schema can be converted to an equivalent collection of relation schemas in 3NF. BCNF is preferable, but in certain rare cases it's not possible (e.g. the ZIP code example).










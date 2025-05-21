# Transaction and locking minilab

## (with explanations)

This is the page with explanations of the results. It may be more fun to use the [page without explanations](demos-without-explanations.md) first, then look back here if you need to.
  
Demo 1 (lost update): simultaneously run
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 1 5`
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 30`

Demo 2 (uses transactions, but still results in a lost update): simultaneously run
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 1 5 -t`
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 30 -t`

Demo 3 (uses write locks and transactions, both complete successfully): simultaneously run
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 1 5 -w -t`
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 30 -w -t`

Demo 4 (uses read locks and transactions, so a deadlock occurs when the two transactions try to upgrade the read lock to a write lock; one transaction is rolled back and the other completes successfully): simultaneously run
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 1 5 -r -t`
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 30 -r -t`

Demo 5 (simpler demonstration of deadlock using only writes -- transfer from one bank account to another): simultaneously run
* `java -cp ".;mysql-connector-java-8.0.26.jar" SlowTransfer 111 222 1 5`
* `java -cp ".;mysql-connector-java-8.0.26.jar" SlowTransfer 222 111 50 0`


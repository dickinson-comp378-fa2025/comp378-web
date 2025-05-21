# Transaction and locking minilab

## (without explanations)

This is the page without explanations of the results. Try to experiment and see if you can explain the outputs yourself. If you need help to understand the outputs, look at the [page that includes explanations](demos-with-explanations.md).
  
Demo 1: simultaneously run
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 1 5`
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 30`

Demo 2: simultaneously run
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 1 5 -t`
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 30 -t`

Demo 3: simultaneously run
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 1 5 -w -t`
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 30 -w -t`

Demo 4: simultaneously run
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 1 5 -r -t`
* `java -cp ".;mysql-connector-java-8.0.26.jar" WithdrawMoney 111 30 -r -t`

Demo 5: simultaneously run
* `java -cp ".;mysql-connector-java-8.0.26.jar" SlowTransfer 111 222 1 5`
* `java -cp ".;mysql-connector-java-8.0.26.jar" SlowTransfer 222 111 50 0`


<?php

// This file demonstrates how to use values from a form to update a
// MySQL database via PHP. Specifically, this page implements a
// deposit into a bank account, based on information submitted into a
// web form.  See the page bank.php for details of how the form is
// submitted.


// Connect to the bank database as the root user with no password
try {
    $mysqli = new mysqli('localhost', 'root', '', 'bank');
    printf("<p>Successfully connected to bank database.\n");
} catch (Exception $e) {
      echo "<p>Caught exception while connecting to database.<br>";
      echo "<p>The error message was:<br>",  $e->getMessage(), "\n";
      die();
}

// Extract values from the submitted form
$account = $_GET['account_num'];
$amount = $_GET['dep_amount'];
printf("<br>Attempting to deposit %s dollars into account %s...<br>\n", $amount, $account);

  
$sql = "UPDATE accounts SET balance=balance+%s WHERE account_number='%s'";
$sql = sprintf($sql, $amount, $account);

try {
    mysqli_query($mysqli, $sql);
    if ($mysqli->affected_rows==1) {
        echo "<p>Deposit was completed successfully.";
    } else {
        echo "<p>The deposit failed. Check that the account number is correct.";
    }
} catch (Exception $e) {
    echo "<p>Caught exception while executing the following SQL statement:<p>" . $sql ;
    echo "<p>The error message was:<p>",  $e->getMessage(), "\n";
}

// Close database connection
mysqli_close($mysqli);

// Link to main bank page
echo "<p><a href='bank.php'>Back to main Bank page</a>\n";

?>

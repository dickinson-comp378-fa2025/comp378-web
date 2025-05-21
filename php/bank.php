<?php
// This file demonstrates some simple ways to use PHP in a dynamic
// webpage that interacts with a MySQL database.


// Connect to the bank database as the root user with no password
try {
    $mysqli = new mysqli('localhost', 'root', '', 'bank');
    printf("<p>Successfully connected to bank database.\n");
} catch (Exception $e) {
      echo "<p>Caught exception while connecting to database.<br>";
      echo "<p>The error message was:<br>",  $e->getMessage(), "\n";
      die();
}
/////////////////////////////////
// Print out all balances
/////////////////////////////////

// Submit the query to the database and store in $result
$query = "SELECT * FROM `accounts`";
$result = mysqli_query($mysqli, $query);

// Print the results in an HTML table
echo "<p>Current balances:\n";
echo "<br><table border=1>\n";
echo "<tr><td>account number</td><td>balance</td></tr>\n";
while ($myrow = mysqli_fetch_array($result)) {
    printf("<tr><td>%s</td><td>%s</td></tr>\n",
           $myrow["account_number"], $myrow["balance"]);
} 
echo "</table>\n";
echo "<br><br>";
/////////////////////////////////
/////////////////////////////////

// Close database connection
mysqli_close($mysqli);


/////////////////////////////////
// Create a form to deposit money
/////////////////////////////////


// We don't need to use a function here, but we use one anyway just to
// demonstrate how to declare functions in PHP. This function creates
// a form that can be used to deposit money into a bank account.
function depositMoney() {
    echo "To make a deposit, please enter details below and click the 'submit' button:\n";
    echo "<form method='get' action='depositMoney.php'>
  Account number:<input type='Text' name='account_num'><br>
  Amount to deposit:<input type='Text' name='dep_amount'><br>
  <input type='Submit' name='submit' value='submit'>
  </form>";
}

// invoke the function that creates the form for depositing money
depositMoney();


?>

<!DOCTYPE html>
<html>
	<head>
		<title>PHP Example</title>
	</head>
	<body>
		<h1> Using PHP to connect to a MySQL Database </h1>
		<p> Note: This example assumes a pre-existing, populated database called "DATABASENAME". </p>
                <h2> Section I </h2>
                <h3> Establish database connection and open "company" database. </h3>
		<?php
			//Create a connection to the MySQL server and store DB resource handle
                       $db = new mysqli('localhost','DATABASENAME','PASSWORD','DATABASENAME' );

			//Check to see if connection established and exit on error
                       if($db->connect_errno)
                        {
                         //Check to see if connection established and exit on error
                         echo "Failed to connect to MySQL database: (" . $db->connect_errno . ") " . $db->connect_error;
                         die();
                        }
		?>
		<hr />
                <h2> Section II </h2>
                <h3> List EMPLOYEE table </h3>
                <?php
			//Running queries on the database
			//Step #1 - Formulate your query
			$query = "SELECT * FROM EMPLOYEE";

                        //Step #2 - Run query and store result
                        $result= $db->query($query);
                        if(!$result) {
                                echo "<p>QUERY ERROR: ". mysqli_connect_errno() ."</p>";
                        }
                        echo "Number of rows: $result->num_rows";

                        //Step #3 - Working with the results
                        //Fetch and return records as associative array
                        while($row=$result->fetch_assoc()){
                                echo "<p>";
                                print_r($row);
                                echo "</p>";
                        }
		?>
                <hr />
                <h2> Section III </h2>
                <h3> Query: List Fname of Employees </h3>
                <?php

		       //Step #2 - Run query and store result
                       //Step #3 - Alternative- Only show specific attribute values
                        $result= $db->query($query);
                        if(!$result) {
				echo "<p>QUERY ERROR: ". mysqli_connect_errno() ."</p>";
                        }

                        while($row=$result->fetch_assoc()){
                                echo "<p>".$row['Fname'] . "</p>";
                        }
		?>
                <hr />
                <h2> Section IV </h2>
                <h3> Query: List Fname, Lname, Dno of Employees in Table format </h3>
                <?php

                       //Step #1 - Formulate your query
                        $query = "SELECT Fname, Lname, Dno FROM EMPLOYEE";

                       //Step #2 - Prepare the SQL query and store the prepared statement
                        if(!($stmt1 = $db->prepare($query)))
                        {
                                echo "Prepare failed: (" . $db->errno . ") " . $db->error;
                        }

                        //Step #3 - Execute the prepared statement and store the result set
                        $stmt1->execute();
                        $stmt1->store_result();

                        //Step #4 - Set the variable bindings for storing query results when they are fetched
                        $stmt1->bind_result($fname, $lname, $dno);

			//Step #5 - Alternative- Use a table to display output
		?>
                <table border="1">
                        <tr>
                                <th>Fname</th>
                                <th>Lname</th>
                                <th>Department</th>
                        </tr>
                <?php
                	while($stmt1->fetch())
                        {
                                echo "
                                <tr>
                                        <td>$fname</td>
                                        <td>$lname</td>
                                        <td>$dno</td>
                                </tr>";
                        }
                ?>
                </table>
                <hr />
                <h2> End </h2>
                <h3> Close connection to database. </h3>
                <?php
		// Don't forget to close your connection to the database
		$db->close();
		?>
	</body>
</html>

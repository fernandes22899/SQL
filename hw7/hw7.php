<!DOCTYPE html>
<html>
	<head>
		<title>Assignment #7 - cs775</title>
		<style type="text/css">
			body {font-family:"Courier New";}
			table {border:2px solid black; border-collapse:collapse;}
			th, td {border:2px solid black;text-align:left; vertical-align:top;}
		</style>
	</head>
	<body>
		<h1> HW #7  </h1>
		<p> Note: This assignment assumes that the "company.sql" file has been properly imported into MySQL. </p>
		<hr />
		<h2> Section I </h2>
		<h3> Establish database connection and open "company" database. </h3>
		<?php
			//Create a connection to the MySQL server and DB
			$db = new mysqli('localhost', 'jjf1027', 'ReRebik', 'jjf1027');
			if($db->connect_errno)
			{
				//Check to see if connection established and exit on error
				echo "Failed to connect to MySQL database: (" . $db->connect_errno . ") " . $db->connect_error;
				die();
			}
			else
			{
				echo "Successfully Connected";
			}
		?>
		<hr />
		<h2> Section II </h2>
		<h3> Formulate basic query and display output in HTML tables. </h3>
		<h4> Query: List all of the projects for department number. <br />
			Output columns: Project Name, Project Number, Project Location. <br />
			Output display: Utilize a TABLE to display your output.
		</h4>
                <h1> PHP and Form Data </h1>
                <h2> Input: </h2>
                <form method="post" action="hw7.php">
                        <p> Enter department number:
                                <input type="text" value="1" name="inputvalue" />
                                <input type="submit" name="submit" />
                                <input type="reset" name="reset" />
                        </p>
                </form>
                <hr />
                <h2> Output: </h2>
                <?php
                        if($_POST) {
                                echo "<p> There is form data input!  It looks like this: <br />";
                        }
                        else {
                                die("<p> No form data. </p>");
                        }

			// ASSIGN DEPARTMENT VALUE TO VARIABLE $dno
			//print_r($_POST);
			echo "</p>";
			$dno = $_POST['inputvalue'];
			echo "<p> The user supplied a department value of $dno.</p>";

		?>

		<?php
			//Step #1 - FORMULATE QUERY $qry1
			$qry1 = "SELECT Pname,Pnumber,Plocation FROM PROJECT WHERE Dnum = $dno";
			//Step #2 - Prepare the SQL query and store the prepared statement
			if(!($stmt1 = $db->prepare($qry1)))
			{
				echo "Prepare failed: (" . $db->errno . ") " . $db->error;
			}

			//Step #3 - Execute the prepared statement and store the result set
			$stmt1->execute();
			$stmt1->store_result();

			//Step #4 - SET THE VARIABLE BINDINGS FOR STORING QUERY RESULTS WHEN THEY ARE FETCHED.
			$stmt1->bind_result($Pname,$Pnumber,$Plocation);
			//Step #5 - Working with the results

		?>
		<table border="1">
			<tr>
				<th>Project Name</th>
				<th>Project Number</th>
				<th>Project Location</th>
			</tr>
		<?php
			// PRINT VALUES OF project name, number, location IN TABLE FORM
			while($stmt1->fetch())
						{
										echo "
										<tr>
														<td>$Pname</td>
														<td>$Pnumber</td>
														<td>$Plocation</td>
										</tr>";
						}
		?>
		</table>
		<hr />

		<h2> Section III </h2>
		<h3> Formulate sub-query that runs for each result row and add output to the HTML table. </h3>
		<h4> Query: List all of the projects for department number and the employees associated to the project. <br />
			Output columns: Project Name, Project Number, Project Location, Employees(SSN). <br />
			Output display: Utilize a TABLE to display your output.
		</h4>
		<table border="1">
			<tr>
				<th>Project Name</th>
				<th>Project Number</th>
				<th>Project Location</th>
				<th>Employees (SSN)</th>
			</tr>
		<?php

			// Reset our previous statement's result pointer to the beginning row
			$stmt1->data_seek(0);

			while($stmt1->fetch())
			{
				// PRINT A NEW ROW
				echo "<tr>";
				// CREATE SUBQUERY $qry2 FOR THE CURRENT PROJECT TO EXTRACT SSNs
				$qry2 = "SELECT Pname,p.Pnumber,Plocation,Essn FROM PROJECT p JOIN
				(SELECT Essn,Pno AS Pnumber FROM WORKS_ON) e ON p.Pnumber = e.Pnumber
				WHERE Dnum = $dno" ;
				// Prepare subquery, execute it, store and bind results
				if(!($stmt2 = $db->prepare($qry2)))
				{
					echo "Prepare failed: (" . $db->errno . ") " . $db->error;
				}

				$stmt2->execute();
				$stmt2->store_result();
				$stmt2->bind_result($Essn);

				// LOOP THROUGH SUBQUERY RESULTS PRINTING Essn
				// CLOSE THE ROW
				echo "
					<td>$Pname</td>
					<td>$Pnumber</td>
					<td>$Plocation</td>
					<td>$Essn</td>
				</tr>";
			}
		?>
		</table>

		<hr />
		<h2> End </h2>
		<h3> Close connection to database. </h3>
		<?php
			$db->close();
		?>

	</body>
</html>

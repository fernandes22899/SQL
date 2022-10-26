<!DOCTYPE html>
<html>
	<head>
		<title>PHP Example</title>
		<style type="text/css">
			h1 {text-align:center;}
		</style>
	</head>
	<body>
		<h1> PHP and Form Data </h1>
		<h2> Input: </h2>
		<form method="post" action="processform.php">
			<p> Enter number: 
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
				die("<p> No form data.  So, I'm done. </p>");
			}
			print_r($_POST);
			echo "</p>";
			$input = $_POST['inputvalue'];
			echo "<p> The user supplied a value of $input.</p>";
			
			// Here is an example of a function in PHP
			function factorial ($n){
				if($n <=1) {
					return 1;
				}
				else {
					return $n * factorial($n-1);
				}
			}
			
			echo "<p> The factorial is " . factorial($input) . ".</p>";
		?>
	</body>
</html>

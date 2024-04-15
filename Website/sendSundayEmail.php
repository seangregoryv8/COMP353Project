<?php
	$sundayEmail = file_get_contents('sendSundayEmail.sql');
	// Execute the SQL query (Note: This is a simple example and may need proper error handling and security measures)
	$servername = "vkc353.encs.concordia.ca:3306";
	$username = "vkc353_4";
	$password = "44JS14DE2";
	$dbname = "vkc353_4";

	$conn = new mysqli($servername, $username, $password, $dbname);

	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	// Execute the first SQL query
	if ($conn->multi_query($sundayEmail)) {
		// Loop through the result sets to free them
		do {
			if ($result = $conn->store_result()) {
				$result->free();
			}
		} while ($conn->next_result());
	} else {
		echo "Error executing initial relations query: " . $conn->error;
	}
	$stmt = $conn->prepare("Select * From EmailLog;");
	$data = [];
		
	try {
		// Execute the statement
		$stmt->execute();
		
		// Get the result set
		$result = $stmt->get_result();

		// Check if rows were returned
		if ($result->num_rows > 0) {
			// Fetch column names
			$columns = [];
			while ($column = $result->fetch_field()) {
				$columns[] = $column->name;
			}
			$data[] = $columns;
			// Fetch the results
			while ($row = $result->fetch_assoc()) {
						$data[] = $row;
			}
		} else {
			// Insert failed, but no error was thrown
			$data[0][0] = "No Emails.";
		}
	} catch (Exception $e) {
		// An error occurred during execution, retrieve and echo the error message
		$data[0][0] = "Insert failed: " . $stmt->error;
	}
	// File path
	$filePath = "emails.txt";

	// Open the file in write mode (create if not exists)
	$file = fopen($filePath, "w");

	// Loop through each row of the 2D array
	foreach ($data as $row) {
		// Loop through each element of the row
		foreach ($row as $element) {
			// Write the element to the file followed by a newline
			fwrite($file, $element . PHP_EOL);
		}
	}
	
	// Close connection
	$conn->close();
	$stmt->close();
	header("Location: {$_SERVER['HTTP_REFERER']}");
	exit;
?>
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
	
	// Close connection
	$conn->close();
	header("Location: {$_SERVER['HTTP_REFERER']}");
	exit;
?>
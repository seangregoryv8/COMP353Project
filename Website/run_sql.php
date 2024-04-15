<?php
$file = $_POST["sqlFile"];

// Ensure a file is uploaded
if (isset($file)) {
    // Execute the SQL query (Note: This is a simple example and may need proper error handling and security measures)
    $servername = "vkc353.encs.concordia.ca:3306";
	$username = "vkc353_4";
	$password = "44JS14DE2";
	$dbname = "vkc353_4";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
	if($_POST["actionType"] == "View")
	{
		// Read the contents of the uploaded SQL file
		$sqlContent = file_get_contents("View/" . $file);
		
		// Prepare the statement
		$stmt = $conn->prepare($sqlContent);
		error_log("Original: " . $sqlContent . "\n" . "\n", 3, "error.txt");
		// Define your parameters dynamically
		$params = array();
		// Find your param types
		$types = "";
		
		$numParams = 0;
		// Iterate over $_POST array to get the values dynamically
		foreach ($_POST as $key => $value) {
			// Here, we're assuming that the keys in $_POST match the column names in your database
			// You might want to add some validation and filtering here
			if($key != "actionType" && $key != "sqlFile")
			{
				$params[$numParams] = trim($value);
				if(preg_match('/_isInt$/', $key))
					$types .= 'i';
				else
					$types .= 's';
				error_log( "Key: " . $key . ", Value: " . $value . ", Value: " . $types[$numParams] . "\n", 3, "error.txt");
				$numParams++;
			}
		}
		
		if($types != "")
			$stmt->bind_param($types, ...$params);
		
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
				// Fetch column names
				$columns = [];
				while ($column = $result->fetch_field()) {
					$columns[] = $column->name;
				}
			}
		} catch (Exception $e) {
			// An error occurred during execution, retrieve and echo the error message
			$data[0][0] = "Query failed: " . $stmt->error;
		}
		
		// Close the statement
		$stmt->close();

		// Close the connection
		$conn->close();

		// Return the data as JSON
		header('Content-Type: application/json');
		echo json_encode($data);
	}
	else if($_POST["actionType"] == "Insert")
	{
		// Read the contents of the uploaded SQL file
		$sqlContent = file_get_contents("Insert/" . $file);
		// Prepare the statement
		$stmt = $conn->prepare($sqlContent);
		error_log("Original: " . $sqlContent . "\n" . "\n", 3, "error.txt");
		// Define your parameters dynamically
		$params = array();
		// Find your param types
		$types = "";
		
		$numParams = 0;
		// Iterate over $_POST array to get the values dynamically
		foreach ($_POST as $key => $value) {
			
			// Here, we're assuming that the keys in $_POST match the column names in your database
			// You might want to add some validation and filtering here
			if($key != "actionType" && $key != "sqlFile")
			{
				$params[$numParams] = trim($value);
				if(preg_match('/_isInt$/', $key))
					$types .= 'i';
				else
					$types .= 's';
				error_log( "Key: " . $key . ", Value: " . $value . ", Value: " . $types[$numParams] . "\n", 3, "error.txt");
				$numParams++;
			}
		}
		
		$stmt->bind_param($types, ...$params);

		$data = [];
		try {
			// Execute the statement
			$stmt->execute();

			// Check if the insert was successful
			if ($stmt->affected_rows > 0) {
				$data[0][0] = "Insert successful";
			} else {
				// Insert failed, but no error was thrown
				$data[0][0] = "Insert failed";
			}
		} catch (Exception $e) {
			// An error occurred during execution, retrieve and echo the error message
			$data[0][0] = "Insert failed: " . $stmt->error;
		}
		// Close the statement
		$stmt->close();
		
		// Close the connection
		$conn->close();
		
		if($file == "InsertInfection.sql")
		{	
			$stmt = $conn->prepare("Select * From EmailLog;");
			$data1 = [];
				
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
					$data1[] = $columns;
					// Fetch the results
					while ($row = $result->fetch_assoc()) {
								$data1[] = $row;
					}
				} else {
					// Insert failed, but no error was thrown
					$data1[0][0] = "The Selected Item Does Not exist.";
				}
			} catch (Exception $e) {
				// An error occurred during execution, retrieve and echo the error message
				$data1[0][0] = "Insert failed: " . $stmt->error;
			}
			// File path
			$filePath = "emails.txt";

			// Open the file in write mode (create if not exists)
			$file = fopen($filePath, "w");

			// Loop through each row of the 2D array
			foreach ($data1 as $row) {
				// Loop through each element of the row
				foreach ($row as $element) {
					// Write the element to the file followed by a newline
					fwrite($file, $element . PHP_EOL);
				}
			}
			
			// Close the statement
			$stmt->close();
		}
		
		// Return the data as JSON
		header('Content-Type: application/json');
		echo json_encode($data);
	}
	else if($_POST["actionType"] == "Display")
	{
		// Read the contents of the uploaded SQL file
		$sqlContent = file_get_contents("Display/" . $file);
		// Prepare the statement
		$stmt = $conn->prepare($sqlContent);
		error_log("Original: " . $sqlContent . "\n" . "\n", 3, "error.txt");
		// Define your parameters dynamically
		$params = array();
		// Find your param types
		$types = "";
		
		$numParams = 0;
		// Iterate over $_POST array to get the values dynamically
		foreach ($_POST as $key => $value) {
			// Here, we're assuming that the keys in $_POST match the column names in your database
			// You might want to add some validation and filtering here
			if($key != "actionType" && $key != "sqlFile")
			{
				$params[$numParams] = trim($value);
				if(preg_match('/_isInt$/', $key))
					$types .= 'i';
				else
					$types .= 's';
				error_log( "Key: " . $key . ", Value: " . $value . ", Value: " . $types[$numParams] . "\n", 3, "error.txt");
				$numParams++;
			}
		}
		
		$stmt->bind_param($types, ...$params);
		
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
				$data[0][0] = "The Selected Item Does Not exist.";
			}
		} catch (Exception $e) {
			// An error occurred during execution, retrieve and echo the error message
			$data[0][0] = "Insert failed: " . $stmt->error;
		}

		// Close the statement
		$stmt->close();

		// Close the connection
		$conn->close();

		// Return the data as JSON
		header('Content-Type: application/json');
		echo json_encode($data);
	}
	else if($_POST["actionType"] == "Delete")
	{
		// Read the contents of the uploaded SQL file
		$sqlContent = file_get_contents("Delete/" . $file);
		// Prepare the statement
		$stmt = $conn->prepare($sqlContent);
		error_log("Original: " . $sqlContent . "\n" . "\n", 3, "error.txt");
		// Define your parameters dynamically
		$params = array();
		// Find your param types
		$types = "";
		
		$numParams = 0;
		// Iterate over $_POST array to get the values dynamically
		foreach ($_POST as $key => $value) {
			// Here, we're assuming that the keys in $_POST match the column names in your database
			// You might want to add some validation and filtering here
			if($key != "actionType" && $key != "sqlFile")
			{
				$params[$numParams] = trim($value);
				if(preg_match('/_isInt$/', $key))
					$types .= 'i';
				else
					$types .= 's';
				error_log( "Key: " . $key . ", Value: " . $value . ", Value: " . $types[$numParams] . "\n", 3, "error.txt");
				$numParams++;
			}
		}
		
		$stmt->bind_param($types, ...$params);
		
		$data = [];
		
		try {
			// Execute the statement
			$stmt->execute();

			// Check if the insert was successful
			if ($stmt->affected_rows > 0) {
				$data[0][0] = "Delete successful";
			} else {
				// Delete failed, but no error was thrown
				$data[0][0] = "Delete failed";
			}
		} catch (Exception $e) {
			// An error occurred during execution, retrieve and echo the error message
			$data[0][0] = "Delete failed: " . $stmt->error;
		}

		// Close the statement
		$stmt->close();

		// Close the connection
		$conn->close();

		// Return the data as JSON
		header('Content-Type: application/json');
		echo json_encode($data);
	}
	else if($_POST["actionType"] == "Edit")
	{
		// Read the contents of the uploaded SQL file
		$sqlContent = file_get_contents("Edit/" . $file);
		// Prepare the statement
		$editValue = $_POST["EditValue"];
		$sqlContent = str_replace("colValue", $editValue, $sqlContent);

		error_log("Original: " . $sqlContent . "\n" . "\n", 3, "error.txt");
		$stmt = $conn->prepare($sqlContent);
		// Define your parameters dynamically
		$params = array();
		// Find your param types
		$types = "";
		
		$numParams = 0;
		// Iterate over $_POST array to get the values dynamically
		foreach ($_POST as $key => $value) {
			if($key == "NewValue")
			{
				$params[$numParams] = trim($value);
				$editValue = strtolower($editValue);
				if($editValue == strtolower("Dose") || $editValue == strtolower("Bedrooms") || $editValue == strtolower("Capacity") || $editValue == strtolower("Quarantine_Period"))
				{
					$types .= 'i';
					$numParams++;
					error_log( "Key: " . $key . ", Value: " . $value . "\n", 3, "error.txt");
					continue;
				}
			}
			// Here, we're assuming that the keys in $_POST match the column names in your database
			// You might want to add some validation and filtering here
			if($key != "actionType" && $key != "sqlFile" && $key != "EditValue")
			{
				$params[$numParams] = trim($value);
				if(preg_match('/_isInt$/', $key))
					$types .= 'i';
				else
					$types .= 's';
				error_log( "Key: " . $key . ", Value: " . $value . "\n", 3, "error.txt");
				$numParams++;
			}
		}
		
		$stmt->bind_param($types, ...$params);
		
		$data = [];
		
		try {
			// Execute the statement
			$stmt->execute();

			// Check if the insert was successful
			if ($stmt->affected_rows > 0) {
				$data[0][0] = "Edit successful";
			} else {
				// Delete failed, but no error was thrown
				$data[0][0] = "Edit failed";
			}
		} catch (Exception $e) {
			// An error occurred during execution, retrieve and echo the error message
			$data[0][0] = "Edit failed: " . $stmt->error;
		}

		// Close the statement
		$stmt->close();

		// Close the connection
		$conn->close();

		// Return the data as JSON
		header('Content-Type: application/json');
		echo json_encode($data);
	}
}

else {
	echo "No file uploaded";
    // If no file is uploaded, redirect back to the index page
    header('Location: index.php?result=' . urlencode('<br> No File Uploaded </br>'));
    exit;
}
?>
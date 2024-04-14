<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Health Facility Employee Status Tracking System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
        }

        #container {
            display: flex;
            justify-content: space-between;
            padding: 20px;
			min-height: 95vh;
        }

        #form-container {
            flex: 2;
            margin-right: 20px;
        }

        #table-container {
            flex: 10;
            background-color: #fff;
            padding: 20px;
            border-top-left-radius: 0px;
			border-bottom-left-radius: 0px;
			border-top-right-radius: 5px;
			border-bottom-right-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
		
		#buttonSwitch {
			text-align: left;
			padding: 0px;
			border-top-left-radius: 5px;
			border-bottom-left-radius: 5px;
			border-top-right-radius: 0px;
			border-bottom-right-radius: 0px;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"] {
            width: calc(100% - 20px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
		
		input[type="number"] {
            width: calc(100% - 20px);
            padding: 8px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        button {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        table {
            width: 100%;
			height: 100%
            border-collapse: collapse;
        }
		.table-selects {
            border-collapse: collapse; /* Collapse borders into a single border */
            border: none; /* Remove the default table border */
        }
		.table-selects th,
		.table-selects td {
			border: none; /* Remove the border */
			padding: 2px;
			text-align: left;
			width: 100px;
		}

        th, td {
            border: 1px solid #ddd;
            padding: 2px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
		.radio-container-insertoptions {
			flex-direction: column;
		}
		.radio-container-viewoptions {
			flex-direction: column;
		}
		.radio-container-deleteoptions {
			flex-direction: column;
		}
		.radio-container-displayoptions {
			flex-direction: column;
		}
		.radio-container-options {
			flex-direction: column;
		}
		#radio-container label {
			display: block; /* Makes the label a block-level element */
			margin: 0;		
		}

		#radio-container input[type="radio"] {
			margin-right: 10px; /* Adjust as needed */
			display: block; /* Makes the radio button a block-level element */
			margin-bottom: 5px; /* Optional: Adds spacing between radio buttons */
		}
		.radio-block {
			display: flex;
			align-items: center;
			cursor: pointer; /* Change cursor to pointer on hover */
			padding: 10px; /* Add padding for better clickability */
			border: 1px solid #ccc; /* Optional: Add border for visual feedback */
			border-radius: 5px; /* Optional: Add border radius for rounded corners */
			margin-bottom: 10px; /* Optional: Add margin between radio blocks */
		}
		.radio-block:hover {
			background-color: #ddd; /* Change to the desired hover color */
			cursor: pointer;
		}
    </style>
</head>
<body>
    <div id="container">
        <div id="form-container">
            <h2>Health Facility Employee Status Tracking System</h2>
			<div id="radio-container" name = "Selection">
				<table class = "table-selects">
					<tr>
						<td>
						<div class="radio-block" onclick="showOptions('insertoptions')">
							Insert
						</div>
						</td>
						<td>
						<div class="radio-block" onclick="showOptions('displayoptions')">
							Display
						</div>
						</td>
						<td>
						<div class="radio-block" onclick="showOptions('deleteoptions')">
							Delete
						</div>
						</td>
						<td>
						<div class="radio-block" onclick="showOptions('editoptions')">
							Edit
						</div>
						</td>
						<td>
						<div class="radio-block" onclick="showOptions('viewoptions')">
							View
						</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="radio-container-insertoptions">
				<table class = "table-selects">
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('InsertResidence.sql','Insert')">
								Insert Residence
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('InsertPerson.sql','Insert')">
								Insert Person
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('InsertEmployee.sql','Insert')">
								Insert Employee
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('InsertHousemate.sql','Insert')">
								Insert Housemate
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('InsertTimesheet.sql','Insert')">
								Insert TimeSheet
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('InsertVaccination.sql','Insert')">
								Insert Vaccination
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('InsertInfection.sql','Insert')">
								Insert Infection
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('InsertFacility.sql','Insert')">
								Insert Facility
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('InsertSchedule.sql','Insert')">
								Insert Schedule
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('InsertHome.sql','Insert')">
								Insert Home
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="radio-container-viewoptions" >
				<table class = "table-selects">
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('ViewQuery8.sql','View')">
								View Query 8
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('ViewQuery9.sql','View')">
								View Query 9
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('ViewQuery10.sql','View')">
								View Query 10
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('ViewQuery11.sql','View')">
								View Query 11
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('ViewQuery12.sql','View')">
								View Query 12
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('ViewQuery13.sql','View')">
								View Query 13
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('ViewQuery14.sql','View')">
								View Query 14
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('ViewQuery15.sql','View')">
								View Query 15
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('ViewQuery16.sql','View')">
								View Query 16
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('ViewQuery17.sql','View')">
								View Query 17
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('ViewQuery18.sql','View')">
								View Query 18
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="radio-container-displayoptions">
				<table class = "table-selects">
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('DisplayResidence.sql','Display')">
								Display Residence
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('DisplayPerson.sql','Display')">
								Display Person
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('DisplayEmployee.sql','Display')">
								Display Employee
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('DisplayHousemate.sql','Display')">
								Display Housemate
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('DisplayTimesheet.sql','Display')">
								Display TimeSheet
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('DisplayVaccination.sql','Display')">
								Display Vaccination
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('DisplayInfection.sql','Display')">
								Display Infection
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('DisplayFacility.sql','Display')">
								Display Facility
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('DisplaySchedule.sql','Display')">
								Display Schedule
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('DisplayHome.sql','Display')">
								Display Home
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="radio-container-deleteoptions">
				<table class = "table-selects">
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('DeleteResidence.sql','Delete')">
								Delete Residence
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('DeletePerson.sql','Delete')">
								Delete Person
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('DeleteEmployee.sql','Delete')">
								Delete Employee
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('DeleteHousemate.sql','Delete')">
								Delete Housemate
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('DeleteTimesheet.sql','Delete')">
								Delete TimeSheet
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('DeleteVaccination.sql','Delete')">
								Delete Vaccination
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('DeleteInfection.sql','Delete')">
								Delete Infection
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('DeleteFacility.sql','Delete')">
								Delete Facility
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('DeleteSchedule.sql','Delete')">
								Delete Schedule
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('DeleteHome.sql','Delete')">
								Delete Home
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="radio-container-editoptions">
				<table class = "table-selects">
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('EditResidence.sql','Edit')">
								Edit Residence
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('EditPerson.sql','Edit')">
								Edit Person
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('EditEmployee.sql','Edit')">
								Edit Employee
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('EditHousemate.sql','Edit')">
								Edit Housemate
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('EditTimesheet.sql','Edit')">
								Edit TimeSheet
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('EditVaccination.sql','Edit')">
								Edit Vaccination
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('EditInfection.sql','Edit')">
								Edit Infection
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('EditFacility.sql','Edit')">
								Edit Facility
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div class="radio-block" onclick="showForm('EditSchedule.sql','Edit')">
								Edit Schedule
							</div>
						</td>
						<td>
							<div class="radio-block" onclick="showForm('EditHome.sql','Edit')">
								Edit Home
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="inputs"></div>
			<!-- Button to execute the chosen SQL file -->
			<button type="button" onclick="submitChosenForm()">Run</button>
        </div>
		<button type="button" id = "buttonSwitch" onclick="switchButtons()">&#9668;</button>
        <div id="table-container">
            <h2>Table</h2>
            <div id="table"></div>
        </div>
    </div>
	
	
    <script>
		var currentOption = "";
		showOptions('insertoptions');
		showOptions('viewoptions');
		showOptions('displayoptions');
		showOptions('deleteoptions');
		showOptions('editoptions');
		
		function showForm(sqlFile, type) 
		{
			// Hide all forms
			var forms = document.querySelectorAll('form');
			var place = document.getElementById('inputs');
			forms.forEach(function (form) {
				console.log("Removing active class from form:", form);
				form.remove();
			});
			
			if(type == "Insert"){
				// Create a unique form dynamically
				var form = document.createElement("form");
				
				form.setAttribute("action", "run_sql.php");
				form.setAttribute("method", "post");
				form.classList.add('active'); // Show the selected form
				
				// Add input fields specific to the selected type of action
				var actionType = document.createElement("input");
				actionType.setAttribute("type", "hidden");
				actionType.setAttribute("name", "actionType");
				actionType.setAttribute("value", type);
				form.appendChild(actionType);
				
				// Add input fields specific to the selected SQL file
				var inputFileName = document.createElement("input");
				inputFileName.setAttribute("type", "hidden");
				inputFileName.setAttribute("name", "sqlFile");
				inputFileName.setAttribute("value", sqlFile);
				form.appendChild(inputFileName);
				
				form.setAttribute("action", "run_sql.php");
				form.setAttribute("method", "post");
				form.classList.add('active'); // Show the selected form
				
				if (sqlFile == 'InsertFacility.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Name", "Enter text");
				addLabelAndTextBox(form, "Address", "Enter text");
				addLabelAndTextBox(form, "City", "Enter text");
				addLabelAndTextBox(form, "Province", "Enter text");
				addLabelAndTextBox(form, "PostalCode", "Enter text");
				addLabelAndTextBox(form, "Phone", "Enter text");
				addLabelAndTextBox(form, "WebAddress", "Enter text");
				addLabelAndNumberBox(form, "Capacity", "Enter number");
				addLabelAndTextBox(form, "Manager", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);
				
				return form;
				
				} else if (sqlFile == 'InsertResidence.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Address", "Enter text");
				addLabelAndTextBox(form, "City", "Enter text");
				addLabelAndTextBox(form, "Province", "Enter text");
				addLabelAndTextBox(form, "PostalCode", "Enter text");
				addLabelAndTextBox(form, "Phone", "Enter text");
				addLabelAndNumberBox(form, "Bedrooms", "Enter number");
				addLabelAndTextBox(form, "Type", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'InsertPerson.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "SIN", "Enter text");
				addLabelAndTextBox(form, "FirstName", "Enter text");
				addLabelAndTextBox(form, "LastName", "Enter text");
				addLabelAndTextBox(form, "DateOfBirth", "yyyy-mm-dd");
				addLabelAndTextBox(form, "MedicareCardNumber", "Enter text");
				addLabelAndTextBox(form, "TelehoneNumber", "Enter text");
				addLabelAndTextBox(form, "Citizenship", "Enter text");
				addLabelAndTextBox(form, "EmailAddress", "Enter text");
				addLabelAndTextBox(form, "Occupation", "Enter text");
				addLabelAndTextBox(form, "PrimaryResidence", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'InsertEmployee.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "SIN", "Enter text");
				addLabelAndTextBox(form, "Role", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'InsertHousemate.sql') {
				addLabelAndTextBox(form, "Employee", "Enter text");
				addLabelAndTextBox(form, "Person", "Enter text");
				addLabelAndTextBox(form, "Relationship", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'InsertTimesheet.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Employee", "Enter text");
				addLabelAndTextBox(form, "Facility", "Enter text");
				addLabelAndTextBox(form, "StartDate", "yyyy-mm-dd");
				addLabelAndTextBox(form, "EndDate", "yyyy-mm-dd or null if working there");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'InsertVaccination.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Dose", "Enter number");
				addLabelAndTextBox(form, "Type", "Enter text");
				addLabelAndTextBox(form, "Date", "yyyy-mm-dd");
				addLabelAndTextBox(form, "Person", "Enter text");
				addLabelAndTextBox(form, "TakenAt", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'InsertInfection.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Date", "yyyy-mm-dd");
				addLabelAndTextBox(form, "Type", "Enter text");
				addLabelAndNumberBox(form, "Quarantine_Period", "Enter number");
				addLabelAndTextBox(form, "Person", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				}else if (sqlFile == 'InsertVaccination.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Dose", "Enter number");
				addLabelAndTextBox(form, "Type", "Enter text");
				addLabelAndTextBox(form, "Date", "yyyy-mm-dd");
				addLabelAndTextBox(form, "Person", "Enter text");
				addLabelAndTextBox(form, "TakenAt", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'InsertInfection.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Date", "yyyy-mm-dd");
				addLabelAndTextBox(form, "Type", "Enter text");
				addLabelAndNumberBox(form, "Quarantine_Period", "Enter number");
				addLabelAndTextBox(form, "Person", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				}else if (sqlFile == 'InsertHome.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Residence", "Enter text");
				addLabelAndTextBox(form, "Person", "Enter text");
				addLabelAndTextBox(form, "StartDate", "yyyy-mm-dd");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'InsertSchedule.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Date", "yyyy-mm-dd");
				addLabelAndTextBox(form, "StartTime", "yyyy-mm-dd hh:mm:ss");
				addLabelAndTextBox(form, "EndTime", "yyyy-mm-dd hh:mm:ss");
				addLabelAndTextBox(form, "ScheduleAt", "Enter text");
				addLabelAndTextBox(form, "ScheduleFor", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				}
			}
			else if (type == "View"){
				var form = document.createElement("form");
				form.setAttribute("action", "run_sql.php");
				form.setAttribute("method", "post");
				form.classList.add('active'); // Show the selected form
				
				var actionType = document.createElement("input");
				actionType.setAttribute("type", "hidden");
				actionType.setAttribute("name", "actionType");
				actionType.setAttribute("value", type);
				form.appendChild(actionType);
				
				var inputFileName = document.createElement("input");
				inputFileName.setAttribute("type", "hidden");
				inputFileName.setAttribute("name", "sqlFile");
				inputFileName.setAttribute("value", sqlFile);
				form.appendChild(inputFileName);
				
				if (sqlFile == 'ViewQuery10.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "After", "yyyy-mm-dd hh:mm:ss");
				addLabelAndTextBox(form, "Before", "yyyy-mm-dd hh:mm:ss");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);
				
				return form;
				
				}else if (sqlFile == 'ViewQuery11.sql') {
				// Add labels and text boxes to the form
				addLabelAndNumberBox(form, "EmployeeSIN", "EnterNumber");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);
				
				return form;
				
				}
				
				place.appendChild(form);
				submitChosenForm();
				return form;
			}
			else if(type == "Display"){
				// Create a unique form dynamically
				var form = document.createElement("form");
				
				form.setAttribute("action", "run_sql.php");
				form.setAttribute("method", "post");
				form.classList.add('active'); // Show the selected form
				
				// Add input fields specific to the selected type of action
				var actionType = document.createElement("input");
				actionType.setAttribute("type", "hidden");
				actionType.setAttribute("name", "actionType");
				actionType.setAttribute("value", type);
				form.appendChild(actionType);
				
				// Add input fields specific to the selected SQL file
				var inputFileName = document.createElement("input");
				inputFileName.setAttribute("type", "hidden");
				inputFileName.setAttribute("name", "sqlFile");
				inputFileName.setAttribute("value", sqlFile);
				form.appendChild(inputFileName);
				
				form.setAttribute("action", "run_sql.php");
				form.setAttribute("method", "post");
				form.classList.add('active'); // Show the selected form
				
				if (sqlFile == 'DisplayFacility.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Name", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);
				
				return form;
				
				} else if (sqlFile == 'DisplayResidence.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Address", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DisplayPerson.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "SIN", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DisplayEmployee.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "SIN", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DisplayHousemate.sql') {
				addLabelAndTextBox(form, "Employee", "Enter text");
				addLabelAndTextBox(form, "Person", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DisplayTimesheet.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Employee", "Enter text");
				addLabelAndTextBox(form, "Facility", "Enter text");
				addLabelAndTextBox(form, "StartDate", "yyyy-mm-dd");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DisplayVaccination.sql') {
				// Add labels and text boxes to the form
				addLabelAndNumberBox(form, "Dose", "Enter Number");
				addLabelAndTextBox(form, "Person", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DisplayInfection.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Date", "yyyy-mm-dd");
				addLabelAndTextBox(form, "Person", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				}else if (sqlFile == 'DisplayHome.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Residence", "Enter text");
				addLabelAndTextBox(form, "Person", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DisplaySchedule.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "StartTime", "yyyy-mm-dd hh:mm:ss");
				addLabelAndTextBox(form, "ScheduleAt", "Enter text");
				addLabelAndTextBox(form, "ScheduleFor", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				}
			}
			else if(type ==  "Delete"){
				// Create a unique form dynamically
				var form = document.createElement("form");
				
				form.setAttribute("action", "run_sql.php");
				form.setAttribute("method", "post");
				form.classList.add('active'); // Show the selected form
				
				// Add input fields specific to the selected type of action
				var actionType = document.createElement("input");
				actionType.setAttribute("type", "hidden");
				actionType.setAttribute("name", "actionType");
				actionType.setAttribute("value", type);
				form.appendChild(actionType);
				
				// Add input fields specific to the selected SQL file
				var inputFileName = document.createElement("input");
				inputFileName.setAttribute("type", "hidden");
				inputFileName.setAttribute("name", "sqlFile");
				inputFileName.setAttribute("value", sqlFile);
				form.appendChild(inputFileName);
				
				form.setAttribute("action", "run_sql.php");
				form.setAttribute("method", "post");
				form.classList.add('active'); // Show the selected form
				
				if (sqlFile == 'DeleteFacility.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Name", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);
				
				return form;
				
				} else if (sqlFile == 'DeleteResidence.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Address", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DeletePerson.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "SIN", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DeleteEmployee.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "SIN", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DeleteHousemate.sql') {
				addLabelAndTextBox(form, "Employee", "Enter text");
				addLabelAndTextBox(form, "Person", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DeleteTimesheet.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Employee", "Enter text");
				addLabelAndTextBox(form, "Facility", "Enter text");
				addLabelAndTextBox(form, "StartDate", "yyyy-mm-dd");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DeleteVaccination.sql') {
				// Add labels and text boxes to the form
				addLabelAndNumberBox(form, "Dose", "Enter Number");
				addLabelAndTextBox(form, "Person", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DeleteInfection.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Date", "yyyy-mm-dd");
				addLabelAndTextBox(form, "Person", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				}else if (sqlFile == 'DeleteHome.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "Residence", "Enter text");
				addLabelAndTextBox(form, "Person", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'DeleteSchedule.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "StartTime", "yyyy-mm-dd hh:mm:ss");
				addLabelAndTextBox(form, "ScheduleAt", "Enter text");
				addLabelAndTextBox(form, "ScheduleFor", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				}
			}
			else if(type ==  "Edit"){
				// Create a unique form dynamically
				var form = document.createElement("form");
				
				form.setAttribute("action", "run_sql.php");
				form.setAttribute("method", "post");
				form.classList.add('active'); // Show the selected form
				
				// Add input fields specific to the selected type of action
				var actionType = document.createElement("input");
				actionType.setAttribute("type", "hidden");
				actionType.setAttribute("name", "actionType");
				actionType.setAttribute("value", type);
				form.appendChild(actionType);
				
				// Add input fields specific to the selected SQL file
				var inputFileName = document.createElement("input");
				inputFileName.setAttribute("type", "hidden");
				inputFileName.setAttribute("name", "sqlFile");
				inputFileName.setAttribute("value", sqlFile);
				form.appendChild(inputFileName);
				
				form.setAttribute("action", "run_sql.php");
				form.setAttribute("method", "post");
				form.classList.add('active'); // Show the selected form
				
				if (sqlFile == 'EditFacility.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "EditValue", "Enter the attribute you want to edit");
				addLabelAndTextBox(form, "NewValue", "Enter the new value");
				addLabelAndTextBox(form, "Name", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);
				
				return form;
				
				} else if (sqlFile == 'EditResidence.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "EditValue", "Enter the attribute you want to edit");
				addLabelAndTextBox(form, "NewValue", "Enter the new value");
				addLabelAndTextBox(form, "Address", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'EditPerson.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "EditValue", "Enter the attribute you want to edit");
				addLabelAndTextBox(form, "NewValue", "Enter the new value");
				addLabelAndTextBox(form, "SIN", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'EditEmployee.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "EditValue", "Enter the attribute you want to edit");
				addLabelAndTextBox(form, "NewValue", "Enter the new value");
				addLabelAndTextBox(form, "SIN", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'EditHousemate.sql') {
				addLabelAndTextBox(form, "EditValue", "Enter the attribute you want to edit");
				addLabelAndTextBox(form, "NewValue", "Enter the new value");
				addLabelAndTextBox(form, "Employee", "Enter text");
				addLabelAndTextBox(form, "Person", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'EditTimesheet.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "EditValue", "Enter the attribute you want to edit");
				addLabelAndTextBox(form, "NewValue", "Enter the new value");
				addLabelAndTextBox(form, "Employee", "Enter text");
				addLabelAndTextBox(form, "Facility", "Enter text");
				addLabelAndTextBox(form, "StartDate", "yyyy-mm-dd");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'EditVaccination.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "EditValue", "Enter the attribute you want to edit");
				addLabelAndTextBox(form, "NewValue", "Enter the new value");
				addLabelAndNumberBox(form, "Dose", "Enter Number");
				addLabelAndTextBox(form, "Person", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'EditInfection.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "EditValue", "Enter the attribute you want to edit");
				addLabelAndTextBox(form, "NewValue", "Enter the new value");
				addLabelAndTextBox(form, "Date", "yyyy-mm-dd");
				addLabelAndTextBox(form, "Person", "Enter text");
				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				}else if (sqlFile == 'EditHome.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "EditValue", "Enter the attribute you want to edit");
				addLabelAndTextBox(form, "NewValue", "Enter the new value");
				addLabelAndTextBox(form, "Residence", "Enter text");
				addLabelAndTextBox(form, "Person", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				} else if (sqlFile == 'EditSchedule.sql') {
				// Add labels and text boxes to the form
				addLabelAndTextBox(form, "EditValue", "Enter the attribute you want to edit");
				addLabelAndTextBox(form, "NewValue", "Enter the new value");
				addLabelAndTextBox(form, "StartTime", "yyyy-mm-dd hh:mm:ss");
				addLabelAndTextBox(form, "ScheduleAt", "Enter text");
				addLabelAndTextBox(form, "ScheduleFor", "Enter text");

				// You can add more input fields here as needed for each SQL file

				// Append the form to the body
				place.appendChild(form);

				return form;
				
				}
			}
			function addLabelAndTextBox(form, name, placeholder) {
				// Add a label to the form
				var label = document.createElement("label");
				label.innerHTML = name + ": ";
				form.appendChild(label);

				// Add a text box to the form
				var textBox = document.createElement("input");
				textBox.setAttribute("type", "text");
				textBox.setAttribute("name", name);
				textBox.setAttribute("placeholder", placeholder);
				form.appendChild(textBox);

				// Add a line break after each text box
				form.appendChild(document.createElement("br"));
			}
			function addLabelAndNumberBox(form, name, placeholder) {
				// Add a label to the form
				var label = document.createElement("label");
				label.innerHTML = name + ": ";
				form.appendChild(label);

				// Add a text box to the form
				var textBox = document.createElement("input");
				textBox.setAttribute("type", "number");
				textBox.setAttribute("name", name + "_isInt");
				textBox.setAttribute("placeholder", placeholder);
				form.appendChild(textBox);

				// Add a line break after each text box
				form.appendChild(document.createElement("br"));
			}
		}

		function submitChosenForm() {
			var selectedForm = document.querySelector('form.active');
			if (selectedForm) {
				// Create a new FormData object to store form data
				var formData = new FormData(selectedForm);

				// Create a new XMLHttpRequest object
				var xhr = new XMLHttpRequest();

				// Define the AJAX request parameters
				xhr.open('POST', 'run_sql.php', true);
				xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');

				// Define the function to handle the AJAX response
				xhr.onload = function() {
					if (xhr.status === 200) {
						// Parse the JSON response
						var data = JSON.parse(xhr.responseText);

						// Append the query results to the page
						appendResultsToPage(data);
					} else {
						// Handle errors
						console.error('Request failed. Status: ' + xhr.status);
					}
				};

				// Send the AJAX request with the form data
				xhr.send(formData);
			} 
			else {
				alert("Please choose a form before submitting.");
			}
		}

		// Function to append query results to the page
		function appendResultsToPage(data) {
			// Assuming data is an array of objects, where each object represents a row in the query results
			var table = document.createElement('table');

			// Iterate over each row in the data array
			data.forEach(function(rowData) {
				var row = document.createElement('tr');

				// Iterate over each key-value pair in the row data object
				for (var key in rowData) {
					if (rowData.hasOwnProperty(key)) {
						var cell = document.createElement('td');
						cell.textContent = rowData[key];
						row.appendChild(cell);
					}
				}

				// Append the row to the table
				table.appendChild(row);
			});

			// Append the table to the page
			var tableContainer = document.getElementById('table');
			tableContainer.innerHTML = ''; // Clear existing content
			tableContainer.appendChild(table);
		}
		
		function showOptions(option) {
			var hiddenDiv = document.getElementById('radio-container-' + option);

			if (hiddenDiv.style.display === "none") {
				if(currentOption != ""){
					var currentDiv = document.getElementById('radio-container-' + currentOption);
					currentDiv.style.display = "none";
				}
				hiddenDiv.style.display = "block";
				currentOption = option;
			} else {
				hiddenDiv.style.display = "none";
				var place = document.getElementById('inputs');
				currentOption = "";
			}
			var forms = document.querySelectorAll('form');
			forms.forEach(function (form) {
				console.log("Removing active class from form:", form);
				form.remove();
			});
		}
		function switchButtons(){
			var buttonContainer = document.getElementById('form-container');
			if(buttonContainer.style.display != 'none'){
				buttonContainer.style.display = 'none';
				var buttonSwitch = document.getElementById('buttonSwitch');
				buttonSwitch.innerHTML = '&#9658;'
			}
			else{
				buttonContainer.style.display = 'block';
				var buttonSwitch = document.getElementById('buttonSwitch');
				buttonSwitch.innerHTML = '&#9668;'
			}
		}
	</script>
	<?php
		$initRelations = file_get_contents('HFEST_Init.sql');
		$initInserts = file_get_contents('Insert/InsertValues.sql');
		// Execute the SQL query (Note: This is a simple example and may need proper error handling and security measures)
		$servername = "localhost:3306";
		$username = "root";
		$password = "pass123";
		$dbname = "HFESTS";

		$conn = new mysqli($servername, $username, $password, $dbname);

		if ($conn->connect_error) {
			die("Connection failed: " . $conn->connect_error);
		}
		// Execute the first SQL query
		if ($conn->multi_query($initRelations)) {
			// Loop through the result sets to free them
			do {
				if ($result = $conn->store_result()) {
					$result->free();
				}
			} while ($conn->next_result());
		} else {
			echo "Error executing initial relations query: " . $conn->error;
		}
		// Execute the second SQL query
		if ($conn->multi_query($initInserts)) {
			// Loop through the result sets to free them
			do {
				echo "HELLO WORLD";
				if ($result = $conn->store_result()) {
					$result->free();
				}
			} while ($conn->next_result());
		} else {
			echo "Error executing initial inserts query: " . $conn->error;
		}

		
		// Close connection
		$conn->close();
	?>
</body>
</html>
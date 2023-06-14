<?php
// Check connection
$servername = "localhost";
$username = "root";
$password = "";
$db = "projekt_crms";

// Create connection
$conn = new mysqli($servername, $username, $password, $db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 



$nid =$_REQUEST['nid'];

$fn = $_REQUEST['firstname'];

$ln = $_REQUEST['lastname'];


$name = $fn . " " . $ln;


$occu = $_REQUEST['occupation'];
$desig = $_REQUEST['designation'];
$offAdd = $_REQUEST['officeAddress'];
$email = $_REQUEST['email'];

$dob = $_REQUEST['dob'];
$dob_sql = date('Y-m-d', strtotime(str_replace('-', '/', $dob)));


$sex = $_REQUEST['RadioGroupSex'];

$parAdd = $_REQUEST['parmanentAddress'];
$phoNum1 = $_REQUEST['phonenumber1'];
$phoNum1Typ = $_REQUEST['numTypeInp1'];


$phoNum2 = $_REQUEST['phonenumber2'];

$phoNum2Typ = $_REQUEST['numTypeInp2'];

$curAdd = $_REQUEST['currentAddress'];

$un = $_REQUEST['username'];
$pass = $_REQUEST['password'];


$insrt =  "INSERT INTO victim (victim_nid, name, occupation, designation, office_address, email, birth_date, sex, permanent_address, current_Address)
VALUES ($nid, '$name', '$occu', '$desig', '$offAdd', '$email', '$dob_sql', '$sex', '$parAdd', '$curAdd')";

if ($conn->query($insrt) === TRUE) {
	//echo "inser 1 pass";
	
	
	
	
	
	
	$insrt =  "INSERT INTO victim_contact_number (Victim_Contact_Numb, Victim_NID, Type)
	VALUES ($phoNum1, $nid, '$phoNum1Typ')";

	if ($conn->query($insrt) === TRUE) {
		//echo "inser 2 pass";
		
		
		
		
		
		$isEmpty = empty($phoNum2);
		
		if($isEmpty) 
		{
			
			//echo "Phone 2 Empty";
			
			
		} else {
			
			$insrt =  "INSERT INTO victim_contact_number (Victim_Contact_Numb, Victim_NID, Type)
			VALUES ($phoNum2, $nid, '$phoNum2Typ')";
	
	
			if ($conn->query($insrt) === TRUE) { 
			
			
				//echo "inser 3 pass";				 
				
				
			} else {
   				echo "Error: " . $insrt . "<br>" . $conn->error;
			}	

		 
		}
		
		
		$insrt =  "INSERT INTO victim_login_credential (victim_username, victim_NID, victim_password)
		VALUES ('$un', $nid, '$pass')";
				
		if ($conn->query($insrt) === TRUE) {
			//echo "inser 4 pass";
			
			
		} else {
			echo "Error: " . $insrt . "<br>" . $conn->error;
		}		
		
		
		
		
	} else {
    	echo "Error: " . $insrt . "<br>" . $conn->error;
	}
	
	
	
	
	
	
} else {
    echo "Error: " . $insrt . "<br>" . $conn->error;
}





// Close connection
mysqli_close($conn);







header('Location: ../webpages/accCreSucc.html');

?>
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
//echo "Connected successfully";



$un =$_REQUEST['username'];
$pass = $_REQUEST['password'];

$logInAs =$_REQUEST['logInAsInp'];


if($logInAs == 'victim') {
	echo "<br/>victim is selected";
	
	$sql = "SELECT victim_NID From victim_login_credential WHERE victim_username = '$un'";
	$result = $conn->query($sql);

	if($result->num_rows == 1) {
		
		
		$sql = "SELECT victim_NID From victim_login_credential WHERE victim_password = '$pass'";
		$result = $conn->query($sql);
		
		if($result->num_rows == 1) {
			
			
			
			//echo "Matched";
		} else if  ($result->num_rows == 0) {
			//echo "password did not match";
		} else {
			//echo "Something's wrong";
		}
		
		
	} else if($result->num_rows == 0) {
		echo "Username not found";
	} else {
		echo "Something is wrong";
	}
	

} else if($logInAs == 'admin') {
	//echo "<br/>Admin is selected<br/>";
} else if($logInAs == 'oc') {
	//echo "<br/>OC is selected<br/>";
} else {
	//echo "<br/>IO is selected<br/>";
}
	




// Close connection
mysqli_close($conn);
?>
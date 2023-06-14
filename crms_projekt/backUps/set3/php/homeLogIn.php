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
echo "Connected successfully";



$un =$_REQUEST['username'];
$pass = $_REQUEST['password'];

$logInAs =$_REQUEST['logInAsInp'];


if($logInAs = 'victim') {
	
}




// Close connection
mysqli_close($conn);
?>
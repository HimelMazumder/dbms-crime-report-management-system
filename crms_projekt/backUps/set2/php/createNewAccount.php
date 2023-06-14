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


$nid =$_REQUEST['nid'];

$fn = $_REQUEST['firstname'];
echo $fn;
$ln = $_REQUEST['lastname'];
echo $ln;

$name = $fn . " " . $ln;
echo $name;

$occu = $_REQUEST['occupation'];
$desig = $_REQUEST['designation'];
$offAdd = $_REQUEST['officeAddress'];
$email = $_REQUEST['email'];

$dob = $_REQUEST['dob'];
$dob_sql = date('Y-m-d', strtotime(str_replace('-', '/', $dob)));
echo $dob_sql;

$sex = $_REQUEST['RadioGroupSex'];
echo $sex;
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
	header('Location: ../webpages/accCreSucc.html'); 
} else {
    echo "Error: " . $insrt . "<br>" . $conn->error;
}






 







 
// Close connection
mysqli_close($conn);
?>
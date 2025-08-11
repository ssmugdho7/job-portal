<?php
$host = 'localhost';
$dbname = 'job-portal';
$username = 'root';
$password = '';

$conn = mysqli_connect($host, $username, $password, $dbname);

if($conn){
    // echo("Database is connected Successfully!");
}
else{
    die("Something Went wrong".mysqli_error);
}


?>
<?php
	$servername = "localhost:3306";
	$usename = "importli_cult";
	$password = "1qaz2wsx3edc";
	$dbname = "importli_culturama"; 

	//create connection
	$con = mysqli_connect($servername, $usename, $password, $dbname);

	//check connection
	if(!$con){
		die('Connection fail: '.mysqli_connect_error());
	}
	// $servername = "localhost";
	// $usename = "root";
	// $password = "";
	// $dbname = "capstone_db"; 

	// //create connection
	// $con = mysqli_connect($servername, $usename, $password, $dbname);

	// //check connection
	// if(!$con){
	// 	die('Connection fail: '.mysqli_connect_error());
	// }
?>
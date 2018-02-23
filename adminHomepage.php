<?php
	require_once ('libs/connect.php');
	include("allClassRegistrationApproval.php");

	$status = null;

	if(isset($_GET['status'])){
		$status = $_GET['status'];
	}


	$sqlCourses = "select * from subject order by name ";
	$resultRegistration = mysqli_query($con, $sql);
	$resultCourses = mysqli_query($con, $sqlCourses);

	$sqlCLass = "select * from classes";
	$resultRegistration = mysqli_query($con, $sql);
	$resultClass = mysqli_query($con, $sqlCLass);

	if($resultRegistration && $resultCourses && $resultClass){
		include('pages/adminHomepage.html');
			mysqli_close($con);
	}
?>
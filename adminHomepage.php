<?php
	require_once ('libs/connect.php');
	include("allClassRegistrationApproval.php");

	$sqlCourses = "select * from courses order by class_name ";
	$resultRegistration = mysqli_query($con, $sql);
	$resultCourses = mysqli_query($con, $sqlCourses);

	if($resultRegistration && $resultCourses){
		include('pages/adminHomepage.html');
			mysqli_close($con);
	}
?>
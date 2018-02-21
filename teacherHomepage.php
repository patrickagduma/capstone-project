<?php
	require_once ('libs/connect.php');
	include("classRegistrationApproval.php");

	$sqlCourses = "select * from classes where instructor_id = " . $_SESSION['id'];
	$resultRegistration = mysqli_query($con, $sql);
	$resultCourses = mysqli_query($con, $sqlCourses);

	if($resultRegistration && $resultCourses){
		include('pages/teacherHomepage.html');
			mysqli_close($con);
	}
?>
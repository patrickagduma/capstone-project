<?php
	require_once ('libs/connect.php');
	include("classRegistrationApproval.php");

	$sqlCourses = "select * from courses where created_by = " . $_SESSION['id'] . " order by class_name ";
	$resultRegistration = mysqli_query($con, $sql);
	$resultCourses = mysqli_query($con, $sqlCourses);

	if($resultRegistration && $resultCourses){
		include('pages/teacherHomepage.html');
			mysqli_close($con);
	}
?>
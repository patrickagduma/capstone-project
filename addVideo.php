<?php
	require_once('libs/connect.php');

	session_start();

	$courseId = $_GET['cid'];
	$sqlCourses = "select * from courses where created_by = " . $_SESSION['id'] . " order by class_name ";
	$resultCourses = mysqli_query($con, $sqlCourses);

	if($resultCourses){
		include('pages/addVideo.html');
			mysqli_close($con);
	}
?> 
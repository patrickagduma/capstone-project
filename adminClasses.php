<?php
    require_once('libs/connect.php');

	session_start();

	$courseId = $_GET['cid'];
	$sqlCourses = "select * from subject order by name ";
	$resultCourses = mysqli_query($con, $sqlCourses);

	if($resultCourses){
		include('pages/adminClasses.html');
			mysqli_close($con);
	}
?>
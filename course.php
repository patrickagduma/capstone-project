<?php
    require_once('libs/connect.php');

	session_start();

	$subjectId = null;
	if (isset($_GET['cid'])) {
		$subjectId = $_GET['cid'];
	}

	$sqlCourses = " select * from subject order by name ";
	$resultCourses = mysqli_query($con, $sqlCourses);

		if($resultCourses){
		include('pages/course.html');
		mysqli_close($con);
	}
?>
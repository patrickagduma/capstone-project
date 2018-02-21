<?php
    require_once('libs/connect.php');

	session_start();

	$subjectId = null;
	if (isset($_GET['cid'])) {
		$subjectId = $_GET['cid'];
	}

	$sqlCourses = " select * from subject order by name ";
	$resultCourses = mysqli_query($con, $sqlCourses);

	$sqlTeachers = " select id, concat(firstname, ' ', lastname) as teacher_name from users where user_type = 'T' and is_active = true order by firstname, lastname ";
	$resultTeachers = mysqli_query($con, $sqlTeachers);

	if($resultCourses && $resultTeachers){
		include('pages/adminClasses.html');
		mysqli_close($con);
	}
?>
<?php
	require_once('libs/connect.php');

	session_start();

	$student_id = $_POST['studentId'];
	$course_id = $_POST['courseId'];
	$sqlAddRegistration = "insert into student_class_enrollment(student_id, course_id, last_modified_date) value('" .$student_id."', '" .$course_id. "', now())";


	//$sqlApproveRegistration = "insert into student_classes(student_id, course_id, is_active, last_modified_date) value('" .$student_id."', '" .$course_id. "', 1, now())";

	// echo "[sql]: " . $sqlAddRegistration;
	if(mysqli_query($con, $sqlAddRegistration)){
		header('Location:studentSearchClasses.php?status=success_enrollment_request');
	}
	else{
		echo "Error ".mysqli_error($con);
	}

	exit(0);
?>
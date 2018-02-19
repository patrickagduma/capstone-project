<?php
	require_once('libs/connect.php');

	session_start();

	$student_id = $_POST['studentId'];
	$course_id = $_POST['courseId'];
	$sqlAddRegistration = "insert into student_course_enrollment(student_id, course_id, lastModifiedDate) value('" .$student_id."', '" .$course_id. "', now())";


	$sqlApproveRegistration = "insert into student_classes(student_id, course_id, is_active, lastModifiedDate) value('" .$student_id."', '" .$course_id. "', 1, now())";

	// echo "[sql]: " . $sqlAddRegistration;
	if(mysqli_query($con, $sqlAddRegistration)){
			header('Location:studentSearchClasses.php?cid=' . $course_id);
		}
		else{
			echo "Error ".mysqli_error($con);
		}

		exit(0);
?>
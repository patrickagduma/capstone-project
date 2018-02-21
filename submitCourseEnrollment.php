<?php
	require_once('libs/connect.php');

	session_start();

	$student_id = $_POST['studentId'];
	$course_id = $_POST['courseId'];
	$sql = "insert into student_classes(student_id, course_id, is_active, last_modified_date) value('" .$student_id."', '" .$course_id. "', 1, now())
	";

	// echo "[sql]: " . $sql;
	if(mysqli_query($con, $sql)){
			header('Location:teacherSearchStudent.php?cid=' . $course_id);
		}
		else{
			echo "Error ".mysqli_error($con);
		}

		exit(0);
?>
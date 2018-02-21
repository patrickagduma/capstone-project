<?php
	require_once('libs/connect.php');

	session_start();

	// Basin makalimot ko... para lang ni dapat sa teacher dili sa admin
	// $instructor = $_SESSION['firstname'] . " " . $_SESSION['lastname'];

	$Id = $_SESSION['id'];
	$subjectId = $_POST['subjectId'];
	$instructorId = $_POST['instructorId'];
	$classCode = $_POST['classCode'];
	$yearLevel = $_POST['yearLevel'];
	$section = $_POST['section'];
	$classGrade = $_POST['classGrade'];

	$sql = "insert into classes(code, subject_id, instructor_id, year_level, section, base_grade, created_by, last_modified_date) 
			value('" . $classCode . "', '" . $subjectId . "', '" . $instructorId . "', '" . $yearLevel . "', '" . $section . "', '" . $classGrade . "', '" . $Id. "', now())";

	if(mysqli_query($con, $sql)){
		$id = mysqli_insert_id($con);
		header('Location:adminHomepage.php?id=' . $id . '&status=success_class_creation');
	}
	else{
		echo "Error ".mysqli_error($con);
	}

	exit(0);
?> 
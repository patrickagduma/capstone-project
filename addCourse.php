<?php
	require_once('libs/connect.php');

	session_start();

	$Id = $_SESSION['id'];
	$instructor = $_SESSION['firstname'] . " " . $_SESSION['lastname'];

		$sql = "insert into classes(code, subject_id, instructor_id, year_level, section, base_grade, created_by, last_modified_date) 
			value('" . $classCode . "', '" . $subjectId . "', '" . $instructorId . "', '" . $yearLevel . "', '" . $section . "', '" . $classGrade . "', '" . $Id. "', now())
		";

		if(mysqli_query($con, $sql)){
			$id = mysqli_insert_id($con);
			header('Location:editListCourse.php?id=' . $id);
		}
		else{
			echo "Error ".mysqli_error($con);
		}

		exit(0);

?> 
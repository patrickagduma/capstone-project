<?php
	require_once('libs/connect.php');

	session_start();

	$Id = $_SESSION['id'];
	$instructor = $_SESSION['firstname'] . " " . $_SESSION['lastname'];
	$courseId = $_POST['courseId'];

		$sql = "insert into classes(code, instructor, year_level, section, base_grade, created_by, last_modified_date) 
				value('".$_POST['classCode']."', '".$_POST['classInstructor']."', '".$_POST['yearLevel']."', '".$_POST['section']."', '".$_POST['classGrade']."', '" .$Id."', now())
		";

		if(mysqli_query($con, $sql)){
			$id = mysqli_insert_id($con);
			header('Location:adminHomepage.php?id=' . $id);
		}
		else{
			echo "Error ".mysqli_error($con);
		}

		exit(0);

?> 
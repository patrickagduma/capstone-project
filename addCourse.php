<?php
	require_once('libs/connect.php');

	session_start();

	$Id = $_SESSION['id'];
	$instructor = $_SESSION['firstname'] . " " . $_SESSION['lastname'];

		$sql = "insert into classes(course_code, class_name, class_description, year_level, section, base_grade, instructor, created_by, last_modified_date) 
				value('".$_POST['classCode']."', '".$_POST['className']."', '".$_POST['classDescription']."', '".$_POST['yearLevel']."', '".$_POST['section']."', '".$_POST['classGrade']."', '". $instructor ."',  '" .$Id."', now())
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
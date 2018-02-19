<?php
	require_once('libs/connect.php');

	session_start();

	$Id = $_SESSION['id'];
	$instructor = $_SESSION['firstname'] . " " . $_SESSION['lastname'];

		$sql = "insert into courses(course_code, class_name, class_description, base_grade, instructor, created_by, lastModifiedDate) 
				value('".$_POST['classCode']."', '".$_POST['className']."', '".$_POST['classDescription']."', '".$_POST['classGrade']."', '". $instructor ."',  '" .$Id."', now())
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
<?php
	require_once('libs/connect.php');

	session_start();

	$Id = $_SESSION['id'];
	$instructor = $_SESSION['firstname'] . " " . $_SESSION['lastname'];

		$sql = "insert into subject(code, name, description, created_by) 
				value('".$_POST['classCode']."', '".$_POST['className']."', '".$_POST['classDescription']."', '".$Id."')
		";

		if(mysqli_query($con, $sql)){
			$id = mysqli_insert_id($con);
			header('Location:adminCourseDetails.php?id=' . $id);
		}
		else{
			echo "Error ".mysqli_error($con);
		}

		exit(0);
?>
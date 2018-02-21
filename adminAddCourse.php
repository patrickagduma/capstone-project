<?php
	require_once('libs/connect.php');

	session_start();

	$Id = $_SESSION['id'];
	$classCode = $_POST['classCode'];
	$className = $_POST['className'];
	$classDescription = $_POST['classDescription'];

	$sql = "insert into subject(code, name, description, created_by) 
			value('" . $classCode . "', '" . $className . "', '" . $classDescription . "', '" . $Id . "')";

	if(mysqli_query($con, $sql)){
		$id = mysqli_insert_id($con);
		header('Location:adminHomepage.php?status=success_subject_creation');
	}
	else{
		echo "Error ".mysqli_error($con);
	}

	exit(0);
?>
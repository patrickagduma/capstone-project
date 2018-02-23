<?php
	require_once('libs/connect.php');
	

	$sql = "UPDATE classes set 
							code = '".$_POST['classCode']."',
							year_level = '".$_POST['yearLevel']."',
							section = '".$_POST['section']."',
							base_grade = '". $_POST['classGrade'] ."'
			where id = '".$_POST['txtID']."'
	";
	if(mysqli_query($con, $sql)){
		header('Location:adminClassDetails.php?id=' . $_POST['txtID']);
	}
	else{
		echo "Error ".mysqli_error($con);
	}
?>
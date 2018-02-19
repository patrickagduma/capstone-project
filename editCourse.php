<?php
	require_once('libs/connect.php');
	

	$sql = "update courses set course_code = '".$_POST['classCode']."',
							class_name = '".$_POST['className']."',
							class_description = '".$_POST['classDescription']."',
							base_grade = '". $_POST['classGrade'] ."'
			where id = '".$_POST['txtID']."'
	";
	if(mysqli_query($con, $sql)){
		header('Location:editListCourse.php?id=' . $_POST['txtID']);
	}
	else{
		echo "Error ".mysqli_error($con);
	}
?>
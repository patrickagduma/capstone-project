<?php
	require_once('libs/connect.php');
	

	$sql = "UPDATE subject set 
							code = '".$_POST['classCode']."',
							name = '".$_POST['className']."',
							description = '".$_POST['classDescription']."'
			where id = '".$_POST['txtID']."'
	";
	if(mysqli_query($con, $sql)){
		header('Location:adminCourseDetails.php?id=' . $_POST['txtID']);
	}
	else{
		echo "Error ".mysqli_error($con);
	}
?>
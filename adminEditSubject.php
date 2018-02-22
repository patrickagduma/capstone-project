<?php
	require_once('libs/connect.php');
	

	$sql = "UPDATE subject s set 
							s.code = '".$_POST['classCode']."',
							s.name = '".$_POST['className']."',
							s.description = '".$_POST['classDescription']."'
			where s.id = '".$_POST['txtID']."'
	";
	if(mysqli_query($con, $sql)){
		header('Location:adminCourseDetails.php?id=' . $_POST['txtID']);
	}
	else{
		echo "Error ".mysqli_error($con);
	}
?>
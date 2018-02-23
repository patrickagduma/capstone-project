<?php
	require_once('libs/connect.php');
	

	$sql = "UPDATE classes c
			INNER JOIN subject s
							set 
							s.name = '".$_POST['classCode']."',
							c.code = '".$_POST['className']."',
							c.year_level = '".$_POST['yearLevel']."',
							c.section = '".$_POST['section']."',
							c.base_grade = '". $_POST['classGrade'] ."'
			where c.id = '".$_POST['txtID']."'
	";
	if(mysqli_query($con, $sql)){
		header('Location:adminClassDetails.php?id=' . $_POST['txtID']);
	}
	else{
		echo "Error ".mysqli_error($con);
	}
?>
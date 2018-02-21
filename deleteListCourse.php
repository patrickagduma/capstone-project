<?php
	require_once('libs/connect.php');

	if(isset($_GET['id'])){
		$sql = "delete from classes where id = ".$_GET['id'];
		if(mysqli_query($con, $sql)){
			header('Location:listCourse.php');
		}
		else{
			echo "Error ".mysqli_error($con);
		}
	}
?>
<?php
	require_once('libs/connect.php');
	

	$sql = "update users set firstname = '".$_POST['firstName']."',
							lastname = '".$_POST['lastName']."',
							email = '".$_POST['email']."'
			where id = '".$_POST['txtID']."'
	";
	if(mysqli_query($con, $sql)){
		header('Location:listUser.php');
	}
	else{
		echo "Error ".mysqli_error($con);
	}
?>
<?php
	require_once('libs/connect.php');

	if(isset($_GET['id'])){
		$sql = "delete from users where id = ".$_GET['id'];
		if(mysqli_query($con, $sql)){
			header('Location:listUser.php');
		}
		else{
			echo "Error ".mysqli_error($con);
		}
	}
?>
<?php
	require_once('libs/connect.php');
	
	$id = '';
	$firstname = '';
	$lastname = '';
	$username = '';
	$password = '';
	$email = '';
	if(isset($_GET['id'])){
		$sql = "select id, firstname, lastname, username, password, email from users
				where id = ".$_GET['id'];

				// echo $sql;


		$result = mysqli_query($con, $sql);
		if(mysqli_num_rows($result) > 0){
			$row = mysqli_fetch_assoc($result);
			$id = $row['id'];
			$firstname = $row['firstname'];
			$lastname = $row['lastname'];
			$username = $row['username'];
			$password = $row['password'];
			$email = $row['email'];
		}
	}

include 'pages/editListUser.html';
	exit(0);
?>
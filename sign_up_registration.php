<?php
	require_once('libs/connect.php');
session_start();
	
		$sql = "insert into users(firstname, lastname, username, password, email, userType, isActive, lastModifiedDate) value('".$_POST['firstName']."', '".$_POST['lastName']."', '".$_POST['username']."', '" . md5($_POST['password']) . "', '".$_POST['email']."', '".$_POST['userType']."', 1, now())
		";

		

		if(mysqli_query($con, $sql)){
			
			 $id = mysqli_insert_id($con);

		$_SESSION['id'] = $id;
		$_SESSION['username'] = $_POST['username'];
		$_SESSION['firstname'] = $_POST['firstName'];
		$_SESSION['lastname'] = $_POST['lastName'];
		$_SESSION['email'] = $_POST['email'];
		$_SESSION['userType'] = $_POST['userType'];

		if($_POST['userType'] == 'T'){
			header('location:teacherHomepage.php?id=' . $_POST['id']);
			
		session_write_close();
		}
		elseif($_POST['userType'] == 'S'){
			header('location:studentHomepage.php?id=' . $_POST['id']);
			
		session_write_close();
		}
		
		 }
		else{
			echo "Error ".mysqli_error($con);
		}

		exit(0);
	//}
?> 
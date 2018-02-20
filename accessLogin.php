<?php 
 
require_once ('libs/connect.php');
 
	session_start();

	$username = $_POST['username']; 
	$password = $_POST['password'];
	$isValid = false;

	$sql = "SELECT * FROM users WHERE username = '" . $username . "'";
	$result = mysqli_query($con, $sql);
	$user = mysqli_fetch_assoc($result);
	$number = mysqli_num_rows($result);
	$escaped_password = mysqli_real_escape_string($con, $password);

	//echo "[SQL]: " . $sql;

	$hasAccess = false;
	if($number > 0) {
		if ($user['password'] == md5($escaped_password)) {
			$hasAccess = true;
		}
	}

	if ($hasAccess) {
		//echo "Login successfully!";
		$_SESSION['id'] = $user['id'];
		$_SESSION['username'] = $user['username'];
		$_SESSION['firstname'] = $user['firstname'];
		$_SESSION['lastname'] = $user['lastname'];
		$_SESSION['email'] = $user['email'];
		$_SESSION['userType'] = $user['userType'];

		if($user['userType'] == 'T'){
			header('location:teacherHomepage.php?id=' . $user['id']);
			session_write_close();
		}
		elseif($user['userType'] == 'S'){
			header('location:studentHomepage.php?id=' . $user['id']);
			session_write_close();
		}
		elseif($user['userType'] == 'A'){
			header('location:adminHomepage.php?id=' . $user['id']);
			session_write_close();
		}

		
	} else {
		//Return 401 (Unauthorized) Status
		http_response_code(401);
		header('location:login.php?success=false');
	}
	
	exit();
?>
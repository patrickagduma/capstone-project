<?php
	require_once('libs/connect.php');
	session_start();
	$searchKey = $_POST['searchKey'];
	$courseId = $_GET['cid'];
	if (strlen($searchKey) >= 3) {
		$sql = "SELECT u.* FROM users u WHERE lower(concat(u.firstname, ' ', u.lastname, ' ', u.email)) like  '%" . $searchKey . "%' and u.user_type='S' ";
		$sql .= " and u.id not in ( SELECT student_id FROM student_classes WHERE class_id = " . $courseId . " ) ";

		if($result = mysqli_query($con, $sql)){
			include('pages/adminStudentSearch.html');
			mysqli_close($con);
		}
	} else {
		header('Location:adminSearchStudent.php?cid=' . $courseId . '&error=search_key_too_few');
	}



?>
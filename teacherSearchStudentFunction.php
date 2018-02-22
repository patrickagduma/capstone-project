<?php
	require_once('libs/connect.php');
	session_start();
	$searchKey = $_POST['searchKey'];
	$courseId = $_POST['course'];
	if (strlen($searchKey) >= 3) {
		$sql = "SELECT u.* FROM users u WHERE lower(concat(u.firstname, ' ', u.lastname, ' ', u.email)) like  '%" . $searchKey . "%' and u.user_type='S' ";
		$sql .= " and u.id not in ( SELECT student_id FROM student_classes WHERE class_id = " . $courseId . " ) ";

		if($result = mysqli_query($con, $sql)){
			include('pages/teacherSearchStudent.html');
			mysqli_close($con);
		}
	} else {
		header('Location:teacherSearchStudent.php');
	}



?>
<?php
	require_once('libs/connect.php');
	session_start();
	$searchKey = $_POST['searchKey'];
	if (strlen($searchKey) >= 3) {
		
		$sql = " SELECT c.* FROM courses c WHERE lower(concat(course_code, ' ', class_name, ' ', class_description)) like  '%" . $searchKey . "%' and ";

		$sql .= " c.id not in ( SELECT sce.course_id FROM student_course_enrollment sce WHERE sce.student_id = " . $_SESSION['id'] . " ) ";

	

		if($result = mysqli_query($con, $sql)){
			include('pages/studentSearchClasses.html');
			mysqli_close($con);
		}
	} else {
		header('Location:studentSearchClasses.php');
	}



?>
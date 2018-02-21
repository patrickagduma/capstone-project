<?php
	require_once('libs/connect.php');
	session_start();
	$searchKey = $_POST['searchKey'];
	if (strlen($searchKey) >= 3) {
		
		$sql = " SELECT s.* FROM subject s WHERE lower(concat(code, ' ', name, ' ', description)) like  '%" . $searchKey . "%' and ";

		$sql .= " s.id not in ( SELECT sce.student_id FROM student_class_enrollment sce WHERE sce.student_id = " . $_SESSION['id'] . " ) ";

	

		if($result = mysqli_query($con, $sql)){
			include('pages/studentSearchClasses.html');
			mysqli_close($con);
		}
	} else {
		header('Location:studentSearchClasses.php');
	}



?>
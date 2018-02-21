<?php
	require_once('libs/connect.php');

	session_start();

	$status = null;
	if (isset($_GET['status'])) {
		$status = $_GET['status'];
	}

	$sql = "select sce.id, sce.student_id, concat(u.firstname, ' ', u.lastname) as student_name,
			sce.course_id, c.code, sce.last_modified_date
			from student_class_enrollment sce
			inner join users u on u.id = sce.student_id
			inner join classes c on c.id = sce.course_id
			where c.created_by = ". $_SESSION['id'] ."
			and sce.status is null
			order by sce.last_modified_date desc";
?>
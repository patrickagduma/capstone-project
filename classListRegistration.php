<?php
	require_once('libs/connect.php');



	$status = null;
	if (isset($_GET['status'])) {
		$status = $_GET['status'];
	}


	$sqlClassList = "select 
				sce.id, 
				sce.student_id, 
				concat(u.firstname, ' ', u.lastname) as student_name,
				s.id as subject_id,
				s.name as subject,
				sce.course_id, 
				c.code, 
				sce.last_modified_date
			from student_class_enrollment sce
			inner join users u on u.id = sce.student_id
			inner join classes c on c.id = sce.course_id
			inner join subject s on s.id = c.subject_id
			where sce.status is null and c.id = ". $id ."
			order by sce.last_modified_date desc";
	$resultRegistrationClassList = mysqli_query($con, $sqlClassList);

?>
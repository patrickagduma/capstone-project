<?php
	require_once('libs/connect.php');
	session_start();
	$searchKey = $_POST['searchKey'];
	if (strlen($searchKey) >= 3) {
		
		$sql = " select 
			c.id,
			c.code as class_code,
			c.subject_id,
			s.code as subject_code,
			s.name as subject,
			c.code,
			c.instructor_id,
			concat(u.firstname, ' ', u.lastname) as teacher,
			c.year_level,
			c.section,
			c.base_grade
		from classes c
		inner join subject s on s.id = c.subject_id
		inner join users u on u.id = c.instructor_id
		WHERE 
			lower(concat(s.code, ' ', s.name, ' ', c.code, ' ', concat(u.firstname, ' ', u.lastname), c.section)) like  '%" . $searchKey . "%' and
			c.id not in ( SELECT sce.course_id FROM student_class_enrollment sce WHERE sce.student_id = " . $_SESSION['id'] . " )
		";

		if($result = mysqli_query($con, $sql)){
			include('pages/studentSearchClasses.html');
			mysqli_close($con);
		}
	} else {
		header('Location:studentSearchClasses.php');
	}



?>
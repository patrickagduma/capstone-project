<?php
	require_once('libs/connect.php');

	$fromPage = $_POST['fromPage'];

	$sqlInsert = "insert into student_classes(student_id, course_id, is_active, lastModifiedDate) value('".$_POST['studentId']."', '".$_POST['courseId']."', 1, now())
	";

	$insert = mysqli_query($con, $sqlInsert);

	$sql = "update student_course_enrollment set status = 'approved' where id=" . $_POST['registrationId'];
	$delete = mysqli_query($con, $sql);

	if($insert && $delete){
		if ($fromPage == 'courseRegistration') {
			header('Location:teacherRegistration.php?status=approved');
		} else if ($fromPage == 'courseDetails') {
			header('Location:editListCourse.php?id=' . $_POST['courseId'] . '&status=approved');
		} else {
			header('Location:teacherHomepage.php?status=approved');
		}
	}
	else{
		echo "Error ".mysqli_error($con);
	}
?>
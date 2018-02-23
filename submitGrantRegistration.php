<?php
	require_once('libs/connect.php');

	$fromPage = $_POST['fromPage'];

	$sqlInsert = "insert into student_classes(student_id, class_id, is_active, last_modified_date) value('".$_POST['studentId']."', '".$_POST['courseId']."', 1, now())
	";

	$insert = mysqli_query($con, $sqlInsert);

	$sql = "update student_class_enrollment set status = 'approved' where id=" . $_POST['registrationId'];
	$delete = mysqli_query($con, $sql);

	if($insert && $delete){
		if ($fromPage == 'courseRegistration') {
			header('Location:teacherRegistration.php?status=approved');
		} else if ($fromPage == 'teacherHome') {
		header('Location:teacherHomepage.php?id=' . $_POST['subjectId'] . '&status=approved');
		} else if ($fromPage == 'teacherClasses') {
		header('Location:editListCourse.php?id=' . $_POST['subjectId'] . '&status=approved');
		} else if ($fromPage == 'adminDetails') {
		header('Location:adminClassDetails.php?id=' . $_POST['subjectId'] . '&status=approved');
		} else if ($fromPage == 'courseDetails') {
			header('Location:editListCourse.php?id=' . $_POST['subjectId'] . '&status=approved');
		} else if ($fromPage == 'adminCourseDetails') {
			header('Location:adminCourseDetails.php?id=' . $_POST['subjectId'] . '&status=approved');
		} else {
			header('Location:adminHomepage.php?status=approved');
		}
	}
	else{
		echo "Error ".mysqli_error($con);
	}
?>
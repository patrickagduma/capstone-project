<?php
	require_once('libs/connect.php');

	$fromPage = $_POST['fromPage'];

	if(isset($_POST['registrationId'])){
		$sql = "update student_class_enrollment set status = 'denied' where id=" . $_POST['registrationId'];

		if(mysqli_query($con, $sql)){
			if ($fromPage == 'courseRegistration') {
				header('Location:teacherRegistration.php?status=denied');
			} else if ($fromPage == 'courseDetails') {
				header('Location:editListCourse.php?id=' . $_POST['subjectId'] . '&status=denied');
			} else if ($fromPage == 'adminCourseDetails') {
				header('Location:adminCourseDetails.php?id=' . $_POST['subjectId'] . '&status=denied');
			} else {
				header('Location:adminHomepage.php?status=denied');
			}
		}
		else{
			echo "Error ".mysqli_error($con);
		}
 }
?>
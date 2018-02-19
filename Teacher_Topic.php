<?php
    require_once('libs/connect.php');
    session_start();

	$courseId = null;
	$topicText = "";
	$topicSummary = "";
	
	if (isset($_GET['cid'])) {
		$courseId = $_GET['cid'];
	}


	if (isset($_SESSION['topic'])) {
		$topicDetails = $_SESSION['topic'];
		if (isset($topicDetails) && !isset($courseId)) {
			$courseId = $topicDetails['courseId'];
			$topicText = $topicDetails['topic'];
			$topicSummary = $topicDetails['summary'];
		}
	}


	/* START: Courses */
	$sqlCourses = "select * from courses where created_by = " . $_SESSION['id'];
	if (isset($courseId)) {
		$sqlCourses .= " and id = " . $courseId;
	}
	$sqlCourses .= " order by class_name ";
	$resultCourses = mysqli_query($con, $sqlCourses);
	/* END: Courses */

	/* START: Videos */
	$sqlClassVideos = " SELECT  v.*  FROM `class_video` v ";
	if (isset($courseId)) {
		$sqlClassVideos .= " WHERE v.course_id =  " . $courseId;
	}
	$sqlClassVideos .= " order by topic ";

	$resultClassVideo  = mysqli_query($con, $sqlClassVideos) or die("Error in Selecting " . mysqli_error($connection));
    /* END: Videos */

    include ('pages/Teacher_Topic.html');
?>

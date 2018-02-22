<?php
    require_once('libs/connect.php');
    session_start();

	$courseId = null;
	$topicText = "";
	$topicSummary = "";
	$topicVideoLink = "";
	
	if (isset($_GET['cid'])) {
		$courseId = $_GET['cid'];
	}


	if (isset($_SESSION['topic'])) {
		$topicDetails = $_SESSION['topic'];
		if (isset($topicDetails) && !isset($courseId)) {
			$courseId = $topicDetails['courseId'];
			$topicText = $topicDetails['topic'];
			$topicSummary = $topicDetails['summary'];
			$topicVideoLink = $topicDetails['videoUrl'];
		}
	}


	/* START: Courses */
	$sqlCourses = "select * from subject where 1=1 ";
	if (isset($courseId)) {
		$sqlCourses .= " and id = " . $courseId;
	}
	$sqlCourses .= " order by name ";
	$resultCourses = mysqli_query($con, $sqlCourses);
	/* END: Courses */

	/* START: Videos */
	$sqlClassVideos = " SELECT  v.*  FROM `subject_videos` v ";
	if (isset($courseId)) {
		$sqlClassVideos .= " WHERE v.subject_id =  " . $courseId;
	}
	$sqlClassVideos .= " order by topic ";

	$resultClassVideo  = mysqli_query($con, $sqlClassVideos) or die("Error in Selecting " . mysqli_error($connection));
    /* END: Videos */

    include ('pages/Teacher_Topic.html');
?>

<?php
    require_once('libs/connect.php');
    session_start();

	$courseId = null;
	$subjectId = null;
	$topicText = "";
	$topicSummary = "";
	$topicVideoLink = "";
	
	if (isset($_GET['cid'])) {
		$courseId = $_GET['cid'];
	}


	if (isset($_SESSION['topic'])) {
		$topicDetails = $_SESSION['topic'];
		if (isset($topicDetails) && isset($courseId)) {
			$courseId = $topicDetails['courseId']; // -> Not sure kung kailangan pani.. hubog ko ato pag butang ani...
			$subjectId = $topicDetails['subjectId'];
			$topicText = $topicDetails['topic'];
			$topicSummary = $topicDetails['summary'];
			$topicVideoLink = $topicDetails['videoUrl'];
		}
	}


	/* START: Subjects */
	$sqlCourses = "select * from subject where 1=1 ";
	if (isset($subjectId)) {
		$sqlCourses .= " and id = " . $subjectId;
	}
	$sqlCourses .= " order by name ";
	$resultCourses = mysqli_query($con, $sqlCourses);
	/* END: Subjects */

	/* START: Class Info */
	$sqlClassInfo = " select c.subject_id from classes c where c.id =" . $courseId;

	//echo "[sql-class-info]: " . $sqlClassInfo . "<br>";

	$resultClassInfo = mysqli_query($con, $sqlClassInfo);
	if(mysqli_num_rows($resultClassInfo) > 0){
		if ($row = mysqli_fetch_assoc($resultClassInfo)) {
			$subjectId = $row['subject_id'];
		}
	}
	/* END: Class Info */

	//echo "[subject-id]: " . $subjectId . "<br>";

	/* START: Videos */
	$sqlClassVideos = " SELECT  v.*  FROM `subject_videos` v ";
	if (isset($subjectId)) {
		$sqlClassVideos .= " WHERE v.subject_id =  " . $subjectId;
	}
	$sqlClassVideos .= " order by topic ";

	$resultClassVideo  = mysqli_query($con, $sqlClassVideos) or die("Error in Selecting " . mysqli_error($connection));
    /* END: Videos */

    include ('pages/Teacher_Topic.html');
?>

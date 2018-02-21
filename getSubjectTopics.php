<?php
	require_once('libs/connect.php');
	session_start();

	$subjectId = $_GET['s'];
	$sqlClassVideos = " SELECT  s.*  FROM `subject_videos` s WHERE s.subject_id = " . $subjectId . " order by s.topic ";

	$resultClassVideo  = mysqli_query($con, $sqlClassVideos) or die("Error in Selecting " . mysqli_error($connection));

    $videosArray = array();
    while($row = mysqli_fetch_assoc($resultClassVideo))
    {
        $videosArray[] = $row;
    }

    echo json_encode($videosArray);
?>
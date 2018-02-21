<?php
	require_once('libs/connect.php');
	session_start();

	$courseId = $_GET['c'];
	$sqlClassVideos = " SELECT  v.*  FROM `subject_videos` v WHERE v.subject_id = " . $courseId . " order by topic ";

	$resultClassVideo  = mysqli_query($con, $sqlClassVideos) or die("Error in Selecting " . mysqli_error($connection));

    $videosArray = array();
    while($row = mysqli_fetch_assoc($resultClassVideo))
    {
        $videosArray[] = $row;
    }

    echo json_encode($videosArray);
?>
<?php
	require_once('libs/connect.php');
	session_start();

	$userId = $_SESSION['id'];
    $userType = $_SESSION['userType'];

    if (isset($userType) && $userType == 'A') {
        $sqlClassVideos = " SELECT  v.*  FROM `subject_videos` v ORDER BY topic ";
    } else {
        $sqlClassVideos = " SELECT  v.*  FROM `subject_videos` v WHERE v.created_by = " . $userId . " order by topic ";
    }

	$resultClassVideo  = mysqli_query($con, $sqlClassVideos) or die("Error in Selecting " . mysqli_error($connection));

    $videosArray = array();
    while($row = mysqli_fetch_assoc($resultClassVideo))
    {
        $videosArray[] = $row;
    }

    echo json_encode($videosArray);
?>
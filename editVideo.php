<?php
	require_once('libs/connect.php');
	session_start();


	$sql = "update subject_videos set topic = '".$_POST['videoTopic']."',
							video_link = '".$_POST['videoTopicLink']."',
							course_id = '". $_POST['courseId'] ."'
			where id = '".$_POST['videoId']."'
	";
	//echo "SQL []" . $sql;

	if(mysqli_query($con, $sql)){
		header('Location:editListCourse.php?id=' . $_POST['courseId'] . "&status=success_video_update");
	}
	else{
		echo "Error ".mysqli_error($con);
	}

?>
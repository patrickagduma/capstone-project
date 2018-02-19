<?php
	require_once('libs/connect.php');

	session_start();

	$Id = $_SESSION['id'];
	$courseId = $_POST['courseId'];
	
		$sql = "insert into class_video(course_id, topic, video_link, created_by, lastModifiedDate) 
			VALUE('".$courseId."', '".$_POST['subject']."', '".$_POST['videolink']."',  '" .$Id."', now())
		";
		
		//echo "SQL[]" .$sql;
		if(mysqli_query($con, $sql)){
			$id = mysqli_insert_id($con);
			header('Location:editListCourse.php?id=' . $courseId);
		}
		else{
			echo "Error ".mysqli_error($con);
		}

		// exit(0);
	//}
?> 
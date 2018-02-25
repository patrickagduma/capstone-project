<?php
	require_once('libs/connect.php');

	session_start();

	$Id = $_SESSION['id'];
	$subjectId = $_POST['subjectId'];
	$courseId = $_POST['courseId'];
	
		$sql = "insert into subject_videos(subject_id, topic, video_link, created_by, last_modified_date) 
			VALUE('".$subjectId."', '".$_POST['subject']."', '".$_POST['videolink']."',  '" .$Id."', now())
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
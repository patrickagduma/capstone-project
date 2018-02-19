<?php
	require_once('libs/connect.php');
	session_start();

	$topicId = $_GET['id'];
	$studentId = $_SESSION['id'];
	if (isset($topicId)) {
			$sql = " SELECT t.*, cv.video_link, c.class_name
					FROM `topic` t 
					inner join class_video cv on 
						cv.id = t.video_id
		            inner join courses c on
						c.id = t.course_id
					where
						t.id = " . $topicId;
				$result = mysqli_query($con, $sql);

				$sqlTookQuiz = " SELECT ans.* FROM topic_item_answer ans " .
								" INNER JOIN topic_item ti ON ti.id = ans.topic_item_id " .
								" WHERE ans.student_id = ". $studentId . " AND ti.topic_id = " . $topicId;
				$rsTookQuiz = mysqli_query($con, $sqlTookQuiz);
				$num_rows = mysqli_num_rows($rsTookQuiz);

		if ($result && $rsTookQuiz) {
			include('pages/studentTopicDetails.html');
			mysqli_close($con);
		}
	}


?>

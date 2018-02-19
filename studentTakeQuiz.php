<?php
    require_once('libs/connect.php');
    session_start();

	$topicId = $_GET['id'];
	$status = isset($_GET['status']) ? $_GET['status'] : "";
    $sql = "select * from topic_item where
						topic_id = " . $topicId;

						//echo "SQL: " . $sql;

	$result = mysqli_query($con, $sql);

		if($result){
			include('pages/studentTakeQuiz.html');
			mysqli_close($con);
		}
?>

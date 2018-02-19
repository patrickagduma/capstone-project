<?php
	require_once('libs/connect.php');
	require_once('libs/commons.php');

	session_start();

	$topicId = $_GET['id'];

	$sql  = " SELECT distinct ti.id, tia.student_id, ti.course_id, ti.topic_id, ti.question, ti.boolean_answer, ti.single_answer,
			  ti.multi_answer_1, ti.multi_answer_2, ti.multi_answer_3, ti.multi_answer_4, ti.multi_answer_5, ti.multi_answer_6, tia.banswer,
			  tia.sanswer, tia.manswers from topic t
			  left join topic_item ti on ti.topic_id = t.id
			  left join topic_item_answer tia on tia.topic_item_id = ti.id
			  where t.id = " . $topicId . " and tia.student_id = " . $_SESSION['id'];
	
	$result = mysqli_query($con, $sql);

	if($result){
		include('pages/studentViewAnswer.html');
		mysqli_close($con);
	}
?>
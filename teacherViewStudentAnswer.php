<?php
	require_once('libs/connect.php');
	require_once('libs/commons.php');

	session_start();

	$topicId = $_GET['id'];

	$sql  = " SELECT distinct ti.id, tia.student_id, ti.subject_id, ti.topic_id, ti.question, ti.boolean_answer, ti.single_answer,
			  ti.multi_answer_1, ti.multi_answer_2, ti.multi_answer_3, ti.multi_answer_4, ti.multi_answer_5, ti.multi_answer_6, tia.banswer,
			  tia.sanswer, tia.manswers, tia.submit_time from topic t
			  left join topic_item ti on ti.topic_id = t.id
			  left join topic_item_answer tia on tia.topic_item_id = ti.id
			  where t.id = " . $topicId;
	
	$result = mysqli_query($con, $sql);


	// $sqlTime = " select submit_time from topic_item_answer "

	// $resultTime = mysqli_query($con, $sqlTime);
	//     if(mysqli_num_rows($resultTime) > 0){
 //                $row = mysqli_fetch_assoc($resultTime);
 //                $submit_time = $row['submit_time'];
 //            }

	if($result){
		include('pages/teacherViewStudentAnswer.html');
		mysqli_close($con);
	}
?>
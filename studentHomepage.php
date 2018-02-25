<?php
	require_once('libs/connect.php');
	session_start();
			$sql = " SELECT distinct t.id, t.topic, sc.student_id, c.code, if(isnull(tia.id), 'no', 'yes') as is_taken
						FROM `topic` t 
						inner join student_classes sc on 
		    			sc.class_id = t.course_id
		    			INNER JOIN classes c on c.id = t.course_id
		    			left join topic_item ti on ti.topic_id = t.id
		    			left join topic_item_answer tia on tia.topic_item_id = ti.id and tia.student_id = ".$_SESSION['id']."
						where sc.student_id =" . $_SESSION['id'];
 			$result = mysqli_query($con, $sql);

 			$sqlTopic = "select distinct c.* from classes c
						 inner join student_classes sc on sc.class_id = c.id
						 where sc.student_id = " . $_SESSION['id'];
 			$resultTopic = mysqli_query($con, $sqlTopic);



			$sqlAnswer  = " SELECT distinct ti.id, tia.student_id, ti.subject_id, ti.topic_id, ti.question, ti.boolean_answer,ti.single_answer,
						 	ti.multi_answer_1, ti.multi_answer_2, ti.multi_answer_3, ti.multi_answer_4, ti.multi_answer_5, ti.multi_answer_6,
							tia.banswer, tia.sanswer, tia.manswers from topic t
						 	left join topic_item ti on ti.topic_id = t.id
							left join topic_item_answer tia on tia.topic_item_id = ti.id
							where tia.student_id = " . $_SESSION['id'];


			$resultScore = mysqli_query($con, $sqlAnswer);

		if($result && $resultScore){

			include('pages/studentHomepage.html');
			mysqli_close($con);
		}


?>

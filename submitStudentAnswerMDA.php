<?php
	require_once('libs/connect.php');
	session_start();

	$studentId = $_SESSION['id'];
	$topicId = $_POST['topicId'];
	$options = null;
	if (isset($_POST['options'])) {

		$options = $_POST['options'];
		$isIncompleteAnswers = false;
		foreach ($options as $item) {
			// if (!isset($item['bAnswer']) && !isset($item['sAnswer']) && !isset($item['mAnswer'])) {
			// 	$isIncompleteAnswers = true;
			// 	break;
			// }
		}

	

		if (!$isIncompleteAnswers) {
			$executeComplete = false;

			foreach ($options as $item) {
				$topicItemId = $item['topicItemId'];
				

				$booleanAnswer = isset($item['bAnswer']) ? $item['bAnswer'] : 'null';
				
				$sAnswer = isset($item['sAnswer']) && $item['sAnswer'] != "" ? "'" . $item['sAnswer'] . "'" : 'null';
				

				$first = true;
				$combinedMultiAnswers = "";
				$mAnswer = null;
				if (isset($item['mAnswer'])) {
					$mAnswer = $item['mAnswer'];
					foreach ($mAnswer as $ans) {
							if (!$first) {
								$combinedMultiAnswers .= ", ";
							}
						$combinedMultiAnswers .= $ans;
						$first = false;
					}
				}

		
				$combinedMultiAnswers = $combinedMultiAnswers != "" ? "'" . $combinedMultiAnswers . "'" : "null";
				

				$sql = "insert into topic_item_answer (student_id, topic_item_id, banswer, sanswer, manswers, submit_time)
						value (" . $studentId . ", " . $topicItemId . ", " . $booleanAnswer . ", " . $sAnswer . ", " . $combinedMultiAnswers . ", now())";
				//echo $topicItemId . ". [SQL]: " . $sql;
				$executeComplete = mysqli_query($con, $sql);
			}
			if($executeComplete){
				header('Location: studentViewAnswer.php?id=' . $topicId . '&status=success_answer_quiz');
			}
			else{
				echo "Error ".mysqli_error($con);
			}
		} else {
			header('Location: studentTakeQuiz.php?id=' . $topicId . '&status=incomplete_answers');
		}
	} else {
		header('Location: studentHomepage.php?status=submission_problem');
	}

	exit(0);
?>
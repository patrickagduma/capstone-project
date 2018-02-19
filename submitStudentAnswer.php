<?php
	require_once('libs/connect.php');
	session_start();

	$studentId = $_SESSION['id'];
 
	$topicId = $_POST['topicId'];
	$topicItemId = $_POST['topicItemId'];
	$booleanAnswer = $_POST['bAnswer'];

	$sAnswer = $_POST['sAnswer'];

	$mAnswer = $_POST['mAnswer'];

    //$problem = isset($qaItem['problem']) ? "'" . $qaItem['problem'] . "'" : 'null';

    $booleanAnswer = isset($_POST['bAnswer']) && $_POST['bAnswer'] != "" ? strtolower($_POST['bAnswer']) : 'null';
    $sAnswer = isset($_POST['sAnswer']) && $_POST['sAnswer'] != "" ? "'" . $_POST['sAnswer'] . "'" : 'null';



    $mAnswer = isset($_POST['mAnswer']) && $_POST['mAnswer'] != "" ? "'" . $_POST['mAnswer'] . "'" : 'null';
    $mAnswer2 = isset($_POST['multiAnswer2']) && $_POST['multiAnswer2'] != "" ? "'" . $_POST['multiAnswer2'] . "'" : 'null';
    $mAnswer3 = isset($_POST['multiAnswer3']) && $_POST['multiAnswer3'] != "" ? "'" . $_POST['multiAnswer3'] . "'" : 'null';
    $mAnswer4 = isset($_POST['multiAnswer4']) && $_POST['multiAnswer4'] != "" ? "'" . $_POST['multiAnswer4'] . "'" : 'null';
    $mAnswer5 = isset($_POST['multiAnswer5']) && $_POST['multiAnswer5'] != "" ? "'" . $_POST['multiAnswer5'] . "'" : 'null';
    $mAnswer6 = isset($_POST['multiAnswer6']) && $_POST['multiAnswer6'] != "" ? "'" . $_POST['multiAnswer6'] . "'" : 'null';

	echo "[topicId]: " . $topicId . "<br />";
	echo "[topicItemId]: " . $topicItemId . "<br />";
	echo "[studentId]: " . $studentId . "<br />";
	echo "[booleanAnswer]: " . $booleanAnswer . "<br />";
	echo "[sAnswer]: " . $sAnswer . "<br />";

	$first = true;
	$combinedMultiAnswers = "";
	foreach ($mAnswer as $ans) {
		if (!$first) {
			$combinedMultiAnswers .= ", ";
		}
		$combinedMultiAnswers .= $ans;
		$first = false;
	}
	
	$combinedMultiAnswers = $combinedMultiAnswers != "" ? "'" . $combinedMultiAnswers . "'" : "";

	echo "[combined-multi-answer]: " . $combinedMultiAnswers . "<br />";
	echo "[mAnswer-count]: " . count($mAnswer) . "<br />";

	// $sql = "insert into topic_item_answer (student_id, topic_item_id, boolean_answer, single_answer, multi_answers)
	// 		value (" . $studentId . ", " . $topicItemId . ", " . $booleanAnswer . ", " . $sAnswer . ", " . $combinedMultiAnswers . ")";

	// echo "[SQL]: " . $sql;
	// if(mysqli_query($con, $sql)){
	// 	header('Location: studentHomepage.php');
	// }
	// else{
	// 	echo "Error ".mysqli_error($con);
	// }

	// exit(0);

?>
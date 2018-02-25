<?php
	require_once('libs/connect.php');
	
	session_start();
	
	// echo "[problem]: " . $_POST['problem'] . "<br>";
	// echo "[saveType]: " . $_POST['saveType'] . "<br>";
	// echo "[booleanAnswer]: " . $_POST['booleanAnswer'] . "<br>";

	$courseId = 0;
	if (isset($_POST['problem']) && $_POST['problem'] != "" && 
		isset($_POST['saveType']) && isset($_POST['booleanAnswer']) && 
		$_POST['booleanAnswer'] != "") {
		$courseId = $_POST['courseId'];
		$qa = array();
		$qa['problem'] = $_POST['problem'];
		$qa['saveType'] = $_POST['saveType'];
		$qa['booleanAnswer'] = $_POST['booleanAnswer'];


		$unsaveTopic = $_SESSION['topic'];
		$questionsAndAnswers = $unsaveTopic['QAs'];
		if (!isset($questionsAndAnswers)) {
			$questionsAndAnswers = array();
		}

		array_push($questionsAndAnswers, $qa);

		$unsaveTopic['QAs'] = $questionsAndAnswers;
		$_SESSION['topic'] = $unsaveTopic;

		if ($_POST['saveType'] == 'saveAddQuestion') {
			header('Location:Teacher_AddQuestion_truefalseVQ.php?cid=' . $courseId . '&status=added');
		} else {
			header('Location:Teacher_Topic.php');
		}
	} else {
			header('Location:Teacher_AddQuestion_truefalseVQ.php?status=insufficient_data');
	}
	         
        //     if ($status == 'success_add_question') {
        //          echo "alert('Question Successfully Added');";
        // }


?>
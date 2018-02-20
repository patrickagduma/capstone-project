<?php
	require_once('libs/connect.php');
	
	session_start();
	
	if (isset($_POST['problem']) && $_POST['problem'] != "" && 
		isset($_POST['saveType']) && isset($_POST['booleanAnswer']) && 
		$_POST['booleanAnswer'] != "") {
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
			header('Location:Teacher_AddQuestion_truefalseVQ.php');
		} else if ($_POST['saveType'] == 'saveViewQuestions') {
			header('Location:Teacher_viewQuestions.php');
		} else {
			header('Location:Teacher_Topic.php');
		}
	} else {
			header('Location:Teacher_AddQuestion_truefalse.php?status=insufficient_data');
	}

?>
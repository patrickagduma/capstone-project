<?php
	require_once('libs/connect.php');
	
	session_start();

	$choiceCount = 0;
	if (isset($_POST['singleChoice1']) && $_POST['singleChoice1'] != "") {
		$choiceCount++;
	}
	if (isset($_POST['singleChoice2']) && $_POST['singleChoice2'] != "") {
		$choiceCount++;
	}
	if (isset($_POST['singleChoice3']) && $_POST['singleChoice3'] != "") {
		$choiceCount++;
	}
	if (isset($_POST['singleChoice4']) && $_POST['singleChoice4'] != "") {
		$choiceCount++;
	}
	if (isset($_POST['singleChoice5']) && $_POST['singleChoice5'] != "") {
		$choiceCount++;
	}
	if (isset($_POST['singleChoice6']) && $_POST['singleChoice6'] != "") {
		$choiceCount++;
	}

	if (isset($_POST['problem']) && $_POST['problem'] != "" && 
		isset($_POST['saveType']) && 
		isset($_POST['singleAnswer1']) && $_POST['singleAnswer1'] != "" &&
		$choiceCount >= 3) {
		$qa = array();
		$qa['problem'] = $_POST['problem'];
		$qa['saveType'] = $_POST['saveType'];

		//Single answer type
		$qa['singleChoice1'] = $_POST['singleChoice1'];
		$qa['singleChoice2'] = $_POST['singleChoice2'];
		$qa['singleChoice3'] = $_POST['singleChoice3'];
		$qa['singleChoice4'] = $_POST['singleChoice4'];
		$qa['singleChoice5'] = $_POST['singleChoice5'];
		$qa['singleChoice6'] = $_POST['singleChoice6'];

		$qa['singleAnswer1'] = $_POST['singleAnswer1'];

		$unsaveTopic = $_SESSION['topic'];
		$questionsAndAnswers = $unsaveTopic['QAs'];
		if (!isset($questionsAndAnswers)) {
			$questionsAndAnswers = array();
		}

		array_push($questionsAndAnswers, $qa);

		
		$unsaveTopic['QAs'] = $questionsAndAnswers;
		$_SESSION['topic'] = $unsaveTopic;

		if ($_POST['saveType'] == 'saveAddQuestion') {
			header('Location:Teacher_AddQuestion_singleanswerVQ.php');
		} else if ($_POST['saveType'] == 'saveViewQuestions') {
			header('Location:Teacher_viewQuestions.php');
		} else {
			header('Location:Teacher_Topic.php');
		}
	} else {
		header('Location:Teacher_AddQuestion_singleanswer.php?status=insufficient_data');
	}


?>
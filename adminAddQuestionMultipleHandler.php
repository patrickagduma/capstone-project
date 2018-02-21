<?php
	require_once('libs/connect.php');
	
	session_start();


	$choiceCount = 0;
	if (isset($_POST['multiChoice1']) && $_POST['multiChoice1'] != "") {
		$choiceCount++;
	}
	if (isset($_POST['multiChoice2']) && $_POST['multiChoice2'] != "") {
		$choiceCount++;
	}
	if (isset($_POST['multiChoice3']) && $_POST['multiChoice3'] != "") {
		$choiceCount++;
	}
	if (isset($_POST['multiChoice4']) && $_POST['multiChoice4'] != "") {
		$choiceCount++;
	}
	if (isset($_POST['multiChoice5']) && $_POST['multiChoice5'] != "") {
		$choiceCount++;
	}
	if (isset($_POST['multiChoice6']) && $_POST['multiChoice6'] != "") {
		$choiceCount++;
	}

	$answerCount = 0;
	if (isset($_POST['multiAnswer1']) && $_POST['multiAnswer1'] != "") {
		$answerCount++;
	}
	if (isset($_POST['multiAnswer2']) && $_POST['multiAnswer2'] != "") {
		$answerCount++;
	}
	if (isset($_POST['multiAnswer3']) && $_POST['multiAnswer3'] != "") {
		$answerCount++;
	}
	if (isset($_POST['multiAnswer4']) && $_POST['multiAnswer4'] != "") {
		$answerCount++;
	}
	if (isset($_POST['multiAnswer5']) && $_POST['multiAnswer5'] != "") {
		$answerCount++;
	}
	if (isset($_POST['muitiAnswer6']) && $_POST['muitiAnswer6'] != "") {
		$choiceCount++;
	}

	if (isset($_POST['problem']) && $_POST['problem'] != "" && 
		isset($_POST['saveType']) && 
		isset($_POST['multiAnswer1']) && $_POST['multiAnswer1'] != "" &&
		$choiceCount >= 3 && $answerCount >= 1) {
		$qa = array();
		$qa['problem'] = $_POST['problem'];
		$qa['saveType'] = $_POST['saveType'];

	//Multi answer type
	$qa['multiChoice1'] = $_POST['multiChoice1'];
	$qa['multiChoice2'] = $_POST['multiChoice2'];
	$qa['multiChoice3'] = $_POST['multiChoice3'];
	$qa['multiChoice4'] = $_POST['multiChoice4'];
	$qa['multiChoice5'] = $_POST['multiChoice5'];
	$qa['multiChoice6'] = $_POST['multiChoice6'];

	$qa['multiAnswer1'] = $_POST['multiAnswer1'];
	$qa['multiAnswer2'] = $_POST['multiAnswer2'];
	$qa['multiAnswer3'] = $_POST['multiAnswer3'];
	$qa['multiAnswer4'] = $_POST['multiAnswer4'];
	$qa['multiAnswer5'] = $_POST['multiAnswer5'];
	$qa['multiAnswer6'] = $_POST['multiAnswer6'];

	

	$unsaveTopic = $_SESSION['topic'];
	$questionsAndAnswers = $unsaveTopic['QAs'];
	if (!isset($questionsAndAnswers)) {
		$questionsAndAnswers = array();
	}

	array_push($questionsAndAnswers, $qa);

	
	$unsaveTopic['QAs'] = $questionsAndAnswers;
	$_SESSION['topic'] = $unsaveTopic;

	if ($_POST['saveType'] == 'saveAddQuestion') {
		header('Location:admin_AddQuestion_multipleansVQ.php');
	} else if ($_POST['saveType'] == 'saveViewQuestions') {
		header('Location:Teacher_viewQuestions.php');
	} else {
		header('Location:SubjectTopics.php');
	}
	} else {
		header('Location:admin_AddQuestion_multipleansVQ.php?status=insufficient_data');
	}
?>
<?php
	require_once('libs/connect.php');
	
	session_start();
	
	$unsaveTopic = $_SESSION['topic'];
	$questionsAndAnswers = null;
	if (isset($unsaveTopic) && isset($unsaveTopic['QAs'])) {
		$questionsAndAnswers = $unsaveTopic['QAs'];
	}

	//include ('pages/teacherViewQuestion.html');
	//include ('pages/Teacher_AddQuestion_truefalse.html');
	include ('pages/admin_AddQuestions_singleanswer.html');
?>
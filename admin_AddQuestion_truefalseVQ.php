<?php
	require_once('libs/connect.php');
	
	session_start();
	
	$unsaveTopic = $_SESSION['topic'];
	$questionsAndAnswers = null;
	if (isset($unsaveTopic) && isset($unsaveTopic['QAs'])) {
		$questionsAndAnswers = $unsaveTopic['QAs'];
	}

	//include ('pages/teacherViewQuestion.html');
	include ('pages/admin_AddQuestion_truefalse.html');
?>
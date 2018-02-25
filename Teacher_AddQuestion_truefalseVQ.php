<?php
	require_once('libs/connect.php');
	
	session_start();

	$courseId = $_GET['cid'];

	$status = null;
    if (isset($_GET['status'])) {
    	$status = $_GET['status'];
    }
	
	$unsaveTopic = $_SESSION['topic'];
	$questionsAndAnswers = null;
	if (isset($unsaveTopic) && isset($unsaveTopic['QAs'])) {
		$questionsAndAnswers = $unsaveTopic['QAs'];
	}

	//include ('pages/teacherViewQuestion.html');
	include ('pages/Teacher_AddQuestion_truefalse.html');
?>
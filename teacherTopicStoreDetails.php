<?php
	require_once('libs/connect.php');
	
	session_start();

	$topic = $_POST['topic'];
	$permalink = $topic;
	$permalink = str_replace(' ', '_', $permalink);
	$permalink = preg_replace('/[^A-Za-z0-9_]/', '', $permalink);
	$permalink = strtolower($permalink);


	$unsaveTopic = $_SESSION['topic'];
	if (!isset($unsaveTopic)) {
		$unsaveTopic = array();
	}

	$unsaveTopic['courseId'] = $_POST['courseId'];
	$unsaveTopic['topic'] = $topic;
	$unsaveTopic['videoLink'] = $_POST['videoLink'];
	$unsaveTopic['summary'] = $_POST['summary'];
	$unsaveTopic['permalink'] = $permalink;

	$questionsAndAnswers = $unsaveTopic['QAs'];
	if (isset($questionsAndAnswers)) {
		$questionsAndAnswers = array();
	}

	$_SESSION['topic'] = $unsaveTopic;

	header('Location:Teacher_AddQuestion_truefalseVQ.php');
?>
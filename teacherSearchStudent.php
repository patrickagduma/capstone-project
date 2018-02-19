<?php
	require_once('libs/connect.php');

	session_start();

	$courseId = $_GET['cid'];

	include('pages/teacherSearchStudent.html');
?>
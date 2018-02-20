<?php
	require_once('libs/connect.php');

	session_start();

	$courseId = null;
	if (isset($_GET['cid'])) {
		$courseId = $_GET['cid'];
	}

	include('pages/adminSearchStudent.html');
?>
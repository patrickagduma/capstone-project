<?php
    require_once('libs/connect.php');
    session_start();

    $courseId = $_GET['cid'];

	$_SESSION['topic'] = null;
	header('Location:Teacher_Topic.php?cid=' . $courseId);
?>

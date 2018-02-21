<?php
    require_once('libs/connect.php');
    session_start();

	$_SESSION['topic'] = null;
	header('Location:SubjectTopics.php');
?>

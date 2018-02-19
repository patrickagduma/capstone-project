<?php
    require_once('libs/connect.php');
    session_start();
    $status = null;
    if (isset($_GET['status'])) {
    	$status = $_GET['status'];
    }
    include ('pages/Teacher_AddQuestions_singleanswer.html');
?>

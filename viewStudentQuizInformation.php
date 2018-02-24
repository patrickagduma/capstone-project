<?php
	require_once('libs/connect.php');
	require_once('libs/commons.php');

	session_start();

    $courseId = $_GET['cid'];
    $studentId = $_GET['sid'];
    $quizId = $_GET['qid'];

    //Student name
    $studentName = 'N/A';
    $sqlStudent = "select concat(firstname, ' ', lastname) as student_name from users where id = " . $studentId;
    $rsStudent = mysqli_query($con, $sqlStudent);
    if(mysqli_num_rows($rsStudent) > 0){
        if ($row = mysqli_fetch_assoc($rsStudent)) {
            $studentName = $row['student_name'];
        }
    }

    // Quiz details
	$sqlQuiz  = " select distinct
            tia.id,
            ti.subject_id,
            tia.student_id,
            ti.topic_id,
            tia.topic_item_id,
            ti.question,
            tia.banswer,
            ti.boolean_answer as correct_boolean,
            tia.sanswer,
            ti.single_answer as correct_sanswer,
            tia.manswers,
            ti.multi_answer_1,
            ti.multi_answer_2,
            ti.multi_answer_3,
            ti.multi_answer_4,
            ti.multi_answer_5,
            ti.multi_answer_6,
            tia.submit_time
        from topic_item_answer tia
        inner join topic_item ti on ti.id = tia.topic_item_id
        where ti.topic_id = " . $quizId . " and tia.student_id = " . $studentId;
	
	$resultQuiz = mysqli_query($con, $sqlQuiz);


    //Subject and Course Info
    $sqlInfo = "select 
        c.*, 
        s.name as subject
    from classes c 
    inner join subject s on s.id = c.subject_id 
    where c.id = " . $_GET['cid'];

    $classId = 0;
    $classCode = 'N/A';
    $subject = 'N/A';
    $year_level = 'N/A';
    $section = 'N/A';
    $baseGrade = 50;
    $rsInfo = mysqli_query($con, $sqlInfo);
    if(mysqli_num_rows($rsInfo) > 0){
        if ($row = mysqli_fetch_assoc($rsInfo)) {
            $classId = $row['id'];
            $code = $row['code'];
            $subject = $row['subject'];
            $year_level = $row['year_level'];
            $section = $row['section'];
            $baseGrade = $row['base_grade'];
        }
    }

	if($resultQuiz){
		include('pages/viewStudentQuizInformation.html');
		mysqli_close($con);
	}
?>
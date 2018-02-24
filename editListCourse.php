<?php
	require_once('libs/connect.php');
	require_once('libs/commons.php');
	

	session_start();

	$status = null;
	if (isset($_GET['status'])) {
		$status = $_GET['status'];
	}

	$courseId = '';
	$name = '';
	$code = '';
	$subject_id = '';
	$year_level = '';
	$section = '';
	$baseGrade = 50;
	$course_id = '';
	$topic = '';
	$video_link = '';
	if(isset($_GET['id'])){

		$sqlSCE = "select
			sce.id, 
			sce.student_id, 
			concat(u.firstname, ' ', u.lastname) as student_name,
			s.id as subject_id,
			s.name as subject,
			sce.course_id, 
			c.code, 
			sce.last_modified_date
		from student_class_enrollment sce
		inner join users u on u.id = sce.student_id
		inner join classes c on c.id = sce.course_id
		inner join subject s on s.id = c.subject_id
		where c.created_by = ". $_SESSION['id'] .
			" and sce.status is null and s.id = " . $_GET['id'] . 
		" order by sce.last_modified_date desc";

		$resultRegistration  = mysqli_query($con, $sqlSCE);


		$sqlClass = "select c.*, s.name from classes c
				inner join subject s on s.id = c.subject_id
				where c.id = ".$_GET['id'];
		$result = mysqli_query($con, $sqlClass);
		if(mysqli_num_rows($result) > 0){
			$row = mysqli_fetch_assoc($result);
			$courseId = $row['id'];
			$subject_id = $row['subject_id'];
			$name = $row['name'];
			$code = $row['code'];
			$year_level = $row['year_level'];
			$section = $row['section'];
			$baseGrade = $row['base_grade'];
		}

		$sqlEditVideos = "select * from subject_videos 
						  where subject_id =" . $subject_id;
		$resultEditVideos = mysqli_query($con, $sqlEditVideos);


		

		$sqlStudentList = "select
			sc.id,
			sc.student_id,
			u.firstname,
			u.lastname,
			u.email,
			sc.class_id,
			sc.last_modified_date
		from student_classes sc
		inner join users u on u.id = sc.student_id
		where sc.is_active=1 and sc.class_id=" . $_GET['id'] . 
		" order by sc.last_modified_date desc";

		$resultStudentList  = mysqli_query($con, $sqlStudentList);

		$sqlTopic  = " SELECT  t.*, v.topic as video_topic, v.video_link  FROM topic t ";
		$sqlTopic .= " LEFT JOIN subject_videos v on v.id = t.video_id ";
		$sqlTopic .= " WHERE t.subject_id = " . $_GET['id'];

		$resultTopic = mysqli_query($con, $sqlTopic);
	}


	$sqlCourseStudents  = " select student_id from student_classes sc where sc.class_id = ";
	$sqlCourseStudents .= $courseId;
	$sqlCourseStudents .= " and sc.is_active = true ";
	$rsCourseStudents = mysqli_query($con, $sqlCourseStudents);

	$courseTopicCount = 0;
	$studentQuizzes = array();
	if (mysqli_num_rows($rsCourseStudents) > 0){
		$studentIndex = 0;
		while($students = mysqli_fetch_array($rsCourseStudents)){ // Students
			$studentId = $students['student_id'];
			$studentQuizzes[$studentIndex]['student_id'] = $studentId;

			$sqlTopics  = " select distinct t.id from topic t inner join topic_item ti on ti.topic_id = t.id ";
			$sqlTopics .= " where ti.subject_id = ";
			$sqlTopics .= $subject_id;
			$rsTopics = mysqli_query($con, $sqlTopics);
			$courseTopicCount = mysqli_num_rows($rsTopics);

			//echo "[students-count]: " . $courseTopicCount . "<br />";

			$topic_quizzes = array();
			if ($courseTopicCount > 0) {
				$topicIndex = 0;
				
				while($topic = mysqli_fetch_array($rsTopics)){ // Course Topics
					$topicId = $topic['id'];

					$sqlItems = "select ti.* from topic_item ti where ti.subject_id =" . $subject_id . " and ti.topic_id = " . $topicId;
					$rsItems = mysqli_query($con, $sqlItems);
					$itemsCount = mysqli_num_rows($rsItems);

					$score = 0;
					$quizId = 0;
					$tId = 0;
					if ($itemsCount > 0) {
						while($cAns = mysqli_fetch_array($rsItems)){
							$topicItemId = $cAns['id'];

							$sqlStudentAnswer = "select distinct
								tia.id,
								ti.subject_id,
								tia.student_id,
								ti.topic_id,
								tia.topic_item_id,
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
								ti.multi_answer_6
							from topic_item_answer tia
							inner join topic_item ti on ti.id = tia.topic_item_id
							where ti.subject_id = " . $subject_id . " and tia.student_id = " . $studentId . " and tia.topic_item_id = " . $topicItemId;
							$resultStudentListAnswer  = mysqli_query($con, $sqlStudentAnswer);

							if (mysqli_num_rows($resultStudentListAnswer) > 0){
								while($answer = mysqli_fetch_array($resultStudentListAnswer)){ //Student Answers
									$quizId = isset($answer['id']);
									$tId = isset($answer['topic_id']);
		                            $booleanType = isset($answer['correct_boolean']);
		                            $singleType = isset($answer['correct_sanswer']);
		                            $multiType = !isset($answer['correct_boolean']) && !isset($answer['correct_sanswer']);
		                            if ($booleanType && ($answer['banswer'] == $answer['correct_boolean'])) {
		                            	
		                                $score++;
		                            } else if ($singleType && ($answer['sanswer'] == $answer['correct_sanswer'])) {
		                            	
		                            	$score++;
		                            } else if ($multiType) {
						                $correctAnswersCount = 0;
						                $corrects = array();
						                $firstAnswer = true;
						                if (isset($answer['multi_answer_1'])) {
						                    $corrects[0] = $answer['multi_answer_1'];
						                    $correctAnswersCount++;
						                }
						                if (isset($answer['multi_answer_2'])) {
						                    $corrects[1] = $answer['multi_answer_2'];
						                    $correctAnswersCount++;
						                }
						                if (isset($answer['multi_answer_3'])) {
						                    $corrects[2] = $answer['multi_answer_3'];
						                    $correctAnswersCount++;
						                }
						                if (isset($answer['multi_answer_4'])) {
						                    $corrects[3] = $answer['multi_answer_4'];
						                    $correctAnswersCount++;
						                }
						                if (isset($answer['multi_answer_5'])) {
						                    $corrects[4] = $answer['multi_answer_5'];
						                    $correctAnswersCount++;
						                }
						                if (isset($answer['multi_answer_6'])) {
						                    $corrects[5] = $answer['multi_answer_6'];
						                    $correctAnswersCount++;
						                }

						                $m_answer = explode(', ', $answer['manswers']);
						                $studentAnswersCount = count($m_answer);

						                $isCorrectAnswer = ($correctAnswersCount == $studentAnswersCount);
						                


						                if ($isCorrectAnswer) {
						                    foreach($m_answer as $m) {
						                        if (!arrayItemExists($corrects, $m)) {
						                            $isCorrectAnswer = false;
						                        }
						                    }
						                }

						                if ($isCorrectAnswer) {
						                    $score++;
						                }
		                            }
								}
								
							}
						}
					}
					$topic_quizzes[$topicIndex]['quiz_id'] = $quizId;
					$topic_quizzes[$topicIndex]['topic_id'] = $topicId;
					$topic_quizzes[$topicIndex]['score'] = $score;
					$topic_quizzes[$topicIndex]['items_count'] = $itemsCount;
					$topicIndex++;
				}
			}
			if (isset($topic_quizzes)) {
				$studentQuizzes[$studentIndex]['topic_quizzes'] = $topic_quizzes;
			}
			$studentIndex++;
		}

	}
	include("classListRegistration.php");
	include 'pages/editListCourse.html';
	exit(0);
?>
<?php
    require_once('libs/connect.php');
    session_start();

    $courseId = $_GET['cid'];

    $topicDetails = null;
    if (isset($_SESSION['topic'])) {
        $topicDetails = $_SESSION['topic'];
    }
    
    $sqlTopic = "insert into topic(course_id, subject_id, video_id, topic, summary, permalink) 
    value('" . $topicDetails['courseId'] . "', '".$topicDetails['subjectId']."', '".$topicDetails['videoLink']."', '".$topicDetails['topic']."', '".$topicDetails['summary']."', '".$topicDetails['permalink']."')";

    //echo "[SQL]: " . $sqlTopic . "<br />";

/* */
    if(mysqli_query($con, $sqlTopic)){
        $topicId = mysqli_insert_id($con);
        $subjectId = $topicDetails['subjectId'];
        $courseId = $topicDetails['courseId'];
        $questionsAndAnswers = $topicDetails['QAs'];
        foreach ($questionsAndAnswers as $qaItem) {
            $problem = isset($qaItem['problem']) ? "'" . $qaItem['problem'] . "'" : 'null';
            //$problem = isset($qaItem['problem']) ? "'" . $qaItem['problem'] . "'" : 'null';


            $permalink = $qaItem['problem'];
            $permalink = str_replace(' ', '_', $permalink);
            $permalink = preg_replace('/[^A-Za-z0-9_]/', '', $permalink);
            $permalink = strtolower($permalink);
            $permalink = "'" . $permalink . "'";

            $booleanAnswer = isset($qaItem['booleanAnswer']) && $qaItem['booleanAnswer'] != "" ? strtolower($qaItem['booleanAnswer']) : 'null';
            $singleChoice1 = isset($qaItem['singleChoice1']) && $qaItem['singleChoice1'] != "" ? "'" . $qaItem['singleChoice1'] . "'" : 'null';
            $singleChoice2 = isset($qaItem['singleChoice2']) && $qaItem['singleChoice2'] != "" ? "'" . $qaItem['singleChoice2'] . "'" : 'null';
            $singleChoice3 = isset($qaItem['singleChoice3']) && $qaItem['singleChoice3'] != "" ? "'" . $qaItem['singleChoice3'] . "'" : 'null';
            $singleChoice4 = isset($qaItem['singleChoice4']) && $qaItem['singleChoice4'] != "" ? "'" . $qaItem['singleChoice4'] . "'" : 'null';
            $singleChoice5 = isset($qaItem['singleChoice5']) && $qaItem['singleChoice5'] != "" ? "'" . $qaItem['singleChoice5'] . "'" : 'null';
            $singleChoice6 = isset($qaItem['singleChoice6']) && $qaItem['singleChoice6'] != "" ? "'" . $qaItem['singleChoice6'] . "'" : 'null';
            $singleAnswer1 = isset($qaItem['singleAnswer1']) && $qaItem['singleAnswer1'] != "" ? "'" . $qaItem['singleAnswer1'] . "'" : 'null';

            $multiChoice1 = isset($qaItem['multiChoice1']) && $qaItem['multiChoice1'] != "" ? "'" . $qaItem['multiChoice1'] . "'" : 'null';
            $multiChoice2 = isset($qaItem['multiChoice2']) && $qaItem['multiChoice2'] != "" ? "'" . $qaItem['multiChoice2'] . "'" : 'null';
            $multiChoice3 = isset($qaItem['multiChoice3']) && $qaItem['multiChoice3'] != "" ? "'" . $qaItem['multiChoice3'] . "'" : 'null';
            $multiChoice4 = isset($qaItem['multiChoice4']) && $qaItem['multiChoice4'] != "" ? "'" . $qaItem['multiChoice4'] . "'" : 'null';
            $multiChoice5 = isset($qaItem['multiChoice5']) && $qaItem['multiChoice5'] != "" ? "'" . $qaItem['multiChoice5'] . "'" : 'null';
            $multiChoice6 = isset($qaItem['multiChoice6']) && $qaItem['multiChoice6'] != "" ? "'" . $qaItem['multiChoice6'] . "'" : 'null';

            $multiAnswer1 = isset($qaItem['multiAnswer1']) && $qaItem['multiAnswer1'] != "" ? "'" . $qaItem['multiAnswer1'] . "'" : 'null';
            $multiAnswer2 = isset($qaItem['multiAnswer2']) && $qaItem['multiAnswer2'] != "" ? "'" . $qaItem['multiAnswer2'] . "'" : 'null';
            $multiAnswer3 = isset($qaItem['multiAnswer3']) && $qaItem['multiAnswer3'] != "" ? "'" . $qaItem['multiAnswer3'] . "'" : 'null';
            $multiAnswer4 = isset($qaItem['multiAnswer4']) && $qaItem['multiAnswer4'] != "" ? "'" . $qaItem['multiAnswer4'] . "'" : 'null';
            $multiAnswer5 = isset($qaItem['multiAnswer5']) && $qaItem['multiAnswer5'] != "" ? "'" . $qaItem['multiAnswer5'] . "'" : 'null';
            $multiAnswer6 = isset($qaItem['multiAnswer6']) && $qaItem['multiAnswer6'] != "" ? "'" . $qaItem['multiAnswer6'] . "'" : 'null';

            $sqlQAItem  = "insert into topic_item(topic_id, subject_id, question, permalink, boolean_answer, single_choice_1, single_choice_2, single_choice_3, single_choice_4, single_choice_5, single_choice_6, single_answer, multi_choice_1, multi_choice_2, multi_choice_3, multi_choice_4, multi_choice_5, multi_choice_6, multi_answer_1, multi_answer_2, multi_answer_3, multi_answer_4, multi_answer_5, multi_answer_6) value (";
            $sqlQAItem .= $topicId . ", " . $subjectId . ", " . $problem . ", " . $permalink . ", ";
            $sqlQAItem .= $booleanAnswer . ", ";
            $sqlQAItem .= $singleChoice1 . ", " . $singleChoice2 . ", " . $singleChoice3 . ", " . $singleChoice4 . ", " . $singleChoice5 . ", " . $singleChoice6 . ", " . $singleAnswer1 . ", ";
            $sqlQAItem .= $multiChoice1 . ", " . $multiChoice2 . ", " . $multiChoice3 . ", " . $multiChoice4 . ", " . $multiChoice5 . ", " . $multiChoice6 . ", ";
            $sqlQAItem .= $multiAnswer1 . ", " . $multiAnswer2 . ", " . $multiAnswer3 . ", " . $multiAnswer4 . ", " . $multiAnswer5 . ", " . $multiAnswer6;
            $sqlQAItem .= ")";

            if (mysqli_query($con, $sqlQAItem)) {
                $_SESSION['topic'] = null;
                header('Location:editListCourse.php?id=' . $courseId . '&status=success_topic');
            } else {
                echo "Error: " . $sqlQAItem . "<br>" . mysqli_error($con);
            }
        }
    }
    else{
        echo "Error ".mysqli_error($con);
    }

?>
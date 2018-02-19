<?php
	require_once('libs/connect.php');

	session_start(); 
		$sql = " SELECT t.topic, sc.student_id, c.course_code
				FROM `topic` t 
				inner join student_classes sc on 
    			sc.course_id = t.course_id
    			INNER JOIN courses c on c.id = t.course_id
				where
 				sc.student_id =" $_POST['id'];

		$result = mysqli_query($con, $sql);
		if(mysqli_num_rows($result) > 0){
		while($row = mysqli_fetch_assoc($result)){
 				//echo "SQL(:)" . $sql;
		}
	}


	?>

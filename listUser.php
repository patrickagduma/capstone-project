<?php
	require_once('libs/connect.php');
?>
<h2>User List</h2>
<table border="1" cellpadding="0" cellspacing="5px">
	<tr>
		<th>ID</th>
		<th>course_id</th>
		<th>topic</th>
		<th>video_id</th>
		<th>summary</th>
		<th>permalink</th>
		<th>student_id</th>
	</tr>
	<?php
		$sql = "select t.*, sc.student_id
				from `topic` t 
				inner join student_classes sc on 
    			sc.course_id = t.course_id
				where
 				sc.student_id = $_SESSION['id']";
		$result = mysqli_query($con, $sql);
		if(mysqli_num_rows($result) > 0){
			while($row = mysqli_fetch_assoc($result)){
	?>
	<!-- <tr>
		<td><?=$row['id']?></td>
		<td><?=$row['course_id']?></td>
		<td><?=$row['topic']?></td>
		<td><?=$row['video_id']?></td>
		<td><?=$row['summary']?></td>
		<td><?=$row['permalink']?></td>
		<td><?=$row['student_id']?></td>
		<td>
				<a href="editListUser.php?id=<?=$row['id']?>">Edit</a>
				<a href="deleteListUser.php?id=<?=$row['id']?>">Delete</a>
			</td>
	</tr>

	<?php
		}
	}
	?>

</table>
<?php
	require_once('libs/connect.php');
?>
<h2>User List</h2>
<table border="1" cellpadding="0" cellspacing="5px">
	<tr>
		<th>ID</th>
		<th>course_code</th>
		<th>class_name</th>
		<th>class_description</th>
		<th>instructor</th>
		<th>created_by</th>
		<th>lastModifiedDate</th>
		<th>action</th>
	</tr>
	<?php
		$sql = "select id, course_code, class_name, class_description, instructor, created_by, lastModifiedDate from courses";
		$result = mysqli_query($con, $sql);
		if(mysqli_num_rows($result) > 0){
			while($row = mysqli_fetch_assoc($result)){
	?>
	<tr>
		<td><?=$row['id']?></td>
		<td><?=$row['course_code']?></td>
		<td><?=$row['class_name']?></td>
		<td><?=$row['class_description']?></td>
		<td><?=$row['instructor']?></td>
		<td><?=$row['created_by']?></td>
		<td><?=$row['lastModifiedDate']?></td>
		<td>
				<a href="editListCourse.php?id=<?=$row['id']?>">Edit</a>
				<a href="deleteListCourse.php?id=<?=$row['id']?>">Delete</a>
			</td>
	</tr>
	<?php
		}
	}
	?>

</table>
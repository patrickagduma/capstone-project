<?php
	include("classRegistrationApproval.php");
	if($resultRegistration  = mysqli_query($con, $sql)){
		include('pages/teacherRegistration.html');
			mysqli_close($con);
	}
?>
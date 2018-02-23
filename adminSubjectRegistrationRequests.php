<?php
	include("allClassRegistrationApproval.php");
	if($resultRegistration  = mysqli_query($con, $sql)){
		include('pages/adminSubjectRegistrationRequests.html');
			mysqli_close($con);
	}
?>
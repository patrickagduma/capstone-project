<?php
	function arrayItemExists($objArray, $objItem) {
		if (isset($objArray) && isset($objItem)) {
			foreach ($objArray as $i) {
				if ($i == $objItem) {
					return true;
				}
			}
		}
		return false;
	}

	function computePercentage($score, $items, $baseGrade, $total_score) {
		if (isset($score) && isset($items) && isset($baseGrade) && $baseGrade <= 100 && isset($total_score) && $total_score > 0) {
			$times = 100 - $baseGrade;
			$plus = $baseGrade;
			return ((($score/$items) * $times) + $plus);
		} else {
			return 0;
		}
 
	}
?>
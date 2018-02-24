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

	function computePercentage($score, $items, $baseGrade) {
		if (isset($score) && isset($items) && isset($baseGrade) && $baseGrade <= 100 && $score > 0) {
			$times = 100 - $baseGrade;
			$plus = $baseGrade;
			return ((($score/$items) * $times) + $plus);
		} else if (isset($score) && isset($items) && isset($baseGrade) && $baseGrade <= 100) {
			$times = 100 - $baseGrade;
			$plus = $baseGrade;
			return ((($score/$items) * $times) + $plus);
		} else {
			return 0;
		}
 
	}
?>
<?php

/*
**	Calculate difference between two times
**	http://stackoverflow.com/a/38599644/6484286
**
*/

function timeDiff($start='00:00',$end='00:00'){
	$startDate = $start;
	$endDate = $end;

	$startArray = explode(":",$startDate); // ["23", "51"]
	$endArray = explode(":",$endDate); // ["00", "01"]

	$startHours = (int) $startArray[0] * 60; // 1380
	$startMinutes = (int) $startArray[1] + $startHours; // 1431

	$endHours = (int) $endArray[0] * 60; // 0
	$endMinutes = (int) $endArray[1] + $endHours; // 1

	$timeDifference = $endMinutes - $startMinutes; // -1430

	$day = 24 * 60; // 1440

	if($timeDifference < 0){
	    $timeDifference += $day; // 10
	}

	return $timeDifference;
}
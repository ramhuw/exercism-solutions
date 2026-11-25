DifferenceOfSquares :: {}.{
	square_of_sum : U64 -> U64
	square_of_sum = |number| {
		var $a = 0
		for i in 1..=number {
		    $a = $a + i
		}
		$a * $a
	}

	sum_of_squares : U64 -> U64
	sum_of_squares = |number| {
	    var $a = 0
    	for i in 1..=number {
    	    $a = $a + i * i
    	}
        $a
	}

	difference_of_squares : U64 -> U64
	difference_of_squares = |number| {
		square_of_sum(number) - sum_of_squares(number)
	}
}

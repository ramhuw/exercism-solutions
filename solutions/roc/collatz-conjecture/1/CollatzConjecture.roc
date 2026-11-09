CollatzConjecture :: {}.{
	steps : U64 -> Try(U64, _)
	steps = |number| {
		if number == 0 {
			Err("")
		} else {
			var $n = number
			var $s = 0
			while $n > 1 {
				if $n % 2 == 0 {
					$n = $n / 2
				} else {
					$n = $n * 3 + 1
				}
				$s = $s + 1
			}
			Ok($s)
		}
	}
}

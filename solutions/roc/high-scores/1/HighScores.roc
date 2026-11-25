HighScores :: {}.{
	latest : List(U64) -> Try(U64, _)
	latest = |scores| {
		match scores {
		[] => Err("")
		[x] => Ok(x)
		[_, .. as rest] => latest(rest)
		}
	}

	personal_best : List(U64) -> Try(U64, _)
	personal_best = |scores| {
		match scores {
		[] => Err("")
		_ => {
		var $a = 0
		for i in scores {
		    if i > $a {
				$a = i
			}
		}
		ans = $a
		Ok(ans)
		}
	}
	}

	personal_top_three : List(U64) -> List(U64)
	personal_top_three = |scores| {
		match List.sort(scores) |> List.rev() {
		    [] => []
			[x] => [x]
			[x, y] => [x, y]
			[x, y, z, ..] => [x, y, z]
		}
	}
}

let rec sq_test (n : int) (a : int) : int =
  if (a + 1) * (a + 1) > n
    then a
else sq_test n (a + 1)

let square_root n =
  sq_test n 0
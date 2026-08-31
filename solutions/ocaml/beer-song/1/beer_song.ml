let rec recite from until =
    if until = 0 then 
        ""
    else 
        if from = 0 then
            "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
        else 
            let i = if until = 1 then
                ""
            else
                "\n\n"
            in if from = 1 then
                "1 bottle of beer on the wall, 1 bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall." ^ i ^ recite (from - 1) (until - 1)
            else if from = 2 then
                "2 bottles of beer on the wall, 2 bottles of beer.\nTake one down and pass it around, 1 bottle of beer on the wall." ^ i ^ recite (from - 1) (until - 1)
            else
                Printf.sprintf "%d bottles of beer on the wall, %d bottles of beer.\nTake one down and pass it around, %d bottles of beer on the wall." from from (from - 1) ^ i ^ recite (from - 1) (until - 1)

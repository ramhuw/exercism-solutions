module BirdWatcher

let lastWeek: int[] = [| 0; 2; 5; 3; 7; 8; 4 |]

let yesterday (counts: int[]) : int = counts[5]

let total (counts: int[]) : int = Array.sum counts

let dayWithoutBirds (counts: int[]) : bool = Array.exists (fun i -> i = 0) counts

let incrementTodaysCount (counts: int[]) : int[] =
    counts[6] <- counts[6] + 1
    counts

let unusualWeek (counts: int[]) : bool =
    counts[1] = 0 && counts[3] = 0 && counts[5] = 0
    || counts[1] = 10 && counts[3] = 10 && counts[5] = 10
    || counts[0] = 5 && counts[2] = 5 && counts[4] = 5 && counts[6] = 5

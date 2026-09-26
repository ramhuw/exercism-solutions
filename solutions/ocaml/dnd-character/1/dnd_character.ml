type character = {
  charisma : int;
  constitution : int;
  dexterity : int;
  hitpoints : int;
  intelligence : int;
  strength : int;
  wisdom : int;
}
let ability () =
  let l = [|(Random.int 6) + 1; (Random.int 6) + 1; (Random.int 6) + 1; (Random.int 6) + 1|] in
  Array.sort Stdlib.compare l;
  l.(1) + l.(2) + l.(3)
let modifier ~score =
  if score >= 10 || score mod 2 = 0 then
    (score - 10) / 2
  else
    (score - 10) / 2 - 1

let generate_character ()  =
  let strength = ability () in
  let dexterity = ability () in
  let constitution = ability () in
  let intelligence = ability () in
  let wisdom = ability () in
  let charisma = ability () in
  let hitpoints = 10 + modifier ~score:constitution in
  { 
    charisma = charisma;
    constitution = constitution;
  dexterity = dexterity;
  hitpoints = hitpoints;
  intelligence = intelligence;
  strength = strength;
  wisdom = wisdom;
}

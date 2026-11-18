pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(ans) = problem
  ans
}

pub fn remove_team_prefix(team: String) -> String {
  let assert "Team " <> ans = team
  ans
}
import gleam/string
pub fn split_region_and_team(combined: String) -> #(String, String) {
  let ss = string.split(combined, ",")
  let assert [a, b] = ss
  #(a, remove_team_prefix(b))
}

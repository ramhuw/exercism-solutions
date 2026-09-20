import gleam/list
import gleam/result
import gleam/string

pub fn message(log_line: String) -> String {
  result.unwrap(list.last(string.split(log_line, ":")), "") |> string.trim
}

pub fn log_level(log_line: String) -> String {
  case log_line {
    "[INFO]" <> _ -> "info"
    "[WARNING]" <> _ -> "warning"
    "[ERROR]" <> _ -> "error"
    _ -> ""
  }
}

pub fn reformat(log_line: String) -> String {
  message(log_line) <> " (" <> log_level(log_line) <> ")"
}

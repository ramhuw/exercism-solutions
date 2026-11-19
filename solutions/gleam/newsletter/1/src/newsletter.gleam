import gleam/result
import simplifile
import gleam/string
import gleam/list
pub fn read_emails(path: String) -> Result(List(String), Nil) {
  case simplifile.read(path) {
    Error(_) -> Error(Nil)
    Ok(x) -> Ok(string.split(x, "\n") |> list.map(string.trim) |> list.filter(fn(x) {!string.is_empty(x)}))
  }
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  simplifile.create_file(path) |> result.map_error(fn(_) { Nil })
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  simplifile.append(path, email <> "\n") |> result.map_error(fn(_) { Nil })
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  let _ = create_log_file(log_path)
  use emails <- result.try(read_emails(emails_path))
  list.each(emails, fn(email) {
    case send_email(email) {
      Ok(_) -> log_sent_email(log_path, email)
      Error(_) -> Ok(Nil)
    }
  })
  Ok(Nil)
}

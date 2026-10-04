pub fn wines_of_color(wines: List(Wine), color: Color) -> List(Wine) {
  case wines {
    [x, ..xs] if x.color == color -> [x, ..wines_of_color(xs, color)]
    [_, ..xs] -> wines_of_color(xs, color)
    [] -> []
  }
}

pub fn wines_from_country(wines: List(Wine), country: String) -> List(Wine) {
  case wines {
    [x, ..xs] if x.country == country -> [x, ..wines_from_country(xs, country)]
    [_, ..xs] -> wines_from_country(xs, country)
    [] -> []
  }
}

// Please define the required labelled arguments for this function
pub fn filter(
  wines: List(Wine),
  color color: Color,
  country country: String,
) -> List(Wine) {
  case wines {
    [x, ..xs] if x.country == country && x.color == color -> [
      x,
      ..filter(xs, color, country)
    ]
    [_, ..xs] -> filter(xs, color, country)
    [] -> []
  }
}

pub type Wine {
  Wine(name: String, year: Int, country: String, color: Color)
}

pub type Color {
  Red
  Rose
  White
}

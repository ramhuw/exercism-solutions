pub fn brackets_are_balanced(string: &str) -> bool {
    let mut stack: Vec<char> = Vec::new();
    for c in string.chars() {
        match c {
            '(' | '[' | '{' => stack.push(c),
            ')' => {
                if let Some(d) = stack.pop()
                    && d == '('
                {
                } else {
                    return false;
                }
            }
            ']' => {
                if let Some(d) = stack.pop()
                    && d == '['
                {
                } else {
                    return false;
                }
            }
            '}' => {
                if let Some(d) = stack.pop()
                    && d == '{'
                {
                } else {
                    return false;
                }
            }
            _ => {}
        }
    }
    return stack.is_empty();
}

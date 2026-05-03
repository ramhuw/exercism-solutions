use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
    let mut ans: HashSet<&'a str> = HashSet::new();
    for &test in possible_anagrams {
        if is_anagram(word, test) {
            ans.insert(test);
        }
    }
    ans
}

fn is_anagram(word: &str, test: &str) -> bool {
    if word.to_lowercase() == test.to_lowercase() {
        return false;
    }
    let mut a = word.to_lowercase().chars().collect::<Vec<char>>();
    a.sort();
    let mut b = test.to_lowercase().chars().collect::<Vec<char>>();
    b.sort();
    a == b
}

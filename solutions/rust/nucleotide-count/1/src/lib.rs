use std::collections::HashMap;

pub fn count(nucleotide: char, dna: &str) -> Result<usize, char> {
    let mut ans = 0;
    for c in dna.chars() {
        if c == nucleotide {
            ans += 1;
        }
        if !['A', 'C', 'T', 'G'].contains(&c) {
            return Err(c);
        }
    }
    Ok(ans)
}

pub fn nucleotide_counts(dna: &str) -> Result<HashMap<char, usize>, char> {
    let mut map: HashMap<char, usize> = HashMap::from([('A', 0), ('C', 0), ('T', 0), ('G', 0)]);
    for c in dna.chars() {
        if !['A', 'C', 'T', 'G'].contains(&c) {
            return Err(c);
        }
        *map.entry(c).or_insert(0) += 1;
    }
    Ok(map)
}

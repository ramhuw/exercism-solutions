#[derive(Debug, PartialEq, Eq)]
pub struct Dna {
    dna: Vec<D>
}

#[derive(Debug, PartialEq, Eq)]
pub enum D {
    G,
    C,
    T,
    A
}

impl D {
    fn new(c: char) -> Option<D> {
        match c {
            'G' => Some(Self::G),
            'C' => Some(Self::C),
            'T' => Some(Self::T),
            'A' => Some(Self::A),
            _ => None
        }
    }

    fn tor(self) -> R {
        match self {
            D::G => R::C,
            D::C => R::G,
            D::T => R::A,
            D::A => R::U
        }
    }
}

#[derive(Debug, PartialEq, Eq)]
pub struct Rna {
    rna: Vec<R>
}

#[derive(Debug, PartialEq, Eq)]
pub enum R {
    C,
    G,
    A,
    U
}

impl R {
    fn new(c: char) -> Option<R> {
        match c {
            'G' => Some(Self::G),
            'C' => Some(Self::C),
            'U' => Some(Self::U),
            'A' => Some(Self::A),
            _ => None
        }
    }
}

impl Dna {
    pub fn new(dna: &str) -> Result<Dna, usize> {
        let mut ds: Vec<D> = vec![];
        let mut chars = dna.chars();
        for i in 0.. {
            if let Some(c) = chars.next() {
                if let Some(d) = D::new(c) {
                    ds.push(d);
                } else {
                    return Err(i);
                }
            } else {
                break;
            }
        }
        Ok(Dna { dna: ds } )
    }

    pub fn into_rna(self) -> Rna {
        Rna {
            rna: self.dna.into_iter().map(D::tor).collect()
        }
    }
}

impl Rna {
    pub fn new(rna: &str) -> Result<Rna, usize> {
        let mut rs: Vec<R> = vec![];
        let mut chars = rna.chars();
        for i in 0.. {
            if let Some(c) = chars.next() {
                if let Some(r) = R::new(c) {
                    rs.push(r);
                } else {
                    return Err(i);
                }
            } else {
                break;
            }
        }
        Ok(Rna { rna: rs } )
    }
}

/// Yields each item of a and then each item of b
pub fn append<I, J>(_a: I, _b: J) -> impl Iterator<Item = I::Item>
where
    I: Iterator,
    J: Iterator<Item = I::Item>,
{
    // this empty iterator silences a compiler complaint that
    // () doesn't implement Iterator
    let mut a = _a;
    let mut b = _b;
    std::iter::from_fn(move || {
        if let Some(x) = a.next() {
            return Some(x);
        } else if let Some(y) = b.next() {
            return Some(y);
        } else {
            return None;
        }
    })
}

/// Combines all items in all nested iterators inside into one flattened iterator
pub fn concat<I>(_nested_iter: I) -> impl Iterator<Item = <I::Item as Iterator>::Item>
where
    I: Iterator,
    I::Item: Iterator,
{
    // this empty iterator silences a compiler complaint that
    // () doesn't implement Iterator
    Concat {
        outer: _nested_iter,
        inner: None,
    }
}

struct Concat<I: Iterator> {
    outer: I,
    inner: Option<I::Item>,
}

impl<I> Iterator for Concat<I>
where
    I: Iterator,
    I::Item: Iterator,
{
    type Item = <I::Item as Iterator>::Item;
    fn next(&mut self) -> Option<Self::Item> {
        loop {
            if let Some(inner_iter) = &mut self.inner {
                if let Some(item) = inner_iter.next() {
                    return Some(item);
                }
            }
            if let Some(next_iter) = self.outer.next() {
                self.inner = Some(next_iter)
            } else {
                return None;
            }
        }
    }
}

/// Returns an iterator of all items in iter for which `predicate(item)` is true
pub fn filter<I, F>(_iter: I, _predicate: F) -> impl Iterator<Item = I::Item>
where
    I: Iterator,
    F: Fn(&I::Item) -> bool,
{
    // this empty iterator silences a compiler complaint that
    // () doesn't implement Iterator
    let mut iter = _iter;
    std::iter::from_fn(move || {
        loop {
            if let Some(item) = iter.next() {
                if _predicate(&item) {
                    return Some(item);
                } else {
                    continue;
                }
            } else {
                return None;
            }
        }
    })
}

pub fn length<I: Iterator>(_iter: I) -> usize {
    let mut ans = 0;
    for _ in _iter {
        ans += 1;
    }
    return ans;
}

/// Returns an iterator of the results of applying `function(item)` on all iter items
pub fn map<I, F, U>(_iter: I, _function: F) -> impl Iterator<Item = U>
where
    I: Iterator,
    F: Fn(I::Item) -> U,
{
    // this empty iterator silences a compiler complaint that
    // () doesn't implement Iterator
    let mut iter = _iter;
    std::iter::from_fn(move || {
        if let Some(item) = iter.next() {
            return Some(_function(item));
        } else {
            return None;
        }
    })
}

pub fn foldl<I, F, U>(mut _iter: I, _initial: U, _function: F) -> U
where
    I: Iterator,
    F: Fn(U, I::Item) -> U,
{
    let mut ans = _initial;
    for item in _iter {
        ans = _function(ans, item)
    }
    ans
}

pub fn foldr<I, F, U>(mut _iter: I, _initial: U, _function: F) -> U
where
    I: DoubleEndedIterator,
    F: Fn(U, I::Item) -> U,
{
    foldl(reverse(_iter), _initial, _function)
}

/// Returns an iterator with all the original items, but in reverse order
pub fn reverse<I: DoubleEndedIterator>(_iter: I) -> impl Iterator<Item = I::Item> {
    // this empty iterator silences a compiler complaint that
    // () doesn't implement Iterator
    let mut stack = vec![];
    for item in _iter {
        stack.push(item);
    }
    std::iter::from_fn(move || stack.pop())
}

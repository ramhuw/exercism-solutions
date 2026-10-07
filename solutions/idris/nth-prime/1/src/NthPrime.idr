module NthPrime
import Data.List

isprime : Integer -> Integer -> Bool
isprime n p = if p * p > n then True else if mod n p == 0 then False else isprime n (p+1)

primes : Integer -> Integer -> Integer -> Integer -> Integer
primes n p m ls = 
    if n == m then 
        ls
    else
        if isprime p 2 then
            primes n (p+1) (m+1) p
        else
            primes n (p+1) m ls



export
prime : Integer -> Integer
prime 0 = 0
prime number = primes number 2 0 2

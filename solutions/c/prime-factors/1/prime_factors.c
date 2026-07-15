#include "prime_factors.h"

size_t find_factors(uint64_t n, uint64_t factors[static MAXFACTORS]) {
    if (n <= 0) {
        return -1;
    }
    size_t size = 0;
    uint64_t p = 2;
    while (n != 1) {
        while (n % p == 0) {
            factors[size] = p;
            n /= p;
            size += 1;
        }
        p += 1;
    }
    return size;
}
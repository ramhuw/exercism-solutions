#include "sieve.h"
#include <stdbool.h>

uint32_t sieve(uint32_t limit, uint32_t *primes, size_t max_primes)
{
    bool f[limit + 1];
    for (uint32_t i = 0; i <= limit; i++)
    {
        if (i == 0 || i == 1)
        {
            f[i] = false;
        }
        else
        {
            f[i] = true;
        }
    }
    uint32_t k = 0;
    for (uint32_t i = 2; i <= limit && k < max_primes; i++)
    {
        if (f[i])
        {
            primes[k++] = i;
            for (uint32_t j = 2 * i; j <= limit; j += i)
            {
                f[j] = false;
            }
        }
    }
    return k;
}
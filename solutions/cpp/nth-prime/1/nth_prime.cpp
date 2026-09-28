#include "nth_prime.h"
#include <stdexcept>

namespace nth_prime
{

    int nth(int n)
    {
        if (n <= 0)
        {
            throw std::domain_error("Input must be positive");
        }
        int count{0};
        for (int p = 2; count < n; p++)
        {
            if (is_prime(p))
            {
                count++;
            }
            if (count == n)
            {
                return p;
            }
        }
        return 0;
    }

    bool is_prime(int n)
    {
        for (int i = 2; i * i <= n; i++)
        {
            if (n % i == 0)
            {
                return false;
            }
        }
        return true;
    }

} // namespace nth_prime

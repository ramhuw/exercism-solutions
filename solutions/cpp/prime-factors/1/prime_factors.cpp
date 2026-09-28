#include "prime_factors.h"
#include <vector>
#include <stdexcept>

namespace prime_factors
{

    std::vector<long long> of(long long n)
    {
        if (n <= 0)
        {
            throw std::domain_error("Input must be positive");
        }
        std::vector<long long> ans{};
        long long p{2};
        while (n != 1)
        {
            while (n % p != 0)
            {
                p++;
                if (p * p > n)
                {
                    p = n;
                }
            }
            while (n % p == 0)
            {
                n /= p;
                ans.push_back(p);
            }
        }
        return ans;
    }

} // namespace prime_factors

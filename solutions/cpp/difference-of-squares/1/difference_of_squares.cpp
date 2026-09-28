#include "difference_of_squares.h"

namespace difference_of_squares
{

    int sum_of_squares(int n)
    {
        auto ans{0};
        for (auto i = 1; i <= n; i++)
        {
            ans += i * i;
        }
        return ans;
    }

    int square_of_sum(int n)
    {
        auto ans{0};
        for (auto i = 1; i <= n; i++)
        {
            ans += i;
        }
        return ans * ans;
    }

    int difference(int n)
    {
        return square_of_sum(n) - sum_of_squares(n);
    }

} // namespace difference_of_squares

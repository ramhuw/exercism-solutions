#include "hamming.h"

int compute(const char *lhs, const char *rhs)
{
    const char *l = lhs;
    const char *r = rhs;
    int ans = 0;
    while (*l != '\0' || *r != '\0')
    {
        if (*l == '\0' || *r == '\0')
        {
            return -1;
        }
        if (*l != *r)
        {
            ans++;
        }
        l += 1;
        r += 1;
    }
    return ans;
}
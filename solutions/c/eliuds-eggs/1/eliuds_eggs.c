#include "eliuds_eggs.h"

int egg_count(int e)
{
    int ans = 0;
    while (e != 0)
    {
        ans += e & 1;
        e >>= 1;
    }
    return ans;
}
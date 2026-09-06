#include "binary.h"
#include <string.h>

int convert(const char *input)
{
    int ans = 0;
    int n = strlen(input);
    for (int i = 0; i < n; i++)
    {
        if (input[n - 1 - i] == '1')
        {
            ans ^= 1 << i;
        }
        else if (input[n - 1 - i] != '0')
        {
            return -1;
        }
    }
    return ans;
}
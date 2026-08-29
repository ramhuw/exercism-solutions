#include "binary_search.h"

const int *binary_search(int value, const int *arr, size_t length)
{
    if (length == 0)
    {
        return NULL;
    }
    size_t l = 0;
    size_t r = length - 1;
    while (l < r)
    {
        size_t middle = (l + r + 1) / 2;
        if (arr[middle] <= value)
        {
            l = middle;
        }
        else
        {
            r = middle - 1;
        }
    }
    if (value == arr[l])
    {
        return &arr[l];
    }
    else
    {
        return NULL;
    }
}
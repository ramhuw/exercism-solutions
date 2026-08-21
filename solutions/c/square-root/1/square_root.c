#include "square_root.h"
int square_root(int n) {
    int left = 0;
    int right = n;
    while (left < right) {
        int middle = (left + right + 1) / 2;
        if (n / middle >= middle) {
            left = middle;
        } else {
            right = middle - 1;
        }
    }
    return left;
}
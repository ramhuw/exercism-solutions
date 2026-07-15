#include "grains.h"

uint64_t square(uint8_t index) {
    if (index == 1) {
        return 1;
    } else {
        return 2 * square(index-1);
    }
}
uint64_t total(void) {
    uint64_t ans = 0;
    uint64_t sq = 1;
    for (int i = 0; i < 64; i++) {
        ans += sq;
        sq *= 2;
    }
    return ans;
}
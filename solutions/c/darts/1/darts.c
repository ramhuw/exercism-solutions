#include "darts.h"

int score(coordinate_t point) {
    float r2 = point.x*point.x + point.y*point.y;
    if (r2 > 100) {
        return 0;
    } else if (r2 > 25) {
        return 1;
    } else if (r2 > 1) {
        return 5;
    } else {
        return 10;
    }
}
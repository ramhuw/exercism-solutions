#include "resistor_color.h"
#include<stdlib.h>

int color_code(resistor_band_t color) {
    return color;
}

resistor_band_t *colors(void) {
    resistor_band_t *arr = malloc(10 * sizeof(resistor_band_t));
    for (int i = 0; i < 10; i++) {
        arr[i] = i;
    }
    return arr;
}
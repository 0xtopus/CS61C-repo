#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include "lfsr.h"

void lfsr_calculate(uint16_t *reg) {
    /* YOUR CODE HERE */
    unsigned msb = (1u & *reg) ^ (1u & *reg >> 2) ^ (1u & *reg >> 3) ^ (1u & *reg >> 5);
    *reg = *reg >> 1;
    *reg |= msb << 15; 
}


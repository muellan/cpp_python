#include <iostream>

#include "prefix.h"

void prefix_sum(double* v, int len)
{
    for(int i = 1; i < len; ++i) {
        v[i] = v[i-1] + v[i];
    }
}


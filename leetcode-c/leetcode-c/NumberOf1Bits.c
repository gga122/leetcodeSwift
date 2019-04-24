//
//  NumberOf1Bits.c
//  leetcode-c
//
//  Created by Henry on 2019/4/25.
//  Copyright © 2019 Henry. All rights reserved.
//

#include "NumberOf1Bits.h"

int hammingWeight(uint32_t n) {
    int c = 0;
    for (int i = 0; i < 32; ++i) {
        if (n & 1) {
            c += 1;
        }
        
        n = n >> 1;
    }
    return c;
}

//
//  ReverseBits.c
//  leetcode-c
//
//  Created by Henry on 2019/4/26.
//  Copyright © 2019 Henry. All rights reserved.
//

#include "ReverseBits.h"

uint32_t reverseBits(uint32_t n) {
    uint32_t ret = 0;
    
    for (int i = 0; i < 32; ++i) {
        ret = ret << 1;
        int c = (n >> i) & 1;
        ret |= c;
    }
    
    return ret;
}

void testReverseBits(void) {
    /*
     input:  00000010100101000001111010011100
     output: 00111001011110000010100101000000
     */
    uint32_t a = reverseBits(43261596);
    printf("%u\n", a);
    
    /*
     input:  11111111111111111111111111111101
     output: 10111111111111111111111111111111
     */
    uint32_t b = reverseBits(4294967293);
    printf("%u\n", b);
}

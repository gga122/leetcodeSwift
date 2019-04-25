//
//  LinkedListCycle.h
//  leetcode-c
//
//  Created by Henry on 2019/4/25.
//  Copyright © 2019 Henry. All rights reserved.
//

#ifndef LinkedListCycle_h
#define LinkedListCycle_h

#include <stdio.h>
#include <stdbool.h>

struct ListNode {
    int val;
    struct ListNode *next;
};

extern bool hasCycle(struct ListNode *head);

extern void testHasCycle(void);

#endif /* LinkedListCycle_h */

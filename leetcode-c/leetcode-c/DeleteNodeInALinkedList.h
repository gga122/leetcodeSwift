//
//  DeleteNodeInALinkedList.h
//  leetcode-c
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

#ifndef DeleteNodeInALinkedList_h
#define DeleteNodeInALinkedList_h

#include <stdio.h>

struct ListNode {
    int val;
    struct ListNode *next;
};

typedef struct ListNode ListNode;

extern void deleteNode(struct ListNode* node);

extern void testDeleteNode(void);

#endif /* DeleteNodeInALinkedList_h */

//
//  DeleteNodeInALinkedList.c
//  leetcode-c
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

#include "DeleteNodeInALinkedList.h"

void deleteNode(struct ListNode* node) {
    struct ListNode *n = node;
    while (node->next != NULL) {
        node->val = node->next->val;
        node = node->next;
    }
    while (n->next != node) {
        n = n->next;
    }
    n->next = NULL;
}

void testDeleteNode(void) {
    ListNode a0, a1, a2, a3;
    a0.val = 4;
    a0.next = &a1;
    a1.val = 5;
    a1.next = &a2;
    a2.val = 1;
    a2.next = &a3;
    a3.val = 9;
    a3.next = NULL;
    
    deleteNode(&a2);
}

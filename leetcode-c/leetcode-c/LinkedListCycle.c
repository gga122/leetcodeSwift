//
//  LinkedListCycle.c
//  leetcode-c
//
//  Created by Henry on 2019/4/25.
//  Copyright © 2019 Henry. All rights reserved.
//

#include "LinkedListCycle.h"

bool hasCycle(struct ListNode *head) {
    if (head == NULL) {
        return false;
    }
    
    struct ListNode *fast = head->next;
    while (head != NULL && fast != NULL) {
        if (head == fast) {
            return true;
        }
        
        head = head->next;
        fast = fast->next;
        if (fast != NULL) {
            fast = fast->next;
        }
    }
    
    return false;
}

void testHasCycle(void) {
    struct ListNode n0, n1, n2, n3;
    n0.val = 3;
    n0.next = &n1;
    n1.val = 2;
    n1.next = &n2;
    n2.val = 0;
    n2.next = &n3;
    n3.val = -4;
    n3.next = &n2;
    bool flag = hasCycle(&n0);
    printf("%d\n", flag);
    
    struct ListNode m0, m1;
    m0.val = 1;
    m0.next = &m1;
    m1.val = 2;
    m1.next = &m0;
    flag = hasCycle(&m0);
    printf("%d\n", flag);
}

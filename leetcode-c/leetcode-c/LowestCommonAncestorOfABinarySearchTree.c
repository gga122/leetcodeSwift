//
//  LowestCommonAncestorOfABinarySearchTree.c
//  leetcode-c
//
//  Created by Henry on 2019/5/4.
//  Copyright © 2019 Henry. All rights reserved.
//

#include "LowestCommonAncestorOfABinarySearchTree.h"

struct TreeNode* lowestCommonAncestor(struct TreeNode* root, struct TreeNode* p, struct TreeNode* q) {
    if (p->val > q->val) {
        struct TreeNode *tmp = p;
        p = q;
        q = tmp;
        tmp = NULL;
    }
    
    if (p->val < root->val && q->val > root->val) {
        return root;
    }
    if (p->val == root->val || q->val == root->val) {
        return root;
    }
    
    if (p->val < root->val && q->val < root->val) {
        return lowestCommonAncestor(root->left, p, q);
    }
    
    return lowestCommonAncestor(root->right, p, q);
}

void testLowestCommonAncestor(void) {
    struct TreeNode a0, a1, a2, a3, a4, a5, a6, a9, a10;
    a0.val = 6;
    a1.val = 2;
    a0.left = &a1;
    a2.val = 8;
    a0.right = &a2;
    a3.val = 0;
    a1.left = &a3;
    a4.val = 4;
    a1.right = &a4;
    a5.val = 7;
    a2.left = &a5;
    a6.val = 9;
    a2.right = &a6;
    a9.val = 3;
    a4.left = &a9;
    a10.val = 5;
    a4.right = &a10;
    
    printf("%d\n", lowestCommonAncestor(&a0, &a1, &a4)->val);
    
    struct TreeNode b0, b1;
    b0.val = 2;
    b1.val = 1;
    b0.left = &b1;
    printf("%d\n", lowestCommonAncestor(&b0, &b0, &b1)->val);
    
    struct TreeNode c0, c1, c2;
    c0.val = 2;
    c1.val = 1;
    c2.val = 3;
    c0.left = &c1;
    c0.right = &c2;
    printf("%d\n", lowestCommonAncestor(&c0, &c2, &c1)->val);
}

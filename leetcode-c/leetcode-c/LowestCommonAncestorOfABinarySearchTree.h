//
//  LowestCommonAncestorOfABinarySearchTree.h
//  leetcode-c
//
//  Created by Henry on 2019/5/4.
//  Copyright © 2019 Henry. All rights reserved.
//

#ifndef LowestCommonAncestorOfABinarySearchTree_h
#define LowestCommonAncestorOfABinarySearchTree_h

#include <stdio.h>

struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
};

extern struct TreeNode* lowestCommonAncestor(struct TreeNode* root, struct TreeNode* p, struct TreeNode* q);

extern void testLowestCommonAncestor(void);

#endif /* LowestCommonAncestorOfABinarySearchTree_h */

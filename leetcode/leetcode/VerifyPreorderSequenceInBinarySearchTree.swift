//
//  VerifyPreorderSequenceInBinarySearchTree.swift
//  leetcode
//
//  Created by MickyZhu on 11/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class VerifyPreorderSequenceInBinarySearchTreeSolution {
    func verifyPreorder(_ preorder: [Int]) -> Bool {
        var stack = [Int]()
        var minVal = Int.min
        for i in 0..<preorder.count {
            let val = preorder[i]
            if val < minVal {
                return false
            }
            
            while !stack.isEmpty && val > stack.last! {
                minVal = stack.removeLast()
            }
            
            stack.append(val)
        }
        
        return true
    }
    
    func test() -> Void {
        print(verifyPreorder([5,2,6,1,3]))
        print(verifyPreorder([5,2,1,3,6]))
    }
}

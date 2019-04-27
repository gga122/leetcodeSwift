//
//  SquaresOfASortedArray.swift
//  leetcode
//
//  Created by Henry on 2019/4/27.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SquaresOfASortedArraySolution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        if A.count == 0 {
            return []
        }
        if A.count == 1{
            return [A.first! * A.first!]
        }
        
        var squares = [Int]()
        var left = 0
        var right = A.count - 1
        while right >= left {
            let absLeftValue = abs(A[left])
            let absRightValue = abs(A[right])
            
            if absLeftValue < absRightValue {
                let square = absRightValue * absRightValue
                right -= 1
                squares.insert(square, at: 0)
            } else {
                let square = absLeftValue * absLeftValue
                left += 1
                squares.insert(square, at: 0)
            }
        }
        
        return squares
    }
    
    func test() -> Void {
        print(sortedSquares([-4, -1, 0, 3, 10]))
        print(sortedSquares([-7, -3, 2, 3, 11]))
    }
}

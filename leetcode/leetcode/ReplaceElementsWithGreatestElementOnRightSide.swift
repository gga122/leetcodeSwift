//
//  ReplaceElementsWithGreatestElementOnRightSide.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ReplaceElementsWithGreatestElementOnRightSideSolution {
    func replaceElements(_ arr: [Int]) -> [Int] {
        if arr.count == 0 {
            return []
        }
        if arr.count == 1 {
            return [-1]
        }
        if arr.count == 2 {
            return [arr[1], -1]
        }
        
        var results = arr
        results[results.count-1] = -1
        results[results.count-2] = arr.last!
        for i in (0..<arr.count-2).reversed() {
            results[i] = max(results[i+1], arr[i+1])
        }
        
        return results
    }
    
    func test() -> Void {
        print(replaceElements([17,18,5,4,6,1]))
    }    
}

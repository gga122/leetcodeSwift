//
//  FindSmallestLetterGreaterThanTarget.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindSmallestLetterGreaterThanTargetSolution {
    func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
        if letters.count == 1 {
            return letters.first!
        }
        
        if target >= letters.last! || target < letters.first! {
            return letters[0]
        }
        
        var left = 0
        var right = letters.count - 1
        while left < right {
            let mid = (right - left) / 2 + left
            if letters[mid] <= target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return letters[right]
    }
    
    func test() -> Void {
        print(nextGreatestLetter(["c", "f", "j"], "a"))
        print(nextGreatestLetter(["c", "f", "j"], "c"))
        print(nextGreatestLetter(["c", "f", "j"], "d"))
        print(nextGreatestLetter(["c", "f", "j"], "g"))
        print(nextGreatestLetter(["c", "f", "j"], "j"))
        print(nextGreatestLetter(["c", "f", "j"], "k"))
        print(nextGreatestLetter(["e", "e", "e", "e", "e", "e", "n", "n", "n", "n"], "e"))
    }
}

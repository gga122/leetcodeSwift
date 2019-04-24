//
//  LengthOfLastWord.swift
//  leetcode
//
//  Created by Henry on 2019/4/24.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LengthOfLastWordSolution {
    func lengthOfLastWord(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }

        let chars = Array(s)
        var index = s.count - 1
        var count = 0
        let space: Character = " "
        while index >= 0 {
            let c = chars[index]
            if c != space {
                count += 1
            } else {
                if count > 0 {
                    break
                }
            }
            
            index -= 1
        }
        
        return count
    }
    
    func test() -> Void {
        print(lengthOfLastWord("Hello World"))
        print(lengthOfLastWord("a"))
    }
}

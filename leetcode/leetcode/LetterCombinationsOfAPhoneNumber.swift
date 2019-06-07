//
//  LetterCombinationsOfAPhoneNumber.swift
//  leetcode
//
//  Created by Henry on 2019/6/7.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LetterCombinationsOfAPhoneNumberSolution {
    func letterCombinations(_ digits: String) -> [String] {{
        let hashs: [Character: [Character]] = ["1": [],
                                               "2": ["a", "b", "c"],
                                               "3": ["d", "e", "f"],
                                               "4": ["g", "h", "i"],
                                               "5": ["j", "k", "l"],
                                               "6": ["m", "n", "o"],
                                               "7": ["p", "q", "r", "s"],
                                               "8": ["t", "u", "v"],
                                               "9": ["w", "x", "y", "z"]]
        let digitChars = Array(digits)
        if digitChars.isEmpty {
            return []
        }
        var ret = [String]()
        var tmp = [Character]()
        backTracking(&ret, digitChars, 0, hashs, &tmp)
        return ret
    }
    
    func backTracking(_ res: inout [String], _ digits: [Character], _ idx: Int, _ hashs: [Character: [Character]], _ tmp: inout [Character]) -> Void {
        if idx == digits.count {
            let str = String(tmp)
            res.append(str)
        } else {
            let curDigit = digits[idx]
            let charSet = hashs[curDigit]!
            if charSet.isEmpty {
                backTracking(&res, digits, idx+1, hashs, &tmp)
            } else {
                for c in charSet {
                    tmp.append(c)
                    backTracking(&res, digits, idx+1, hashs, &tmp)
                    tmp.removeLast()
                }
            }
        }
    }
    
    func test() -> Void {
        print(letterCombinations("23"))
    }
}

//
//  VerbalArithmeticPuzzle.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

#warning("Uresolved problem!")
class VerbalArithmeticPuzzleSolution {
    func isSolvable(_ words: [String], _ result: String) -> Bool {
        let base = Character("A").asciiValue!
        
        /* Max letter count is 10, only uppercase characters */
        var c = [Int].init(repeating: -1, count: 26)  // character to num
        var flag = [Bool].init(repeating: true, count: 10)  // true when can be zero at begin
        var aim = [Int].init(repeating: 0, count: 10)  // target num
        var numFlag = [Bool].init(repeating: false, count: 10)  // true when num has used
        var top = 0
        
        for i in 0..<words.count {
            let word = words[i]
            let chars = Array(word)
            for j in 0..<chars.count {
                let char = chars[j]
                let x = base.distance(to: char.asciiValue!)
                if c[x] == -1 {
                    c[x] = top
                    top += 1
                }
                if j == 0 {
                    flag[c[x]] = false
                }
            }
        }
        let resultArray = Array(result)
        for i in 0..<resultArray.count {
            let char = resultArray[i]
            let x = base.distance(to: char.asciiValue!)
            if c[x] == -1 {
                c[x] = top
                top += 1
            }
            if i == 0 {
                flag[c[x]] = false
            }
        }
        
        return backTrace(0, top, c, aim, flag, &numFlag, words, result)
    }
    
    func backTrace(_ deep: Int, _ max: Int, _ c: [Int], _ aim: [Int], _ flag: [Bool], _ numFlag: inout [Bool], _ words: [String], _ result: String) -> Bool {
        if deep == max {
            var leftSum = 0
            var rightSum = 0
            for word in words {
                leftSum += sum(word, c, aim)
            }
            rightSum = sum(result, c, aim)
            return leftSum == rightSum
        }
        
        for i in 0...9 {
            if numFlag[i] {
                /* skip used num */
                continue
            }
            if i == 0 && !flag[deep] {
                /* the character can not be 0 at begin */
                continue
            }
            
            var aim = aim
            numFlag[i] = true
            aim[deep] = i
            if backTrace(deep+1, max, c, aim, flag, &numFlag, words, result) {
                return true
            }
            numFlag[i] = false
        }
        
        return false
    }
    
    func sum(_ s: String, _ c: [Int], _ aim: [Int]) -> Int {
        var ans = 0
        let base = Character("A").asciiValue!
        let chars = Array(s)
        for i in 0..<chars.count {
            let char = chars[i]
            let x = base.distance(to: char.asciiValue!)
            ans = ans * 10 + aim[c[x]]
        }
        return ans;
    }
    
    func test() -> Void {
        print(isSolvable(["SEND","MORE"], "MONEY"))
        print(isSolvable(["SIX","SEVEN","SEVEN"], "TWENTY"))
        print(isSolvable(["THIS","IS","TOO"], "FUNNY"))
        print(isSolvable(["LEET","CODE"], "POINT"))
    }
}

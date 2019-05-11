//
//  RansomNote.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RansomNoteSolution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var ransomDic = [Character: Int]()
        for c in ransomNote {
            if let count = ransomDic[c] {
                ransomDic[c] = count + 1
            } else {
                ransomDic[c] = 1
            }
        }
        var magazineDic = [Character: Int]()
        for c in magazine {
            if let count = magazineDic[c] {
                magazineDic[c] = count + 1
            } else {
                magazineDic[c] = 1
            }
        }

        for (k, v) in ransomDic {
            if let count = magazineDic[k] {
                if v > count {
                    return false
                }
            } else {
                return false
            }
        }
        
        return true
    }
    
    func test() -> Void {
        print(canConstruct("a", "b"))
        print(canConstruct("aa", "ab"))
        print(canConstruct("aa", "aab"))
    }
}

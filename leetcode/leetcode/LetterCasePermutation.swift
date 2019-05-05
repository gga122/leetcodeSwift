//
//  LetterCasePermutation.swift
//  leetcode
//
//  Created by Henry on 2019/5/5.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LetterCasePermutationSolution {
    
    let a = Int("a".unicodeScalars.first!.value)
    let z = Int("z".unicodeScalars.first!.value)
    let A = Int("A".unicodeScalars.first!.value)
    let Z = Int("Z".unicodeScalars.first!.value)
    let dis = 32
    
    func letterCasePermutation(_ S: String) -> [String] {
        if S.count == 0 {
            return []
        }
        
        let chars = Array(S)
        let ret = backtraceHelper(chars, 0)
        
        return ret
    }
    
    func backtraceHelper(_ chars: [Character], _ index: Int) -> [String] {
        var ret = [String]()
        ret.append(String(chars))
        var chars = chars
        var i = index
        while i < chars.count {
            var cValue = Int(chars[i].unicodeScalars.first!.value)
            if cValue >= a && cValue <= z {
                cValue -= dis
                chars[i] = Character.init(UnicodeScalar.init(cValue)!)
                ret += backtraceHelper(chars, i + 1)
                cValue += dis
                chars[i] = Character.init(UnicodeScalar.init(cValue)!)
            } else if cValue >= A && cValue <= Z {
                cValue += dis
                chars[i] = Character.init(UnicodeScalar.init(cValue)!)
                ret += backtraceHelper(chars, i + 1)
                cValue -= dis
                chars[i] = Character.init(UnicodeScalar.init(cValue)!)
            }
            
            i += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(letterCasePermutation("a1b2"))
        print(letterCasePermutation("3z4"))
        print(letterCasePermutation("12345"))
    }
}

//
//  UncommonWordsFromTwoSentences.swift
//  leetcode
//
//  Created by Henry on 2019/5/6.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class UncommonWordsFromTwoSentencesSolution {
    func uncommonFromSentences(_ A: String, _ B: String) -> [String] {
        let S = A + " " + B
        let subStrings = S.split(separator: " ")
        var subs = [String: Int]()
        for str in subStrings {
            let s = String(str)
            let c = subs[s]
            if c == nil {
                subs[s] = 1
            } else {
                subs[s] = c! + 1
            }
        }
        
        var ret = [String]()
        for (k, v) in subs {
            if v == 1 {
                ret.append(k)
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(uncommonFromSentences("this apple is sweet", "this apple is sour"))
        print(uncommonFromSentences("apple apple", "banana"))
    }
}

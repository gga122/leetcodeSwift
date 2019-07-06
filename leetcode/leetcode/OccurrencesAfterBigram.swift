//
//  OccurrencesAfterBigram.swift
//  leetcode
//
//  Created by Henry on 2019/7/6.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class OccurrencesAfterBigramSolution {
    func findOcurrences(_ text: String, _ first: String, _ second: String) -> [String] {
        var words = text.components(separatedBy: " ")
        var ret = [String]()
        for i in 0..<words.count-2 {
            if words[i] == first && words[i+1] == second {
                ret.append(words[i+2])
            }
        }
        
        return ret
    }
    
    func test() -> Void {
        print(findOcurrences("alice is a good girl she is a good student", "a", "good"))
        print(findOcurrences("we will we will rock you", "we", "will"))
    }
}

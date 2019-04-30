    //
//  FindCommonCharacters.swift
//  leetcode
//
//  Created by Henry on 2019/5/1.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindCommonCharactersSolution {
    func commonChars(_ A: [String]) -> [String] {
        if A.count == 0 {
            return []
        }
        
        var dictionarys = [[Character: Int]]()
        var minDictionary: Dictionary<Character, Int>? = nil
        for str in A {
            var dictionary = [Character: Int]()
            for c in str {
                let count = dictionary[c]
                if count == nil {
                    dictionary[c] = 1
                } else {
                    dictionary[c] = count! + 1
                }
            }
            if minDictionary == nil {
                minDictionary = dictionary
            } else {
                if minDictionary!.count > dictionary.count {
                    dictionarys.append(minDictionary!)
                    minDictionary = dictionary
                } else {
                    dictionarys.append(dictionary)
                }
            }
        }
        
        var strs = [String]()
        for (char, count) in minDictionary! {
            var numbers = count
            for dictionary in dictionarys {
                if dictionary[char] == nil {
                    numbers = 0
                    break
                }
                
                if dictionary[char]! < numbers {
                    numbers = dictionary[char]!
                }
            }
            
            while numbers > 0 {
                strs.append(String(char))
                numbers -= 1
            }
        }
        
        return strs
    }
    
    func test() -> Void {
        print(commonChars(["bella", "label", "roller"]))
        print(commonChars(["cool", "lock", "cook"]))
    }
}

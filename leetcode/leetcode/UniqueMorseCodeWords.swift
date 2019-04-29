//
//  UniqueMorseCodeWords.swift
//  leetcode
//
//  Created by Henry on 2019/4/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class UniqueMorseCodeWordsSolution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        if words.count <= 1 {
            return words.count
        }
        
        let morses = [".-",
                      "-...",
                      "-.-.",
                      "-..",
                      ".",
                      "..-.",
                      "--.",
                      "....",
                      "..",
                      ".---",
                      "-.-",
                      ".-..",
                      "--",
                      "-.",
                      "---",
                      ".--.",
                      "--.-",
                      ".-.",
                      "...",
                      "-",
                      "..-",
                      "...-",
                      ".--",
                      "-..-",
                      "-.--",
                      "--.."]
        
        var set = Set<String>.init()
        let base = "a".unicodeScalars.first!.value
        for word in words {
            var morseStr = ""
            for c in word {
                let index = base.distance(to: c.unicodeScalars.first!.value)
                morseStr.append(morses[index])
            }
            set.insert(morseStr)
        }
        
        return set.count
    }
    
    func test() -> Void {
        print(uniqueMorseRepresentations(["gin", "zen", "gig", "msg"]))
    }
}

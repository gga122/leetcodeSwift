//
//  SentenceSimilarity.swift
//  leetcode
//
//  Created by MickyZhu on 10/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class SentenceSimilaritySolution {
    func areSentencesSimilar(_ words1: [String], _ words2: [String], _ pairs: [[String]]) -> Bool {
        if words1.count != words2.count {
            return false
        }
        
        var set = Set<String>()
        for pair in pairs {
            let w1 = pair[0]
            let w2 = pair[1]
            let c1 = "\(w1)_\(w2)"
            set.insert(c1)
            let c2 = "\(w2)_\(w1)"
            set.insert(c2)
        }
        
        for i in 0..<words1.count {
            let word1 = words1[i]
            let word2 = words2[i]
            if word1 == word2 {
                continue
            }
            
            let c = "\(word1)_\(word2)"
            if !set.contains(c) {
                return false
            }
        }
        
        return true
    }
    
    func test() -> Void {
        print(areSentencesSimilar(["great"], ["great"], []))
        print(areSentencesSimilar(["an","extraordinary","meal"], ["one","good","dinner"],    [["great","good"],["extraordinary","good"],["well","good"],["wonderful","good"],["excellent","good"],["fine","good"],["nice","good"],["any","one"],["some","one"],["unique","one"],["the","one"],["an","one"],["single","one"],["a","one"],["truck","car"],["wagon","car"],["automobile","car"],["auto","car"],["vehicle","car"],["entertain","have"],["drink","have"],["eat","have"],["take","have"],["fruits","meal"],["brunch","meal"],["breakfast","meal"],["food","meal"],["dinner","meal"],["super","meal"],["lunch","meal"],["possess","own"],["keep","own"],["have","own"],["extremely","very"],["actually","very"],["really","very"],["super","very"]]))
    }
}

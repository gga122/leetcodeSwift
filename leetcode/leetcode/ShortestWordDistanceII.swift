//
//  ShortestWordDistanceII.swift
//  leetcode
//
//  Created by Henry on 2019/6/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ShortestWordDistanceII {
    
    var hashs: NSMutableDictionary
    
    init(_ words: [String]) {
        let dic = NSMutableDictionary.init()
        
        for i in 0..<words.count {
            let word = words[i]
            if dic[word] == nil {
                let array = NSMutableArray.init()
                array.add(i)
                dic[word] = array
            } else {
                let array = dic[word] as! NSMutableArray
                array.add(i)
            }
        }
        
        hashs = dic
    }
    
    func shortest(_ word1: String, _ word2: String) -> Int {
        let indexes1 = self.hashs[word1] as! NSMutableArray
        let indexes2 = self.hashs[word2] as! NSMutableArray
        
        var ret = Int.max
        var i = 0
        while i < indexes1.count {
            var j = 0
            while j < indexes2.count {
                let index1 = indexes1.object(at: i) as! Int
                let index2 = indexes2.object(at: j) as! Int
                ret = min(ret, abs(index1-index2))
                j += 1
            }
            i += 1
        }

        return ret
    }
    
    func test() -> Void {
        print(shortest("coding", "practice"))
    }
}

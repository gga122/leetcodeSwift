//
//  FindAnagramMappings.swift
//  leetcode
//
//  Created by MickyZhu on 5/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class FindAnagramMappingsSolution {
    func anagramMappings(_ A: [Int], _ B: [Int]) -> [Int] {
        var hashs = [Int: [Int]]()
        for i in 0..<B.count {
            if let indexes = hashs[B[i]] {
                var newIndexes = indexes
                newIndexes.append(i)
                hashs[B[i]] = newIndexes
            } else {
                hashs[B[i]] = [i]
            }
        }
        
        var res = [Int]()
        for n in A {
            if var indexes = hashs[n] {
                res.append(indexes.removeLast())
                if !indexes.isEmpty {
                    hashs[n] = indexes
                }
            }
        }
        
        return res
    }
    
    func test() -> Void {
        print(anagramMappings([12, 28, 46, 32, 50], [50, 12, 32, 46, 28]))
    }
}

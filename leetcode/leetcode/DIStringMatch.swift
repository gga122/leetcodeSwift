//
//  DIStringMatch.swift
//  leetcode
//
//  Created by Henry on 2019/4/29.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DIStringMatchSolution {
    func diStringMatch(_ S: String) -> [Int] {
        var ret = [Int]()
        var end = S.count
        var start = 0
        for char in S {
            switch char {
            case "I":
                ret.append(start)
                start += 1
                break
            case "D":
                ret.append(end)
                end -= 1
                break
            default:
                break
            }
        }
        ret.append(end)
        
        return ret
    }
    
    func test() -> Void {
        print(diStringMatch("IDID"))
        print(diStringMatch("III"))
        print(diStringMatch("DDI"))
    }
}

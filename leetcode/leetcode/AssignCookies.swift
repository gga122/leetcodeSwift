//
//  AssignCookies.swift
//  leetcode
//
//  Created by Henry on 2019/4/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class AssignCookiesSolution {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        if g.count == 0 || s.count == 0 {
            return 0
        }
        
        var g = g
        g.sort()
        var s = s
        s.sort()
        
        var sIndex = 0
        var gIndex = 0
        while sIndex < s.count && gIndex < g.count {
            if g[gIndex] <= s[sIndex] {
                gIndex += 1
            }
            
            sIndex += 1
        }
        
        return gIndex
    }
    
    func test() -> Void {
        print(findContentChildren([1, 2, 3], [1, 1]))
        print(findContentChildren([1, 2], [1, 2, 3]))
        print(findContentChildren([1, 2, 3], [3]))
        print(findContentChildren([10, 9, 8, 7, 10, 9, 8, 7], [10, 9, 8, 7]))
        print(findContentChildren([10, 9, 8, 7], [5, 6, 7, 8]))
    }
}

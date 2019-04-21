//
//  BackspaceStringCompare.swift
//  leetcode
//
//  Created by Henry on 2019/4/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class BackspaceStringCompareSolution {
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        var sStack = [Character]()
        for c in S {
            if c != "#" {
                sStack.append(c)
            } else {
                if !sStack.isEmpty {
                    sStack.removeLast()
                }
            }
        }
        
        var tStack = [Character]()
        for c in T {
            if c != "#" {
                tStack.append(c)
            } else {
                if !tStack.isEmpty {
                    tStack.removeLast()
                }
            }
        }
        
        if sStack.count != tStack.count {
            return false
        }

        var index = 0
        while index < sStack.count {
            if sStack[index] != tStack[index] {
                return false
            }
            
            index += 1
        }
        
        return true
    }
    
    func test() -> Void {
        print(backspaceCompare("ab#c", "ad#c"))
        print(backspaceCompare("ab##", "c#d#"))
        print(backspaceCompare("a##c", "#a#c"))
        print(backspaceCompare("a#c", "b"))
    }
}

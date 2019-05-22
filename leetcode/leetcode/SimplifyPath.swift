//
//  SimplifyPath.swift
//  leetcode
//
//  Created by Henry on 2019/5/22.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class SimplifyPathSolution {
    func simplifyPath(_ path: String) -> String {
        let chars = Array(path)
        
        var componentStack = [String]()
        var current = ""
        for c in chars {
            if c == "/" {
                if current == ".." {
                    if componentStack.count > 0 {
                        componentStack.removeLast()
                    }
                    current = ""
                } else if current == "." || current == "" {
                    current = ""
                } else {
                    componentStack.append(current)
                    current = ""
                }
            } else {
                current.append(c)
            }
        }
        if current == ".." {
            if componentStack.count > 0 {
                componentStack.removeLast()
            }
            current = ""
        } else if current == "." || current == "" {
            current = ""
        } else {
            componentStack.append(current)
            current = ""
        }
        
        let absolutedPath = componentStack.joined(separator: "/")
        return "/" + absolutedPath
    }
    
    func test() -> Void {
        print(simplifyPath("/home/"))
        print(simplifyPath("/../"))
        print(simplifyPath("/home//foo/"))
        print(simplifyPath("/a/./b/../../c/"))
        print(simplifyPath("/a/../../b/../c//.//"))
        print(simplifyPath("/a//b////c/d//././/.."))
        print(simplifyPath("/..."))
        print(simplifyPath("/a/./b/../../c/"))
        print(simplifyPath("/."))
    }
}

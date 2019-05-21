//
//  RestoreIPAddresses.swift
//  leetcode
//
//  Created by Henry on 2019/5/21.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RestoreIPAddressesSolution {
    func restoreIpAddresses(_ s: String) -> [String] {
        if s.count <= 3 {
            return []
        }
        
        var ret = [String]()
        var tmp = [String]()
        backTracking(&ret, Array(s), &tmp, 0)
        return ret
    }
    
    func backTracking(_ result: inout [String], _ chars: [Character], _ tmp: inout [String], _ index: Int) -> Void {
        if index == chars.count {
            if tmp.count == 4 {
                let v = tmp.joined(separator: ".")
                result.append(v)
            }
        } else {
            /* Skip useless back tracking */
            if tmp.count == 4 {
                return
            }
            
            var i = index
            /* For each component, the length is [1, 3] and index is [0, 2]  */
            while i < chars.count && i <= index + 2 {
                /* We MUST skip component that start with 0 but component length greater than 1, like 00, 01, 001, 010., etc */
                if i - index != 0 && chars[index] == "0" {
                    break
                }
                
                let sub = chars[index...i]
                let v = String(sub)
                if Int(v)! <= 255 {
                    tmp.append(v)
                    backTracking(&result, chars, &tmp, i + 1)
                    tmp.removeLast()
                }
                
                i += 1
            }
        }
    }
    
    func test() -> Void {
        print(restoreIpAddresses("25525511135"))
        print(restoreIpAddresses("0000"))
        print(restoreIpAddresses("010010"))
    }
}

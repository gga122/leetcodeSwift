//
//  NumberOfAtoms.swift
//  leetcode
//
//  Created by Henry on 2019/6/10.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class NumberOfAtomsSolution {
    func countOfAtoms(_ formula: String) -> String {
        guard formula.count > 0 else {
            return formula
        }
        
        let chars = Array(formula)
        let res = helper(chars, 0)
        let ret = res.0.sorted(by: {$0.key < $1.key})
        var str = ""
        for (k,v) in ret {
            if v > 1 {
                str += "\(k)\(v)"
            } else {
                str += "\(k)"
            }
        }
        
        return str
    }
    
    func helper(_ chars: [Character], _ index: Int) -> ([String: Int], Int) {
        var res = [String: Int]()
        var stack = [[String: Int]]()
        var i = index
        while i < chars.count {
            let c = chars[i]
            
            if c == "(" {
                stack.append(res)
                res.removeAll()
                i += 1
            } else if c == ")" {
                var right =  i + 1
                var val = 0
                while right < chars.count && chars[right].isNumber {
                    val = val * 10 + Int(String(chars[right]))!
                    right += 1
                }
                if val == 0 { val = 1 }
                for (k,v) in res {
                    res[k] = v * val
                }
                if !stack.isEmpty {
                    let tmp = stack.removeLast()
                    res.merge(tmp) { (v1, v2) -> Int in
                        return v1+v2
                    }
                }
                i = right
            } else {
                var right = i + 1
                while right < chars.count && chars[right].isLetter && chars[right].isLowercase {
                    right += 1
                }
                let atom = String(chars[i..<right])
                
                i = right
                var val = 0
                while i < chars.count && chars[i].isNumber {
                    val = val * 10 + Int(String(chars[i]))!
                    i += 1
                }
                if val == 0 { val = 1 }
                res[atom] = (res[atom] ?? 0) + val
            }
        }
        return (res, i)
    }
    
    func test() -> Void {
        print(countOfAtoms("H2O"))
        print(countOfAtoms("Mg(OH)2"))
        print(countOfAtoms("K4(ON(SO3)2)2"))
        print(countOfAtoms("(NB3)33"))
    }
}

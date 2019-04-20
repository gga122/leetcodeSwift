//
//  AddStrings.swift
//  leetcode
//
//  Created by Henry on 2019/4/19.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class AddStringsSolution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        var arr_num1 = Array(num1).map { Int("\($0)")! }
        var arr_num2 = Array(num2).map { Int("\($0)")! }
        var res = "", cur = 0, asc = 0
        
        while cur < arr_num1.count || cur < arr_num2.count {
            let idx_1 = arr_num1.count - cur - 1
            let idx_2 = arr_num2.count - cur - 1
            var val = asc
            if idx_1 >= 0 {
                val += arr_num1[idx_1]
            }
            if idx_2 >= 0 {
                val += arr_num2[idx_2]
            }
            res = "\(val % 10)" + res
            asc = val / 10
            cur += 1
        }
        if asc > 0 {
            res = "\(asc)" + res
        }
        return res
        
//        var s = Array<Character>.init()
//        let mCount = num1.count
//        let nCount = num2.count
//        let m = max(nCount, mCount)
//
//        var carry = 0
//        let zero = "0".unicodeScalars.first!.value
//
//        for index in stride(from: 0, to: m, by: 1) {
//            if index < num1.count {
//                let mIndex = num1.index(num1.endIndex, offsetBy: (-1 - index))
//                if (mIndex >= num1.startIndex && mIndex < num1.endIndex) {
//                    let c = num1[mIndex].unicodeScalars.first!.value
//                    carry += zero.distance(to: c)
//                }
//            }
//
//            if index < num2.count {
//                let nIndex = num2.index(num2.endIndex, offsetBy: (-1 - index))
//                if (nIndex >= num2.startIndex && nIndex <= num2.endIndex) {
//                    let c = num2[nIndex].unicodeScalars.first!.value
//                    carry += zero.distance(to: c)
//                }
//            }
//
//            let v = "\(carry % 10)"
//            carry /= 10
//            s += v
//        }
//        if carry > 0 {
//            s += "\(carry)"
//        }
//
//        return String.init(s.reversed())
    }
    
    func test() -> Void {
        print(addStrings("9", "99"))
        print(addStrings("1", "9"))
        print(addStrings("0", "0"))
        print(addStrings("1234", "2222"))
        print(addStrings("0", "2222"))
    }
}

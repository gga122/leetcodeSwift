//
//  FizzBuzz.swift
//  leetcode
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FizzBuzzSolution {
    func fizzBuzz(_ n: Int) -> [String] {
        var ret = [String]()
        var i = 1
        while i <= n {
            var str = ""
            if i % 3 == 0 {
                str = str + "Fizz"
            }
            if i % 5 == 0 {
                str = str + "Buzz"
            }
            if str == "" {
                str = "\(i)"
            }
            ret.append(str)
            
            i += 1
        }
        
        return ret
    }
    
    func test() -> Void {
        print(fizzBuzz(15))
    }
}

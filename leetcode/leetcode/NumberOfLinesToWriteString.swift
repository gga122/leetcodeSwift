//
//  NumberOfLinesToWriteString.swift
//  leetcode
//
//  Created by Henry on 2019/5/2.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class NumberOfLinesToWriteStringSolution {
    func numberOfLines(_ widths: [Int], _ S: String) -> [Int] {
        let maxLineWidth = 100
        
        let chars = Array(S)
        var lineIndex = 0
        var used = 0
        var i = 0
        let base = "a".unicodeScalars.first!.value
        while i < chars.count {
            let value = chars[i].unicodeScalars.first!.value
            let index = base.distance(to: value)
            let width = widths[index]
            if used + width > maxLineWidth {
                lineIndex += 1
                used = width
            } else {
                used += width
            }
            
            i += 1
        }
        
        return [lineIndex + 1, used]
    }
    
    func test() -> Void {
        print(numberOfLines([10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], "abcdefghijklmnopqrstuvwxyz"))
        print(numberOfLines([4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10], "bbbcccdddaaa"))
    }
}

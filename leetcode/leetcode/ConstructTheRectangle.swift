//
//  ConstructTheRectangle.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ConstructTheRectangleSolution {
    func constructRectangle(_ area: Int) -> [Int] {
        if area == 1 {
            return [1, 1]
        }
        
        let sqrtValue = sqrt(Double(area))
        var floorValue = Int(floor(sqrtValue))
        while area % floorValue != 0 {
            floorValue -= 1
        }
    
        return [area / floorValue, floorValue]
    }
    
    func test() -> Void {
        print(constructRectangle(4))
    }
}

//
//  StudentAttendanceRecordI.swift
//  leetcode
//
//  Created by Henry on 2019/5/11.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class StudentAttendanceRecordISolution {
    func checkRecord(_ s: String) -> Bool {
        if s.count == 0 {
            return false
        }
        if s.count == 1 {
            return true
        }
        
        var lCount = 0
        var aCount = 0
        for c in s {
            switch c {
            case "A":
                if aCount == 1 {
                    return false
                } else {
                    aCount += 1
                }
                lCount = 0
                break
            case "L":
                if lCount == 2 {
                    return false
                } else {
                    lCount += 1
                }
                break
            case "P":
                lCount = 0
                break
            default:
                break
            }
        }
        
        return true
    }
    
    func test() -> Void {
        print(checkRecord("PPALLP"))
        print(checkRecord("PPALLL"))
    }
}

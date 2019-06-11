//
//  MeetingRooms.swift
//  leetcode
//
//  Created by Henry on 2019/6/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MeetingRoomsSolution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        if intervals.count <= 1 {
            return true
        }
        
        var intervals = intervals
        intervals.sort { (i1, i2) -> Bool in
            return i1[0] < i2[0]
        }
        
        let begin = intervals[0][0]
        var end = intervals[0][1]
        for i in 1..<intervals.count {
            let range = intervals[i]
            if range[0] >= begin && range[0] < end {
                return false
            }
            
            end = range[1]
        }
        
        return true
    }
    
    func test() -> Void {
        print(canAttendMeetings([[0,30],[5,10],[15,20]]))
        print(canAttendMeetings([[7,10],[2,4]]))
    }
}

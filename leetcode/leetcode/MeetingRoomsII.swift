//
//  MeetingRoomsII.swift
//  leetcode
//
//  Created by Henry on 2020/1/18.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class MeetingRoomsIISolution {
    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        if intervals.count <= 1 {
            return intervals.count
        }
        
        var sorted = intervals.sorted { (entry1, entry2) -> Bool in
            return entry1[0] < entry2[0]
        }
        
        var count = 1
        var previous = sorted.removeFirst()
        while !sorted.isEmpty {
            var i = 0
            while i < sorted.count {
                let current = sorted[i]
                if current[0] >= previous[1] {
                    previous = sorted.remove(at: i)
                } else {
                    i += 1
                }
            }
            
            if sorted.count > 0 {
                count += 1
                previous = sorted.removeFirst()
            }
        }
        
        return count
    }
    
    func test() -> Void {
        print(minMeetingRooms([[0, 30],[5, 10],[15, 20]]))
        print(minMeetingRooms([[7,10],[2,4]]))
        print(minMeetingRooms([[1,5],[8,9],[8,9]]))
    }
}

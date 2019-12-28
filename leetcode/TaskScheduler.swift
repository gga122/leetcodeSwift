//
//  TaskScheduler.swift
//  leetcode
//
//  Created by mickyzhu on 2019/12/28.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class TaskSchedulerSolution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        if n == 0 || tasks.count <= 1 {
            return tasks.count
        }
        
        var entries = [Int].init(repeating: 0, count: 26)
        let base = Character.init("A").asciiValue!
        for task in tasks {
            let index = base.distance(to: task.asciiValue!)
            entries[index] += 1
        }
        
        entries = entries.sorted { (val1, val2) -> Bool in
            return val1 > val2
        }
        
        var maxCount = 0
        for entry in entries {
            if entry > 0 {
                maxCount += 1
            } else {
                break
            }
        }
        
        let maxVal = entries[0] - 1
        var idleSlots = maxVal * n
        var i = 1
        while i < maxCount && entries[i] > 0 {
            idleSlots -= min(entries[i], maxVal)
            i += 1
        }
        
        return idleSlots > 0 ? idleSlots + tasks.count : tasks.count
    }
    
    func test() -> Void {
        print(leastInterval(["A","A","A","B","B","B"], 2))
    }
}

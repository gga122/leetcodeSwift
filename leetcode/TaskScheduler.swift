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
        
        var least = 0
        while entries[0] > 0 {
            var i = 0
            while i <= n {
                if entries[0] == 0 {
                    break
                }
                if i < 26 && entries[i] > 0 {
                    entries[i] -= 1
                }
                least += 1
                i += 1
            }
            entries = entries.sorted(by: { (val1, val2) -> Bool in
                return val1 > val2
            })
        }
        
        return least
    }
    
    func test() -> Void {
        print(leastInterval(["A","A","A","B","B","B"], 2))
    }
}

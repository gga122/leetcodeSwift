//
//  DistributeCandiesToPeople.swift
//  leetcode
//
//  Created by Henry on 2019/7/6.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DistributeCandiesToPeopleSolution {
    func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
        if num_people == 1 {
            return [candies]
        }
        
        /* N peoples K round: k*n*n+n*(n+1)/2
         m rounds Sum: (m-1)*m/2*n*n + m*(n+1)*n/2
                       m*m*n*n + m*n = 2Sum
         o
         */
        var res = [Int].init(repeating: 0, count: num_people)
        var m = 0
        let upper = 2*candies/num_people
        while m*m*num_people+m < upper {
            m+=1
        }
    
        var remains = candies
        for i in 0...m {
            for j in 0..<num_people {
                let v = i * num_people + (j+1)
                if v <= remains {
                    res[j] += v
                    remains -= v
                } else {
                    res[j] += remains
                    remains = 0
                    break
                }
            }
            
            if remains == 0 {
                break
            }
        }
        
        return res
    }
    
    func test() -> Void {
        print(distributeCandies(7, 4))
        print(distributeCandies(10, 3))
        print(distributeCandies(80, 6))
    }
}

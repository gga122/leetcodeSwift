//
//  DivisorGame.swift
//  leetcode
//
//  Created by Henry on 2019/5/3.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class DivisorGameSolution {
    func divisorGame(_ N: Int) -> Bool {
        return N % 2 == 0
    }

    func test() -> Void {
        print(divisorGame(2))
        print(divisorGame(3))
    }
}

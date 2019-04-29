//
//  NimGame.swift
//  leetcode
//
//  Created by Henry on 2019/4/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class NimGameSolution {
    func canWinNim(_ n: Int) -> Bool {
        if n == 0 {
            return false
        }
        
        return n % 4 != 0
    }
    
    func test() -> Void {
        print(canWinNim(4))
    }
}

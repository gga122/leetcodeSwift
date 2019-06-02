//
//  RectangleArea.swift
//  leetcode
//
//  Created by Henry on 2019/6/2.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class RectangleAreaSolution {
    func computeArea(_ A: Int, _ B: Int, _ C: Int, _ D: Int, _ E: Int, _ F: Int, _ G: Int, _ H: Int) -> Int {
        let area1 = (C-A)*(D-B)
        let area2 = (G-E)*(H-F)
        let w = min(C, G)-max(A, E) > 0 ? min(C, G)-max(A, E) : 0
        let h = min(D, H)-max(B, F) > 0 ? min(D, H)-max(B, F) : 0
        let area3 = w * h
        
        return area1+area2-area3
    }
    
    func test() -> Void {
        print(computeArea(-3, 0, 3, 4, 0, -1, 9, 2))
    }
}

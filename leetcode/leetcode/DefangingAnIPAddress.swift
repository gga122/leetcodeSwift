//
//  DefangingAnIPAddress.swift
//  leetcode
//
//  Created by Henry on 2020/1/12.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class DefangingAnIPAddressSolution {
    func defangIPaddr(_ address: String) -> String {
        let components = address.split(separator: ".")
        let res = components.joined(separator: "[.]")
        return res
    }
    
    func test() -> Void {
        print(defangIPaddr("1.1.1.1"))
        print(defangIPaddr("255.100.50.0"))
    }
}

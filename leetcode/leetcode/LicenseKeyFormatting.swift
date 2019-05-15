//
//  LicenseKeyFormatting.swift
//  leetcode
//
//  Created by Henry on 2019/5/15.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LicenseKeyFormattingSolution {
    func licenseKeyFormatting(_ S: String, _ K: Int) -> String {
        var count = 0
        var licenseKey = ""
        for char in S.reversed() where char != "-" {
            
            if count == K {
                count = 0
                licenseKey.append("-")
            }
            
            count = count + 1
            licenseKey.append(char)
        }
        
        
        return String(licenseKey.uppercased().reversed())
    }
    
    func test() -> Void {
        print(licenseKeyFormatting("5F3Z-2e-9-w", 4))
        print(licenseKeyFormatting("2-5g-3-J", 2))
        print(licenseKeyFormatting("--a-a-a-a--", 2))
    }
}

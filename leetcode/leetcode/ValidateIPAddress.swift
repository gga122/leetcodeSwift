//
//  ValidateIPAddress.swift
//  leetcode
//
//  Created by MickyZhu on 2/2/2020.
//  Copyright © 2020 Henry. All rights reserved.
//

import Foundation

class ValidateIPAddressSolution {
    
    let IPV4 = "IPv4"
    let IPV6 = "IPv6"
    let NONE = "Neither"
        
    func validIPAddress(_ IP: String) -> String {
        if IP.contains(".") {
            let subs = IP.split(separator: ".", maxSplits: Int.max, omittingEmptySubsequences: false)
            if subs.count != 4 {
                return NONE
            }
            
            for sub in subs {
                if sub.count <= 0 || sub.count > 3 {
                    return NONE
                }
                if sub.count > 1 && sub.first == "0" {
                    return NONE
                }
                
                for c in sub {
                    if !c.isNumber {
                        return NONE
                    }
                }
                
                let val = Int(sub)
                if val == nil || val! > 255 {
                    return NONE
                }
            }
            
            return IPV4
        }
        
        let asciiA = UInt8.init(65)
        let asciiF = UInt8.init(70)
        let asciia = UInt8.init(97)
        let asciif = UInt8.init(102)
        
        if IP.contains(":") {
            let subs = IP.split(separator: ":", maxSplits: Int.max, omittingEmptySubsequences: false)
            if subs.count != 8 {
                return NONE
            }
            
            for sub in subs {
                if sub.count <= 0 || sub.count > 4 {
                    return NONE
                }

                for c in sub {
                    if c.isNumber {
                        continue
                    }
                    let asciiVal = c.asciiValue!
                    if asciiVal >= asciiA && asciiVal <= asciiF {
                        continue
                    }
                    if asciiVal >= asciia && asciiVal <= asciif {
                        continue
                    }
                    
                    return NONE
                }
            }
                        
            return IPV6
            
        }
        
        return NONE
    }
    
    func test() -> Void {
        print(validIPAddress("172.16.254.1"))
        print(validIPAddress("2001:0db8:85a3:0:0:8A2E:0370:7334"))
        print(validIPAddress("256.256.256.256"))
        print(validIPAddress("2001:0db8:85a3:0:0:8A2E:0370:7334:"))
        print(validIPAddress("1e1.4.5.6"))
        print(validIPAddress("20EE:FGb8:85a3:0:0:8A2E:0370:7334"))
        print(validIPAddress("15.16.-0.1"))
        print(validIPAddress("192.0.0.1"))
    }
}

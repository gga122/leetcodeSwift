//
//  UniqueEmailAddresses.swift
//  leetcode
//
//  Created by Henry on 2019/4/30.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class UniqueEmailAddressesSolution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        if emails.count <= 1 {
            return emails.count
        }
        
        var set = Set<String>.init()
        for email in emails {
            var trimEmail = ""
            var skip = false
            var domainVisible = false
            for c in email {
                switch c {
                case ".":
                    if domainVisible {
                        trimEmail.append(c)
                    }
                    break
                case "@":
                    skip = false
                    domainVisible = true
                    trimEmail.append(c)
                    break
                case "+":
                    skip = true
                    break
                default:
                    if !skip {
                        trimEmail.append(c)
                    }
                }
            }
            set.insert(trimEmail)
        }
        
        return set.count
    }
    
    func test() -> Void {
        print(numUniqueEmails(["test.email+alex@leetcode.com", "test.e.mail+bob.cathy@leetcode.com", "testemail+david@lee.tcode.com"]))
    }
}

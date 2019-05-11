//
//  ReorderLogFiles.swift
//  leetcode
//
//  Created by Henry on 2019/5/10.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class ReorderLogFilesSolution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        if logs.count == 0 {
            return logs
        }
        
        var letterPart = [String]()
        var numberPart = [String]()
        var flagIndexes = [Int]()
        for log in logs {
            var findFirstSpace = false
            let chars = Array(log)
            var i = 0
            while i < chars.count {
                let c = chars[i]
                if findFirstSpace {
                    let asciiValue = Int(c.unicodeScalars.first!.value)
                    if asciiValue < 48 || asciiValue > 57 {
                        letterPart.append(log)
                    } else {
                        numberPart.append(log)
                    }
                    break
                }
                if c == " " {
                    findFirstSpace = true
                    flagIndexes.append(i)
                }
                i += 1
            }
        }
        
        var i = 0
        while i < letterPart.count {
            var j = i + 1
            while j < letterPart.count {
                let splitA = split(letterPart[i])
                let splitB = split(letterPart[j])

                let nameAChars = Array(splitA.1)
                let nameBChars = Array(splitB.1)
                let nameResult = compare(nameAChars, nameBChars)
                if nameResult >= 1 {
                    let tmp = letterPart[i]
                    letterPart[i] = letterPart[j]
                    letterPart[j] = tmp
                } else if nameResult == 0 {
                    let flagAChars = Array(splitA.0)
                    let flagBChars = Array(splitB.0)
                    let flagResult = compare(flagAChars, flagBChars)
                    if flagResult >= 1 {
                        let tmp = letterPart[i]
                        letterPart[i] = letterPart[j]
                        letterPart[j] = tmp
                    }
                }
                j += 1
            }
            
            i += 1
        }
        
        return letterPart + numberPart
    }

    func compare(_ charsA: [Character], _ charsB: [Character]) -> Int {
        var a = 0
        var b = 0
        while a < charsA.count && b < charsB.count {
            if charsA[a] > charsB[b] {
                return 1
            } else if (charsA[a] < charsB[b]) {
                return -1
            }
            
            a += 1
            b += 1
        }
        
        if charsA.count > charsB.count {
            return 1
        } else if (charsA.count < charsB.count) {
            return -1
        }
        return 0;
    }
    
    func split(_ letter: String) -> (String, String) {
        let chars = Array(letter)
        var findFlag = false
        var flag = ""
        var name = ""
        var i = 0
        while i < chars.count {
            let c = chars[i]
            if findFlag {
                name.append(c)
            } else {
                if c != " " {
                    flag.append(c)
                }
            }
            
            if c == " " {
                findFlag = true
            }
            
            i += 1
        }
        
        return (flag, name)
    }
    
    func test() -> Void {
        print(reorderLogFiles(["a1 9 2 3 1", "g1 act car", "zo4 4 7", "ab1 off key dog", "a8 act zoo"]))
        print(reorderLogFiles(["a1 9 2 3 1", "g1 act car", "zo4 4 7", "ab1 off key dog", "a8 act zoo", "a2 act car"]))
        print(reorderLogFiles(["j mo", "5 m w", "g 07", "o 2 0", "t q h"]))
    }
}

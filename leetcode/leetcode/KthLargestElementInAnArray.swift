//
//  KthLargestElementInAnArray.swift
//  leetcode
//
//  Created by Henry on 2019/5/23.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class KthLargestElementInAnArraySolution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        guard nums.count >= k && k >= 1 else {
            return 0
        }
        
        var newNums = nums
        func quickSort(leftIndex: Int, rightIndex: Int) {
            let targetIndex = k - 1
            guard leftIndex < rightIndex && targetIndex >= leftIndex && targetIndex <= rightIndex else {
                return
            }
            let middleIndex = (leftIndex + rightIndex) / 2
            let leftSelection = newNums[leftIndex]
            let rightSelection = newNums[rightIndex]
            let middleSelection = newNums[middleIndex]
            var pivot: Int
            if leftSelection <= rightSelection {
                if leftSelection <= middleSelection {
                    if middleSelection <= rightSelection {
                        pivot = middleSelection
                        newNums[leftIndex] = middleSelection
                        newNums[middleIndex] = leftSelection
                    } else {
                        pivot = rightSelection
                        newNums[leftIndex] = rightSelection
                        newNums[rightIndex] = leftSelection
                    }
                } else {
                    pivot = leftSelection
                }
            } else {
                if leftSelection <= middleSelection {
                    pivot = leftSelection
                } else {
                    if middleSelection <= rightSelection {
                        pivot = rightSelection
                        newNums[leftIndex] = rightSelection
                        newNums[rightIndex] = leftSelection
                    } else {
                        pivot = middleSelection
                        newNums[leftIndex] = middleSelection
                        newNums[middleIndex] = leftSelection
                    }
                }
            }
            var i = leftIndex, j = rightIndex
            while i < j {
                while i < j && pivot >= newNums[j] {
                    j -= 1
                }
                if i < j {
                    newNums[i] = newNums[j]
                }
                while i < j && pivot <= newNums[i] {
                    i += 1
                }
                if i < j {
                    newNums[j] = newNums[i]
                }
            }
            newNums[i] = pivot
            if i > targetIndex {
                quickSort(leftIndex: leftIndex, rightIndex: i - 1)
            } else if j < targetIndex {
                quickSort(leftIndex: j + 1, rightIndex: rightIndex)
            }
        }
        quickSort(leftIndex: 0, rightIndex: newNums.count - 1)
        return newNums[k - 1]
    }
    
    func test() -> Void {
        print(findKthLargest([3,2,1,5,6,4], 2))
        print(findKthLargest([3,2,3,1,2,4,5,5,6], 4))
        print(findKthLargest([2,1], 2))
        print(findKthLargest([99,99], 1))
        print(findKthLargest([-1,-1], 2))
        print(findKthLargest([7,6,5,4,3,2,1], 2))
    }
}

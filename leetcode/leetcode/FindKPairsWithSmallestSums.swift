//
//  FindKPairsWithSmallestSums.swift
//  leetcode
//
//  Created by Henry on 2019/6/5.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class FindKPairsWithSmallestSumsSolution {
    
    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
        if nums1.isEmpty || nums2.isEmpty {
            return [[Int]]()
        }
        var res = [[Int]]()
        let heap = MinHeap()
        func addToHeap(_ index : Int) {
            for i in 0..<nums2.count {
                let paris =  Paris(index1: index, index2: i, value: nums1[index] + nums2[i])
                heap.insert(paris)
            }
        }
        
        addToHeap(0)
        var index1 = 1
        
        while !heap.isEmpty && res.count < k {
            var tmp = heap.peek()!
            if index1 < nums1.count && tmp.value > nums1[index1] + nums2[0] {
                addToHeap(index1)
                index1 += 1
            }
            tmp = heap.remove()!
            res.append([nums1[tmp.index1],nums2[tmp.index2]])
        }
        return res
    }
    
    
    struct Paris : Comparable {
        static func < (lhs: Paris, rhs: Paris) -> Bool {
            return lhs.value < rhs.value
        }
        
        let index1 : Int
        let index2 : Int
        let value : Int
    }
    
    class MinHeap {
        private var nodes = [Paris]()
        
        func shiftUp(_ index: Int) {
            var childIndex = index
            let child = nodes[childIndex]
            var parentIndex = self.parentIndex(ofIndex: childIndex)
            
            while childIndex > 0 && child < nodes[parentIndex] {
                nodes[childIndex] = nodes[parentIndex]
                childIndex = parentIndex
                parentIndex = self.parentIndex(ofIndex: childIndex)
            }
            
            nodes[childIndex] = child
        }
        
        func shiftDown(_ index: Int) {
            shiftDown(from: index, until: nodes.count)
        }
        
        func peek() -> Paris? {
            return nodes.first
        }
        
        @discardableResult func remove() -> Paris? {
            guard !nodes.isEmpty else { return nil }
            
            if nodes.count == 1 {
                return nodes.removeLast()
            } else {
                let value = nodes[0]
                nodes[0] = nodes.removeLast()
                shiftDown(0)
                return value
            }
        }
        
        func shiftDown(from index: Int, until endIndex: Int) {
            let leftChildIndex = self.leftChildIndex(ofIndex: index)
            let rightChildIndex = leftChildIndex + 1
            var first = index
            if leftChildIndex < endIndex && nodes[leftChildIndex] < nodes[first] {
                first = leftChildIndex
            }
            if rightChildIndex < endIndex && nodes[rightChildIndex] < nodes[first] {
                first = rightChildIndex
            }
            if first == index { return }
            
            nodes.swapAt(index, first)
            shiftDown(from: first, until: endIndex)
        }
        
        func insert(_ value: Paris) {
            nodes.append(value)
            shiftUp(nodes.count - 1)
        }
        
        var isEmpty: Bool {
            return nodes.isEmpty
        }
        
        @inline(__always) internal func parentIndex(ofIndex i: Int) -> Int {
            return (i - 1) / 2
        }
        
        @inline(__always) internal func leftChildIndex(ofIndex i: Int) -> Int {
            return 2*i + 1
        }
        
        @inline(__always) internal func rightChildIndex(ofIndex i: Int) -> Int {
            return 2*i + 2
        }
        
    }
    
    func test() -> Void {
        print(kSmallestPairs([1,7,11], [2,4,6], 3))
        print(kSmallestPairs([1,1,2], [1,2,3], 2))
        print(kSmallestPairs([1,2], [3], 3))
        print(kSmallestPairs([1,1,2], [1,2,3], 10))
        print(kSmallestPairs([-476570184,-423568801,-385585840,-375390924,-364630569,-359795128,-281872968,-126410430,-75677925,-54214495,-49178055,-32637211,-32198215,3413177,19045759,62248526,67551536,113606647,155411580,164755463,164781059,203133270,277305105,284913246,285973110,296436629,325431544,357294459,378678394,399786157],[-408663357,-404578641,-376531700,-311642519,-294905976,-232001207,-183530032,-141524508,-115652480,-70696522,-63386299,-54656543,-32316999,29714175,33993996,45020708,62165363,84210823,93905151,102177224,209285622,288668099,328300713,338684779,342861859,384940859,408019604,410097843,458721542,475395296],1000))
    }
}


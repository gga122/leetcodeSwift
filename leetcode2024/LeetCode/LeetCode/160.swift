//
//  160.swift
//  LeetCode
//
//  Created by henry on 2024/11/8.
//

import Foundation

class Solution_160 {
    
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        /**
         1. 有相交
         + 假设 headA 有 a 个不相交和 b 个相交节点, headB有 c 个不相交和 b个相交节点
         + 如果 a = c, 两个步进会同时到达相交点
         + 如果 a != c, headA需要走 a + b + c 步 / headB 需要走 c + b + a 步
         2. 无相交
         + 如果 headA 长度为 m, headB 长度 为 n
         + 如果 m = n, 两个步进会同时到达末尾
         + 如果 m != n, headA 需要走 m + n 步 / headB 需要走 n + m 步
         */
        guard headA != nil, headB != nil else { return nil }
        
        var pA = headA
        var pB = headB
        
        while true {
            if pA == nil, pB == nil {
                return nil
            }
            
            if pA == nil {
                pA = headB
            }
            if pB == nil {
                pB = headA
            }
            
            /**
             垃圾题目, 这里不用val来判断而是需要用指针相等判断, 真是万万没想到
             */
            if pA === pB {
                return pA
            }
            
            pA = pA?.next
            pB = pB?.next
        }
        
        return nil
    }
}

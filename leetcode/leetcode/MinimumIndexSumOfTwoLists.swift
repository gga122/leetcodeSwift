//
//  MinimumIndexSumOfTwoLists.swift
//  leetcode
//
//  Created by Henry on 2019/5/12.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class MinimumIndexSumOfTwoListsSolution {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var listDic1 = [String: Int]()
        var i = 0
        for item in list1 {
            listDic1[item] = i
            i += 1
        }
        
        var items = [String]()
        var minIndexCount = Int.max
        var j = 0
        for item in list2 {
            if let index1 = listDic1[item] {
                if j + index1 < minIndexCount {
                    minIndexCount = j + index1
                    items.removeAll()
                    items.append(item)
                } else if j + index1 == minIndexCount {
                    items.append(item)
                }
            }
            j += 1
        }
        
        return items
    }
    
    func test() -> Void {
        print(findRestaurant(["Shogun", "Tapioca Express", "Burger King", "KFC"],
                             ["Piatti", "The Grill at Torrey Pines", "Hungry Hunter Steakhouse", "Shogun"]))
        print(findRestaurant(["Shogun", "Tapioca Express", "Burger King", "KFC"],
                             ["KFC", "Shogun", "Burger King"]))
        print(findRestaurant(["Shogun","Tapioca Express","Burger King","KFC"],
                             ["KFC","Burger King","Tapioca Express","Shogun"]))
    }
}

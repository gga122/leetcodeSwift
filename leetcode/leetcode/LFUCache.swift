//
//  LFUCache.swift
//  leetcode
//
//  Created by Henry on 2019/6/7.
//  Copyright © 2019 Henry. All rights reserved.
//

import Foundation

class LFUCache {

    public class LFUEntry {
        public var key: Int
        public var val: Int
        init(_ val: Int, _ key: Int) {
            self.key = key
            self.val = val
        }
    }
    
    public class LFUChunk {
        public var entries = [LFUEntry]()
        
        public var count: Int { return entries.count }
        public var accessCount = 1
        
        init(_ accessCount: Int) {
            self.accessCount = accessCount
        }
        
        func add(_ entry: LFUEntry) -> Void {
            entries.insert(entry, at: 0)
        }
        
        func remove() -> LFUEntry? {
            if entries.isEmpty {
                return nil
            }
            return entries.removeLast()
        }
        
        func dequeue(_ key: Int) -> LFUEntry? {
            for i in 0..<entries.count {
                if entries[i].key == key {
                    return entries.remove(at: i)
                }
            }
            
            return nil
        }
    }
    
    var capacity = Int.max
    var accessHash = [Int: Int]() // Key: AccessCount
    var chunkHash = [Int: LFUChunk]() // AccessCount: LFUChunk
    var count = 0
    var minAccessCount = 1
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func chunkForKey(_ key: Int) -> LFUChunk? {
        if let accessCount = accessHash[key] {
            if let chunk = chunkHash[accessCount] {
                if chunk.count > 0 {
                    return chunk
                }

                chunkHash[accessCount] = nil
            }
            accessHash[key] = nil
            return nil
        }
        return nil
    }
    
    func nextChunkForChunk(_ chunk: LFUChunk) -> LFUChunk {
        let nextAccessCount = chunk.accessCount + 1
        var nextChunk = chunkHash[nextAccessCount]
        if nextChunk == nil {
            nextChunk = LFUChunk.init(nextAccessCount)
            chunkHash[nextAccessCount] = nextChunk
        }
        
        return nextChunk!
    }
    
    func get(_ key: Int) -> Int {
        if capacity == 0 { return -1 }

        let chunk = chunkForKey(key)
        if chunk == nil { return -1 }
        
        let entry = chunk!.dequeue(key)
        if entry == nil { return -1 }
        
        let nextChunk = nextChunkForChunk(chunk!)
        nextChunk.add(entry!)
        accessHash[key] = nextChunk.accessCount
        
        if chunk!.count == 0 {
            chunkHash[chunk!.accessCount] = nil
            if chunk!.accessCount == minAccessCount {
                minAccessCount += 1
            }
        }
        
        return entry!.val
    }
    
    func put(_ key: Int, _ value: Int) {
        if capacity == 0 {
            return
        }
        
        let chunk = chunkForKey(key)
        if chunk != nil {
            let entry = chunk!.dequeue(key)!
            entry.val = value
            let nextChunk = nextChunkForChunk(chunk!)
            nextChunk.add(entry)
            accessHash[key] = nextChunk.accessCount
            if chunk!.count == 0 {
                chunkHash[chunk!.accessCount] = nil
                if chunk!.accessCount == minAccessCount {
                    minAccessCount = nextChunk.accessCount
                }
            }
        } else {
            if count == capacity {
                let minChunk = chunkHash[minAccessCount]!
                let removeEntry = minChunk.remove()!
                print("expired key: \(removeEntry.key) + \(removeEntry.val)")
                accessHash[removeEntry.key] = nil
                if minChunk.count == 0 {
                    chunkHash[minAccessCount] = nil
                    minAccessCount += 1
                }
                count -= 1
            }
            
            let entry = LFUEntry.init(value, key)
            var basicChunk = chunkHash[1]
            if basicChunk == nil {
                basicChunk = LFUChunk.init(1)
                chunkHash[1] = basicChunk
            }
            basicChunk!.add(entry)
            accessHash[key] = basicChunk!.accessCount
            count += 1
            
            minAccessCount = 1
        }
    }
    
    func test() -> Void {
        /*
        put(1, 1)
        put(2, 2)
        print(get(1))
        put(3, 3)
        print(get(2))
        print(get(3))
        put(4, 4)
        print(get(1))
        print(get(3))
        print(get(4))
         */
 
        /*
        put(2, 2)
        put(1, 1)
        print(get(2))
        print(get(1))
        print(get(2))
        put(3, 3)
        put(4, 4)
        print(get(3))
        print(get(2))
        print(get(1))
        print(get(4))
         */
        
        /*
        put(2, 1)
        put(1, 1)
        put(2, 3)
        put(4, 1)
        print(get(1))
        print(get(2))
         */
        
        
        put(10, 13)
        put(3, 17)
        put(6, 11)
        put(10, 5)
        put(9, 10)
        print(get(13))
        put(2, 19)
        print(get(2))
        print(get(3))
        put(5, 25)
        print(get(8))
        put(9, 22)
        put(5, 5)
        put(1, 30)
        print(get(11))
        put(9, 12)
        print(get(7))
        print(get(5))
        print(get(8))
        print(get(9))
        put(4, 30)
        put(9, 3)
        print(get(9))
        print(get(10))
        print(get(10))
        put(6, 14)
        put(3, 1)
        print(get(3))
        put(10, 11)
        print(get(8))
        put(2, 14)
        print(get(1))
        print(get(5))
        print(get(4))
        put(11, 4)
        put(12, 24)
        put(5, 18)
        print(get(13))
        put(7, 23)
        print(get(8))
        print(get(12))
        put(3, 27)
        put(2, 12)
        print(get(5))
        put(2, 9)
        put(13, 4)
        put(8, 18)
        put(1, 7)
        print(get(6))
        put(9, 29)
        put(8, 21)
        print(get(5))
        put(6, 30)
        put(1, 12)
        print(get(10))
        put(4, 15)
        put(7, 22)
        put(11, 26)
        put(8, 17)
        put(9, 29)
        print(get(5))
        put(3, 4)
        put(11, 30)
        print(get(12))
        put(4, 29)
        print(get(3))
        print(get(9))
        print(get(6))
        put(3, 4)
        print(get(1))
        print(get(10))
        put(3, 29)
        put(10, 28)
        put(1, 20)
        put(11, 13)
        print(get(3))
        put(3, 12)
        put(3, 8)
        put(10, 9)
        put(3, 26)
        print(get(8))
        print(get(7))
        print(get(5))
        put(13, 17)
        put(2, 27)
        put(11, 15)
        print(get(12))
        put(9, 19)
        put(2, 15)
        put(3, 16)
        print(get(1))
        put(12, 17)
        put(9, 1)
        put(6, 19)
        print(get(4))
        print(get(5))
        print(get(5))
        put(8, 1)
        put(11, 7)
        put(5, 2)
        put(9, 28)
        print(get(1))
        put(2, 2)
        put(7, 4)
        put(4, 22)
        put(7, 24)
        put(9, 26)
        put(13, 28)
        put(11, 26)
         
    }
}

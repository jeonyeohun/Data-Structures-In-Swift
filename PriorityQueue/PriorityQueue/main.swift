//
//  main.swift
//  PriorityQueue
//
//  Created by 전여훈 on 2021/07/25.
//

import Foundation

struct PriorityQueue<T> {
    var heap: Heap<T>
    
    init(_ elements: [T], _ sort: @escaping (T, T) -> Bool) {
        heap = Heap(elements: elements, sort: sort)
    }
    
    var count : Int {
        return heap.count
    }
    
    var isEmpty : Bool {
        return heap.isEmpty
    }
    
    mutating func clear () {
        heap = Heap<T>(elements: [], sort: heap.sort)
    }
    
    func top () -> T? {
        return heap.peek()
    }
    
    mutating func pop() -> T? {
        return heap.pop()
    }
    
    mutating func push(_ element: T) {
        heap.push(element)
    }
}

var pq: PriorityQueue<Int> = PriorityQueue<Int>([], >)
pq.push(1)
pq.push(3)
pq.push(2)
pq.push(5)

print(pq.pop()!)
print(pq.top()!)

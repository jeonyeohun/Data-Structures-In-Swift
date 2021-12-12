//
//  Queue.swift
//  Queue
//
//  Created by 전여훈 on 2021/12/12.
//

import Foundation

struct Queue<T> {
    var list = TwoPointerLinkedList<T>()
    
    init(_ elements: [T] = []) {
        for element in elements {
            list.add(node: Node(data: element))
        }
    }
    
    var count : Int {
        return list.count
    }
    var isEmpty : Bool {
        return list.head == nil
    }
    var front: T? {
        return list.front?.data
    }
    var back: T? {
        return list.back?.data
    }
    
    mutating func clear () {
        list.clear()
    }
    
    mutating func pop() -> T? {
        return list.removeFirst()?.data
    }
    
    mutating func push(_ element: T) {
        list.add(node: Node(data: element))
    }
}

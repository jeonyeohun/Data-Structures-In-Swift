//
//  main.swift
//  Queue
//
//  Created by 전여훈 on 2021/08/08.
//

import Foundation

struct Queue<T> {
    var queue: [T] = []
    
    init(_ elements: [T]) {
        queue = elements
    }
    
    init(){}
    
    var count : Int {
        return queue.count
    }
    
    var isEmpty : Bool {
        return queue.isEmpty
    }
    
    mutating func clear () {
        queue = []
    }
    
    mutating func pop() -> T? {
        return queue.removeFirst()
    }
    
    mutating func push(_ element: T) {
        queue.append(element)
    }
}

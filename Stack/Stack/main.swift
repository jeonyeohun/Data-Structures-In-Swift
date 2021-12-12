//
//  main.swift
//  Stack
//
//  Created by 전여훈 on 2021/08/01.
//

import Foundation

struct Stack<T> {
    var elements: [T] = []
    
    var count : Int {
        return elements.count
    }
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    mutating func pop() -> T? {
        return elements.popLast()
    }
    mutating func push(_ element: T) {
        elements.append(element)
    }
    func top() -> T? {
        return elements.last
    }
}

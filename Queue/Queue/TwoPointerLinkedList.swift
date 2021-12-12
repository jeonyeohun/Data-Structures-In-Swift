//
//  TwoPointerLinkedList.swift
//  Queue
//
//  Created by 전여훈 on 2021/12/12.
//

import Foundation

struct TwoPointerLinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    var count: Int = 0
    
    var front: Node<T>? {
        return head
    }
    var back: Node<T>? {
        return tail
    }
    
    mutating func add(node: Node<T>) {
        if self.head == nil {
            self.head = node
            self.tail = node
        } else {
            self.tail?.next = node
            self.tail = node
        }
        self.count += 1
    }
    mutating func removeFirst() -> Node<T>? {
        guard head != nil else {
            self.clear()
            return nil
        }
        let deleted = self.head
        self.head = head?.next
        self.count -= 1
        
        if head == nil {
            self.clear()
        }
        return deleted
    }
    mutating func clear() {
        self.head = nil
        self.tail = nil
    }
}

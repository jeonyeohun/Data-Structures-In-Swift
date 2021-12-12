//
//  LinkedList.swift
//  LinkedList
//
//  Created by 전여훈 on 2021/12/11.
//

import Foundation

struct LinkedList<T: Equatable> {
    var head: Node<T>?
    var tail: Node<T>?
    
    mutating func add(node: Node<T>) {
        // head node does not exist
        if head == nil {
            head = node
            tail = node
            return
        }
        
        // search for last node and attatch new
        tail?.next = node
        tail = node
    }
    
    func searchNode(with data: T) -> Node<T>? {
        var now = head
        while now?.data != data && now != nil {
            now = now?.next
        }
        return now
    }
    
    mutating func insert(node: Node<T>, after id: Int) {
        var now = head
        while now?.id != id && now?.next != nil {
            now = now?.next
        }
        
        node.next = now?.next
        now?.next = node
    }
    
    mutating func insert(node: Node<T>, before id: Int) {
        var now = head
        
        if now?.id == id {
            head = node
            node.next = now
            return
        }
        
        while now?.next?.id != id && now?.next != nil {
            now = now?.next
        }
        
        node.next = now?.next
        now?.next = node
    }
    
    mutating func delete(node: Node<T>) -> Bool {
        var now = self.head
        
        // if target node is at head
        if now === node {
            if self.head === self.tail { self.tail = nil }
            self.head = now?.next
            return true
        }
        
        while now?.next !== node && now?.next != nil {
            now = now?.next
        }
        
        // no matching node to delete
        if now == nil { return false }
        
        if now?.next === tail {
            tail = now
        }
        
        // delete node
        now?.next = now?.next?.next
        return true
    }
    
    func showList() {
        var now = head
        print("===== Linked List ======")
        while now != nil {
            now?.next == nil
            ? print("id: \(now?.id) | data: \(now?.data)")
            : print("id: \(now?.id) | data: \(now?.data) -> ")
            now = now?.next
        }
        print("========================")
    }
}

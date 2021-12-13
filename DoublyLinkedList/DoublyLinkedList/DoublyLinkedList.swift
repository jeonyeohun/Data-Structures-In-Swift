//
//  DoublyLinkedList.swift
//  DoublyLinkedList
//
//  Created by 전여훈 on 2021/12/11.
//

import Foundation

struct DoublyLinkedList<T: Equatable> {
    var head: Node<T>?
    var tail: Node<T>?
    
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
            return
        }
        
        self.tail?.next = node
        node.prev = self.tail
        self.tail = node
    }
    
    mutating func searchNode(with data: T) -> Node<T>? {
        var now = self.head
        while now?.data != data && now !== tail {
            now = now?.next
        }
        return now
    }
    
    mutating func deleteNode(with id: Int) -> Node<T>? {
        var now = self.head
        
        if id == self.tail?.id {
            now = self.tail
        } else {
            while now?.id != id && now != nil {
                now = now?.next
            }
        }
        
        let deleted = now
        deleted?.next?.prev = deleted?.prev
        deleted?.prev?.next = deleted?.next
        
        if deleted === head {
            self.head = deleted?.next
        }
        
        if deleted === tail {
            self.tail = deleted?.prev
        }
        
        return deleted
    }
    
    mutating func insert(node: Node<T>, after id: Int) {
        guard head != nil else { return }
        var now = self.head
        if id == self.tail!.id {
            self.add(node: node)
        }
        
        while now?.id != id && now != nil {
            now = now?.next
        }
        if now === self.tail {
            self.tail = node
        }
        node.next = now?.next
        now?.next?.prev = node
        now?.next = node
        node.prev = now
    }
    
    mutating func insert(node: Node<T>, before id: Int) {
        guard head != nil else { return }
        var now = self.head
        
        if id == self.tail?.id {
            now = self.tail
        } else {
            while now?.id != id && now != nil {
                now = now?.next
            }
        }
        
        if now === self.head {
            self.head = node
        }
    
        now?.prev?.next = node
        node.prev = now?.prev
        now?.prev = node
        node.next = now
    }
    
    mutating func reverse() {
        var now = head
        while now != nil {
            let nowNext = now?.next
            now?.next = now?.prev
            now?.prev = nowNext
            now = now?.prev
        }
        let nowHead = self.head
        self.head = self.tail
        self.tail = nowHead
    }
    
    func showAll() {
        var now = head
        print("===== Linked List ======")
        while now != nil {
            now?.next == nil
            ? print("id: \(now!.id) | data: \(now!.data)")
            : print("id: \(now!.id) | data: \(now!.data) -> ")
            now = now?.next
        }
        print("========================")
    }
}

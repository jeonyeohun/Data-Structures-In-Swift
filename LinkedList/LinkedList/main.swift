//
//  main.swift
//  LinkedList
//
//  Created by 전여훈 on 2021/12/11.
//

import Foundation

struct LinkedList<T: Equatable> {
    var head: Node<T>?
    
    mutating func add(node: Node<T>) {
        // head node does not exist
        if head == nil {
            head = node
            return
        }
        
        // search for last node and attatch new
        var now = head
        while now?.next != nil {
            now = now?.next
        }
        now?.next = node
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
        var now = head
        
        // if target node is at head
        if now === node {
            self.head = now?.next
            return true
        }
        
        while now?.next !== node && now?.next != nil {
            now = now?.next
        }
        
        // no matching node to delete
        if now == nil { return false }
        
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


var list = LinkedList<Int>()
list.add(node: Node(id: 1, data: 0))
list.add(node: Node(id: 2, data: 1))
list.add(node: Node(id: 3, data: 2))
list.add(node: Node(id: 4, data: 3))
list.add(node: Node(id: 5, data: 6))
list.add(node: Node(id: 6, data: 5))
list.add(node: Node(id: 7, data: 10))

print("search node with data 0")
let deletionTargetNode = list.searchNode(with: 0)
list.showList()

print("delete node with data 0")
print(list.delete(node: deletionTargetNode!))
list.showList()

print("search node with data 0")
print(list.searchNode(with: 0))

print("delete node with data 10")
list.delete(node: list.searchNode(with: 10)!)
list.showList()


print("insert node after node with id(2)")
list.insert(node: Node(id: 30, data: 2), after: 2)
list.showList()

print("insert node before node with id (3)")
list.insert(node: Node(id: 50, data: 3), before: 2)
list.showList()

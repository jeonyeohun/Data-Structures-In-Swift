//
//  main.swift
//  DoublyLinkedList
//
//  Created by 전여훈 on 2021/12/11.
//

import Foundation

var list = DoublyLinkedList<Int>()

for id in 0..<30 {
    list.add(node: Node(id: id, data: (0...100).randomElement()!))
}

list.showAll()
print("\ncommand: reverse")
list.reverse()
list.showAll()

let deletedzero = list.deleteNode(with: 0)
print("deleted node: id: \(deletedzero?.id) data: \(deletedzero?.data)")
list.showAll()

let deletedtwenty = list.deleteNode(with: 20)
print("deleted node: id: \(deletedtwenty?.id) data: \(deletedtwenty?.data)")
list.showAll()

print("insert node with id 30 before node with id 21")
list.insert(node: Node(id: 30, data: 0), before: 21)
list.showAll()

print("insert node with id 31 after node with id 29")
list.insert(node: Node(id: 31, data: 0), after: 29)
list.showAll()

print("reverse")
list.reverse()
list.showAll()

print("insert node with id 0 before node with id 31")
list.insert(node: Node(id: 0, data: 1), before: 31)
list.showAll()

print("node at front")
print("id: \(list.front?.id) data: \(list.front?.data)")

print("node at back")
print("id: \(list.back?.id) data: \(list.back?.data)")

//===== Linked List ======
//id: 0 | data: 18 ->
//id: 1 | data: 6 ->
//id: 2 | data: 13 ->
//id: 3 | data: 46 ->
//id: 4 | data: 37 ->
//id: 5 | data: 79 ->
//id: 6 | data: 70 ->
//id: 7 | data: 42 ->
//id: 8 | data: 23 ->
//id: 9 | data: 59 ->
//id: 10 | data: 60 ->
//id: 11 | data: 44 ->
//id: 12 | data: 12 ->
//id: 13 | data: 18 ->
//id: 14 | data: 4 ->
//id: 15 | data: 54 ->
//id: 16 | data: 16 ->
//id: 17 | data: 5 ->
//id: 18 | data: 69 ->
//id: 19 | data: 69 ->
//id: 20 | data: 35 ->
//id: 21 | data: 24 ->
//id: 22 | data: 32 ->
//id: 23 | data: 14 ->
//id: 24 | data: 99 ->
//id: 25 | data: 31 ->
//id: 26 | data: 27 ->
//id: 27 | data: 16 ->
//id: 28 | data: 68 ->
//id: 29 | data: 50
//========================
//
//command: reverse
//===== Linked List ======
//id: 29 | data: 50 ->
//id: 28 | data: 68 ->
//id: 27 | data: 16 ->
//id: 26 | data: 27 ->
//id: 25 | data: 31 ->
//id: 24 | data: 99 ->
//id: 23 | data: 14 ->
//id: 22 | data: 32 ->
//id: 21 | data: 24 ->
//id: 20 | data: 35 ->
//id: 19 | data: 69 ->
//id: 18 | data: 69 ->
//id: 17 | data: 5 ->
//id: 16 | data: 16 ->
//id: 15 | data: 54 ->
//id: 14 | data: 4 ->
//id: 13 | data: 18 ->
//id: 12 | data: 12 ->
//id: 11 | data: 44 ->
//id: 10 | data: 60 ->
//id: 9 | data: 59 ->
//id: 8 | data: 23 ->
//id: 7 | data: 42 ->
//id: 6 | data: 70 ->
//id: 5 | data: 79 ->
//id: 4 | data: 37 ->
//id: 3 | data: 46 ->
//id: 2 | data: 13 ->
//id: 1 | data: 6 ->
//id: 0 | data: 18
//========================
//deleted node: id: Optional(0) data: Optional(18)
//===== Linked List ======
//id: 29 | data: 50 ->
//id: 28 | data: 68 ->
//id: 27 | data: 16 ->
//id: 26 | data: 27 ->
//id: 25 | data: 31 ->
//id: 24 | data: 99 ->
//id: 23 | data: 14 ->
//id: 22 | data: 32 ->
//id: 21 | data: 24 ->
//id: 20 | data: 35 ->
//id: 19 | data: 69 ->
//id: 18 | data: 69 ->
//id: 17 | data: 5 ->
//id: 16 | data: 16 ->
//id: 15 | data: 54 ->
//id: 14 | data: 4 ->
//id: 13 | data: 18 ->
//id: 12 | data: 12 ->
//id: 11 | data: 44 ->
//id: 10 | data: 60 ->
//id: 9 | data: 59 ->
//id: 8 | data: 23 ->
//id: 7 | data: 42 ->
//id: 6 | data: 70 ->
//id: 5 | data: 79 ->
//id: 4 | data: 37 ->
//id: 3 | data: 46 ->
//id: 2 | data: 13 ->
//id: 1 | data: 6
//========================
//deleted node: id: Optional(20) data: Optional(35)
//===== Linked List ======
//id: 29 | data: 50 ->
//id: 28 | data: 68 ->
//id: 27 | data: 16 ->
//id: 26 | data: 27 ->
//id: 25 | data: 31 ->
//id: 24 | data: 99 ->
//id: 23 | data: 14 ->
//id: 22 | data: 32 ->
//id: 21 | data: 24 ->
//id: 19 | data: 69 ->
//id: 18 | data: 69 ->
//id: 17 | data: 5 ->
//id: 16 | data: 16 ->
//id: 15 | data: 54 ->
//id: 14 | data: 4 ->
//id: 13 | data: 18 ->
//id: 12 | data: 12 ->
//id: 11 | data: 44 ->
//id: 10 | data: 60 ->
//id: 9 | data: 59 ->
//id: 8 | data: 23 ->
//id: 7 | data: 42 ->
//id: 6 | data: 70 ->
//id: 5 | data: 79 ->
//id: 4 | data: 37 ->
//id: 3 | data: 46 ->
//id: 2 | data: 13 ->
//id: 1 | data: 6
//========================
//insert node with id 30 before node with id 21
//===== Linked List ======
//id: 29 | data: 50 ->
//id: 28 | data: 68 ->
//id: 27 | data: 16 ->
//id: 26 | data: 27 ->
//id: 25 | data: 31 ->
//id: 24 | data: 99 ->
//id: 23 | data: 14 ->
//id: 22 | data: 32 ->
//id: 30 | data: 0 ->
//id: 21 | data: 24 ->
//id: 19 | data: 69 ->
//id: 18 | data: 69 ->
//id: 17 | data: 5 ->
//id: 16 | data: 16 ->
//id: 15 | data: 54 ->
//id: 14 | data: 4 ->
//id: 13 | data: 18 ->
//id: 12 | data: 12 ->
//id: 11 | data: 44 ->
//id: 10 | data: 60 ->
//id: 9 | data: 59 ->
//id: 8 | data: 23 ->
//id: 7 | data: 42 ->
//id: 6 | data: 70 ->
//id: 5 | data: 79 ->
//id: 4 | data: 37 ->
//id: 3 | data: 46 ->
//id: 2 | data: 13 ->
//id: 1 | data: 6
//========================
//insert node with id 31 after node with id 29
//===== Linked List ======
//id: 29 | data: 50 ->
//id: 31 | data: 0 ->
//id: 28 | data: 68 ->
//id: 27 | data: 16 ->
//id: 26 | data: 27 ->
//id: 25 | data: 31 ->
//id: 24 | data: 99 ->
//id: 23 | data: 14 ->
//id: 22 | data: 32 ->
//id: 30 | data: 0 ->
//id: 21 | data: 24 ->
//id: 19 | data: 69 ->
//id: 18 | data: 69 ->
//id: 17 | data: 5 ->
//id: 16 | data: 16 ->
//id: 15 | data: 54 ->
//id: 14 | data: 4 ->
//id: 13 | data: 18 ->
//id: 12 | data: 12 ->
//id: 11 | data: 44 ->
//id: 10 | data: 60 ->
//id: 9 | data: 59 ->
//id: 8 | data: 23 ->
//id: 7 | data: 42 ->
//id: 6 | data: 70 ->
//id: 5 | data: 79 ->
//id: 4 | data: 37 ->
//id: 3 | data: 46 ->
//id: 2 | data: 13 ->
//id: 1 | data: 6
//========================
//reverse
//===== Linked List ======
//id: 1 | data: 6 ->
//id: 2 | data: 13 ->
//id: 3 | data: 46 ->
//id: 4 | data: 37 ->
//id: 5 | data: 79 ->
//id: 6 | data: 70 ->
//id: 7 | data: 42 ->
//id: 8 | data: 23 ->
//id: 9 | data: 59 ->
//id: 10 | data: 60 ->
//id: 11 | data: 44 ->
//id: 12 | data: 12 ->
//id: 13 | data: 18 ->
//id: 14 | data: 4 ->
//id: 15 | data: 54 ->
//id: 16 | data: 16 ->
//id: 17 | data: 5 ->
//id: 18 | data: 69 ->
//id: 19 | data: 69 ->
//id: 21 | data: 24 ->
//id: 30 | data: 0 ->
//id: 22 | data: 32 ->
//id: 23 | data: 14 ->
//id: 24 | data: 99 ->
//id: 25 | data: 31 ->
//id: 26 | data: 27 ->
//id: 27 | data: 16 ->
//id: 28 | data: 68 ->
//id: 31 | data: 0 ->
//id: 29 | data: 50
//========================
//insert node with id 0 before node with id 31
//===== Linked List ======
//id: 1 | data: 6 ->
//id: 2 | data: 13 ->
//id: 3 | data: 46 ->
//id: 4 | data: 37 ->
//id: 5 | data: 79 ->
//id: 6 | data: 70 ->
//id: 7 | data: 42 ->
//id: 8 | data: 23 ->
//id: 9 | data: 59 ->
//id: 10 | data: 60 ->
//id: 11 | data: 44 ->
//id: 12 | data: 12 ->
//id: 13 | data: 18 ->
//id: 14 | data: 4 ->
//id: 15 | data: 54 ->
//id: 16 | data: 16 ->
//id: 17 | data: 5 ->
//id: 18 | data: 69 ->
//id: 19 | data: 69 ->
//id: 21 | data: 24 ->
//id: 30 | data: 0 ->
//id: 22 | data: 32 ->
//id: 23 | data: 14 ->
//id: 24 | data: 99 ->
//id: 25 | data: 31 ->
//id: 26 | data: 27 ->
//id: 27 | data: 16 ->
//id: 28 | data: 68 ->
//id: 0 | data: 1 ->
//id: 31 | data: 0 ->
//id: 29 | data: 50
//========================
//node at front
//id: Optional(1) data: Optional(6)
//node at back
//id: Optional(29) data: Optional(50)
//Program ended with exit code: 0

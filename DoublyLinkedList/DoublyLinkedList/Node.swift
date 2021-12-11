//
//  Node.swift
//  DoublyLinkedList
//
//  Created by 전여훈 on 2021/12/11.
//

import Foundation

class Node<T: Equatable> {
    let id: Int
    let data: T
    var next: Node? = nil
    var prev: Node? = nil
    
    init(id: Int, data: T) {
        self.id = id
        self.data = data
    }
}

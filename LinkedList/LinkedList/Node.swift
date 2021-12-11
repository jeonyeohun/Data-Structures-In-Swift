//
//  Node.swift
//  LinkedList
//
//  Created by 전여훈 on 2021/12/11.
//

import Foundation

class Node<T: Equatable> {
    let id: Int
    let data: T
    var next: Node?
    
    init(id: Int, data: T, next: Node? = nil) {
        self.id = id
        self.data = data
        self.next = next
    }
}

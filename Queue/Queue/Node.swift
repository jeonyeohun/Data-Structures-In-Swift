//
//  Node.swift
//  Queue
//
//  Created by 전여훈 on 2021/12/12.
//

import Foundation

class Node<T> {
    let data: T
    var next: Node? = nil
    
    init(data: T) {
        self.data = data
    }
}

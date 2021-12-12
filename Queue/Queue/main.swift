//
//  main.swift
//  Queue
//
//  Created by 전여훈 on 2021/08/08.
//

import Foundation

var queue = Queue<Int>()

for i in 0..<20 {
    queue.push(i)
}

print(queue.count)

while !queue.isEmpty {
    print(queue.pop())
}

print(queue.count)

for i in 0..<20 {
    queue.push(i)
}

queue.clear()

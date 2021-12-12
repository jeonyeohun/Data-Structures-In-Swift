//
//  main.swift
//  PriorityQueue
//
//  Created by 전여훈 on 2021/07/25.
//

import Foundation

var pq: PriorityQueue<Int> = PriorityQueue<Int>([], <)
pq.push(1)
pq.push(3)
pq.push(2)
pq.push(5)

print(pq.pop()!)
print(pq.top()!)


while !pq.isEmpty {
    print(pq.pop())
}

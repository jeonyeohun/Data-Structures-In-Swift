//
//  main.swift
//  Heap
//  Created by 전여훈 on 2021/07/25.
//

import Foundation

print("\n======Test Min Heap ======")
var heap = Heap<Int>(sortFunction: <)

for number in 0..<10 {
    heap.insert(node: number)
}
while !heap.isEmpty {
    print(heap.remove())
}

//Optional(0)
//Optional(1)
//Optional(2)
//Optional(3)
//Optional(4)
//Optional(5)
//Optional(6)
//Optional(7)
//Optional(8)
//Optional(9)

print("\n======Test Max Heap ======")
heap = Heap<Int>(sortFunction: >)

for number in 0..<10 {
    heap.insert(node: number)
}
while !heap.isEmpty {
    print(heap.remove())
}

//Optional(9)
//Optional(8)
//Optional(7)
//Optional(6)
//Optional(5)
//Optional(4)
//Optional(3)
//Optional(2)
//Optional(1)
//Optional(0)

print("\n======Test Build Heap ======")
heap = Heap<Int>(elements: [9, 8, 7, 6, 5, 4, 3, 2, 1, 0], sortFunction: <)

while !heap.isEmpty {
    print(heap.remove())
}

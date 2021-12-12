//
//  Heap.swift
//  Heap
//
//  Created by 전여훈 on 2021/12/12.
//

import Foundation

struct Heap<T: Comparable> {
    private var elements: [T]
    private let sortFunction: (T, T) -> Bool
    
    init(elements: [T], sortFunction: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.sortFunction = sortFunction
    }
    
    func leftChild(of index: Int) -> Int {
        return index * 2
    }
    func rightChild(of index: Int) -> Int {
        return index * 2 + 1
    }
    func parent(of index: Int) -> Int {
        return index / 2
    }
    mutating func add(element: T) {
        elements.append(element)
    }
    mutating func diveDown(from index: Int) {
        var largest = index
        let leftIndex = self.leftChild(of: index)
        let rightIndex = self.rightChild(of: index)
        
        if leftIndex < elements.endIndex && self.sortFunction(elements[leftIndex], elements[largest]) {
            largest = leftIndex
        }
        if rightIndex < elements.endIndex && self.sortFunction(elements[rightIndex], elements[largest]) {
            largest = rightIndex
        }
        if largest != index {
            elements.swapAt(largest, index)
            self.diveDown(from: largest)
        }
    }
    mutating func swimUp(from index: Int) {
        var index = index
        while index > 1 && self.elements[index/2] < self.elements[index] {
            self.elements.swapAt(index/2, index)
            index /= 2
        }
    }
    mutating func insert(node: T) {
        self.elements.append(node)
        self.swimUp(from: self.elements.endIndex - 1)
    }
    mutating func remove() -> T? {
        if self.elements.count == 1 { return nil }
        self.elements.swapAt(1, elements.endIndex - 1)
        let deleted = elements.removeLast()
        self.diveDown(from: 1)
        
        return deleted
    }
}

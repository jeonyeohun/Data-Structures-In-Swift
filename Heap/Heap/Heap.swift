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
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    var peak: T? {
        return self.elements.first
    }
    
    init(elements: [T] = [], sortFunction: @escaping (T, T) -> Bool) {
        self.elements = elements
        self.sortFunction = sortFunction
        if !elements.isEmpty {
            self.buildHeap()
        }
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
        var higherPriority = index
        let leftIndex = self.leftChild(of: index)
        let rightIndex = self.rightChild(of: index)
        
        if leftIndex < elements.endIndex && self.sortFunction(elements[leftIndex], elements[higherPriority]) {
            higherPriority = leftIndex
        }
        if rightIndex < elements.endIndex && self.sortFunction(elements[rightIndex], elements[higherPriority]) {
            higherPriority = rightIndex
        }
        if higherPriority != index {
            elements.swapAt(higherPriority, index)
            self.diveDown(from: higherPriority)
        }
    }
    mutating func swimUp(from index: Int) {
        var index = index
        while index >= 0 && self.sortFunction(self.elements[index], self.elements[index/2]) {
            self.elements.swapAt(index/2, index)
            index /= 2
        }
    }
    mutating func buildHeap() {
        for index in (0...(self.elements.count / 2)).reversed() {
            self.diveDown(from: index)
        }
    }
    mutating func insert(node: T) {
        self.elements.append(node)
        self.swimUp(from: self.elements.endIndex - 1)
    }
    mutating func remove() -> T? {
        if self.elements.isEmpty { return nil }
        self.elements.swapAt(0, elements.endIndex - 1)
        let deleted = elements.removeLast()
        self.diveDown(from: 0)
        
        return deleted
    }
}

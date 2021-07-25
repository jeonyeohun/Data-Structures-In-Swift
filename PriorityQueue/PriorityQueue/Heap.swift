//
//  main.swift
//  Heap
//  Created by 전여훈 on 2021/07/25.
//

import Foundation

struct Heap<Element> {
    var elements : [Element]
    let sort : (Element, Element) -> Bool
    
    var isEmpty : Bool {
        return elements.isEmpty
    }
    
    var count : Int {
        return elements.count
    }
    
    init(elements: [Element] = [], sort: @escaping (Element, Element) -> Bool) {
        self.elements = elements
        self.sort = sort
        buildHeap()
    }
    
    // 마지막 리프노드의 부모노드부터 루트노드까지 diveDown을 수행한다.
    mutating func buildHeap() {
        for index in (0..<(count / 2)).reversed() {
            diveDown(from: index)
        }
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    func isRoot(_ index: Int) -> Bool {
        return index == 0
    }
    
    func leftChildIndex(of index: Int) -> Int {
        return (2 * index) + 1
    }
    
    func rightChildIndex(of index: Int) -> Int {
        return (2 * index) + 2
    }
    
    func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    func isWithHigherPriority (at firstIdx: Int, than secondIdx: Int) -> Bool {
        return sort(elements[firstIdx], elements[secondIdx])
    }
    
    // 왼쪽 자녀노드가 있는 경우에는 부모노드와 비교하여 더 큰 노드의 인덳스를 반환하고, 없다면 부모노드의 인덱스르 반환한다.
    func higherPriorityWithChild(parentIndex: Int, childIndex: Int) -> Int {
        guard childIndex < count && isWithHigherPriority(at: childIndex, than: parentIndex) else {
            return parentIndex
        }
        return childIndex
    }
    
    // 왼쪽 자녀노드와 부모노드 중 우선순위가 더 큰 노드와 오른쪽 자녀노드를 비교히여 더 큰 노드의 인덱스를 반환한다.
    func higherPriorityOfChildren(for parent: Int) -> Int {
        return higherPriorityWithChild(
            parentIndex: higherPriorityWithChild(parentIndex: parent,
                                                 childIndex: leftChildIndex(of: parent)),
            childIndex: rightChildIndex(of: parent))
    }
    
    mutating func swapElement (at firstIndex: Int, with secondIndex: Int){
        elements.swapAt(firstIndex, secondIndex)
    }
    
    // 트리의 가장 마지막에 새로운 노드를 삽입하고 swimUp으로 트리를 재조정한다.
    mutating func push (_ element: Element) {
        elements.append(element)
        swimUp(fromIndex: count - 1)
    }
    
    // 지정된 인덱스부터 자신의 부모노드와 비교하면서 부모노드보다 우선순위가 높다면 두 노드를 교체한 뒤 새롭게 부모노드가 된 노드부터 swimUp을 다시 수행한다.
    mutating func swimUp(fromIndex index: Int) {
        let parentIdx = parentIndex(of: index)
        guard !isRoot(index), isWithHigherPriority(at: index, than: parentIdx) else {
            return
        }
        swapElement(at: index, with: parentIdx)
        swimUp(fromIndex: parentIdx)
    }
    
    // 루트노드의 내용을 마지막 리프노드의 내용과 교환한뒤 마지막 리프노드를 떼어버린다. 그리고 루트노드부터 diveDown을 수행하여 트리를 재조정한다.
    mutating func pop() -> Element? {
        guard !isEmpty else {
            return nil
        }
        swapElement(at: 0, with: count - 1)
        let removedElement = elements.removeLast()
        if !isEmpty {
            diveDown(from: 0)
        }
        return removedElement
    }
    
    // 부모노드와 자녀노드를 비교하면서 자녀노드의 우선순위가 더 높다면 교환한다.
    mutating func diveDown(from index: Int){
        let childIndex = higherPriorityOfChildren(for: index)
        if index == childIndex {
            return
        }
        swapElement(at: index, with: childIndex)
        diveDown(from: childIndex)
    }
}

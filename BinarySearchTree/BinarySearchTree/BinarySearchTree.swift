//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by 전여훈 on 2021/12/12.
//

import Foundation

struct BinarySearchTree<T: Comparable> {
    var root: TreeNode<T>?
    
    mutating func add(data: T) {
        let node = TreeNode(data: data)
        if root == nil {
            self.root = node
            return
        }
        self.add(newNode: node, under: root)
    }
    
    func search(data: T) -> TreeNode<T>? {
        return self.search(data: data, in: root)
    }
    
    func delete(data: T) -> T? {
        return delete(data: data, at: root)
    }
    
    private func delete(data: T, at node: TreeNode<T>?) -> T? {
        guard let targetNode = self.search(data: data, in: root) else { return nil }
        
        // target is leaf node
        if targetNode.isLeafNode {
            let parent = self.findParent(of: targetNode, under: root)
            parent?.rightChild === targetNode
            ? (parent?.rightChild = nil)
            : (parent?.leftChild = nil)
            return targetNode.data
        }
        
        // target has single child node
        if targetNode.hasSingleChild {
            let child = targetNode.leftChild != nil ? targetNode.leftChild : targetNode.rightChild
            guard let parent = self.findParent(of: targetNode, under: root) else { return nil }
            parent.data > child!.data ? (parent.leftChild = child) : (parent.rightChild = child)
            return targetNode.data
        }
        
        // target has two child nodes
        if targetNode.hasTwoChild {
            let deleted = targetNode.data
            guard let successor = self.findSuccessor(of: targetNode.rightChild) else { return nil }
            if !successor.isLeafNode {
                let parent = self.findParent(of: successor, under: root)
                parent?.leftChild = successor.rightChild
            }
            _ = self.delete(data: successor.data)
            targetNode.update(data: successor.data)
            return deleted
        }
        
        return nil
    }
    
    private func findSuccessor(of node: TreeNode<T>?) -> TreeNode<T>? {
        if node?.leftChild == nil { return node }
        return self.findSuccessor(of: node?.leftChild)
    }
    
    private func findParent(of node: TreeNode<T>, under parentNode: TreeNode<T>?) -> TreeNode<T>? {
        if parentNode == nil { return nil }
        if parentNode?.leftChild === node || parentNode?.rightChild === node {
            return parentNode
        }
        if let parent = findParent(of: node, under: parentNode?.leftChild) {
            return parent
        }
        return findParent(of: node, under: parentNode?.rightChild)
    }
    
    private func search(data: T, in node: TreeNode<T>?) -> TreeNode<T>? {
        if node == nil || node?.data == data { return node }
        
        return node!.data > data
        ? search(data: data, in: node?.leftChild)
        : search(data: data, in: node?.rightChild)
    }
    
    @discardableResult
    private func add(newNode: TreeNode<T>, under parentNode: TreeNode<T>?) -> TreeNode<T>? {
        guard newNode.data != parentNode?.data else { return nil }
        if parentNode == nil {
            return newNode
        }
        parentNode!.data > newNode.data
        ? (parentNode?.leftChild = add(newNode: newNode, under: parentNode?.leftChild))
        : (parentNode?.rightChild = add(newNode: newNode, under: parentNode?.rightChild))
        return parentNode
    }
    
    func printTree() {
        print(root!.asString)
    }
}

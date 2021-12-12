//
//  BinaryTree.swift
//  BinaryTree
//
//  Created by 전여훈 on 2021/12/12.
//

import Foundation

struct BinaryTree<T: Comparable> {
    var root: TreeNode<T>?
    
    mutating func add(data: T) {
        let treeNode = TreeNode(data: data)
        if self.root == nil {
            self.root = treeNode
            return
        }
        self.add(newNode: treeNode, to: root!)
    }
    
    func printInorder() {
        print("\n==== Inorder ====")
        self.printInorder(node: self.root)
        print("\n")
    }
    
    func printPreorder() {
        print("\n==== Preorder ====")
        self.printPreorder(node: self.root)
        print("\n")
    }
    
    func printPostorder() {
        print("\n==== Preorder ====")
        self.printPostorder(node: self.root)
        print("\n")
    }
    
    private func printPreorder(node: TreeNode<T>?) {
        guard let node = node else { return }
        print(node.data, terminator: " ")
        self.printPreorder(node: node.leftChild)
        self.printPreorder(node: node.rightChild)
    }
    
    private func printInorder(node: TreeNode<T>?) {
        guard let node = node else { return }
        self.printInorder(node: node.leftChild)
        print(node.data, terminator: " ")
        self.printInorder(node: node.rightChild)
    }
    
    private func printPostorder(node: TreeNode<T>?) {
        guard let node = node else { return }
        self.printPostorder(node: node.leftChild)
        self.printPostorder(node: node.rightChild)
        print(node.data, terminator: " ")
    }
    
    private func add(newNode: TreeNode<T>, to node: TreeNode<T>) {
        var queue = Queue<TreeNode<T>> ()
        queue.push(root!)
        
        while !queue.isEmpty {
            let now = queue.pop()
            if now?.leftChild == nil {
                now?.leftChild = newNode
                return
            }
            if now?.rightChild == nil {
                now?.rightChild = newNode
                return
            }
            queue.push(now!.leftChild!)
            queue.push(now!.rightChild!)
        }
    }
    
    func printTree() {
        print(root!.asString)
    }
}

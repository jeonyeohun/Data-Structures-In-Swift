//
//  main.swift
//  BinarySearchTree
//
//  Created by 전여훈 on 2021/12/12.
//

import Foundation

var tree = BinarySearchTree<Int>()

tree.add(data: 6)
tree.add(data: 5)
tree.add(data: 1)
tree.add(data: 2)
tree.add(data: 4)
tree.add(data: 0)
tree.add(data: 3)
tree.add(data: 9)
tree.add(data: 7)
tree.add(data: 8)
tree.add(data: 10)
tree.add(data: 16)
tree.add(data: 12)
tree.add(data: 13)



tree.printTree()

//      1
//     / \
//    0   2
//         \
//          5
//         / \
//        3   7
//         \   \
//          4   10

let searchedNode = tree.search(data: 2)
print(searchedNode!.data) // 2
print(tree.delete(data: 10))
tree.printTree()
print(tree.delete(data: 5))
tree.printTree()
print(tree.delete(data: 9))
tree.printTree()

//Optional(9)
//             6
//         ___/ \__
//        1        12
//       / \    __/  \_
//      0   2  7       16
//           \  \     /
//            4  8   13
//           /
//          3

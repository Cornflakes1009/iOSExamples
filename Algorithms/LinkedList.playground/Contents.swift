import UIKit

public class LLNode<T> {
    var value: T
    var next: LLNode?
    var previous: LLNode?
    
    init(value: T, next: LLNode? = nil, previous: LLNode? = nil) {
        self.value = value
    }
}

public class LinkedList<T> {
    public typealias Node = LLNode<T>
    private var head: Node?
    public var first: Node? {
        return head
    }
    
    public var last: Node? {
        guard var node = head else { return nil }
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public var count: Int {
        guard var node = head else { return 0 } // no nodes in list
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    public var print: String {
        var stringArray = "["
        guard var node = head else { return stringArray + "]" }
        
        while let next = node.next {
            
            stringArray += "\(node.value), "
            node = next
        }
        stringArray += "\(node.value)"
        return stringArray + "]"
    }
    
    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            // no nodes in list. This will become the first
            head = newNode
        }
    }
    
    public func node(atIndex index: Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head?.next
            for _ in 1 ..< index {
                node = node?.next
                if node == nil { break }
            }
            return node!
        }
    }
    
    public func insert(value: T, atIndex index: Int) {
        let newNode = Node(value: value)
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } 
        
        else if list.count < index {
            newNode.previous = last
            last?.next = newNode
        } 
        
        else {
            let prev = self.node(atIndex: index - 1)
            let next = prev.next
            newNode.previous = prev
            newNode.next = prev.next
            prev.next = newNode
            next?.previous = newNode
        }
    }
    
    private func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        if let prev = prev {
            // setting the properties for the previous node
            prev.next = next
            next?.previous = prev
        } else { // this case woudld be if we were trying to remove the head
            head = next
        }
        // removing the references on the node
        node.previous = nil
        node.next = nil
        return node.value
    }
    
    public func removeAt(_ index: Int) -> T {
        // this doesn't account for the index being passed being out of index. Should get the last node and check the index
        if index > count - 1 || index < 0 { return "Out of bounds of linked list " as! T }
        let nodeToRemove = node(atIndex: index)
        return remove(node: nodeToRemove)
    }
}

let list = LinkedList<String>()
list.first
list.last
list.count
list.append(value: "Hello")
list.count
list.append(value: "asdf")
list.count
list.append(value: "Another one")

list.print

list.node(atIndex: 1).value
list.node(atIndex: 2).value

list.insert(value: "nine", atIndex: 9)
list.print
//list.removeAt(2)
list.print
list.removeAt(12)
list.removeAt(4)
list.removeAt(3)
list.removeAt(-4)

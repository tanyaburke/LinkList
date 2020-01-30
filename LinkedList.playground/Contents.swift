import UIKit
//This is a SSingly Linked List- I can only see my next c


class Node<T: Equatable> : Equatable {
    
    
    //this say this is of type T, meaning, Generic
    //class has to be given an intializer
    var value:T
    var next: Node?//has the value of nil //Singly
    //    var previous: Node? //Doubly Linked List, its Double cause it points both ways
    
    //required to make the Node, and Type T conform to equatable
    //(lhs) tail == (rhs) head (left hand side- lhs)
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        //T && T = T
        //T && F =F
        return lhs.value == rhs.value && lhs.next == rhs.next
    }

    
    init(_ value: T) {
        self.value = value
    }
}
//implementing custom string convertible to customize descriptio n of  Node

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value) -> nil"//12 -> nil
        }
        //if we have connected Nodes
        return " \(value) -> \(next)"
    }
    
    
}

//instantiating Node instances
let car12 = Node<Int>(12)//one node, pointing to nil
let car99 = Node<Int>(99)

//link our nodes

car12.next = car99
//car99.previous = car12 //

//print the current state of the linked Node
//in order to print our connected nodes in a readable manner
//we conformed to CustomStringConvertible
//implement var description and wrote the print logic

print(car12)// 12 -> 99
//did not print out what we expected
//our class Node doesn't have a way to print itself
//it doesn't have a description
//use custom string convertible



//====================================
//implementation of full linked list,
//has head and tail
//=====================================
class LinkedList<T:Equatable>{
    var head: Node<T>?
    var tail: Node<T>?
    
    //first computed property
    public var first: Node<T>?{
        return head
    }
    
    //last computed property
    public var last: Node<T>?{
        return tail
    }
    
    //append method adds a Node to the end of the list
    public func append(_ value: T){
        let newNode = Node(value)
        //scenario 1- empty list
        guard let lastNode = tail else{
            //empty list
            head = newNode
            tail = head
            return
        }
        //scenario 2 existing nodes
        lastNode.next = newNode
        tail = head
    }
    
    public var isEmpty: Bool{
        print("Empty list")
        return head == nil
    }
    
    //removeLast method- removes last from the list
    public func removeLast() -> Node<T>? {
        //scenario 1 - empty list
        if isEmpty {
            return nil
        }
        var removedNode: Node<T>?
        if head == tail {
          removedNode = head
            head = nil
            tail = nil
            return removedNode
        }
     //scenario 3 iterate, traverse walk the linked list starting from the head
     //for loop conforms to collection protocol
    //will see while loop more
        
        var currentNode = head
        while currentNode?.next != tail {
            currentNode = currentNode?.next
        
        }
        //where is currentNode at the end of the while loop, its one before the tail
       //save the tail Node before removing the last node (tail)
        removedNode = tail
        
        //set tail to Node befor the last Node
        tail = currentNode
        
        //since its removed, we want it to point to nothing
        currentNode?.next = nil
            return removedNode
    }
        
    
}
extension LinkedList: CustomStringConvertible{
    // stored property var name = 90 - Does not compile, extensions are not allowed to have these
    
    //bellow is a computed property
    var description: String {
        guard let head = head else{
            return "empty list"
        }
        return "\(head)"
    }
    
    
}

let fellows = LinkedList<String>()

fellows.append("Tanya")
print (fellows)
fellows.append("Eric")
print (fellows)
fellows.append("Yulia")
print (fellows)
fellows.removeLast()

fellows.append("Oscar")
print (fellows)

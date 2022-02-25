import UIKit
import Foundation

var greeting = "Hello, playground"
func swapTwoValues<T>(_ a: inout T, _ b: inout T){
    let temporaryA = a
    a = b
    b = temporaryA
}
var a = 10
var b = 20
swapTwoValues(&a,&b)
print(a)
print(b)

struct Stack<Element>{
    var arr:[Element]
    
    mutating func push(item:Element){
        arr.append(item)
    }
    mutating func pop(item:Element) -> Element{
        let result = arr.removeLast()
        return result
    }
}
var stackOFStrings = Stack<String>(arr: ["item1"])
stackOFStrings.push(item:"item2")
print(stackOFStrings.arr)


//Extension for generic type

extension Stack{
    var topElement:Element?{
        return arr.isEmpty ? nil : arr[arr.count - 1]
    }
}

// Type Constraints in Action

func findIndex<T:Hashable>(for findValue:T, in array:[T]) -> Int?{
    for (index,value) in array.enumerated(){
        if value == findValue{
            return index
        }
    }
    return nil
}
func useOfDefer() {
    print("print 1")
    defer{
        print("print 2")
    }
    defer{
        print("print 3")
    }
    defer{
        defer{
            print("print 7")
        }
        print("print 4")
    }
    defer{
        print("print 5")
    }
    print("print 6")
}
useOfDefer()




class A {
    func x() {
        print("x:I am of A type ")
    }
    func y() {
        print("y:I am of A type ")
    }
}

class B : A {
  override  func y() {
        print("y:I am of B type ")
    }
    func z() {
        print("z:I am of B type ")
    }
}

let temp  = A() // temp = A()
let tempb : B = B() // temp = B()
let tempa : A = B() // ****


var complitionHandler: ((Int)->Void)?
    func getSumOf(array:[Int], handler: @escaping ((Int)->Void)) {
        //step 2
       //here I'm taking for loop just for example, in real case it'll be something else like API call
       var sum: Int = 0
        for value in array {
            sum += value
        }
//step 3
        complitionHandler = handler
    }
    
    func doSomething() {
        //setp 1
        getSumOf(array: [16,756,442,6,23]) { (sum) in
            print(sum)
            //step 4, finishing the execution
        }
    }



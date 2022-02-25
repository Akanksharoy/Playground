import UIKit
import Foundation

var greeting = "Hello, playground"

////let queue = DispatchQueue(label: "com.example") // serial queue
////let concQueue = DispatchQueue(label: "com.random", attributes: .concurrent) // conc
////concQueue.async {
////    print("task 1")
////    sleep(2)
////    for num in 1...10{
////        print(num)
////    }
////    print("task1 done")
////}
////concQueue.async {
////    print("task 2")
////    sleep(1)
////    for num in 20...30{
////        print(num)
////    }
////    print("task2 done")
////}
////queue.sync {
////    print("sync process executed")
////}
////func closureFunc(a:Int, b:Int, closure: (Int)->Int){
////
////}
//
//
//
///*
// func list(head,size){
//
// //size < link list size
// //list must not be null
//
// //size  = 7
//   tempHead = head
// //a b c
//
//   for (i =0, i <size, i++  {
//  prevnode = tempHead
// tempHead = tempHead ->next
// }
// if (tempHead = = null){
// return
// }
// prevnode -> next  = null
// lastNode = tempHead  //c
//  while(lastNode --> next != null){
// lastNode = lastNode -> next   //d  //e  -> a -> b
//  }
// lastNode ->next = head
// head = tempHead
//
//
//
// }
// */
//
//struct Queue<Element>{
//    var arr:[Element]
//
//    mutating func enQueue(item : Element){
//        arr.append(item)
//    }
//    mutating func deQueue(){
//        arr.remove(at: 0)
//    }
//    func showElements(){
//        for num in arr{
//            print(num)
//        }
//    }
//}
//func calculate_Sum(_ array:Array<Int>, performSum:((Int) -> Void)){
//    var sum = 0
//    for i in array{
//        sum = sum + i
//    }
//    performSum(sum)
//}
//
//
//func calculation(){
//    let array = [0,1,2,3,4,5,6,7,8,9]
//    calculate_Sum(array) { (sum) in
//        debugPrint(sum)
//    }
//    print("non escaping closure")
//}
//calculation()
//
//
//func calculate_Sum_Escaping(_ array:Array<Int>, performSum: @escaping ((Int) -> Void)){
//    var sum = 0
//    for i in array{
//        sum = sum + i
//    }
//    DispatchQueue.global().asyncAfter(deadline: .now() + 4) {
//        performSum(sum)
//    }
//
//}
//
//
//func calculation_escaping(){
//    let array = [0,1,2,3,4,5,6,7,8,9]
//    calculate_Sum(array) { (sum) in
//        debugPrint(sum)
//    }
//    print("escaping closure")
//
//}
//calculation_escaping()
//
//
//
//
//
//let q = DispatchQueue(label: "custom",attributes: .concurrent)
//
//func printQ(){
//    q.async {
//        for i in 0..<10 {
//            print("RED") // t 1
//        }
//        DispatchQueue.main.sync {
//
//        }
//    }
//    q.sync {
//        for i in 0..<10 {
//            print("Green") // t 2
//        }
//    }
//    q.async {
//        for i in 0..<10 {
//            print("Blue")
//        }
//    }
//}
//printQ()


//print("1")
//DispatchQueue.main.async {
//    print("2")
//    DispatchQueue.main.sync {
//        print("3")
//    }
//    print("4")
//}
//print("5")
class Hello {
    var closure: (()->())?

    let str = "Hello"

    init() {
        closure = { [weak self] in
            
            self?.helloWorld()
        }
    }

    private func helloWorld() {
        print("Hello World")
    }


    deinit {
        print("deinit")
    }
}
var hello: Hello? = Hello()
hello?.closure?()
hello = nil

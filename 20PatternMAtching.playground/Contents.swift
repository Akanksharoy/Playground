import UIKit

var greeting = "Hello, playground"
let coordinate = (x:1, y:0, z:0)

if coordinate.y == 0 && coordinate.z == 0{
    print("Along the x axis")
}

if case(_,0,0) = coordinate {
    print("Along the x axis")
}
//Both are same


//Pattern matching with guard

func process(point:(x:Int,y:Int, z:Int)){
    guard case(0,0,0) = point else{
        return
    }
}
process(point: (0,0,0))


//filter with for loop

var arr = [1,5,9,4,2,3]
for case 1 in arr {
    print("found and individual")
}

//wildcard pattern
// _ matches any value
if case(_,0,0) = coordinate {
    print("Along the x axis")
}

//value binding pattern

if case(let x, 0, 0) = coordinate{
    print("Value of x is \(x)")
}

//Enumeration pattern matching

enum Direction {
    case east,west,north,south
}
let direction = Direction.north
switch direction{
case .north:
    print("Test")
case .east:
    print(".east")
default:
    print("default")
}

enum Pet {
    case plant
    case animal(legs:Int)
}
let pet = Pet.animal(legs: 4)

switch pet{
case .animal(let x): print("number of legs \(x)")
default: print("Default ")
}
//is type casting pattern

let response:[Any] = [1,"Akki", 2.0]
for res in response{
    switch res{
    case is String:
        print(res)
    case is Int:
        print("integer")
    default:
        print("default")
    }
}

//as type casting pattern

for res in response{
    switch res{
    case let text as String:
        print(text)
    default:
        print("default")
    
    }
}
//use of where
var numArray = [1,2,3,4,5,6,7,8,9,0]
for num in numArray{
    switch num {
    case let x  where x%2==0:
        print("even")
    default:
        print("odd")
    }
}


// associated enum and where
enum LevelStatus {
  case complete
  case inProgress(percent: Double)
  case notStarted
}
let levels: [LevelStatus] =
  [.complete, .inProgress(percent: 0.9), .notStarted]
for level in levels {
  switch level {
  case .inProgress(let percent) where percent > 0.8 :
    print("Almost there!")
  case .inProgress(let percent) where percent > 0.5 :
    print("Halfway there!")
  case .inProgress(let percent) where percent > 0.2 :
    print("Made it through the beginning!")
  default:
break
} }

//Custom tupple

let name = "Bob"
let age = 23

if case ("Bob",23) = (name,age){
    print("Found the correct bob")
}
//fibonacci series


func fibonacci(num:Int){
    var num1 = 0
    var num2 = 1
    
    for number in 2...num{
       let nums = num1+num2
       num1 = num2
        num2 = nums
    }
    print(num2)
}

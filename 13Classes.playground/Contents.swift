import UIKit
class Person{
    var firstName:String
    var lastName:String
    init(firstName:String, lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
    var fullName:String{
        "\(firstName) \(lastName)"
    }
}


struct Grade{
    let letter:String
    let point:Double
    let credits:Double
    
}
class Student{
    var firstName:String
    var lastName:String
    var grades:[Grade] = []
    var credits:Double = 0.0
    init(firstName:String, lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
   
    
    func recordGrade(_ grade:Grade){
        grades.append(grade)
        credits+=grade.credits
    }
}
let jane = Student(firstName: "Jane", lastName: "Sir")
let history = Grade(letter: "A", point: 10, credits: 3)
jane.recordGrade(history)

extension Student{
    var fullName:String{
        "\(firstName) \(lastName)"
    }
}


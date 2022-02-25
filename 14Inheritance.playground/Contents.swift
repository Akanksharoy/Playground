import UIKit

struct Grade{
    var letter:String
    var points:Double
    var creits:Double
}

//Superclass
class Person{
    var firstName:String
    var lastName:String
    init(firstName:String, lastName:String){
        self.firstName = firstName
        self.lastName = lastName
    }
}
//subclass
class Student: Person{ // only single inheritance allowed
    var grades:[Grade] = []
    
    func recordGrade(grade:Grade){
        grades.append(grade)
    }
}

var stu = Student(firstName: "John", lastName: "Sir")
var history = Grade(letter: "A", points: 10.0, creits: 3.0)
stu.recordGrade(grade: history)

var person = Person(firstName: "Jonny", lastName: "Anything")
//Person does not have access to record grade
//person.recordGrade(grade: history)

///There is no limit in depth of subclassing

class BandMember:Student{
    var minimumPracticeTime = 2
}

class OboePlayer:BandMember{
    override var minimumPracticeTime: Int{
        get{
            super.minimumPracticeTime * 2
        }
        set{
            super.minimumPracticeTime = newValue/2
        }
    }
}

/// Polymorphism -- object can be treated differently example OboePlayer can be treated as a person
func phoneBookName(_ person:Person) -> String{
    return "\(person.firstName) \(person.lastName)"
}
var personOne = Person(firstName: "first", lastName: "name")
var oboeplayer = OboePlayer(firstName: "second", lastName: "name")
phoneBookName(personOne)
phoneBookName(oboeplayer)


// not accessible
//(oboeplayer as Student).minimumPracticeTime
personOne = oboeplayer
(personOne as? BandMember)?.minimumPracticeTime
(personOne as! BandMember).minimumPracticeTime

func afterClassActivity(for student: Student){
    print("Goes home")
}
func afterClassActivity(for student: OboePlayer){
    print("Goes  to practise")
}
afterClassActivity(for: stu)
afterClassActivity(for: oboeplayer)

//override methods of super class
class StudentAthlete:Student{
    var failedGrades:[Grade] = []
    override func recordGrade(grade: Grade) {
        super.recordGrade(grade: grade)
        if grade.letter == "F" {
            failedGrades.append(grade)
        }
    }
    var isEligible: Bool {
        failedGrades.count < 3
    }
}

///Two phase initialization process
class NewStudent {
    var firstName:String
    var lastName:String
    var grades:[Grade] = []
    init(firstName:String, lastName:String){
        self.firstName = firstName
        self.lastName  = lastName
    }
    func recordGrade(grade:Grade){
        grades.append(grade)
    }
    
}
class NewStudentAthelete:NewStudent{
    var sport:[String]
     init(firstName: String, lastName: String,sports:[String]) {
        self.sport = sports
        super.init(firstName: firstName, lastName: lastName)
         let passgrade = Grade(letter: "P", points: 10.0, creits: 10.0)
        recordGrade(grade: passgrade)
        
    }
}

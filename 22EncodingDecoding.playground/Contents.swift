import UIKit

struct Employee:Codable{
    var name:String
    var id:Int
    var favToy:Toy
    enum CodingKeys:String,CodingKey{
        case id = "employee_id"
        case name
        case favToy
    }
}
struct Toy:Codable{
    var name:String
}
let toy1 = Toy(name: "Teddy Bear");
let employee1 = Employee(name: "John Appleseed", id: 7,
                         favToy: toy1)
//encoding
var jsonEncoder = JSONEncoder()
var jsonData = try jsonEncoder.encode(employee1)
//print json string from data
var jsonString = String(data: jsonData, encoding: .utf8)

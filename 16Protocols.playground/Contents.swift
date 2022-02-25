import UIKit

enum Direction{
    case left
    case rigtht
}
protocol DirectionalVehicle{
    func accelrate()
    func stop()
    func turn(_ direction:Direction)
    func description()->String
}

///Cannot have optional value in protocol methods
///example as below
//protocol optionalDirectionVehicle{
//    func turn(_direction:Direction = .left) //gives error
//}
///To declare optional functions it can be done in this way
protocol optionalDirectionVehicle{
    func turn()
    func turn(_direction:Direction)
}

///Properties in protocols // but we do not implement properties
protocol VehicleProperties{
    var weight:Int {
        get
    }
    var name:String{get set}
}

///Initializers in protoco
protocol Account{
    var amount:Double{get set}
    init(initialAmount:Double)
    init?(transferAccount:Account)
}

class BitcoinAccount:Account{
    var amount: Double
    required init(initialAmount: Double) {
        amount = initialAmount
    }

    required init?(transferAccount: Account) {
        guard transferAccount.amount > 0.0 else {
            return nil
        }
        amount = transferAccount.amount
    }

}
var accountType: Account.Type = BitcoinAccount.self
let account = accountType.init(initialAmount: 30.00)
let transferAccount = accountType.init(transferAccount:
account)!

///Protocol Inheritanc
protocol Vehicle{
    func accelerate()
    func stop()
}

protocol WheelVehicle:Vehicle{
    var numberOfWheels:Int {get}
    var wheelSize:Double{get set}
}

///Implementing protocols
class BikeVehicle:Vehicle{
    var brakesapplied:Bool = false
    var peddling: Bool = true
    func accelerate() {
        brakesapplied = false
        peddling = true
        
    }
    
    func stop() {
        brakesapplied = true
        peddling = false
    }
}

///Implementing properties
///Protocols don’t care how you implement their requirements, as long as you implement them. Your choices for implementing a get  and set requirement are:
///• A constant stored property.
///• A variable stored property.
///• A read-only computed property.
///• A read-write computed property.
class Bike:WheelVehicle{
    let numberOfWheels: Int = 2
    var wheelSize: Double = 16.0
    var brakesapplied:Bool = false
    var peddling: Bool = true
    func accelerate() {
        brakesapplied = false
        peddling = true
        
    }
    
    func stop() {
        brakesapplied = true
        peddling = false
    }
  
}

///Associated types in protocol
protocol WeightCalculator{
    associatedtype WeightType
    var weight:WeightType{get}
}
class HeavyThing: WeightCalculator{
    typealias WeightType = Int
    var weight: Int{100}
}
class LightThing:WeightCalculator{
    typealias WeightType = Double
    var weight: Double = 16.0
}
///Implementing multiple protocols
protocol Wheeled {
  var numberOfWheels: Int { get }
  var wheelSize: Double { get set }
}
class Bikemultiple: Vehicle, Wheeled {
    func accelerate() {
        
    }
    
    func stop() {
        
    }
    
    var numberOfWheels: Int = 10
    
    var wheelSize: Double = 2
    
  // Implement both Vehicle and Wheeled
}

///Protocol Composition

func protocolComposition(_ type: Vehicle & WheelVehicle){
    // type - confirming to both the protocols
}

///Requiring reference semantics
protocol Named{
    var name:String{get set}
}
class ClassyName:Named{
    var name: String
    init(_ name:String){
        self.name = name
    }
    
}
struct StructyName:Named{
    var name: String
}
var classyName = ClassyName("Classy name")
var referenceType = classyName
referenceType.name = "Copy class"

var structyName = StructyName(name: "Structy Name")
var copyStruct = structyName
copyStruct.name = "Copy Name"

///Protocol must only be adopted by class - it can be done in thsi way
protocol NamedReferenceType: class {
    // can only be adopted by class
    var name:String{get set}
}
///Protocols in the Standard Library
///Equatable
class Record {
  var wins: Int
  var losses: Int
  init(wins: Int, losses: Int) {
      self.wins = wins
      self.losses = losses
  }
}
extension Record:Equatable{
    static func ==(lhs:Record, rhs:Record) -> Bool{
        return lhs.losses == rhs.losses && lhs.wins == rhs.wins
    }
}
protocol Comparable: Equatable {
  static func <(lhs: Self, rhs: Self) -> Bool
  static func <=(lhs: Self, rhs: Self) -> Bool
  static func >=(lhs: Self, rhs: Self) -> Bool
  static func >(lhs: Self, rhs: Self) -> Bool
}
protocol AssociatedType {
    associatedtype weightType
    func associatedTest()
}
class AssociatedClass:AssociatedType{
    typealias weightType = Int
    func associatedTest() {
        print("associated type")
    }
}

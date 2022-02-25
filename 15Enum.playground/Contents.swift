import UIKit

enum Month:CaseIterable{
    case January,February,March,April,May,June,July,August,September,October,November,December
    
    var semester:String{
        switch(self){
        case .January,.February,.November,.December:
           return ("Winter")
        case .May,.March,.April,.June,.July,.August,.September,.October:
           return ("Autum")
        
        }
    }
}
///Switch must be exhaustive
func semester(month:Month){
    switch(month){
    case .January,.February,.November,.December:
        print("Winter")
    case .May,.March,.April,.June,.July,.August,.September,.October:
        print("Autum")
    
    }
}
var month = Month.August
semester(month: month)

month = .July
semester(month: month)

month.semester
////////////////////////////////////////////////////-----Very important -------------------------------------------
///Associated values in enum
var balance = 100
enum WithDrawableResult{
    case success(newBalance:Int)
    case error(message:String)
}
func withdrawAmount(amount:Int) -> WithDrawableResult{
    if (amount<balance){
        balance -= amount
        return .success(newBalance: balance)
    }
    else{
        return .error(message: "Balance is low")
    }
}
let result = withdrawAmount(amount: 50)
switch result{
case .success(let newBalance):
    print("Balance \(balance)")
case .error(let message):
    print(message)
}

enum HTTPMethod {
    case get
    case post(body:String)
}

let request = HTTPMethod.post(body: "My request")

guard case .post(let body) = request else{
    fatalError("no msg was posted")
}
print(body)

///iterating through all the cases
for month in Month.allCases{
    print(month)
}


//enumerations without any cases
//don't have to create instances
enum Math{
    static func add(a:Int, b:Int){
        print(a+b)
    }
}

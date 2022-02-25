enum Month: Int {
    case January
    case Feberuary
    case March
    case April
    case May
    case June
    case July
    case August
    case September
    case November
    case December
}
print(Month.January.rawValue)
let enumRawInit = Month(rawValue: 5)
print(enumRawInit ?? "0")
enum icon:String{
    case movies
    case sports
    case weather
    
    var file:String {
        "\(rawValue).png"
    }
}
var filename = icon.movies
enum Mercedes {

 case sedan(height: Double)
 case suv(height: Double)
 case roadster(height: Double)
}

var choice = Mercedes.suv(height: 5.4)
print(choice)

switch(choice) {
 case let .sedan(height):
   print("Height:", height)

 case let .suv(height):
   print("Height:", height)

 case let .roadster(height):
   print("Height:", height)
}

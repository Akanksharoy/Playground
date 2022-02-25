import UIKit


//Custom Failable initializer -- init can return nil as well
struct testFaliableInitializer{
    var random:Int
    init?(random:Int){
        if random<1 {
            return nil
        }
        else{
            self.random = random
        }
    }
}

//Map and compact map
let array:[Int?] = [1,2,3,4,5,nil]

let maparray = array.map({$0})
let comapct = array.compactMap({$0})
print(maparray)
print(comapct)

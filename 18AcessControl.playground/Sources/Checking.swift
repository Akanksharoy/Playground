import Foundation

import Foundation
public class CheckingAccount: BasicAccount {
    public  let accountNumber = UUID().uuidString
    public override init() { }
    public class Check {
        public let account: String
        public var amount: Dollars
        private(set) var cashed = false
        
        func cash() {
            cashed = true
        }
        ///Closely related to private is fileprivate, which permits access to any code written in the same file as the entity, instead of the same lexical scope and extensions within the same file that private provides.
        // change below private to fileprivate and code works
        fileprivate init(amount: Dollars, from account: CheckingAccount) {// declare this as private
            self.amount = amount ///can acess
            self.account = account.accountNumber
        }
        
    }
    public func writeCheck(amount: Dollars) -> Check? {
        guard balance > amount else {
            return nil
        }
        let check = Check(amount: amount, from: self) // then this is not possible
        withdraw(amount: check.amount)
        return check
    }
    public func deposit(_ check: Check) {
        guard !check.cashed else {
            return
        }
        //check.cashed = true cannot acess
       deposit(amount: check.amount)
       check.cash()
    }
}



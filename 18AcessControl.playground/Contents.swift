import UIKit

var greeting = "Hello, playground"
//
//   Account.swift..swift
//  18AcessControl
//
//  Created by Akanksha on 05/02/22.
//

import Foundation

let johnChecking = CheckingAccount()
johnChecking.deposit(amount: 300.00)


/// declare BasicAccount to be open
//class SavingsAccount: BasicAccount {  /// will not work
//  var interestRate: Double
//  init(interestRate: Double) {
//    self.interestRate = interestRate
//  }
//  func processInterest() {
//    let interest = balance * interestRate
//    deposit(amount: interest)
//  }
//}
//Do you see it all coming together? The interfaces you’ve crafted using public and open permit subclassing of BasicAccount to provide new types of accounts. withdraw(amount:) and deposit(amount:), because they’re public, can be used by those subclasses. The implementations of withdraw(amount:) and deposit(amount:) are safe from being overridden because they’re only public, not open!

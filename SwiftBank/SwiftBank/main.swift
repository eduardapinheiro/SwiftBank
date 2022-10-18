//
//  main.swift
//  SwiftBank
//
//  Created by Eduarda Pinheiro on 15/10/22.
//

import Foundation

struct SwiftBank {
    private let password: String
    private var balance: Double = 0 {
        didSet {
            if balance < 100 {
                displayLowBalanceMessage()
            }
        }
    }
    static var depositBonusRate = 0.01
    
    init(password: String, initialDeposit: Double) {
        self.password = password
        makeDeposit(depositAmount: initialDeposit)
    }
    
    private func isValid(enteredPassword: String) -> Bool {
        if enteredPassword == password {
            return true
        }
        else {
            return false
        }
    }
    
    private func finalDepositWithBonus(deposit: Double) -> Double {
        return deposit + (deposit * SwiftBank.depositBonusRate)
    }
    
    mutating func makeDeposit(depositAmount: Double) {
        if depositAmount >= 1000 {
        let depositWithBonus = finalDepositWithBonus(deposit: depositAmount)
        print("Making a deposit of \(depositAmount) with a bonus rate. The final amount deposited is \(depositWithBonus).")
        }
        else if depositAmount < 0 {
            print("It's not posible make a deposit with negative number")
        }
        else if depositAmount == 0 {
            print("It's not posible make a deposit with 0")

        }
        else {
            print("Making a deposit of \(depositAmount)")
        }
        self.balance += depositAmount
    }

    func displayBalance(password: String) {
        if !isValid(enteredPassword: password) {
            print("Error: Invalid password. Cannot retrieve balance.")
        }
        return
            print("Your current balance is \(balance)")
    }
    
    mutating func makeWithDrawal(withdrawalAmount: Double, password: String) {
        if !isValid(enteredPassword: password) {
            print("Error: Invalid password. Cannot make withdrawal.")
        } else if(withdrawalAmount < 0) {
            print("It's not possible make withdrawal with negative number")
        } else if (withdrawalAmount == 0) {
            print("It's not possible make withdrawal with 0")
        } else if(withdrawalAmount > balance) {
            print("Withdraw more cash than they have in the bank")
        }
        else {
            balance -= withdrawalAmount
            print("Making a \(withdrawalAmount) withdrawal")
        }
        
    }
    private func displayLowBalanceMessage() {
        print("Alert: Your balance is under $100")
    }
}

var myAccount = SwiftBank(password: "123", initialDeposit: -1)
myAccount.makeDeposit(depositAmount: 50.0)
myAccount.makeWithDrawal(withdrawalAmount: 100.0, password: "321")
myAccount.makeWithDrawal(withdrawalAmount: 20, password: "123")
myAccount.displayBalance(password: "123")

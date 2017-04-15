//
//  ViewModel.swift
//  RevYoPoints
//
//  Created by Raja on 4/14/17.
//  Copyright © 2017 us.banga.RevYoPoints. All rights reserved.
//

import Foundation

public class ViewModel {
    
    enum RewardsLevel: Int {
        case LevelOne = 45
        case LevelTwo = 70
        case LevelThree = 100
    }
    
    fileprivate var rewardsLevel: RewardsLevel? = nil
    
    fileprivate func getAllCustomers() -> [CustomerEntity?] {
    
        let customer1 = CustomerEntity(name: "John Doe", points: 36, phoneNumber: "(111) 111-1111")
        
        let customer2 = CustomerEntity(name: "Johnny Depp", points: 21, phoneNumber: "(222) 222-2222")
 
        let customer3 = CustomerEntity(name: "Ricky Martin", points: 78, phoneNumber: "(333) 333-3333")
        
        let customer4 = CustomerEntity(name: "Mark Smith", points: 105, phoneNumber: "(444) 444-4444")

        return [customer1, customer2, customer3, customer4]
    
    }
}

extension ViewModel : ViewModelProtocol {
    
    public func createNewCustomer(name: String, points: Int, phoneNumber: String) -> Bool {
        //TODO: Code
        return true
    }

    public func updateCustomerData(name: String, points: Int, phoneNumber: String) -> Bool {

        return true
    }
    
    public func getCustomerData(phoneNumber: String) -> CustomerEntity? {
        
        let allCustomers = getAllCustomers()
        
        for customer in allCustomers {
            guard let cust = customer else {
                return nil
            }
            
            if cust.PhoneNumber == phoneNumber {
                return customer
            }
        }
        return nil
    }
    
    public func getRewards(points: Int) -> String {
        
        let rewards: String
        
        switch points {
            case 45...70 :
                rewardsLevel = RewardsLevel.LevelOne
                rewards = "$3 off (Min $5)"
            case 70...100 :
                rewardsLevel = RewardsLevel.LevelTwo
                rewards = "$5 off (Min $10)"
            case let p where p > 100 :
                rewardsLevel = RewardsLevel.LevelThree
                rewards = "Free 12oz Yogurt"
            default :
                rewardsLevel = nil
                rewards = ""
        }
        
        return rewards
    }
}

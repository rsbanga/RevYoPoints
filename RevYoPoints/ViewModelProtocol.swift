//
//  ViewModelProtocol.swift
//  RevYoPoints
//
//  Created by Raja on 4/14/17.
//  Copyright © 2017 us.banga.RevYoPoints. All rights reserved.
//

import Foundation

public protocol ViewModelProtocol {

    func getCustomerData(phoneNumber: String) -> CustomerEntity?
    
    func createNewCustomer(name: String, points: Int, phoneNumber: String) -> Bool
    
    func updateCustomerData(name: String, points: Int, phoneNumber: String) -> Bool
}

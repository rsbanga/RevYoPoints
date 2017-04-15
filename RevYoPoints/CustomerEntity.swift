//
//  CustomerEntity.swift
//  RevYoPoints
//
//  Created by Raja on 4/14/17.
//  Copyright © 2017 us.banga.RevYoPoints. All rights reserved.
//

import Foundation

public class CustomerEntity {
    
    fileprivate var name: String = ""
    fileprivate var points: Int = 0
    fileprivate var phoneNumber: String = ""
    
    var Name: String {
        get {
            return self.name
        }
        set{
            self.name = newValue
        }
    }
    var Points: Int {
        get {
            return self.points
        }
        set{
            self.points = newValue
        }
    }
    var PhoneNumber: String {
        get {
            return self.phoneNumber
        }
        set{
            self.phoneNumber = newValue
        }
    }

    var vip: Bool {
        get {
                return points > 100
            }
    }
    
    init(name: String = "", points: Int = 0, phoneNumber: String) {
        self.name = name
        self.points = points
        self.phoneNumber = phoneNumber
    }
}

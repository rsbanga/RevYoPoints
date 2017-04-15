//
//  ViewController.swift
//  RevYoPoints
//
//  Created by Raja on 1/25/17.
//  Copyright © 2017 us.banga.RevYoPoints. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customerName: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var rewards: UILabel!
    @IBOutlet weak var vip: UILabel!
    @IBOutlet weak var addPoints: UILabel!

    @IBOutlet weak var display: UILabel!
    
    var userIsInMiddleOfTyping = false
    
    @IBAction func touchNumber(_ sender: UIButton) {

        let digit = sender.currentTitle!
        print ("\(digit) was pressed")
        
        switch digit {
        
            case "CLR" :
                display!.text = ""
                customerName!.text = ""
                points!.text = ""
                rewards!.text = ""
                vip!.text = ""
                
                return
            case "<--" :
                let numberInDisplay = display!.text!
        
                let end = numberInDisplay.index(numberInDisplay.endIndex, offsetBy: -1)
                        display!.text = numberInDisplay.substring(to: end)
                return
            case "GO" :
                findCustomer(sender)
            default :
                display!.text = display!.text!
        }
        
        var numberCurrentlyInDisplay = display!.text!

        if numberCurrentlyInDisplay.characters.count == 1 {
            numberCurrentlyInDisplay =  "(" + numberCurrentlyInDisplay
        }
        
        if numberCurrentlyInDisplay.characters.count == 4 {
            numberCurrentlyInDisplay =  numberCurrentlyInDisplay + ") "
        }
        
        if numberCurrentlyInDisplay.characters.count == 9 {
            numberCurrentlyInDisplay =  numberCurrentlyInDisplay + "-"
        }
        
        if numberCurrentlyInDisplay.characters.count < 14 {
            if userIsInMiddleOfTyping {
                display!.text = numberCurrentlyInDisplay + digit
            } else {
            
                display!.text = digit
                userIsInMiddleOfTyping = true
            }
        }
    }
    
    
    @IBAction func findCustomer(_ sender: UIButton) {
        
        let phoneNumber = display!.text!
        
        print ("\(phoneNumber)")
        
        if phoneNumber.characters.count == 14 {
            let viewModel = ViewModel()
            
            let customer = viewModel.getCustomerData(phoneNumber: phoneNumber)
            
            guard let cust = customer else {
                customerName.text = "Customer not found"
                return
            }
            
            customerName.text = "Welcome back \(cust.Name)"
            points.text = String(cust.Points)
            rewards.text = viewModel.getRewards(points: cust.Points)
            if cust.vip {
                vip.text = "VIP"
            }else{
                vip.text = ""
            }
        }

    }
    
    @IBAction func redeemRewards(_ sender: UIButton) {
        //TODO: update customer points
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


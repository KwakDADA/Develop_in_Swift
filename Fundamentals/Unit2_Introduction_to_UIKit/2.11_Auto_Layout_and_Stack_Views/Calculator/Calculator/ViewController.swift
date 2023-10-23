//
//  ViewController.swift
//  Calculator
//
//  Created by 곽다은 on 10/22/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var display: UILabel!
    var currNum = "0"
    var savedNum = "0"
    var currOperation = ""
    var prevOperation = ""
    
    @IBOutlet var clearButton: UIButton!
    
    @IBOutlet var sumButton: UIButton!
    @IBOutlet var subButton: UIButton!
    @IBOutlet var mulButton: UIButton!
    @IBOutlet var divButton: UIButton!
    @IBOutlet var eqButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func digit(num: String) {
        guard num.count > 3 else {
            display.text = num
            return
        }
        var temp = ""
        let numberOfTop = num.count % 3
        for i in 0..<num.count {
            let c = Array(num)[i]
            if c.isNumber {
                temp.append(c)
            } else { continue }
            
            if i+1 == numberOfTop || ((i+1) % 3 == numberOfTop && i != num.count-1) {
                temp += ","
            }
        }
        display.text = temp
    }
    
    func calcButtonInit() {
        sumButton.backgroundColor = .systemOrange
        subButton.backgroundColor = .systemOrange
        mulButton.backgroundColor = .systemOrange
        divButton.backgroundColor = .systemOrange
        eqButton.backgroundColor = .systemOrange
        
        sumButton.titleLabel?.tintColor = .white
        subButton.titleLabel?.tintColor = .white
        mulButton.titleLabel?.tintColor = .white
        divButton.titleLabel?.tintColor = .white
        eqButton.titleLabel?.tintColor = .white
    }
    
    func buttonSelected(button: UIButton) {
        button.backgroundColor = .white
        button.titleLabel?.tintColor = .orange
    }
    
    @IBAction func numericButtonTapped(_ sender: UIButton) {
        clearButton.titleLabel!.text = "C"
        guard currNum.count < 9 else { return }
        
        calcButtonInit()
        
        if currNum == "0" {
            currNum = (sender.titleLabel?.text)!
        } else {
            currNum.append((sender.titleLabel?.text)!)
        }
        digit(num: currNum)
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        if clearButton.titleLabel!.text == "C" {
            print("C")
            clearButton.titleLabel!.text = "AC"
            currNum = "0"
            
            print(currOperation)
            switch currOperation {
            case "+": buttonSelected(button: sumButton)
            case "-": buttonSelected(button: subButton)
            case "×": buttonSelected(button: mulButton)
            case "÷": buttonSelected(button: divButton)
            default: break
            }
            print(currNum, prevOperation, savedNum)
        } else {
            print("AC")
            currNum = "0"
            display.text = "0"
            prevOperation = ""
            savedNum = "0"
            calcButtonInit()
            print(currNum, prevOperation, savedNum)
        }
    }
    
    @IBAction func calcButtonTapped(_ sender: UIButton) {
        calcButtonInit()
        buttonSelected(button: sender)
        currOperation = sender.titleLabel!.text!
        
        guard currNum != "" else { 
            prevOperation = sender.titleLabel!.text!
            return
        }
        
        print(currNum, prevOperation, savedNum)
        
        if savedNum == "0" {
            savedNum = currNum
        } else {
            switch prevOperation {
            case "+": savedNum = String(Int(savedNum)! + Int(currNum)!)
            case "-": savedNum = String(Int(savedNum)! - Int(currNum)!)
            case "×": savedNum = String(Int(savedNum)! * Int(currNum)!)
            case "÷": savedNum = String(Int(savedNum)! / Int(currNum)!)
            default: break
            }
        }
        prevOperation = currOperation
        
        print(currNum, savedNum)
        digit(num: savedNum)
        currNum = ""
    }
}

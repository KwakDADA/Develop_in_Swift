//
//  ViewController.swift
//  TrafficSegues
//
//  Created by 곽다은 on 12/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var segueSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        if segueSwitch.isOn {
            performSegue(withIdentifier: "hello", sender: segueSwitch)
        }
    }
    
    @IBAction func byeTapped(_ sender: Any) {
        if segueSwitch.isOn {
            performSegue(withIdentifier: "bye", sender: segueSwitch)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if segueSwitch.isOn {
            return true
        }
        return false
    }
}


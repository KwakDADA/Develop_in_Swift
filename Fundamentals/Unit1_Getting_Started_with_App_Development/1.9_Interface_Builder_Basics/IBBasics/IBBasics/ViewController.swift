//
//  ViewController.swift
//  IBBasics
//
//  Created by 곽다은 on 2023/09/17.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var myButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myButton.tintColor = .red
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        print("The button was pressed")
    }
    
}

//
//  ViewController.swift
//  Light
//
//  Created by 곽다은 on 2023/09/19.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    fileprivate func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        lightOn.toggle()
        updateUI()
    }
}

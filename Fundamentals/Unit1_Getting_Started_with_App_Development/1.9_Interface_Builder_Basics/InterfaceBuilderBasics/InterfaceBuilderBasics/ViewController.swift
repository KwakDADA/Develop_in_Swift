//
//  ViewController.swift
//  InterfaceBuilderBasics
//
//  Created by 곽다은 on 2023/09/19.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func changeTitle(_ sender: Any) {
        mainLabel.text = "This app rocks!"
    }
    
}


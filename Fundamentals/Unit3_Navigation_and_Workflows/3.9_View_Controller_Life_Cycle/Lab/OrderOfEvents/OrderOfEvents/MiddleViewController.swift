//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by 곽다은 on 12/8/23.
//

import UIKit

class MiddleViewController: UIViewController {
    
    @IBOutlet var middleLabel: UILabel!
    var eventNumber = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabel(from: "viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateLabel(from: "viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        updateLabel(from: "viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        updateLabel(from: "viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        updateLabel(from: "viewDidDisappear")
    }
    
    func updateLabel(from: String) {
        if let text = middleLabel.text {
            middleLabel.text = "\(text)\nEvent number \(eventNumber) was \(from)"
            eventNumber += 1
        }
    }

}

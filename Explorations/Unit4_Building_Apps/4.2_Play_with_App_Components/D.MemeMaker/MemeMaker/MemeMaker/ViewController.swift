//
//  ViewController.swift
//  MemeMaker
//
//  Created by 곽다은 on 2023/08/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UISegmentedControl!
    
    var topChoices: [CaptionOption]
    var bottomChoices: [CaptionOption]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func valueChanged(_ sender: UISegmentedControl) {
    }
    
    
}

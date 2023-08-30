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
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    var topChoices: [CaptionOption] = [
        CaptionOption(emoji: "🕶️", caption: "You know what's cool?"),
        CaptionOption(emoji: "💥", caption: "You know what's makes me mad?"),
        CaptionOption(emoji: "💕", caption: "You know what I love?")
    ]
    var bottomChoices: [CaptionOption] = [
        CaptionOption(emoji: "🐱", caption: "Cats wearing hats"),
        CaptionOption(emoji: "🐕", caption: "Dogs carrying logs"),
        CaptionOption(emoji: "🐒", caption: "Monkeys being funky")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        topSegmentedControl.removeAllSegments()
        for choice in topChoices {
            topSegmentedControl.insertSegment(withTitle: choice.emoji, at: topChoices.count, animated: false)
        }
        topSegmentedControl.selectedSegmentIndex = 0
        
        bottomSegmentedControl.removeAllSegments()
        for choice in bottomChoices {
            bottomSegmentedControl.insertSegment(withTitle: choice.emoji, at: bottomChoices.count, animated: false)
        }
        bottomSegmentedControl.selectedSegmentIndex = 0
        
        segmentSelected()
    }

    @IBAction func valueChanged(_ sender: UISegmentedControl) {
        segmentSelected()
    }
    
    func segmentSelected() {
        topCaptionLabel.text = topChoices[topSegmentedControl.selectedSegmentIndex].caption
        bottomCaptionLabel.text = bottomChoices[bottomSegmentedControl.selectedSegmentIndex].caption
    }
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
   
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
}

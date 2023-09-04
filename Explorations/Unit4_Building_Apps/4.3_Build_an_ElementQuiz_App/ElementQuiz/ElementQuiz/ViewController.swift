//
//  ViewController.swift
//  ElementQuiz
//
//  Created by 곽다은 on 2023/08/30.
//

import UIKit

enum Mode {
    case flashCard, quiz
}

enum State {
    case question, answer
}

var mode: Mode = .flashCard

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var modeSelector: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    
    let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    var currentElementIndex = 0
    
    var state: State = .question
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateFlashCardUI()
    }

    func updateFlashCardUI() {
        let elementName = elementList[currentElementIndex]
        let image = UIImage(named: elementName)
        imageView.image = image
        
        if state == .answer {
            answerLabel.text = elementName
        } else {
            answerLabel.text = "?"
        }
    }

    @IBAction func showAnswer(_ sender: Any) {
        state = .answer
        
        updateFlashCardUI()
    }
    
    @IBAction func next(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex == elementList.count {
            currentElementIndex = 0
        }
        
        state = .question
        
        updateFlashCardUI()
    }
    
}


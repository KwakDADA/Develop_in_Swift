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

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var modeSelector: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    
    let elementList = ["Carbon", "Gold", "Chlorine", "Sodium"]
    var currentElementIndex = 0
    
    var state: State = .question
    
    // Quiz-specific state
    var answerIsCorrect = false
    var correctAnswerCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    // Updates the app's UI in flash card mode.
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
        
        updateUI()
    }
    
    @IBAction func next(_ sender: Any) {
        currentElementIndex += 1
        if currentElementIndex == elementList.count {
            currentElementIndex = 0
        }
        
        state = .question
        
        updateUI()
    }
    
    // Updates the app's UI in quiz mode.
    func updateQuizUI() {
        switch state {
        case .question:
            answerLabel.text = ""
        case .answer:
            if answerIsCorrect {
                answerLabel.text = "Correct!"
            } else {
                answerLabel.text = "❌"
            }
        }
    }
    
    // Updates the app's UI based on its mode and state.
    func updateUI() {
        switch mode {
        case .flashCard:
            updateFlashCardUI()
        case .quiz:
            updateQuizUI()
        }
    }
    
    // Runs after the user hits the Return key on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Get the text from the text field
        let textFieldContents = textField.text!
        
        // Determine whether the user answered correctly and update appropriate quiz
        if textFieldContents.lowercased() == elementList[currentElementIndex].lowercased() {
            answerIsCorrect = true
            correctAnswerCount += 1
        } else {
            answerIsCorrect = false
        }
        
        // The app should now display the answer to the user
        state = .answer
        
        updateUI()
        
        return true
    }
}

//
//  ViewController.swift
//  practice
//
//  Created by 곽다은 on 11/7/23.
//

import UIKit

class ViewController: UIViewController {
    var words = ["daeun", "chanhyuk", "jihyun", "chohee"]
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var currentGame: Game!
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    func newRound() {
        guard !words.isEmpty else {
            enableLetterButtons(enable: false)
            return
        }
        let newWord = words.removeFirst()
        currentGame = Game(life: 7, word: newWord, guessedLetters: [])
        enableLetterButtons(enable: true)
        updateUI()
    }
    
    func enableLetterButtons(enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    func updateUI() {
        correctWordLabel.text = currentGame.formattedWord.map{String($0)}.joined(separator: " ")
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.life)")
    }
    
    func updateGameState() {
        if currentGame.life == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        }
        updateUI()
    }

}


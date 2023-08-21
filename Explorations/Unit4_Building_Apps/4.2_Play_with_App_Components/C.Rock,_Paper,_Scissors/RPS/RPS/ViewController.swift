//
//  ViewController.swift
//  RPS
//
//  Created by 곽다은 on 2023/08/17.
//

import UIKit

class ViewController: UIViewController {
    
    var game: GameState = .start
    
    @IBOutlet weak var app_sign: UILabel!
    @IBOutlet weak var status: UILabel!
    
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    
    @IBOutlet weak var again: UIButton!
    
    @IBAction func signTouchInside(_ sender: UIButton) {
        updateStatus()
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 1, alpha: 1)
        status.text = "Rock, Paper, Scissors?"
        app_sign.text = "🤖"
        again.isHidden = true
    }
    
    func updateStatus() {
        let app: Sign = randomSign()
        app_sign.text = app.emoji
        
        if rock.isTouchInside {
            let player: Sign = .rock
            status.text = player.defeat(opponent: app).message()
        } else if paper.isTouchInside {
            let player: Sign = .paper
            status.text = player.defeat(opponent: app).message()
        } else if scissors.isTouchInside {
            let player: Sign = .scissors
            status.text = player.defeat(opponent: app).message()
        }
    }

}


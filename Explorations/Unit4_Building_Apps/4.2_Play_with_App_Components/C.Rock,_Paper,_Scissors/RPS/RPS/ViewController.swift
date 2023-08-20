//
//  ViewController.swift
//  RPS
//
//  Created by 곽다은 on 2023/08/17.
//

import UIKit

class ViewController: UIViewController {
    
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
        
    }
    
    func updateStatus() {
        var app: Sign = randomSign()
        app_sign.text = app.emoji
        
        var player: Sign
        
        if rock.isTouchInside {
            player = .rock
            status.text = player.defeat(opponent: app).message()
        } else if paper.isTouchInside {
            player = .paper
            status.text = player.defeat(opponent: app).message()
        } else if scissors.isTouchInside {
            player = .scissors
            status.text = player.defeat(opponent: app).message()
        }
        
    }

}


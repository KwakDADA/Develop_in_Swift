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
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        updateUI(.start)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(.start)
    }
    
    func updateUI(_ state: GameState) {
        status.text = state.message()
        
        switch state {
        case .start:
            view.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 1, alpha: 1)
            app_sign.text = "🤖"
            again.isHidden = true
            
            rock.isEnabled = true
            paper.isEnabled = true
            scissors.isEnabled = true
            
            rock.isHidden = false
            paper.isHidden = false
            scissors.isHidden = false
        case .win:
            view.backgroundColor = UIColor(red: 0.75, green: 1, blue: 0.75, alpha: 1)
        case .lose:
            view.backgroundColor = UIColor(red: 1, green: 0.5, blue: 0.5, alpha: 1)
        case .draw:
            view.backgroundColor = UIColor(red: 1, green: 0.75, blue: 0.5, alpha: 1)
        }
        
    }

}


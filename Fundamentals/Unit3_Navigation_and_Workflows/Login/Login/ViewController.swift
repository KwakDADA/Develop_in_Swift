//
//  ViewController.swift
//  Login
//
//  Created by 곽다은 on 12/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var forgotUserNameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        if sender == forgotPasswordButton {
            print("password")
            segue.destination.title = "Forgot Password"
        } else if sender == forgotUserNameButton {
            print("username")
            segue.destination.title = "Forgot Username"
        } else {
            segue.destination.title = userNameTextField.text
        }
    }
    
    @IBAction func forgotUserNameButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUsernameOrPassword", sender: sender)
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "ForgottenUsernameOrPassword", sender: sender)
    }
    
    
}


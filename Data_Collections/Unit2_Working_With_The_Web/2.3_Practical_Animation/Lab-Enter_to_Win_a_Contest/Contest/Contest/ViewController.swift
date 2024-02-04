//
//  ViewController.swift
//  Contest
//
//  Created by 곽다은 on 2/4/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        if emailTextField.text == "" {
            UIView.animateKeyframes(withDuration: 0.8, delay: 0, options: [], animations: {
                
                UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2) {
                    self.emailTextField.transform = CGAffineTransform(translationX: 8, y: 0)
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.4) {
                    self.emailTextField.transform = CGAffineTransform(translationX: -8, y: 0)
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.6) {
                    self.emailTextField.transform = CGAffineTransform(translationX: 4, y: 0)
                }
                
                UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.8) {
                    self.emailTextField.transform = CGAffineTransform(translationX: -4, y: 0)
                }
                
            }) { (_) in
                self.emailTextField.transform = CGAffineTransform.identity
            }
        } else {
            performSegue(withIdentifier: "submitSegue", sender: sender)
        }
    }
    
}


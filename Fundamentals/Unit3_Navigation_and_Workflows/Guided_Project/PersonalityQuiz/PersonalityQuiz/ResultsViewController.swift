//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by 곽다은 on 12/11/23.
//

import UIKit

class ResultsViewController: UIViewController {
    var responses: [Answer]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

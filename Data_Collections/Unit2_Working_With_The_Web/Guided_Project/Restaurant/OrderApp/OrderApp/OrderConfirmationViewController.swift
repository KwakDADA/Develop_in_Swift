//
//  OrderConfirmationViewController.swift
//  OrderApp
//
//  Created by 곽다은 on 3/10/24.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    @IBOutlet var confirmationLabel: UILabel!
    
    let minutesToPrepare: Int
    
    init?(coder: NSCoder, minutesToPrepare: Int) {
        self.minutesToPrepare = minutesToPrepare
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

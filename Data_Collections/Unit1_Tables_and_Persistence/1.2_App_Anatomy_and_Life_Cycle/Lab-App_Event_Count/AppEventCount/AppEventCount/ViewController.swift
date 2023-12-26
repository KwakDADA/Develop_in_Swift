//
//  ViewController.swift
//  AppEventCount
//
//  Created by 곽다은 on 12/26/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var didFinishLaunchingLabel: UILabel!
    @IBOutlet var configurationForConnectingLabel: UILabel!
    @IBOutlet var willConnectLabel: UILabel!
    @IBOutlet var didBecomeActiveLabel: UILabel!
    @IBOutlet var willResignActiveLabel: UILabel!
    @IBOutlet var willEnterForegroundLabel: UILabel!
    @IBOutlet var didEnterBackgroundLabel: UILabel!
    
    var didFinishLaunchingCount = 0
    var configurationForConnectingCount = 0
    var willConnectCount = 0
    var didBecomeActiveCount = 0
    var willResignActiveCount = 0
    var willEnterForegroundCount = 0
    var didEnterBackgroundCount = 0
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // This method won't be called at all the app events, so this place is not the perfect place to call updateView().
    }

    func updateView() {
        // updates each label with its count.
        didFinishLaunchingLabel.text = "The App has Launched \(appDelegate.launchCount) time(s)"
        configurationForConnectingLabel.text = "The app has configured for connecting \(appDelegate.configurationForConnectingCount) time(s)"
        willConnectLabel.text = "The Scene has connected \(willConnectCount) time(s)"
        didBecomeActiveLabel.text = "The Scene has became active \(didBecomeActiveCount) time(s)"
        willResignActiveLabel.text = "The Scene has resigned active \(willResignActiveCount) time(s)"
        willEnterForegroundLabel.text = "The Scene has entered foreground \(willEnterForegroundCount) time(s)"
        didEnterBackgroundLabel.text = "The Scene has entered background \(didEnterBackgroundCount) time(s)"
    }

}


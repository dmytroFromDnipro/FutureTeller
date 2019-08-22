//
//  TabBarRootViewController.swift
//  FortuneTeller
//
//  Created by Dmitry Grin on 8/21/19.
//  Copyright © 2019 Dmitry Grin. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    //Prepare active models
    let networkService = NetwotkingService()
    let answerBank = AnswerBank()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let activityModel = ActivityModel(networkService: networkService, answerBank: answerBank)
        answerBank.loadAnswers()
        
        let mainViewController = self.viewControllers?[0] as? MainViewController
        mainViewController?.activityModel = activityModel
        activityModel.delegate = mainViewController
        
        let settingsViewController = self.viewControllers?[1] as? SettingsViewController
        settingsViewController?.activityModel = activityModel
    }
}
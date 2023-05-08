//
//  HistoryViewController.swift
//  PomodoroFullApp
//
//  Created by Alikhan Gubayev on 08.05.2023.
//

import UIKit

class HistoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitialSettings()
    }
    
    private func setInitialSettings() {
        self.view.backgroundColor = UIColor(named: "CustomBlack")
    }
}

//
//  BottomSheetViewController.swift
//  PomodoroFullApp
//
//  Created by Alikhan Gubayev on 08.05.2023.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    var backgroundView: UIView = {
        let backgroundView = UIView()
        backgroundView.backgroundColor = .white
        backgroundView.layer.cornerRadius = 12
        return backgroundView
    } ()
    
    var closeButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = UIColor(named: "CustomBlack")
        return button
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeInitialSettings()
        createBottomSheet()
    }
    
    private func makeInitialSettings() {
        self.view.backgroundColor = .clear
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func createBottomSheet() {
        [backgroundView, closeButton].forEach { self.view.addSubview($0) }
        
        setConstraints()
        
        closeButton.addTarget(self, action: #selector(closeBottomSheet), for: .touchUpInside)
    }
    
    private func setConstraints() {
        backgroundView.anchor(right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingRight: 0, paddingBottom: 0, paddingLeft: 0, height: 362)
        closeButton.anchor(top: backgroundView.topAnchor, right: backgroundView.rightAnchor, paddingTop: 16, paddingRight: 16)
    }

    @objc private func closeBottomSheet() {
        dismiss(animated: true, completion: nil)
    }
}

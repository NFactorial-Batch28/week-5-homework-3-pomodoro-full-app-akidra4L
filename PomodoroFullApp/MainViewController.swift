//
//  MainViewController.swift
//  PomodoroFullApp
//
//  Created by Alikhan Gubayev on 08.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        return imageView
    } ()
    
    private var focusButtonView: UIButton = {
        var button = UIButton()
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.setTitle("Focus Category", for: .normal)
        button.layer.cornerRadius = 20
        return button
    } ()
    
    private var playButton = CustomActionButton(icon: "play")
    private var stopButton = CustomActionButton(icon: "stop")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [imageView, focusButtonView, playButton, stopButton].forEach { self.view.addSubview($0) }
        self.view.sendSubviewToBack(imageView)
        
        setBackground()
        setConstraints()
    }
    
    private func setBackground() {
        imageView.frame = view.bounds
    }
    
    private func setConstraints() {
        focusButtonView.anchor(top: view.topAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 164, paddingRight: 84, paddingLeft: 84, width: 170, height: 36)
        
        playButton.anchor(top: focusButtonView.bottomAnchor, left: view.leftAnchor, paddingTop: 360, paddingLeft: 80, width: 56, height: 56)
        
        stopButton.anchor(top: focusButtonView.bottomAnchor, right: view.rightAnchor, paddingTop: 360, paddingRight: 80, width: 56, height: 56)
    }
}

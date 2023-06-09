//
//  MainViewController.swift
//  PomodoroFullApp
//
//  Created by Alikhan Gubayev on 08.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    var appProgress: AppProgress = {
        return AppProgress()
    } ()
    
    private var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "background")
        return imageView
    } ()
    
    private var focusButtonView: UIButton = {
        var button = UIButton()
        button.backgroundColor = .white.withAlphaComponent(0.3)
        button.setImage(UIImage(systemName: "pencil", withConfiguration: UIImage.SymbolConfiguration(weight: .black)), for: .normal)
        button.setTitle("Focus Category", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 20
        return button
    } ()
    
    private var playAndStopButton = CustomActionButton(icon: "pause")
    private var stopButton = CustomActionButton(icon: "stop")
    private let progressCircleView = ProgressCircleView(frame: CGRect(x: 0, y: 0, width: 248, height: 248))
    private let strokeCircleView = CircleStrokeView(frame: CGRect(x: 0, y: 0, width: 248, height: 248))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        [imageView, focusButtonView, playAndStopButton, stopButton, progressCircleView, strokeCircleView].forEach { self.view.addSubview($0) }
        self.view.sendSubviewToBack(imageView)
        
        setBackground()
        setConstraints()
        setButtonsActions()
        startTimerProgress()
    }
    
    private func setBackground() {
        imageView.frame = view.bounds
    }
    
    private func startTimerProgress() {
        progressCircleView.setProgress(1, animated: true)
        progressCircleView.startTimer()
    }
    
    private func setConstraints() {
        focusButtonView.anchor(top: view.topAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 164, paddingRight: 84, paddingLeft: 84, width: 170, height: 36)
        
        playAndStopButton.anchor(top: focusButtonView.bottomAnchor, left: view.leftAnchor, paddingTop: 360, paddingLeft: 80, width: 56, height: 56)
        
        stopButton.anchor(top: focusButtonView.bottomAnchor, right: view.rightAnchor, paddingTop: 360, paddingRight: 80, width: 56, height: 56)
        
        progressCircleView.anchor(top: focusButtonView.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 50, paddingRight: 70, paddingLeft: 70)
        
        strokeCircleView.anchor(top: focusButtonView.bottomAnchor, right: view.rightAnchor, left: view.leftAnchor, paddingTop: 50, paddingRight: 70, paddingLeft: 70)
    }
    
    private func setButtonsActions() {
        focusButtonView.addTarget(self, action: #selector(openBottomSheet), for: .touchUpInside)
        playAndStopButton.addTarget(self, action: #selector(pauseTimer), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(resetAll), for: .touchUpInside)
    }
    
    @objc private func pauseTimer() {
        progressCircleView.pauseTimer()
        updateButtonImage()
    }
    
    @objc private func resetAll() {
        progressCircleView.resetAll()
    }
    
    private func updateButtonImage() {
        if progressCircleView.isTimerRunning {
            let image = UIImage(systemName: "pause")
            playAndStopButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(systemName: "play")
            playAndStopButton.setImage(image, for: .normal)
        }
    }
    
    @objc private func openBottomSheet() {
        self.navigationController?.present(BottomSheetViewController(), animated: true)
    }
}

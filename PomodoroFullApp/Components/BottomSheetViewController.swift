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
    
    var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Focus Category"
        label.adjustsFontSizeToFitWidth = true
        return label
    } ()
    
    var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeInitialSettings()
        createBottomSheet()
        initializeStackView()
    }
    
    private func makeInitialSettings() {
        self.view.backgroundColor = .clear
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func createBottomSheet() {
        [backgroundView, closeButton, titleLabel, stackView].forEach { self.view.addSubview($0) }
        
        setConstraints()
        
        closeButton.addTarget(self, action: #selector(closeBottomSheet), for: .touchUpInside)
    }
    
    private func setConstraints() {
        backgroundView.anchor(right: view.rightAnchor, bottom: view.bottomAnchor, left: view.leftAnchor, paddingRight: 0, paddingBottom: 0, paddingLeft: 0, height: 362)
        closeButton.anchor(top: backgroundView.topAnchor, right: backgroundView.rightAnchor, paddingTop: 20, paddingRight: 16)
        titleLabel.anchor(top: backgroundView.topAnchor, right: closeButton.leftAnchor, left: backgroundView.leftAnchor, paddingTop: 20, paddingRight: 105, paddingLeft: 140)
        stackView.centerInView(in: backgroundView)
    }

    @objc private func closeBottomSheet() {
        dismiss(animated: true, completion: nil)
    }
}

extension BottomSheetViewController {
    private func initializeStackView() {
        let listOfButtons: [UIButton] = [
            getButtonItem(title: "Work"),
            getButtonItem(title: "Study"),
            getButtonItem(title: "Workout"),
            getButtonItem(title: "Reading"),
            getButtonItem(title: "Meditation"),
            getButtonItem(title: "Others"),
        ]
        
        for i in 0..<3 {
            let rowStackView = UIStackView()
            rowStackView.axis = .horizontal
            rowStackView.distribution = .fillEqually
            rowStackView.spacing = 14
            stackView.addArrangedSubview(rowStackView)
            
            
            
            for j in 0..<2 {
                let index = i * 2 + j
                if index < listOfButtons.count {
                    let button = listOfButtons[index]
                    rowStackView.addArrangedSubview(button)
                }
            }
        }
    }
    
    private func getButtonItem(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setDimensions(width: 172, height: 60)
        button.backgroundColor = .lightGray.withAlphaComponent(0.5)
        button.layer.cornerRadius = 16
        button.setTitle(title, for: .normal)
        button.tintColor = UIColor(named: "CustomBlack")
        return button
    }
}

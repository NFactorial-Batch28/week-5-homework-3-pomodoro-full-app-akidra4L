//
//  CustomActionButton.swift
//  PomodoroFullApp
//
//  Created by Alikhan Gubayev on 08.05.2023.
//

import UIKit

class CustomActionButton: UIButton {
    
    public var icon: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(icon: String) {
        self.init(frame: CGRect.zero)
        self.icon = icon
        self.tintColor = .white
        self.layer.cornerRadius = 24
        self.backgroundColor = .white.withAlphaComponent(0.3)
        if let icon = self.icon {
            self.setImage(UIImage(systemName: icon), for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

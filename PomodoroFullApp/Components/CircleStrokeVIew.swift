//
//  CircleStrokeVIew.swift
//  PomodoroFullApp
//
//  Created by Alikhan Gubayev on 08.05.2023.
//

import UIKit

class CircleStrokeView: UIView {
    
    private let progressLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayers()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayers()
    }
    
    private func setupLayers() {
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                                      radius: bounds.width / 2,
                                      startAngle: -.pi / 2,
                                      endAngle: .pi * 2 - .pi / 2,
                                      clockwise: true)
        progressLayer.path = circlePath.cgPath
        
        progressLayer.strokeColor = UIColor.white.withAlphaComponent(0.3).cgColor
        progressLayer.lineWidth = 5
        progressLayer.fillColor = UIColor.clear.cgColor
        layer.addSublayer(progressLayer)
    }
}


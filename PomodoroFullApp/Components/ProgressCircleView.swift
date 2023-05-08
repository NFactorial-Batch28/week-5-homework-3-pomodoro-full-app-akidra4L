//
//  ProgressCircleView.swift
//  PomodoroFullApp
//
//  Created by Alikhan Gubayev on 08.05.2023.
//

import UIKit

class ProgressCircleView: UIView {
    
    private let progressLayer = CAShapeLayer()
    private let textLayer = CATextLayer()
    private var progress: CGFloat = 0 {
        didSet {
            progressLayer.strokeEnd = progress
            textLayer.string = "\(Int(progress * 100))%"
        }
    }
    
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
                                      radius: bounds.width / 2 - 10,
                                      startAngle: -.pi / 2,
                                      endAngle: .pi * 2 - .pi / 2,
                                      clockwise: true)
        progressLayer.path = circlePath.cgPath
        
        progressLayer.strokeColor = UIColor.white.cgColor
        progressLayer.lineWidth = 5
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeEnd = progress
        layer.addSublayer(progressLayer)
        
        textLayer.fontSize = 24
        textLayer.alignmentMode = .center
        textLayer.foregroundColor = UIColor.black.cgColor
        textLayer.frame = CGRect(x: 0, y: bounds.midY - 15, width: bounds.width, height: 30)
        layer.addSublayer(textLayer)
    }
    
    func setProgress(_ progress: CGFloat, animated: Bool) {
        if animated {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = 0.5
            animation.fromValue = self.progress
            animation.toValue = progress
            progressLayer.add(animation, forKey: "strokeEndAnimation")
        }
        self.progress = progress
    }
}

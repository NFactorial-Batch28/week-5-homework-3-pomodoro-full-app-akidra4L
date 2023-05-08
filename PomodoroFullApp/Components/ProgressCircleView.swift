//
//  ProgressCircleView.swift
//  PomodoroFullApp
//
//  Created by Alikhan Gubayev on 08.05.2023.
//

import UIKit

class ProgressCircleView: UIView {
    
    private var timer: Timer?
    private let progressLayer = CAShapeLayer()
    private let textLayer = CATextLayer()
    private var progress: CGFloat = 0 {
        didSet {
            progressLayer.strokeEnd = progress
        }
    }
    
    public var isTimerRunning = false
    private var remainingSeconds: Int = 300 {
        didSet {
            setProgress(CGFloat(remainingSeconds) / 300, animated: true)
            updateText()
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
                                      radius: bounds.width / 2,
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
        textLayer.foregroundColor = UIColor.white.cgColor
        textLayer.fontSize = 44
        textLayer.frame = CGRect(x: 0, y: bounds.midY - 25, width: bounds.width, height: 56)
        textLayer.string = String(format: "%02d:%02d", remainingSeconds / 60, remainingSeconds % 60)
        layer.addSublayer(textLayer)
    }
    
    public func startTimer() {
        stopTimer()
        isTimerRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            if self.remainingSeconds > 0 {
                self.remainingSeconds -= 1
            } else {
                self.stopTimer()
            }
        })
    }
    
    public func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    public func setProgress(_ progress: CGFloat, animated: Bool) {
        if animated {
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.duration = 0.5
            animation.fromValue = self.progress
            animation.toValue = progress
            progressLayer.add(animation, forKey: "strokeEndAnimation")
        }
        self.progress = progress
    }
    
    private func updateText() {
        textLayer.string = String(format: "%02d:%02d", remainingSeconds / 60, remainingSeconds % 60)
    }
    
    public func pauseTimer() {
        if isTimerRunning {
            isTimerRunning = false
            timer?.invalidate()
        } else {
            isTimerRunning = true
            startTimer()
        }
    }
    
    public func resumeTimer() {
        isTimerRunning = true
        startTimer()
    }
    
    public func resetAll() {
        remainingSeconds = 300
        setProgress(0, animated: false)
        updateText()
    }
}

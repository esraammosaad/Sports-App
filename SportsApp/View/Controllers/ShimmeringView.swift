//
//  ShimmeringView.swift
//  SportsApp
//
//  Created by Macos on 16/05/2025.
//

import Foundation
import UIKit
class ShimmeringView: UIView {
    var isShimmering = false {
        didSet {
            if isShimmering {
                startShimmering()
            } else {
                stopShimmering()
            }
        }
    }
    
    var contentView: UIView? {
        didSet {
            oldValue?.removeFromSuperview()
            if let contentView = contentView {
                addSubview(contentView)
                contentView.frame = bounds
                contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            }
        }
    }
    
    private let gradientLayer = CAGradientLayer()
    private let animation = CABasicAnimation(keyPath: "locations")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        gradientLayer.colors = [
            UIColor.systemGray5.cgColor,
            UIColor.systemGray6.cgColor,
            UIColor.systemGray5.cgColor
        ]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.addSublayer(gradientLayer)
        
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.duration = 1.5
        animation.repeatCount = .infinity
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private func startShimmering() {
        gradientLayer.add(animation, forKey: "shimmer")
    }
    
    private func stopShimmering() {
        gradientLayer.removeAnimation(forKey: "shimmer")
    }
}

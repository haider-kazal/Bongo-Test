//
//  ButtonWithLoader.swift
//  BongoBDTest
//
//  Created by Haider Ali Kazal on 30/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import UIKit

class ButtonWithLoader: UIButton {
    var oldLabelText: String?
    
    var normalBackgroundColor: UIColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1) {
        didSet {
            updateButtonAppearance()
        }
    }
    
    var highlightedBackgroundColor: UIColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1) {
        didSet {
            updateButtonAppearance()
        }
    }
    
    var disabledBackgroundColor: UIColor = .lightGray {
        didSet {
            updateButtonAppearance()
        }
    }
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.hidesWhenStopped = true
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }()
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                backgroundColor = normalBackgroundColor
            } else {
                backgroundColor = disabledBackgroundColor
            }
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            guard !activityIndicator.isAnimating else {
                return
            }
            
            if isHighlighted {
                backgroundColor = highlightedBackgroundColor
            } else {
                backgroundColor = normalBackgroundColor
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialConfiguration()
    }
    
    convenience init() {
        self.init(frame: .zero)
        initialConfiguration()
    }
    
    private func initialConfiguration() {
        oldLabelText = titleLabel?.text
        setTitleColor(.white, for: .normal)
        backgroundColor = normalBackgroundColor
    }
    
    func showActivityIndicator(with style: UIActivityIndicatorView.Style, positionedAt: ActivityIndicatorPosition, isUserInteractionEnabled: Bool) {
        oldLabelText = currentTitle
        setTitle("", for: .normal)
        
        activityIndicator.style = style
        self.isUserInteractionEnabled = isUserInteractionEnabled
        
        addSubview(activityIndicator)
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        if positionedAt == .left {
            activityIndicator.leftAnchor.constraint(equalTo: rightAnchor, constant: 10).isActive = true
        } else if positionedAt == .center {
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        } else {
            activityIndicator.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        }
        
        backgroundColor = isUserInteractionEnabled ? normalBackgroundColor : disabledBackgroundColor
        activityIndicator.startAnimating()
    }
    
    func stopActivityIndicator(leavingUserInteractionEnabled isUserInteractionEnabled: Bool) {
        activityIndicator.stopAnimating()
        if activityIndicator.superview != nil {
            activityIndicator.removeFromSuperview()
        }
        
        setTitle(oldLabelText, for: .normal)
        self.isUserInteractionEnabled = isUserInteractionEnabled
        
        backgroundColor = isUserInteractionEnabled ? normalBackgroundColor : disabledBackgroundColor
    }
    
    // Hack to trigger appearance update
    private func updateButtonAppearance() {
        if isEnabled {
            isEnabled = true
        } else {
            isEnabled = false
        }
        
        if isHighlighted {
            isHighlighted = true
        } else {
            isHighlighted = false
        }
    }
}

extension ButtonWithLoader {
    enum ActivityIndicatorPosition {
        case left
        case center
        case right
    }
}

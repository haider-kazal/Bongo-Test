//
//  BaseController.swift
//  BongoBDTest
//
//  Created by Haider Ali Kazal on 30/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import UIKit

protocol BaseController {
    func didLoad()
    
    func willAppear()
    func didAppear()
    
    func willDisappear()
    func didDisappear()
}

extension BaseController where Self: UIViewController {
    func didLoad() {
        setNeedsStatusBarAppearanceUpdate()
        //view.backgroundColor = .white
    }
    
    func willAppear() { }
    func didAppear() { }
    
    func willDisappear() { }
    func didDisappear() { }
}

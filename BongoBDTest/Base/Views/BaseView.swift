//
//  BaseView.swift
//  BongoBDTest
//
//  Created by Haider Ali Kazal on 30/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import UIKit

class BaseView<ViewModel>: UIView, ViewModelBased {
    var viewModel: ViewModel
    
    required init?(coder: NSCoder) {
        fatalError("Use .init(with:) instead")
    }
    
    private override init(frame: CGRect) {
        fatalError("Use .init(with:) instead")
    }
    
    init(with viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() { }
    
    func setupConstraints() { }
}


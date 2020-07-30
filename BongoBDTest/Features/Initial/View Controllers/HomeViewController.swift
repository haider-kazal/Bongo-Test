//
//  HomeViewController.swift
//  BongoBDTest
//
//  Created by Haider Ali Kazal on 30/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController<HomeView, HomeViewModel> {
    override func viewDidLoad() {
        setNavigationBarTitle()
        setupRootViewBackgroundColor()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupRootViewBackgroundColor()
    }
    
    private func setNavigationBarTitle() {
        title = viewModel.title
    }
    
    private func setupRootViewBackgroundColor() {
        switch traitCollection.userInterfaceStyle {
        case .light,
             .unspecified:
            rootView.backgroundColor = .white
        case .dark:
            rootView.backgroundColor = .black
        @unknown default:
            rootView.backgroundColor = .white
        }
    }
}

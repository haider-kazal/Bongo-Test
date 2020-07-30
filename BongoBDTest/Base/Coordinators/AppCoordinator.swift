//
//  AppCoordinator.swift
//  BongoBDTest
//
//  Created by Haider Ali Kazal on 30/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import Foundation

import UIKit

final class AppCoordinator: Coordinator {
    let baseViewController: UIViewController
    
    private(set) lazy var rootViewController = UINavigationController()
    
    private weak var window: UIWindow?
    
    init(withWindow window: UIWindow?) {
        self.window = window
        
        let viewModel = DefaultHomeViewModel(with: HomeAPIService())
        let view = HomeView(with: viewModel)
        baseViewController = HomeViewController(with: view, and: viewModel)
        rootViewController.pushViewController(baseViewController, animated: false)
        
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    }
    
    func start() {
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}

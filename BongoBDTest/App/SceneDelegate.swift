//
//  SceneDelegate.swift
//  BongoBDTest
//
//  Created by Haider Ali Kazal on 27/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    private(set) var appCoordinator: AppCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window.windowScene = windowScene
        self.window = window
        
        appCoordinator = .init(withWindow: window)
        appCoordinator?.start()
    }
}


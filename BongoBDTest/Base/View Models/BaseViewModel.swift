//
//  BaseViewModel.swift
//  BongoBDTest
//
//  Created by Haider Ali Kazal on 30/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import Foundation

protocol BaseViewModel {
    associatedtype Services
    init(with services: Services)
}


//
//  ViewBased.swift
//  BongoBDTest
//
//  Created by Haider Ali Kazal on 30/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import UIKit

protocol ViewBased {
    associatedtype View: UIView
    var rootView: View { get }
}

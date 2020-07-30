//
//  HomeView.swift
//  BongoBDTest
//
//  Created by Haider Ali Kazal on 30/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import UIKit

final class HomeView: BaseView<HomeViewModel> {
    private lazy var htmlView: UITextView = {
        let textView = UITextView()
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var dataFetchButton: ButtonWithLoader = {
        let button = ButtonWithLoader()
        button.addTarget(self, action: #selector(fetchHTMLData(sender:)), for: .touchUpInside)
        button.setTitle("Get Data", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(htmlView)
        addSubview(dataFetchButton)
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        
        NSLayoutConstraint.activate([
            htmlView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            htmlView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            htmlView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            htmlView.bottomAnchor.constraint(equalTo: dataFetchButton.topAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            dataFetchButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            dataFetchButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            dataFetchButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            dataFetchButton.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    @objc
    private func fetchHTMLData(sender: ButtonWithLoader) {
        func showErrorAlert(withTitle title: String, andMessage message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            window?.rootViewController?.present(alertController, animated: true, completion: nil)
        }
        
        sender.showActivityIndicator(with: .medium, positionedAt: .center, isUserInteractionEnabled: false)
        
        viewModel.getHTMLString { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case let .success(string):
                    self?.htmlView.text = string
                    
                    
                case let .failure(error):
                    showErrorAlert(withTitle: "Error", andMessage: "\(error.code): \(error.localizedDescription)")
                    self?.htmlView.text = error.localizedDescription
                }
                
                sender.stopActivityIndicator(leavingUserInteractionEnabled: true)
            }
        }
    }
}

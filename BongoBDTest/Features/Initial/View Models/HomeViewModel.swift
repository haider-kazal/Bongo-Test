//
//  HomeViewModel.swift
//  BongoBDTest
//
//  Created by Haider Ali Kazal on 30/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import Foundation

protocol HomeViewModel: BaseViewModel {
    var title: String { get }
    func getHTMLString(onCompletion completionHandler: ((Result<String, URLError>) -> Void)?)
}

final class DefaultHomeViewModel: HomeViewModel {
    typealias Services = HomeAPIService
    
    let apiService: HomeAPIService
    
    let title = "Bongo Test"
    
    init(with services: Services) {
        apiService = services
    }
    
    func getHTMLString(onCompletion completionHandler: ((Result<String, URLError>) -> Void)?) {
        apiService.getDisclaimerHTML { [weak self] (result) in
            switch result {
            case let .success(string):
                let processedString =
                    string.split(separator: ">")
                        .map({ $0.appending(">\n") })
                        .joined()
                        .trimmingCharacters(in: .whitespacesAndNewlines)
                
                self?.textOperations(on: string)
                completionHandler?(.success(processedString))
                
            case let .failure(error):
                completionHandler?(.failure(error))
            }
        }
    }
    
    private func textOperations(on text: String) {
        let textOperator = BongoTestTextOperations()
        let lastCharacter = textOperator.lastCharacter(from: text)
        let everyTenthCharacters = textOperator.everyTenthCharacter(from: text)
        let wordsWithCounts = textOperator.uniqueWordsWithCount(from: text)
        
        print("❕Last Character: \(String(describing: lastCharacter))")
        print("❕Every 10th Character: \(everyTenthCharacters.reduce(into: "", { $0.append("\($1) ") }))")
        print("❕Words with counts: \n\(wordsWithCounts.map({ "\($0.key): \($0.value)" }))")
    }
}

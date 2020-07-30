//
//  BongoTestTextOperations.swift
//  BongoBDTest
//
//  Created by Haider Ali Kazal on 30/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import Foundation

final class BongoTestTextOperations {
    func lastCharacter(from text: String) -> Character? {
        return text.last
    }
    
    func everyTenthCharacter(from text: String) -> [Character] {
        let characters = text.enumerated().filter({ (($0.offset + 1) % 10) == 0 }).map({ $0.element })
        return characters
    }
    
    func uniqueWordsWithCount(from text: String) -> [String: Int] {
        let allWords = text.split(separator: "\n").map({ $0.split(separator: " ") }).flatMap({ $0 }).map({ String($0) })
        let wordsAndCount = allWords.reduce(into: [:]) { (result, text) in
            result[text, default: 0] += 1
        }
        
        return wordsAndCount
    }
}

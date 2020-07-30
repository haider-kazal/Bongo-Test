//
//  BongoBDTestTests.swift
//  BongoBDTestTests
//
//  Created by Haider Ali Kazal on 27/7/20.
//  Copyright © 2020 Haider Ali Kazal. All rights reserved.
//

import XCTest
@testable import BongoBDTest

class BongoBDTestTests: XCTestCase {
    private var textOperation: BongoTestTextOperations!
    
    override func setUpWithError() throws {
        super.setUp()
        textOperation = .init()
    }

    override func tearDownWithError() throws {
        textOperation = nil
    }

    func testLastCharacter() throws {
        let text = "A"
        let lastCharacter = textOperation.lastCharacter(from: text)!
        
        XCTAssertTrue(text == String(lastCharacter))
    }
    
    func testEmptyCharacter() throws {
        let text = ""
        
        XCTAssertNil(textOperation.lastCharacter(from: text))
    }
    
    func testTenthCharacterFromTenSizeArray() throws {
        let text = "ABCDEFGHIJ"
        let tenthCharacter = textOperation.everyTenthCharacter(from: text).first!
        
        XCTAssertTrue(tenthCharacter == Character("J"))
    }
    
    func testUniqueWordsWithCount() throws {
        let text = "A\n A A B B C D E"
        let wordsWithCounts = textOperation.uniqueWordsWithCount(from: text)
        
        XCTAssertTrue(wordsWithCounts["A"] == 3)
        XCTAssertTrue(wordsWithCounts["B"] == 2)
        XCTAssertTrue(wordsWithCounts["C"] == 1)
        XCTAssertTrue(wordsWithCounts["D"] == 1)
        XCTAssertTrue(wordsWithCounts["E"] == 1)
    }
}

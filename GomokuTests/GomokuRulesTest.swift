//
//  GomokuRulesTest.swift
//  Gomoku
//
//  Created by Anton Novoselov on 16/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import XCTest

@testable import Gomoku

class GomokuRulesTest: XCTestCase {
    
    var board: Board!
    var rules: GomokuRules!
    
    override func setUp() {
        super.setUp()
        board = Board()
        rules = GomokuRules()
    }
    
    func testEmptyBoard_isNotAWin() throws {
        try XCTAssertFalse(rules.isWin(board))
    }
    
    func testNotEmptyBoardButNotWin_isNotAWin() throws {
        try! board.place(intersection: Intersection(1,1), player: Player.White)
        try XCTAssertFalse(rules.isWin(board))
    }
    
    func testFiveInARowInTheFirstRow_isAWin() throws {
        for col in 0..<5 {
            try board.place(intersection: Intersection(col, 0), player: Player.White)
        }
        
        try XCTAssertTrue(rules.isWin(board))
    }
    
    func testFourInARowInTheFirstRow_isALose() throws {
        for col in 0..<4 {
            try board.place(intersection: Intersection(col, 0), player: Player.White)
        }
        
        try XCTAssertFalse(rules.isWin(board))
    }
    
    func testSixInARowInTheFirstRow_isAWin() throws {
        for col in 0..<6 {
            try board.place(intersection: Intersection(col, 0), player: Player.White)
        }
        
        try XCTAssertTrue(rules.isWin(board))
    }
    
    func testFiveInARowInAnyRow_isAWin() throws {
        for row in 0..<board.HEIGHT {
            
            board = Board()
            
            for col in 0..<5 {
                try board.place(intersection: Intersection(col, row), player: Player.White)
            }
            
            try XCTAssertTrue(rules.isWin(board))
        }
    }
    
}













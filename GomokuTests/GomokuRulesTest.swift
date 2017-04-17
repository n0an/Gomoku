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
    var boardState: BoardState!
    
    override func setUp() {
        super.setUp()
        Game.boardFactory = BoardFactoryImpl()
        board = Game.boardFactory.makeBoard()
        boardState = board as! BoardState
        rules = GomokuRules()
    }
    
    func testEmptyBoard_isNotAWin() {
        XCTAssertFalse(rules.isWin(boardState, Player.White))
    }
    
    func testNotEmptyBoardButNotWin_isNotAWin() {
        board.place(1, 1, Player.White)
        XCTAssertFalse(rules.isWin(boardState,Player.White))
    }
    
    func testFiveInARowInTheFirstRow_isAWin() {
        for col in 0..<5 {
            board.place(col, 0, Player.Black)
        }
        
        XCTAssertTrue(rules.isWin(boardState, Player.Black))
    }
    
    func testFiveConsecutiveStonesForOtherPlayer_isALose() {
        for col in 0..<5 {
            board.place(col, 0, Player.Black)
        }
        
        XCTAssertFalse(rules.isWin(boardState, Player.White))

    }
    
    func testFourInARowInTheFirstRow_isALose() {
        for col in 0..<4 {
            board.place(col, 0, Player.White)
        }
        
        XCTAssertFalse(rules.isWin(boardState, Player.White))
    }
    
    func testSixInARowInTheFirstRow_isAWin() {
        for col in 0..<6 {
            board.place(col, 0, Player.White)
        }
        
        XCTAssertTrue(rules.isWin(boardState, Player.White))
    }
    
    func testFiveConsecutiveInAnyRow_isAWin() {
        
        for row in 0..<board.getHeight() {
            board = Game.boardFactory.makeBoard()
            boardState = board as! BoardState
            for col in 0..<5 {
                board.place(col,row,Player.Black)
            }
            XCTAssertTrue(rules.isWin(boardState, Player.Black))
        }
    }
    
    
    func testFiveNonConsecutiveStonesInRow_isALose() {
        
        board.place(1, 0, Player.White)
        board.place(3, 0, Player.White)
        board.place(5, 0, Player.White)
        board.place(7, 0, Player.White)
        board.place(9, 0, Player.White)
        
        XCTAssertFalse(rules.isWin(boardState, Player.White))

    }
    
    func testFiveConsecutiveStonesInColumn_isAWin() {
        
        for row in 0..<5 {
            board.place(1, row, Player.Black)
        }
        
        XCTAssertTrue(rules.isWin(boardState, Player.Black))
        
    }
    
}













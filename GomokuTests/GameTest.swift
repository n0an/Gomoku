//
//  GameTest.swift
//  Gomoku
//
//  Created by Anton Novoselov on 17/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import XCTest

@testable import Gomoku

class GameTest: XCTestCase {
    
    func testWhiteStartsNewGame() {
        let board = Board()
        let rules = GomokuRules()
        let game = Game(board: board, rules: rules)
        
        XCTAssertEqual(Player.White, game.whoseTurn())
    }
    
    func testAfterTurn_isOtherPlayerTurn() {
        let board = Board()
        let rules = GomokuRules()
        let game = Game(board: board, rules: rules)
        
        game.takeTurn(0,0)
        XCTAssertEqual(Player.White, board.get(0, 0).0)
        XCTAssertEqual(Player.Black, game.whoseTurn())
        
        game.takeTurn(0,1)
        XCTAssertEqual(Player.Black, board.get(0, 1).0)
        XCTAssertEqual(Player.White, game.whoseTurn())
        
    }
    
    
    
}

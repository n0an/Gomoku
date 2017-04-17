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
    
    override func setUp() {
        super.setUp()
        
        Game.boardFactory = BoardFactoryImpl()
    }
    
    
    func testWhiteStartsNewGame() {
        
        let game = Game()
        
        XCTAssertEqual(Player.White, game.whoseTurn())
    }
    
    func testAfterTurn_isOtherPlayerTurn() {
        
        let game = Game()
        
        game.takeTurn(0,0)
        XCTAssertEqual(Player.White, game.getBoard().get(0, 0).0)
        XCTAssertEqual(Player.Black, game.whoseTurn())
        
        game.takeTurn(0,1)
        XCTAssertEqual(Player.Black, game.getBoard().get(0, 1).0)
        XCTAssertEqual(Player.White, game.whoseTurn())
        
    }
    
    
    
}

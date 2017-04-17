//
//  GamePresenterTest.swift
//  Gomoku
//
//  Created by Anton Novoselov on 17/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import XCTest

@testable import Gomoku

class GamePresenterTest: XCTestCase {
    
    func testFormatOfPlayerStatus() {
        
        let presenter = GamePresenter()
        
        XCTAssertEqual("White's Turn", presenter.getPlayerStatus(player: Player.White))
        XCTAssertEqual("Black's Turn", presenter.getPlayerStatus(player: Player.Black))
    }
    
    
    func testFormatOfPlayerWinStatus() {
        let presenter = GamePresenter()
        XCTAssertEqual("White Wins!", presenter.getWinStatus(player: Player.White))
    }
    
}

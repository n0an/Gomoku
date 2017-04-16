//
//  BoardTest.swift
//  Gomoku
//
//  Created by Anton Novoselov on 16/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import XCTest

@testable import Gomoku

class BoardTest: XCTestCase {
    
    var board: Board!
    
    override func setUp() {
        super.setUp()
        board = Board()
    }
    
    func testNewBoardHasNoStones() {
        
        let stones = board.stonesPlaced()
        
        XCTAssertEqual(0, stones)
    }
    
    func testCanAddOneStone() throws {
        
        let row = 1
        let col = 1
        let player = Player.White
        try board.place(row: row, col: col, player: player)
        
        XCTAssertEqual(1, board.stonesPlaced())
        
        let placedStone = try board.get(row: row, column: col)
        
        XCTAssertEqual(Player.White, placedStone)
    }
    
    func testKnowsAboutEmptyIntersections() throws {
        XCTAssertEqual(Player.Empty, try board.get(row: 0, column: 1))
        
        try board.place(row: 0, col: 1, player: Player.White)
        
        XCTAssertEqual(Player.White, try board.get(row: 0, column: 1))
    }
    
    func testCannotAddToOccupiedIntersection() throws {
        try board.place(row: 0, col: 0, player: Player.White)
        
        XCTAssertThrowsError(try board.place(row: 0, col: 0, player: Player.Black))
    }
    
    
    func testCannotPlaceStonesOutsideBounds() throws {
        XCTAssertThrowsError(try board.place(row: 42, col: 42, player: Player.White))
    }
    
}

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
    
    func testCanAddStonesInBounds() throws {
        try board.place(intersection: Intersection(1,1), player: Player.White)
        XCTAssertEqual(1, board.stonesPlaced())
        
        var placedStone = try board.get(intersection: Intersection(1,1))
        XCTAssertEqual(Player.White, placedStone)
        
        try board.place(intersection: Intersection(board.HEIGHT - 1, board.WIDTH - 1), player: Player.Black)
        placedStone = try board.get(intersection: Intersection(board.HEIGHT - 1,board.WIDTH - 1))
        XCTAssertEqual(Player.Black, placedStone)
    }
    
    func testKnowsAboutEmptyIntersections() throws {
        XCTAssertEqual(Player.Empty, try board.get(Intersection(0,1)))
        
        try board.place(intersection: Intersection(0,1), player: Player.White)
        XCTAssertEqual(Player.White, try board.get(Intersection(0,1)))
    }
    
    func testCannotAddToOccupiedIntersection() throws {
        try board.place(intersection: Intersection(0,0), player: Player.White)
        
        XCTAssertThrowsError(try board.place(intersection: Intersection(0,0), player: Player.Black))
        XCTAssertThrowsError(try board.place(intersection: Intersection(0,0), player: Player.White))

    }
    
    
    func testCannotPlaceStonesOutsideBounds() throws {
        XCTAssertThrowsError(try board.place(intersection: Intersection(-1,-1), player: Player.White))
        XCTAssertThrowsError(try board.place(intersection: Intersection(0,-1), player: Player.White))
        XCTAssertThrowsError(try board.place(intersection: Intersection(-1,0), player: Player.White))
        
        XCTAssertThrowsError(try board.place(intersection: Intersection(0,board.HEIGHT), player: Player.White))
        
        XCTAssertThrowsError(try board.place(intersection: Intersection(board.WIDTH,0), player: Player.White))
        
        XCTAssertEqual(0, board.stonesPlaced())

    }
    
}








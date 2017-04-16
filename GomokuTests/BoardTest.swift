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
    
    func testCanAddStonesInBounds() {
        board.place(intersection: Intersection(1,1), player: Player.White)
        XCTAssertEqual(1, board.stonesPlaced())
        
        XCTAssertEqual(Player.White, board.get(intersection: Intersection(1,1)).0)
        
        board.place(intersection: Intersection(board.HEIGHT - 1, board.WIDTH - 1), player: Player.Black)
        XCTAssertEqual(Player.Black, board.get(intersection: Intersection(board.HEIGHT - 1, board.WIDTH - 1)).0)
    }
    
    func testKnowsAboutEmptyIntersections() {
        var (placedStone, _) = board.get(Intersection(0,1))
        XCTAssertEqual(Player.Empty, placedStone)
        
        board.place(intersection: Intersection(0,1), player: Player.White)
        (placedStone, _) = board.get(Intersection(0,1))
        XCTAssertEqual(Player.White, placedStone)
    }
    
    func testCannotAddToOccupiedIntersection() {
        board.place(intersection: Intersection(0,0), player: Player.White)
        
        XCTAssertThrowsError(board.place(intersection: Intersection(0,0), player: Player.Black))
        XCTAssertThrowsError(board.place(intersection: Intersection(0,0), player: Player.White))

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








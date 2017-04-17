//
//  Game.swift
//  Gomoku
//
//  Created by Anton Novoselov on 17/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

protocol BoardFactory {
    
    func makeBoard() -> Board
    
}

class Game {
    
    let board: Board
    let rules: GomokuRules
    var player = Player.White
    
    static var boardFactory: BoardFactory!
    
    init() {
        self.board = Game.boardFactory.makeBoard()
        self.rules = GomokuRules()
    }
    
    func takeTurn(_ col: Int, _ row: Int) {
        board.place(col, row, whoseTurn())
        player = other(player: player)
    }
    
    func whoseTurn() -> Player {
        return player
    }
    
    func other(player: Player) -> Player {
        return player == Player.White ? Player.Black : Player.White
    }
    
    func getBoard() -> BoardState {
        return board as! BoardState
    }
    
    func getRules() -> GomokuRules {
        return rules
    }
    
    
}

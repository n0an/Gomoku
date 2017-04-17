//
//  Game.swift
//  Gomoku
//
//  Created by Anton Novoselov on 17/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

class Game {
    
    let board: Board
    let rules: GomokuRules
    var player = Player.White
    
    init(board: Board, rules: GomokuRules) {
        self.board = board
        self.rules = rules
    }
    
    func takeTurn(_ col: Int, _ row: Int) {
        self.board.place(col, row, whoseTurn())
        
        player = other(player: player)
        
    }
    
    func whoseTurn() -> Player {
        return player
    }
    
    func other(player: Player) -> Player {
        return player == Player.White ? Player.Black : Player.White
    }
    
    func getBoard() -> Board {
        return board
    }
    
    func getRules() -> GomokuRules {
        return rules
    }
    
    
}

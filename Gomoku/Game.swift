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
    let gameData: GameData
    let rules: GomokuRules
    
    static var boardFactory: BoardFactory!
    
    init() {
        self.board = Game.boardFactory.makeBoard()
        self.gameData = GameData()
        self.rules = GomokuRules()
    }
    
    func takeTurn(_ col: Int, _ row: Int) -> BoardError? {
//        board.place(col, row, whoseTurn())
//        player = other(player: player)
        
        return gameData.takeTurn(col, row)
        
    }
    
    
    
    func getBoard() -> BoardState {
        return board as! BoardState
    }
    
    func getRules() -> GomokuRules {
        return rules
    }
    
    
}

//
//  GomokuRules.swift
//  Gomoku
//
//  Created by Anton Novoselov on 16/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

class GomokuRules {
    
    
    
    func isWin(_ board: BoardState, _ player: Player) -> Bool {
        
        if isRowWin(board, player) || isColWin(board, player) {
            return true
        } else {
            return false
        }
        
        
    }
    
    func isRowWin(_ board: BoardState, _ player: Player) -> Bool {
        
        return isConsecutive(board, player, board.getHeight(), board.getWidth()) { (i, j) -> Player in
            return board.get(j, i).0!
        }
    }
    
    func isColWin(_ board: BoardState, _ player: Player) -> Bool {
        
        return isConsecutive(board, player, board.getWidth(), board.getHeight()) { (i, j) -> Player in
            return board.get(i, j).0!
        }
    }
    
    func isConsecutive(_ board: BoardState, _ player: Player, _ iMax: Int, _ jMax: Int, getStone: (_ i: Int, _ j: Int) -> Player) -> Bool {
        
        var consecutiveStones = 0
        
        for col in 0..<iMax {
            
            for row in 0..<jMax {
                
                let playerPiece = getStone(col, row)
                
                if playerPiece == player {
                    consecutiveStones += 1
                    if consecutiveStones > 4 {
                        return true
                    }
                } else {
                    consecutiveStones = 0
                }
                
            }
        }
        
        return false

    }
}















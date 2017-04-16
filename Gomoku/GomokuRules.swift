//
//  GomokuRules.swift
//  Gomoku
//
//  Created by Anton Novoselov on 16/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

class GomokuRules {
    
    func isWin(_ board: Board) throws -> Bool {
        let row = 0
        var playerPiecesInARow = 0
        
        for col in 0..<board.WIDTH {
            
            let playerPiece = try board.get(intersection: Intersection(col, row))
            if playerPiece == Player.White {
                playerPiecesInARow += 1
            }
            
        }
        
        
        return playerPiecesInARow > 4
    }
    
}

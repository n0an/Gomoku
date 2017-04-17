//
//  GamePresenter.swift
//  Gomoku
//
//  Created by Anton Novoselov on 17/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation


class GamePresenter {
    
    var playerTurnNames = [Player.White: "White's Turn", Player.Black: "Black's Turn", Player.Empty: "TILT"]
    
    func getPlayerStatus(player: Player) -> String {
        
        return playerTurnNames[player]!
        
    }
    
    
}


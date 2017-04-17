//
//  Board.swift
//  Gomoku
//
//  Created by Anton Novoselov on 16/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//


enum Player {
    case White
    case Black
    case Empty
}

enum BoardError {
    case SpaceOccupied, BadLocation

}



typealias Intersection = (row: Int, column: Int)

class Board {
    let WIDTH = 19
    let HEIGHT = 19
    
    var placedStones: [Int: Player] = [:]
    
    func stonesPlaced() -> Int {
        return placedStones.count
    }
    
    
    
    
    func place(_ row: Int, _ column: Int, _ player: Player) -> BoardError? {
        
        let (loc, error) = makeLocation(row, column)
        
        if error != nil {
            return error
        }
        
        if placedStones[loc] != nil {
            return .SpaceOccupied
        }
        
        placedStones[loc] = player
        
        return nil
    }
    
    
    func makeLocation(_ row: Int, _ column: Int) -> (Int, BoardError?) {
        var error: BoardError?
        if row < 0 || row >= WIDTH || column < 0 || column >= HEIGHT {
            error = .BadLocation
        }
        
        return (column * WIDTH + row, error)
    }
    
    
    
    func get(_ row: Int, _ column: Int) -> (Player?, BoardError?) {
        let (loc, error) = makeLocation(row, column)
        
        if error != nil {
            return (nil, error)
        }
        
        if let stone = placedStones[loc] {
            return (stone, nil)
        } else {
            return (Player.Empty, nil)
        }
        
    }
    
    
    
}


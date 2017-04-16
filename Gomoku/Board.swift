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

class SpaceOccupied: Error {
    
}

class BadLocaton: Error {
    
}

typealias Intersection = (row: Int, column: Int)

class Board {
    let WIDTH = 19
    let HEIGHT = 19
    
    var placedStones: [Int: Player] = [:]
    
    func stonesPlaced() -> Int {
        return placedStones.count
    }
    
    func place(row: Int, col: Int, player: Player) -> Error? {
        return place(intersection: Intersection(row, col), player: player)
    }
    
    func place(intersection: Intersection, player: Player) -> Error? {
        
        let (loc, error) = makeLocation(intersection: intersection)
        
        if error != nil {
            return error
        }
        
        if placedStones[loc] != nil {
            return SpaceOccupied()
        }
        
        placedStones[loc] = player
        
        return nil
    }
    
    func makeLocation(intersection: Intersection) -> (Int, Error?) {
        return makeLocation(row: intersection.row, column: intersection.column)
    }
    
    func makeLocation(row: Int, column: Int) -> (Int, Error?) {
        var error: Error?
        if row < 0 || row >= WIDTH || column < 0 || column >= HEIGHT {
            error = BadLocaton()
        }
        
        return (column * WIDTH + row, error)
    }
    
    func get(row: Int, column: Int) -> (Player?, Error?) {
        return get(intersection: Intersection(row, column))
    }
    
    func get(intersection: Intersection) -> (Player?, Error?) {
        let (loc, error) = makeLocation(intersection: intersection)
        
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


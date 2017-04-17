//
//  BoardData.swift
//  Gomoku
//
//  Created by Anton Novoselov on 16/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//



class BoardFactoryImpl: BoardFactory {
    
    func makeBoard() -> Board {
        return BoardData()
    }
}

class BoardData: Board, BoardState {
    private let WIDTH = 19
    private let HEIGHT = 19
    
    var placedStones: [Int: Player] = [:]
    
    func getWidth() -> Int {
        return WIDTH
    }
    
    func getHeight() -> Int {
        return HEIGHT
    }
    
    func stonesPlaced() -> Int {
        return placedStones.count
    }
    
    func place(_ column: Int, _ row: Int, _ player: Player) -> BoardError? {
        
        let (loc, error) = makeLocation(column, row)
        
        if error != nil {
            return error
        }
        
        if placedStones[loc] != nil {
            return .SpaceOccupied
        }
        
        placedStones[loc] = player
        
        return nil
    }
    
    
    func makeLocation(_ column: Int, _ row: Int) -> (Int, BoardError?) {
        var error: BoardError?
        if column < 0 || column >= WIDTH || row < 0 || row >= HEIGHT {
            error = .BadLocation
        }
        
        return (column * WIDTH + row, error)
    }
    
    
    
    func get(_ column: Int, _ row: Int) -> (Player?, BoardError?) {
        let (loc, error) = makeLocation(column, row)
        
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


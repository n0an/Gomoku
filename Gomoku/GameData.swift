//
//  GameData.swift
//  Gomoku
//
//  Created by Anton Novoselov on 16/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//



class BoardFactoryImpl: BoardFactory {
    
    func makeBoard() -> Board & BoardState {
        return GameData()
    }
}

class GameData: Board, BoardState {
    private let WIDTH = 19
    private let HEIGHT = 19
    
    var placedStones: [Int: Player] = [:]
    var player: Player = Player.White
    
    func getWidth() -> Int {
        return WIDTH
    }
    
    func getHeight() -> Int {
        return HEIGHT
    }
    
    func stonesPlaced() -> Int {
        return placedStones.count
    }
    
    func takeTurn(_ column: Int, _ row: Int) -> BoardError? {
        let error = place(column, row, player)
        player = other(player)
        return error
    }
    
    func whoseTurn() -> Player {
        return player
    }
    
    func other(_ player: Player) -> Player {
        return player == Player.White ? Player.Black : Player.White
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


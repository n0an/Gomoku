//
//  BoardSymbols.swift
//  Gomoku
//
//  Created by Anton Novoselov on 17/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation


enum Player {
    case White
    case Black
    case Empty
}

enum BoardError {
    case SpaceOccupied, BadLocation
    
}

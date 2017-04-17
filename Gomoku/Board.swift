//
//  Board.swift
//  Gomoku
//
//  Created by Anton Novoselov on 17/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import Foundation

protocol Board {
    func place(_ column: Int, _ row: Int, _ player: Player) -> BoardError?
    func get(_ column: Int, _ row: Int) -> (Player?, BoardError?)
    func getWidth() -> Int
    func getHeight() -> Int
}

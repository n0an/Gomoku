//
//  GridView.swift
//  Gomoku
//
//  Created by Anton Novoselov on 16/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import UIKit

class GridView: UIView {
    
    let board: Board
    let boardSize: CGFloat
    let cellCount: Int
    let cellSize: CGFloat
    
    var tapper: UITapGestureRecognizer!
    
    init(frame: CGRect, board: Board) {
        self.board = board
        self.boardSize = min(frame.size.width, frame.size.height)
        
        self.cellCount = board.WIDTH + 1
        self.cellSize = self.boardSize / CGFloat(cellCount)
        
        super.init(frame: frame)
        
        self.tapper = UITapGestureRecognizer(target: self, action: #selector(self.tapped(recognizer:)))
        self.addGestureRecognizer(self.tapper)
        
        self.backgroundColor = UIColor(colorLiteralRed: 255/255, green: 226/255, blue: 124/255, alpha: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    func tapped(recognizer: UITapGestureRecognizer) {
        let locationOfTap = tapper.location(ofTouch: 0, in: self)
        
        let tappedColumn = Int(((locationOfTap.x - cellSize) / cellSize) + 0.5)
        let tappedRow = Int(((locationOfTap.y - cellSize) / cellSize) + 0.5)
        
        _ = board.place(tappedColumn, tappedRow, Player.White)
        
        self.setNeedsDisplay()
        
    }
    
    override func draw(_ rect: CGRect) {
        
        let path = UIBezierPath()
        
        for i in 1..<cellCount {
            let xPos = CGFloat(i) * cellSize
            path.move(to: CGPoint(x:xPos, y: cellSize))
            path.addLine(to: CGPoint(x: xPos, y: boardSize - cellSize))
        }
        
        for i in 1..<cellCount {
            let yPos = CGFloat(i) * cellSize
            path.move(to: CGPoint(x:cellSize, y: yPos))
            path.addLine(to: CGPoint(x: boardSize - cellSize, y: yPos))
        }
        
        path.lineWidth = 1
        path.stroke()
        
        for col in 0..<board.WIDTH {
            for row in 0..<board.HEIGHT {
                let (stone, _) = board.get(col, row)
                
                if stone != Player.Empty {
                    let stonePath = UIBezierPath()
                    
                    if stone == Player.White {
                        UIColor.white.setFill()
                    } else {
                        UIColor.black.setFill()
                    }
                    
                    let center = CGPoint(x: CGFloat(col + 1) * cellSize, y: CGFloat(row + 1) * cellSize)
                    let stoneRadius = cellSize / 2.5
                    
                    stonePath.move(to: center)
                    
                    stonePath.addArc(withCenter: center, radius: stoneRadius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
                    
                    stonePath.fill()
                }
            }
        }
        
        
       
    }
 

}






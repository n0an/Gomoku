//
//  ViewController.swift
//  Gomoku
//
//  Created by Anton Novoselov on 16/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var board = Board()
        try! board.place(intersection: Intersection(10, 10), player: Player.White)
        try! board.place(intersection: Intersection(11, 11), player: Player.Black)
        try! board.place(intersection: Intersection(8, 8), player: Player.White)
        try! board.place(intersection: Intersection(9, 9), player: Player.Black)


        
        let gridRect = CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.width)
        
        let gridView = GridView(frame: gridRect, board: board)
        
        view.addSubview(gridView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


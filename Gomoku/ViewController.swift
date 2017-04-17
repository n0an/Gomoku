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
        
        let board = Board()
//        board.place(10, 10, Player.White)
//        board.place(11, 11, Player.Black)
//        board.place(8, 8, Player.White)
//        board.place(9, 9, Player.Black)
//

        
        let gridRect = CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.width)
        
        let gridView = GridView(frame: gridRect, board: board)
        
        view.addSubview(gridView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


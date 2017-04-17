//
//  ViewController.swift
//  Gomoku
//
//  Created by Anton Novoselov on 16/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var statusLabel: UILabel!
    var board: Board!
    var rules: GomokuRules!
    var game: Game!
    var presenter: GamePresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        board = Board()
        rules = GomokuRules()
        game = Game(board: board, rules: rules)
        presenter = GamePresenter()
        
        let gridRect = CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.width)
        let gridView = GridView(frame: gridRect, game: game)
        view.addSubview(gridView)
        gridView.tapResponder = { col, row in
            self.respondToTap(col: col, row: row)
        }
        
        let labelWidth: CGFloat = 100.0
        let statusRect = CGRect(x: view.frame.midX - labelWidth/2, y: 100, width: labelWidth, height: 25)
        statusLabel = UILabel(frame: statusRect)
        statusLabel.textAlignment = .center
        
        view.addSubview(statusLabel)
        
        statusLabel.text = presenter.getPlayerStatus(player: game.whoseTurn())
        
        
    }
    
    func respondToTap(col: Int, row: Int) {
        self.game.takeTurn(col, row)
        
        if game.getRules().isWin(board, game.whoseTurn()) {
            statusLabel.text = presenter.getWinStatus(player: game.whoseTurn())
        } else {
            
            self.statusLabel.text = self.presenter.getPlayerStatus(player: self.game.whoseTurn())
        }
        
    }

    


}


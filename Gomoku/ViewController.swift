//
//  ViewController.swift
//  Gomoku
//
//  Created by Anton Novoselov on 16/04/2017.
//  Copyright © 2017 Anton Novoselov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var statusLabel: UILabel = {
        return self.makeStatusLabel()
    }()

    var rules: GomokuRules!
    lazy var game: Game = {
        return Game()
    }()
    
    lazy var presenter: GamePresenter = {
        return GamePresenter()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let gridRect = CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.width)
        let gridView = GridView(frame: gridRect, board: game.getBoard())
        view.addSubview(gridView)
        gridView.tapResponder = { col, row in
            self.respondToTap(col: col, row: row)
        }
        
//        let labelWidth: CGFloat = 100.0
//        let statusRect = CGRect(x: view.frame.midX - labelWidth/2, y: 100, width: labelWidth, height: 25)
//        statusLabel = UILabel(frame: statusRect)
//        statusLabel.textAlignment = .center
        
        view.addSubview(statusLabel)
        
        statusLabel.text = presenter.getPlayerStatus(player: game.whoseTurn())
        
        
    }
    
    func respondToTap(col: Int, row: Int) {
        
        let tappinglayer = game.whoseTurn()
        game.takeTurn(col, row)
        
        if game.getRules().isWin(game.getBoard(), tappinglayer) {
            statusLabel.text = presenter.getWinStatus(player: tappinglayer)
        } else {
            
            self.statusLabel.text = self.presenter.getPlayerStatus(player: tappinglayer)
        }
        
    }

    func makeStatusLabel() -> UILabel {
        let labelWidth: CGFloat = 100.0
        let statusRect = CGRect(x: view.frame.midX - labelWidth/2, y: 100, width: labelWidth, height: 25)
        let label = UILabel(frame: statusRect)
        label.textAlignment = .center
        return label
    }


}


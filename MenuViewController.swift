//
//  MenuViewController.swift
//  Pong
//
//  Created by Allen Aboytes on 8/19/17.
//  Copyright © 2017 Allen Aboytes. All rights reserved.
//

import Foundation
import UIKit

enum gameMode {
    case easy
    case medium
    case hard
    case p2
}

class MenuViewController: UIViewController {

    @IBAction func Player2 (sender: Any){
        moveToGame(game: .p2)
    }
    @IBAction func Easy (sender: Any){
        moveToGame(game: .easy)
    }
    @IBAction func Medium (sender: Any){
        moveToGame(game: .medium)
    }
    @IBAction func Hard (sender: Any){
        moveToGame(game: .hard)
    }

    
    func moveToGame (game: gameMode){
        let gameVC = self.storyboard?.instantiateInitialViewController(performSegue(withIdentifier: "gameVC") as! GameViewController
    }
    
}

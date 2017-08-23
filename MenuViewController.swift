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

//    @IBAction func Player2(_ sender: Any) {
//        moveToGame(game: .p2)
//    }
//    @IBAction func Easy(_ sender: Any) {
//        moveToGame(game: .easy)
//    }
//    @IBAction func Medium(_ sender: Any) {
//        moveToGame(game: .medium)
//    }
//    @IBAction func Hard(_ sender: Any) {
//        moveToGame(game: .hard)
//    }
    
    func moveToGame (game: gameMode){
        let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "gameVC") as! GameViewController
        
        currentGameType = game
        
        self.navigationController?.pushViewController(gameVC, animated: true)
    }
    
}

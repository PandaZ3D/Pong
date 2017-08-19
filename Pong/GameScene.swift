//
//  GameScene.swift
//  Pong
//
//  Created by Allen Aboytes on 8/18/17.
//  Copyright © 2017 Allen Aboytes. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var bot = SKSpriteNode()
    var usr = SKSpriteNode()
    
    var score = [Int]()
    
    var btmLbl = SKLabelNode()
    var topLbl = SKLabelNode()
    
    override func didMove(to view: SKView) {
        
        startGame()
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        bot = self.childNode(withName: "bot") as! SKSpriteNode
        usr = self.childNode(withName: "usr") as! SKSpriteNode
        
        btmLbl = self.childNode(withName: "BottomScore") as! SKLabelNode
        topLbl = self.childNode(withName: "TopScore") as! SKLabelNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 12, dy: 12))
        
        bot.position.y = (self.frame.height/2) - 50
        usr.position.y = (-self.frame.height/2) + 50
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
       
    }
    
    func displayScore() {
        btmLbl.text = String(score[0])
        topLbl.text = String(score[1])
    }
    
    func startGame() {
        //init scores
        score = [0,0]
        
        displayScore()
    }
    
    func addScore(player: SKSpriteNode) {
        //remove forces on ball
        ball.position = CGPoint(x: 0, y: 0)
        ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        //increment scores
        if player == usr {
            //increment usr score
            score[0] += 1
            //add impulse
            ball.physicsBody?.applyImpulse(CGVector(dx: 12, dy: 12))
        }
        else if player == bot {
            //imcrement score for bot
            score[1] += 1
            //add impulse
            ball.physicsBody?.applyImpulse(CGVector(dx: -12, dy: -12))
        }
        
        displayScore()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //every touch happening cont.
        for touch in touches {
            let location = touch.location(in: self)
            //track UI touch
            usr.run(SKAction.moveTo(x: location.x, duration: 0.2))
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        //every touch happening cont.
        for touch in touches {
            let location = touch.location(in: self)
            //move usr paddle along with UI touch
            usr.run(SKAction.moveTo(x: location.x, duration: 0.2))
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        bot.run(SKAction.moveTo(x: ball.position.x, duration: 1))
        
        if ball.position.y <= usr.position.y - 30 {
            //usr position lower half (-)
            //add score to AI
            addScore(player: bot)
        }
        else if ball.position.y >= bot.position.y + 30 {
            //bot position upper half (+)
            //add score to usr
            addScore(player: usr)
        }
    }
}

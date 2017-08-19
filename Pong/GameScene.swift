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
    
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        bot = self.childNode(withName: "bot") as! SKSpriteNode
        usr = self.childNode(withName: "usr") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -12, dy: 12))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
       
    }
    
    func startGame() {
        score = [0,0]
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            usr.run(SKAction.moveTo(x: location.x, duration: 0.2))
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            
            usr.run(SKAction.moveTo(x: location.x, duration: 0.2))
            
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        bot.run(SKAction.moveTo(x: ball.position.x, duration: 1))
    }
}

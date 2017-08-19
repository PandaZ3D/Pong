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
    
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        bot = self.childNode(withName: "bot") as! SKSpriteNode
        usr = self.childNode(withName: "usr") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: 20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
       
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

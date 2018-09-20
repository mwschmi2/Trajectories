//
//  GameScene.swift
//  Trajectories
//
//  Created by Mark Schmidt on 9/13/18.
//  Copyright © 2018 Mark Schmidt. All rights reserved.
//

import Foundation
import SpriteKit
let playerRect = CGSize(width: 50, height: 50)
class GameScene : SKScene {
        //TODO create a better physics system and decouple it from the view (maybe?)
    let p2 = SKShapeNode(circleOfRadius: 50)
    
    let player = SKShapeNode(rectOf: playerRect, cornerRadius: 5)
    let G = 0.1
    var lastPosition = CGPoint()
    override func didMove(to view: SKView) {
        
        
        p2.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        lastPosition = p2.position
        player.position = CGPoint(x: size.width * 0.7, y: size.height * 0.5)
        let body = SKPhysicsBody(rectangleOf: playerRect)
        player.physicsBody = body
        body.affectedByGravity = false
        body.linearDamping = 0.0
        body.angularDamping = 0.0
        self.addChild(p2)
        self.addChild(player)
        player.physicsBody?.velocity = CGVector(dx: 0, dy: 200)
        

        
    }
    
    override func update(_ currentTime: TimeInterval) {
        //TODO: put this in a for loop and run it for all objects in the scene
        let dir =  (Vector2D(p2.position) - Vector2D(player.position)).normalized()
        let force = (G * 100 * 1) / dir.length²()

        let amount = dir * force
        
        player.physicsBody?.applyForce(CGVector(dx: amount.x, dy: amount.y));
        
        let path = CGMutablePath()
        path.move(to: lastPosition)
        path.addLine(to: player.position)
        
        let lineseg = SKShapeNode(path: path)
        lineseg.strokeColor = SKColor.red
        lineseg.fillColor = SKColor.red
        self.addChild(lineseg)
        
        lastPosition = player.position;
    }
}

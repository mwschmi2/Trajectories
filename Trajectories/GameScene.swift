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
        //TODO create a better physics system and decouple it from the view
    let p2 = SKShapeNode(circleOfRadius: 50)
    
    let player = SKShapeNode(rectOf: playerRect, cornerRadius: 5)
    var playerVelocity = Vector2D(0, 7e-4)
    let G = 5e-5
    var lastPosition = CGPoint()
    
    override func didMove(to view: SKView) {
        
        
        p2.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        lastPosition = p2.position
        player.position = CGPoint(x: size.width * 0.7, y: size.height * 0.5)

        self.addChild(p2)
        self.addChild(player)
        
        print("\(player.position), \(playerVelocity)")

        
    }
    
    var arrowNode : SKShapeNode?
    override func update(_ currentTime: TimeInterval) {
        //TODO: put this in a for loop and run it for all objects in the scene
        let radius =  (Vector2D(p2.position) - Vector2D(player.position))
        let norm = radius.normalized()
        let m_planet = 1.0
        let a = (G * m_planet) / radius.length²() * norm

        let v_i = playerVelocity
        let at = a * currentTime
        let v_f = v_i + at
        
        let pos = Vector2D(player.position)
        
        let vt = v_i * currentTime
        
        let at2 = a * (currentTime * currentTime)
        let newPosition = pos + vt + (0.5) * at2
        
        player.position = newPosition.CG()
        print("\(player.position), \(playerVelocity), \(a)")
        playerVelocity = v_f
        
//        let amount = norm * force
//        print(force)
//        player.physicsBody?.applyForce(CGVector(dx: amount.x, dy: amount.y));
        
        let path = CGMutablePath()
        path.move(to: lastPosition)
        path.addLine(to: player.position)
        
        let lineseg = SKShapeNode(path: path)
        lineseg.strokeColor = SKColor.red
        lineseg.fillColor = SKColor.red
        self.addChild(lineseg)
        
        //lineseg.run(SKAction.sequence([SKAction.fadeOut(withDuration: 2.5), SKAction.removeFromParent()]))
        
        if let node = arrowNode {
            node.removeFromParent()
        }
        
        let arrow = CGMutablePath()
        arrow.move(to: player.position)
        arrow.addLine(to: (pos + norm * 10).CG())
        
        arrowNode = SKShapeNode(path: arrow)
        arrowNode?.strokeColor = SKColor.blue
        arrowNode?.strokeColor = SKColor.blue
        self.addChild(arrowNode!)
        
        
        lastPosition = player.position;
    }
}

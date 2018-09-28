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

//class Player : GameObject {
//    var Vector2D position
//    var Vector2D velocity
//    // shape associated with it
//}
//
//class GameObject {
//
//    var Double mass
//    var Vector2D position
//
//}
//
//class Body {
//    var Double mass
//    var position
//
//    // position function
//}
let ZERO = Vector2D(0, 0)
let playerLength = 20.0
class GameScene : SKScene {
        //TODO create a better physics system and decouple it from the view
    var objects : [PhysicsObject] = []
    var player : Player!
    var physics : PhysicsSystem!
    var scale : Double!
    var firstFrame = true;
    override func didMove(to view: SKView) {
        physics = PhysicsSystem()
        scale = physics.calculateScale(viewWidth: Double(size.width) )
        objects.append(Planet(position: Vector2D(-100, 0), velocity: ZERO, mass: 1, radius: 50))

        player = Player(position: ZERO, velocity: Vector2D(0, 2e-5), mass: 1)
        physics.objects = objects
        physics.player = player
        
        for object in objects {
            if let planet = object as? Planet {
                let node = SKShapeNode.init(circleOfRadius: CGFloat( scale * planet.radius))
                planet.node = node
                self.addChild(node)
            } else {
                //TODO add stuff for other objects that aren't planets
            }
        }
        let playerSize = CGSize(width: playerLength * scale, height: playerLength * scale)

        let node = SKShapeNode(rectOf: playerSize)
        player.node = node
        self.addChild(node)
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        physics.simulate(time: currentTime)
        
        
        if let node = player.node as? SKShapeNode {
            
            let newPosition = getObjectPosition(physics: physics, object: player)
            if !firstFrame {
                let oldPosition = node.position
                let path = CGMutablePath()
                path.move(to: oldPosition)
                path.addLine(to: newPosition)
                
                let lineseg = SKShapeNode(path: path)
                lineseg.strokeColor = SKColor.red
                lineseg.fillColor = SKColor.red
                self.addChild(lineseg)
                //make the trail fade away after a little while to prevent build up of nodes
                lineseg.run(SKAction.sequence([SKAction.fadeOut(withDuration: 2.5), SKAction.removeFromParent()]))
            } else {
                firstFrame = false
            }
            node.position = newPosition
        }
        
        for object in objects {
            if let planet = object as? Planet {
                if let node = planet.node as? SKShapeNode {
                    node.position = getObjectPosition(physics: physics, object: planet)
                }
            }
        }
        
        
        
    }
    
    func getObjectPosition(physics: PhysicsSystem, object : PhysicsObject) -> CGPoint {
        let scaled = physics.size * scale
        
        let offset_y = (Double(size.height) - scaled.y) / 2
        let offset_x = (Double(size.width) - scaled.x) / 2
        
        let new_x = (object.position.x + physics.size.x / 2) * scale + offset_x
        let new_y = (object.position.y + physics.size.y/2) * scale + offset_y
        return CGPoint(x: new_x, y: new_y)
    }
}

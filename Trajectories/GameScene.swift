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
        player.position = CGPoint(x: size.width * 0.8, y: size.height * 0.5)

        self.addChild(p2)
        self.addChild(player)
        
        print("\(player.position), \(playerVelocity)")

        
    }
    
    var arrowNode : SKShapeNode?
    override func update(_ currentTime: TimeInterval) {
        //TODO: put this in a for loop and run it for all objects in the scene
        //Not sure entirely how it will work with more objects, but should be very similar (add up accelerations/ change in velocities?
        //Probably best to keep puzzle objects and planets on fixed paths--just compute the trajectory for the player
        
        
        let radius =  (Vector2D(p2.position) - Vector2D(player.position)) //get the radius or hypotenuse vector
        let norm = radius.normalized() //normalize it to get just the direction components
        
        let m_planet = 1.0
        let a = (G * m_planet) / radius.length²() * norm //a = Gm/R^2, multipled by norm to get a vector

        let v_i = playerVelocity //initial velocity
        let v_f = v_i + a * currentTime //final velocity after this frame

        
        let pos = Vector2D(player.position) //get a Vector2D of the player position
        
        let vt = (v_f + v_i)/2 * currentTime //use the average velocity for v * t component
        
        let at2 = a * (currentTime * currentTime) // a * t^2 component
        let newPosition = pos + vt + (0.5) * at2 // x_2 = x_1 + v * t + 1/2 a * t ^ 2
        
        player.position = newPosition.CG() // set the new position
        playerVelocity = v_f //set the new velocity
        
        //draw the trail
        let path = CGMutablePath()
        path.move(to: lastPosition)
        path.addLine(to: player.position)
        
        let lineseg = SKShapeNode(path: path)
        lineseg.strokeColor = SKColor.red
        lineseg.fillColor = SKColor.red
        self.addChild(lineseg)
        //make the trail fade away after a little while to prevent build up of nodes
        lineseg.run(SKAction.sequence([SKAction.fadeOut(withDuration: 2.5), SKAction.removeFromParent()]))
        
        //update last position after drawing trail
        lastPosition = player.position;
    }
}

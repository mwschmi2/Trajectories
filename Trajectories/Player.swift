//
//  Player.swift
//  Trajectories
//
//  Created by Mark Schmidt on 9/22/18.
//  Copyright © 2018 Mark Schmidt. All rights reserved.
//

import Foundation

class Player : PhysicsObject {
    
    func getNetAcceleration(objects : [PhysicsObject]) -> Vector2D {
        var totalAcceleration = Vector2D(0, 0)
        
        for object in objects {
            if (object.id != self.id){
                let distanceVector = object.position - self.position
                let distanceNorm = distanceVector.normalized()
                //TODO add collision stuff when distanceVector.length() < some value associated with the PhysicsObject
                let accelScale = G * object.mass / distanceVector.length²()
                totalAcceleration = totalAcceleration + accelScale * distanceNorm
            }
        }
        
        return totalAcceleration
    }
    
    func updatePosition(objects : [PhysicsObject], time : TimeInterval){
        let a = getNetAcceleration(objects: objects)
        let nextVelocity = velocity + a * time
        let nextPosition = position + (nextVelocity + velocity) * time * (0.5) + a * time * time * 0.5
        position = nextPosition
        velocity = nextVelocity
    }
}

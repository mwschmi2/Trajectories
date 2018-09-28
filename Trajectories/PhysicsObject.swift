//
//  PhysicsObject.swift
//  Trajectories
//
//  Created by Mark Schmidt on 9/22/18.
//  Copyright © 2018 Mark Schmidt. All rights reserved.
//

import Foundation

let G = 5e-7


class PhysicsObject {
    
    var position: Vector2D
    var velocity: Vector2D
    var mass: Double
    var id : UUID
    var node : AnyObject?
    
    init(position : Vector2D, velocity : Vector2D, mass : Double){
        self.position = position
        self.velocity = velocity
        self.mass = mass
        self.id = UUID.init()
    }
}

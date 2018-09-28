//
//  Planet.swift
//  Trajectories
//
//  Created by Mark Schmidt on 9/28/18.
//  Copyright © 2018 Mark Schmidt. All rights reserved.
//

import Foundation

class Planet : PhysicsObject {
    var radius : Double
    
    init(position: Vector2D, velocity: Vector2D, mass: Double, radius: Double) {
        self.radius = radius
        super.init(position: position, velocity: velocity, mass: mass)
        
    }
}

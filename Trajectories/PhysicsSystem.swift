//
//  PhysicsSystem.swift
//  Trajectories
//
//  Created by Mark Schmidt on 9/28/18.
//  Copyright © 2018 Mark Schmidt. All rights reserved.
//

import Foundation

let DEFAULT_WIDTH = 375
let DEFAULT_HEIGHT = 667

class PhysicsSystem {
    var objects : [PhysicsObject]?
    var player : Player?
    
    var size : Vector2D
    
    // 0,0 in the physics system corresponds to the center of the screen
    //(-187, 333)   |   (187, 333)
    //              |
    //              |
    //              |
    //------------(0,0) ----------
    //              |
    //              |
    //              |
    //(-187, -333)  |   (187, -333)
    
    
    init() {
        
        size = Vector2D(Double(DEFAULT_WIDTH), Double(DEFAULT_HEIGHT))
    }
    
    func simulate(time : TimeInterval) {
        //TODO: add moving planets
        
        player?.updatePosition(objects: objects!, time: time)
    }
    
    func calculateScale(viewWidth : Double) -> Double {
        return size.x / Double(viewWidth)
    }
}

//
//  GravityObject.swift
//  Trajectories
//
//  Created by Mark Schmidt on 9/11/18.
//  Copyright © 2018 Mark Schmidt. All rights reserved.
//

import Foundation

class GravityObject : GameObject {
    var mass = 0.0;
    
    init(startPoint : Vector2D, startVelocity : Vector2D, mass : Double){
        super.init(startPoint: startPoint, startVelocity: startVelocity);
        self.mass = mass;
    }}

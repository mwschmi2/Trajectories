//
//  GameObject.swift
//  Trajectories
//
//  Created by Mark Schmidt on 9/11/18.
//  Copyright © 2018 Mark Schmidt. All rights reserved.
//

import Foundation

struct Vector2D {
    var x = 0.0;
    var y = 0.0;
    
    mutating func unitize() {
        let magnitude = x * x + y * y;
        x /= magnitude;
        y /= magnitude;
    };
}

class GameObject {
    var startPoint = Vector2D();
    var currentPoint = Vector2D();
    
    var startVelocity = Vector2D();
    var currentVelocity = Vector2D();
    
    init(startPoint : Vector2D, startVelocity : Vector2D){
        self.startPoint = startPoint;
        self.currentPoint = startPoint;
        
        self.startVelocity = startVelocity;
        self.currentVelocity = startVelocity;
    }
    
}

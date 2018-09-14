//
//  GameScene.swift
//  Trajectories
//
//  Created by Mark Schmidt on 9/13/18.
//  Copyright © 2018 Mark Schmidt. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene : SKScene {
    
    override func didMove(to view: SKView) {
        let p1 = SKShapeNode(circleOfRadius: 50);
        let p2 = SKShapeNode(circleOfRadius: 100);
        
        p1.position = CGPoint(x: size.width * 0.1, y: size.width * 0.5);
        p2.position = CGPoint(x: size.width * 0.2, y: size.width * 0.7);
        self.addChild(p1);
        self.addChild(p2);
        
    }
}

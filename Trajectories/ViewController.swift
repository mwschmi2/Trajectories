//
//  ViewController.swift
//  Trajectories
//
//  Created by Mark Schmidt on 9/11/18.
//  Copyright © 2018 Mark Schmidt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let bounds = UIScreen.main.bounds;
        let xrange = 0 ..< bounds.width;
        let yrange = 0 ..< bounds.height;
        
        
        
        let a = GravityObject(startPoint: Vector2D(x: Double(bounds.width/4), y: Double(bounds.height/4)), startVelocity: Vector2D(x: 0, y: 0), mass: 1.0 );
        let b = GravityObject(startPoint: Vector2D(x: Double(bounds.width/3), y: Double(bounds.height/3)), startVelocity: Vector2D(x: 0, y: 0), mass: 1.0 );
        
        let objects = [a, b];
        
        //draws a circle to the screen, should probably use SKNodes or something
        for object in objects {
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: object.currentPoint.x,y: object.currentPoint.y), radius: CGFloat(20), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
            
            let shapeLayer = CAShapeLayer()
            shapeLayer.path = circlePath.cgPath
            
            //change the fill color
            shapeLayer.fillColor = UIColor.clear.cgColor
            //you can change the stroke color
            shapeLayer.strokeColor = UIColor.red.cgColor
            //you can change the line width
            shapeLayer.lineWidth = 3.0
            
            view.layer.addSublayer(shapeLayer)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


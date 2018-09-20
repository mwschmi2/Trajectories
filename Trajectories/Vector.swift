//
//  GameObject.swift
//  Trajectories
//
//  Created by Mark Schmidt on 9/11/18.
//  Copyright © 2018 Mark Schmidt. All rights reserved.
//

import Foundation
import CoreGraphics

infix operator ⨯ : MultiplicationPrecedence
infix operator • : AdditionPrecedence

struct Vector2D {
    var x: Double
    var y: Double
    
    init(_ x: Double, _ y: Double) {
        self.x = x; self.y = y
    }
    
    init(_ point : CGPoint) {
        self.x = Double(point.x)
        self.y = Double(point.y) //essentially a meaningless cast
    }
    
    func length²() -> Double {
        return (x * x) + (y * y)
    }
    
    func length() -> Double {
        return sqrt(self.length²())
    }
    
    func normalized() -> Vector2D {
        let l = self.length()
        return Vector2D(x/l, y/l)
    }
    
    func CG() -> CGPoint {
        return CGPoint(x: x, y: y)
    }
    
}

//We probably don't need all these vector operations, but they are nice to have!
func + (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
    return Vector2D(lhs.x + rhs.x, lhs.y + rhs.y)
}

func - (lhs: Vector2D, rhs: Vector2D) -> Vector2D {
    return Vector2D(lhs.x - rhs.x, lhs.y - rhs.y)
}

func * (lhs: Vector2D, rhs: Double) -> Vector2D {
    return Vector2D(lhs.x * rhs, lhs.y * rhs)
}

func * (lhs: Double, rhs: Vector2D) -> Vector2D {
    return Vector2D(lhs * rhs.x, lhs * rhs.y)
}

func / (lhs: Vector2D, rhs: Double) -> Vector2D {
    return Vector2D(lhs.x / rhs, lhs.y / rhs)
}

func / (lhs: Double, rhs: Vector2D) -> Vector2D {
    return Vector2D(lhs / rhs.x, lhs / rhs.y)
}

func • (lhs: Vector2D, rhs: Vector2D) -> Double { // dot product
    return lhs.x * rhs.y - lhs.y * rhs.x
}

func ⨯ (lhs: Vector2D, rhs: Vector2D) -> Double { // cross product
    return lhs.x * rhs.y - lhs.y * rhs.x
}

func length²(_ lhs: Vector2D, _ rhs: Vector2D) -> Double {
    return pow(rhs.x - lhs.x, 2.0) + pow(rhs.y - lhs.y, 2.0)
}

func length(_ lhs: Vector2D, _ rhs: Vector2D) -> Double {
    return sqrt(length²(lhs, rhs))
}

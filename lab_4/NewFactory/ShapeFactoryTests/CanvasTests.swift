//
//  CanvasTests.swift
//  ShapeFactoryTests
//
//  Created by Dmitrii Voronin on 04.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import XCTest

class CanvasTests: XCTestCase {
    let canvas = Canvas()
    
    func testDrawLine() {
        let color = Color.Green
        let point1 = Point(x: 1, y: 1)
        let point2 = Point(x: 2, y: 2)
        
        canvas.setColor(color: color)
        canvas.drawLine(point1, point2)
    }
    
    func testDrawElipse() {
        let color = Color.Red
        let center = Point(x: 0, y: 0)
        let horRadius = 3.5
        let verRadius = 10.0
        
        canvas.setColor(color: color)
        canvas.drawElipse(center: center, horRedius: horRadius, verRadius: verRadius)
    }

}

extension CanvasTests {
    func isEqualPoint(lhs: Point, rhs: Point) -> Bool {
        guard lhs.x == rhs.x && lhs.y == rhs.y else {
            return false
        }
        return true
    }
}

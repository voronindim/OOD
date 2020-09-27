//
//  ShapeTests.swift
//  ShapeFactryTests
//
//  Created by Dmitrii Voronin on 27.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

@testable
import ShapeFactory
import XCTest


class ShapeTests: XCTestCase {
    let canvas = mockCanvas()
    
    func testRectangle() {
        let leftTop = Point(x: 10, y: 10)
        let rightBottom = Point(x: 20, y: 0)
        
        let rectangle = Rectangle(color: .Blue, leftTopPoint: leftTop, rightBottomPoint: rightBottom)
        
        XCTAssertEqual(rectangle.color, Color.Blue)
        XCTAssert(isPointEqual(rectangle.leftTopPoint, leftTop))
        XCTAssert(isPointEqual(rectangle.rightBottomPoint, rightBottom))
        
        rectangle.draw(canvas)
        
        XCTAssertEqual(canvas.color, Color.Blue)
        XCTAssertEqual(canvas.elipses, 0)
        XCTAssertEqual(canvas.lines, 4)
    }

    func testTriangle() {
        let vertex1 = Point(x: 0, y: 0)
        let vertex2 = Point(x: 5, y: 5)
        let vertex3 = Point(x: 6, y: 0)
        
        let triangle = Triangle(color: .Red, vertex1: vertex1, vertex2: vertex2, vertex3: vertex3)
        
        XCTAssertEqual(triangle.color, Color.Red)
        XCTAssert(isPointEqual(triangle.vertex1, vertex1))
        XCTAssert(isPointEqual(triangle.vertex2, vertex2))
        XCTAssert(isPointEqual(triangle.vertex3, vertex3))
        
        triangle.draw(canvas)
        
        XCTAssertEqual(canvas.color, Color.Red)
        XCTAssertEqual(canvas.elipses, 0)
        XCTAssertEqual(canvas.lines, 3)
    }
    
    func testElipse() {
        let center = Point(x: 0, y: 0)
        let horRadius = 10.0
        let verRadius = 20.0
        
        let elipse = Elipse(color: .Pink, center: center, horizontalRadius: horRadius, verticalRadius: verRadius)
        
        XCTAssertEqual(elipse.color, Color.Pink)
        XCTAssert(isPointEqual(elipse.center, center))
        XCTAssertEqual(elipse.horizontalRadius, horRadius)
        XCTAssertEqual(elipse.verticalRadius, verRadius)
        
        elipse.draw(canvas)
        XCTAssertEqual(canvas.color, Color.Pink)
        XCTAssertEqual(canvas.lines, 0)
        XCTAssertEqual(canvas.elipses, 1)
    }
    
    func testRegularPolygon() {
        let verticalCount = 5
        let center = Point(x: 0, y: 0)
        let radius = 10.0
        
        let regularPolygon = RegularPolygon(color: .Yellow, center: center, radius: radius, vertexCount: verticalCount)
        
        XCTAssertEqual(regularPolygon.vertexCount, verticalCount)
        XCTAssertEqual(regularPolygon.radius, radius)
        XCTAssert(isPointEqual(regularPolygon.center, center))
        
        regularPolygon.draw(canvas)
        
        XCTAssertEqual(canvas.color, Color.Yellow)
        XCTAssertEqual(canvas.lines, 5)
        XCTAssertEqual(canvas.elipses, 0)
    }
}

class mockCanvas: ICanvas {
    var lines = 0
    var elipses = 0
    var color: Color = .Black

    func setColor(color: Color) {
        self.color = color
    }

    func drawLine(from: Point, to: Point) {
        lines += 1
    }

    func drawElipse(center: Point, horRadius: Double, verRadius: Double) {
        elipses += 1
    }
    
}

//
//  ShapeFactoryTests.swift
//  ShapeFactoryTests
//
//  Created by Dmitrii Voronin on 03.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import XCTest

class ShapeFactoryTests: XCTestCase {
    
    let canvas = MockCanvas()
    
    func testRectangle() {
        let color = Color.Green
        let leftTop = Point(x: 10, y: 10)
        let rightBottom = Point(x: 30, y: 0)
        
        let rectangle = Rectangle(color: color, leftTop: leftTop, rightBottom: rightBottom)
        
        XCTAssertEqual(rectangle.color, color)
        
        rectangle.draw(canvas: canvas)
        
        XCTAssertEqual(canvas.elipseCount, 0)
        XCTAssertEqual(canvas.linesCount, 4)
        
    }
    
    func testTriange() {
        let color = Color.Blue
        let vertex1 = Point(x: 0, y: 0)
        let vertex2 = Point(x: 10, y: 10)
        let vertex3 = Point(x: 10, y: 0)
        
        let triangle = Triangle(color: color, vertex1: vertex1, vertex2: vertex2, vertex3: vertex3)
        
        triangle.draw(canvas: canvas)
        
        XCTAssertEqual(canvas.linesCount, 3)
        XCTAssertEqual(canvas.elipseCount, 0)
    }
    
    func testElipse() {
        let color = Color.Red
        let center = Point(x: 0, y: 0)
        let verticalRadius = 10.0
        let horizontalRadius = 50.0
        
        let elipse = Elipse(color: color, center: center, horRadius: horizontalRadius, verRadius: verticalRadius)
        
        elipse.draw(canvas: canvas)
        
        XCTAssertEqual(canvas.linesCount, 0)
        XCTAssertEqual(canvas.elipseCount, 1)
    }
    
    func testRegularPolygon() {
        let color = Color.Pink
        let center = Point(x: 30, y: 30)
        let radius = 5.0
        let vertexCount = 5
        
        let regularPolygon = try! RegularPolygon(color: color, center: center, radius: radius, vertexCount: vertexCount)
        
        regularPolygon.draw(canvas: canvas)
        
        XCTAssertEqual(regularPolygon.color, color)
        
        XCTAssertEqual(canvas.linesCount, 5)
        XCTAssertEqual(canvas.elipseCount, 0)

    }
    
}

extension ShapeFactoryTests {
    class MockCanvas: ICanvas {
        
        var color = Color.Black
        var linesCount = 0
        var elipseCount = 0
        
        func setColor(color: Color) {
            self.color = color
        }
        
        func drawLine(_ from: Point, _ to: Point) {
            linesCount += 1
        }
        
        func drawElipse(center: Point, horRedius: Double, verRadius: Double) {
            elipseCount += 1
        }
        
    }
}


//
//  FactoryTests.swift
//  ShapeFactoryTests
//
//  Created by Dmitrii Voronin on 04.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import XCTest

class FactoryTests: XCTestCase {
    let shapeFactory = ShapeFactory()
    
    func testCreateShapeWithEmptyDescription() {
        do {
            _ = try shapeFactory.createShape("")
            XCTFail()
        } catch {
        }
    }
    
    func testCreateShapeOnlyWithName() {
        do {
            _ = try shapeFactory.createShape("rectangle")
            XCTFail()
        } catch {
            
        }
    }
    
    func testCreateShapeWitnUnknownName() {
        do {
            _ = try shapeFactory.createShape("!rectangle! blue 10 10 30 0")
            XCTFail()
        } catch {
            
        }
    }
    
    func testCreateRectangle() {
        let rectangle = try! shapeFactory.createShape("rectangle blue 10 10 30 0")
        XCTAssertEqual(rectangle.color, Color.Blue)
        
        do {
            _ = try shapeFactory.createShape("rectangle red 10; 10 30 0")
            XCTFail()
        } catch {
            
        }
    }
    
    func testCreateTriangle() {
        let triangle = try! shapeFactory.createShape("triangle red 0 0 10 10 10 0")
        XCTAssertEqual(triangle.color, Color.Red)
        
        do {
            _ = try shapeFactory.createShape("!triangle pink 10 10 20 20 10 30")
            XCTFail()
        } catch {
            
        }
    }
    
    func testCreateElipse() {
        let elipse = try! shapeFactory.createShape("ELIPSE yellow 0 -1 3.5 5.5555")
        XCTAssertEqual(elipse.color, Color.Yellow)
        
        do {
            _ = try shapeFactory.createShape("elispe yellow")
            XCTFail()
        } catch {
            
        }
    }
    
    func testCreateRegularPolyfon() {
        let polygon = try! shapeFactory.createShape("RegularPolygon green 0 0 5 100")
        XCTAssertEqual(polygon.color, Color.Green)
        
        do {
            _ = try shapeFactory.createShape("RegularPolygon green -0 -0 1")
            XCTFail()
        } catch {
            
        }
    }
    
}


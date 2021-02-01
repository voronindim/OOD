//
//  DraftTests.swift
//  ShapeFactoryTests
//
//  Created by Dmitrii Voronin on 03.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import XCTest

class DraftTests: XCTestCase {
    let draft = PictureDraft()
    
    func testDraft() {
        XCTAssertEqual(draft.shapeCount, 0)
        
        let color: Color = .Blue
        let leftTop = Point(x: 10, y: 10)
        let rightBotton = Point(x: 30, y: 0)
        
        let rectangle = Rectangle(color: color, leftTop: leftTop, rightBottom: rightBotton)
    
        draft.addShape(rectangle)
        
        XCTAssertEqual(draft.shapeCount, 1)
        
        let shape = try! draft.getShape(0)
        XCTAssertEqual(shape.color, color)
        
        
        XCTAssertThrowsError(try draft.getShape(1))
    }

}

//fileprivate func XCTAssertRectangleEqual(_ lhs: Rectangle, _ rhs: Rectangle) -> Bool {
//
//}
//
//fileprivate func twoPointIsEqual(_ lhs: Point, _ rhs: Point) -> Bool {
//    guard lhs.x == rhs.x && lhs.y == rhs.y else {
//        return false
//    }
//
//    return true
//}

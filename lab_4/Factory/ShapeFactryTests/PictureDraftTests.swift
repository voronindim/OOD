//
//  PictureDraftTests.swift
//  ShapeFactryTests
//
//  Created by Dmitrii Voronin on 27.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import XCTest

class PictureDraftTests: XCTestCase {
    let pictureDraft = PictureDraft()
    
    func testPictireDraft() {
        pictureDraft.addShapeToArray(shape: Rectangle(color: .Black, leftTopPoint: Point(x: 10, y: 10), rightBottomPoint: Point(x: 20, y: 0)))
        XCTAssertEqual(pictureDraft.shapeCount, 1)
        pictureDraft.addShapeToArray(shape: Rectangle(color: .Pink, leftTopPoint: Point(x: 20, y: 20), rightBottomPoint: Point(x: 40, y: 0)))
        XCTAssertEqual(pictureDraft.shapeCount, 2)
        
        let shape = pictureDraft.getShape(index: 0)
        
        XCTAssertEqual(shape.color, Color.Black)
    }
    
    func testEmptyPictureDraft() {
        XCTAssertEqual(pictureDraft.shapeCount, 0)
        
    }
}

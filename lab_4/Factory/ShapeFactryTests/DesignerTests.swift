//
//  DesignerTests.swift
//  ShapeFactryTests
//
//  Created by Dmitrii Voronin on 27.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import XCTest

class DesignerTests: XCTestCase {
    func testDesignerCurrect() {
        let arrayOfParams = ["triangle blue 0 0 10 10 10 0"]
        let shapeFactory = ShapeFactory()
        let designer = Designer(shapeFactory: shapeFactory)
        let draft = designer.createDraft(arrayOfParams)
        
        XCTAssertEqual(draft.shapeCount, 1)
    }
    
    func testDesignerUncorrect_ExtraArgument() {
        let arrayOfParams = ["triangle blue 0 0 10 10 10 0 extra"]
        let shapeFactory = ShapeFactory()
        let designer = Designer(shapeFactory: shapeFactory)
        let draft = designer.createDraft(arrayOfParams)
        
        XCTAssertEqual(draft.shapeCount, 0)
    }
    
    func testDesignerUncorrect_ExtraSimbul() {
        let arrayOfParams = ["triangle blue 0: 0 10 10 10 0"]
        let shapeFactory = ShapeFactory()
        let designer = Designer(shapeFactory: shapeFactory)
        let draft = designer.createDraft(arrayOfParams)
        
        XCTAssertEqual(draft.shapeCount, 0)
    }
}

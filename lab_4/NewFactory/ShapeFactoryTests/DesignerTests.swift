//
//  DesignerTests.swift
//  ShapeFactoryTests
//
//  Created by Dmitrii Voronin on 03.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import XCTest

class DesignerTests: XCTestCase {
    func testCreateDraft() {
        let shapeFactory = ShapeFactory()
        let designer = Designer(shapeFactory: shapeFactory)
        
        let listOfShapes = ["rectangle blue 20 20 30 0", "triangle red 0 0 10 10 10 0", "exit"]
        
        let stream = StreamFromArray(array: listOfShapes)
        
        let pd = designer.createDraft(stream: stream)
        
        XCTAssertEqual(pd.shapeCount, 2)
        
    }
}

extension DesignerTests {
    class StreamFromArray: Stream {
        let arrayOfShapes: [String]
        
        var index = 0
        
        init(array: [String]) {
            self.arrayOfShapes = array
        }
        func getLine() -> String {
            index += 1
            guard index <= arrayOfShapes.count else {
                fatalError("OutOfRange")
            }
            return arrayOfShapes[index - 1]
        }
    }
}

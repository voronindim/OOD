//
//  AdapterTests.swift
//  AdapterTests
//
//  Created by Dmitrii Voronin on 16.10.2020.
//

import XCTest

class AdapterTests: XCTestCase {
    func testRenderLine() {
        let stream = MockStream()
        let adapter = ModernCanvasAdapter(modernCanvasRenderer: ModernGraphicsRenderer(stream: stream))
        
        XCTAssertNoThrow(try adapter.drawBegin())
        XCTAssertNoThrow(adapter.moveTo(x: 50, y: 50))
        XCTAssertNoThrow(try adapter.lineTo(x: 100, y: 100))
        XCTAssertNoThrow(try adapter.drawEnd())
        
        let result = "<draw>\tLine from x: 50.0, y: 50.0, to x: 100.0, y: 100.0<\\draw>"
        
        XCTAssertEqual(stream.result, result)
    }
    
    func testTryingRenderLineWithutBeginDraw() {
        let stream = MockStream()
        let adapter = ModernCanvasAdapter(modernCanvasRenderer: ModernGraphicsRenderer(stream: stream))
        
        XCTAssertThrowsError(try adapter.lineTo(x: 10, y: 10))
    }
    
    func testBeginDrawingMultipleTimes() {
        let stream = MockStream()
        let adapter = ModernCanvasAdapter(modernCanvasRenderer: ModernGraphicsRenderer(stream: stream))
        XCTAssertNoThrow(try adapter.drawBegin())
        XCTAssertThrowsError(try adapter.drawBegin())
    }
    
    func testBeginDrawingWithoutStarting() {
        let stream = MockStream()
        let adapter = ModernCanvasAdapter(modernCanvasRenderer: ModernGraphicsRenderer(stream: stream))
        XCTAssertThrowsError(try adapter.lineTo(x: 10, y: 10))
    }

}

fileprivate class MockStream: Stream {
    var result = ""
    func getLine() -> String {
        ""
    }
    
    func write(string: String) {
        result = result + string
    }
}

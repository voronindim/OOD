//
//  AdapterTests.swift
//  AdapterTests
//
//  Created by Dmitrii Voronin on 16.10.2020.
//

import XCTest

class AdapterTests: XCTestCase {
    func testRenderLineWithColor() {
        let stream = MockStream()
        let adapter = ModernCanvasAdapter(modernCanvasRenderer: ModernGraphicsRenderer(stream: stream))
        
        adapter.setColor(0x00AABB)
        XCTAssertNoThrow(try adapter.drawBegin())
        adapter.moveTo(x: 50, y: 50)
        XCTAssertNoThrow(try adapter.lineTo(x: 100, y: 100))
        XCTAssertNoThrow(try adapter.drawEnd())
        
        XCTAssertEqual("<draw>", stream.result[0])
        XCTAssertEqual("\tLine fromX=50.0 fromY=50.0 toX=100.0 toY=100.0", stream.result[1])
        XCTAssertEqual("\t\tcolor r=0.0 g=0.67 b=0.73 a=1.0", stream.result[2])
        XCTAssertEqual("<\\draw>", stream.result[3])
    }
    
    func testRenderLineWithDefaultColor() {
        let stream = MockStream()
        let adapter = ModernCanvasAdapter(modernCanvasRenderer: ModernGraphicsRenderer(stream: stream))
        
        XCTAssertNoThrow(try adapter.drawBegin())
        adapter.moveTo(x: 50, y: 50)
        XCTAssertNoThrow(try adapter.lineTo(x: 100, y: 100))
        XCTAssertNoThrow(try adapter.drawEnd())
        
        XCTAssertEqual("<draw>", stream.result[0])
        XCTAssertEqual("\tLine fromX=50.0 fromY=50.0 toX=100.0 toY=100.0", stream.result[1])
        XCTAssertEqual("\t\tcolor r=0.0 g=0.0 b=0.0 a=1.0", stream.result[2])
        XCTAssertEqual("<\\draw>", stream.result[3])
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
    var result: [String] = []
    func getLine() -> String {
        ""
    }
    
    func write(string: String) {
        result.append(string)
    }
}

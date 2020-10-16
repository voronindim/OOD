//
//  modern_graphics_lib.swift
//  Adapter
//
//  Created by Dmitrii Voronin on 14.10.2020.
//

import Foundation

struct Point {
    let x: Double
    let y: Double
}

class ModernGraphicsRenderer {
    private var drawing = false
    private let stream: Stream
    
    init(stream: Stream) {
        self.stream = stream
    }
    
    func beginDraw() throws {
        guard !drawing else {
            throw Errors.logicError("Drawing has already begun!")
        }
        stream.write(string: "<draw>")
        drawing = true
    }
    
    func drawLine(start: Point, end: Point) throws {
        guard drawing else {
            throw Errors.logicError("DrawLine is allowed between beginDraw()/endDraw() only")
        }
        stream.write(string: "\tLine from x: \(start.x), y: \(start.y), to x: \(end.x), y: \(end.y)")
    }
    
    func endDraw() throws {
        guard drawing else {
            throw Errors.logicError("DrawLine is allowed between beginDraw()/endDraw() only")
        }
        stream.write(string: "<\\draw>")
        drawing = false
    }
    deinit {
        if drawing {
            do {
             try endDraw()
            } catch {
                
            }
        }
    }
}

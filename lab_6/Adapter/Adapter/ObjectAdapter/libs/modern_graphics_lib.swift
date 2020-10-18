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

class CRGBAColor {
    let r: Float
    let g: Float
    let b: Float
    let a: Float
    
    init(_ r: Float, _ g: Float, _ b: Float, _ a: Float) {
        self.a = a
        self.g = g
        self.b = b
        self.r = r
    }
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
    
    func drawLine(start: Point, end: Point, color: CRGBAColor) throws {
        guard drawing else {
            throw Errors.logicError("DrawLine is allowed between beginDraw()/endDraw() only")
        }
        stream.write(string: "\tLine fromX=\(start.x) fromY=\(start.y) toX=\(end.x) toY=\(end.y)")
        stream.write(string: "\t\tcolor r=\(roundColorValue(color.r)) g=\(roundColorValue(color.g)) b=\(roundColorValue(color.b)) a=\(roundColorValue(color.a))")
    }
    
    func endDraw() throws {
        guard drawing else {
            throw Errors.logicError("DrawLine is allowed between beginDraw()/endDraw() only")
        }
        stream.write(string: "<\\draw>")
        drawing = false
    }
    
    private func roundColorValue(_ value: Float) -> Float {
        round(value * 100) / 100
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



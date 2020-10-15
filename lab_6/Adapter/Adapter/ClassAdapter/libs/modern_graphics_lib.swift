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
    
    
    func beginDraw() throws {
        guard !drawing else {
            throw Errors.logicError("Drawing has already begun!")
        }
        print("<draw>") // писать в поток
        drawing = true
    }
    
    func drawLine(start: Point, end: Point) throws {
        guard drawing else {
            throw Errors.logicError("DrawLine is allowed between beginDraw()/endDraw() only")
        }
        print("\tLine from x: \(start.x), y: \(start.y), to x: \(end.x), y: \(end.y)") // писать в поток
    }
    
    func endDraw() throws {
        guard drawing else {
            throw Errors.logicError("DrawLine is allowed between beginDraw()/endDraw() only")
        }
        print("</draw>") // писать в поток
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

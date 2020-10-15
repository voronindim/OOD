//
//  graphics_lib.swift
//  Adapter
//
//  Created by Dmitrii Voronin on 14.10.2020.
//

import Foundation

protocol Canvas {
    func moveTo(x: Double, y: Double)
    func lineTo(x: Double, y: Double) throws
}

class CanvasImpl: Canvas {
    func moveTo(x: Double, y: Double) {
        print("MoveTo (\(x), \(y))")
    }
    
    func lineTo(x: Double, y: Double) {
        print("LineTo (\(x), \(y))")
    }
}

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
    func setColor(_ color: UInt32)
}

class CanvasImpl: Canvas {
    func moveTo(x: Double, y: Double) {
        print("MoveTo (\(x), \(y))")
    }
    
    func lineTo(x: Double, y: Double) {
        print("\tLineTo (\(x), \(y))")
    }
    
    func setColor(_ color: UInt32) {
        let hex = String(color, radix: 16, uppercase: false)
        print("SetColor #\(hex)")
    }
    
}

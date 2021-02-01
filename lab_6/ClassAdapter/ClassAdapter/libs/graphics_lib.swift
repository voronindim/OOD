//
//  graphics_lib.swift
//  Adapter
//
//  Created by Dmitrii Voronin on 14.10.2020.
//

import Foundation

protocol Canvas {
    func moveTo(x: Double, y: Double)
    func lineTo(x: Double, y: Double)
    func setColor(_ color: UInt32)
}

class CanvasImpl: Canvas {
    
    let stream: Stream
    
    init(stream: Stream) {
        self.stream = stream
    }
    func moveTo(x: Double, y: Double) {
        stream.write(string: "MoveTo (\(x), \(y))")
    }
    
    func lineTo(x: Double, y: Double) {
        stream.write(string: "\tLineTo (\(x), \(y))")
    }
    
    func setColor(_ color: UInt32) {
        let hex = String(color, radix: 16, uppercase: false)
        stream.write(string: "SetColor #\(hex)")
    }
    
}

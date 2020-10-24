//
//  StreamCanvas.swift
//  slides
//
//  Created by Dmitrii Voronin on 23.10.2020.
//

import Foundation

class StreamCanvas: Canvas {
    private var fillColor: RGBAColor
    private var lineColor: RGBAColor
    private var lineThikness: Double
    private let stream: Stream
    
    init(stream: Stream, fillColor: RGBAColor, lineColor: RGBAColor, lineThikness: Double) {
        self.stream = stream
        self.fillColor = fillColor
        self.lineColor = lineColor
        self.lineThikness = lineThikness
    }
    
    func drawLine(start: PointD, end: PointD) {
        let message = "Draw #\(lineColor) line with \(lineThikness) thikness from {\(start.x); \(start.y)} to {\(end.x); \(end.y)}"
        stream.writeLine(string: message)
    }
    
    func drawElipse(left: PointD, width: Double, height: Double) {
        let message = "Draw #\(fillColor) elipse with \(lineColor) outline color and \(lineThikness) thikness with left top at {\(left.x); \(left.y)} width \(width) and hieght \(height)"
        stream.writeLine(string: message)
    }
    
    func fillPolygon(vertices: [PointD]) {
        let message = "Fill polygon with color # \(fillColor)"
        stream.writeLine(string: message)
        
        for vertex in vertices {
            stream.writeLine(string: "Vertex {\(vertex.x); \(vertex.y)}")
        }
    }
    
    func setFillColor(color: RGBAColor) {
        self.fillColor = color
    }
    
    func setLineColor(color: RGBAColor) {
        self.lineColor = color
    }
    
    func setLineThikness(thikness: Double) {
        self.lineThikness = thikness
    }
}

//
//  StreamCanvas.swift
//  slides
//
//  Created by Dmitrii Voronin on 23.10.2020.
//

import Foundation

class StreamCanvas: Canvas {
    private var fillColor: RGBAColor = Colors.white.rawValue
    private var lineColor: RGBAColor = Colors.black.rawValue
    private var lineThikness: Double = 1
    private let stream: Stream
    
    init(stream: Stream) {
        self.stream = stream
    }
    
    func drawLine(start: PointD, end: PointD) {
        let message = "Draw #\(lineColor) line with \(lineThikness) thikness from {\(start.x); \(start.y)} to {\(end.x); \(end.y)}"
        stream.writeLine(string: message)
    }
    
    func drawElipse(left: PointD, width: Double, height: Double) {
        let message = "Draw elipse with \(lineColor) outline color and \(lineThikness) thikness with left top at {\(left.x); \(left.y)} width \(width) and hieght \(height)"
        stream.writeLine(string: message)
    }
    
    func fillElipse(left: PointD, width: Double, height: Double) {
        let message = "Draw #\(fillColor) elipse"
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

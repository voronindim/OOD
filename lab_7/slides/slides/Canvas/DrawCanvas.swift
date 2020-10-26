//
//  DrawCanvas.swift
//  slides
//
//  Created by Dmitrii Voronin on 25.10.2020.
//

import Foundation
import Cocoa

class DrawCanvas: Canvas {
    private var view = NSView()
    private var fillColor: NSColor = .white
    private var lineColor: NSColor = .black
    private var lineThikness: Double = 1

    func drawLine(start: PointD, end: PointD) {
        let line = Line(start: start, end: end, frame: CGRect(x: 0, y: 0, width: 1500, height: 1000), color: lineColor, thikness: CGFloat(lineThikness))
        view.addSubview(line)
    }
    
    init(view: NSView) {
        self.view = view
        view.setFrameOrigin(NSPoint(x: 0, y: 0))
        view.setFrameSize(NSSize(width: 2500, height: 2000))
    }
    
    func drawElipse(left: PointD, width: Double, height: Double) {
        let oval = Oval(center: left, width: width, height: height, lineColor: lineColor, frame: CGRect(x: 0, y: 0, width: 1500, height: 1000), thikness: CGFloat(lineThikness))
        view.addSubview(oval)
    }
    
    func fillElipse(left: PointD, width: Double, height: Double) {
        let oval = FillOval(center: left, width: width, height: height, fillColor: fillColor, frame: CGRect(x: 0, y: 0, width: 1500, height: 1000))
        view.addSubview(oval)
    }
    
    func fillPolygon(vertices: [PointD]) {
        let polygon = Polygon(vertexes: vertices, frame: CGRect(x: 0, y: 0, width: 1500, height: 1000), fillColor: fillColor)
        view.addSubview(polygon)
    }
    
    func setFillColor(color: RGBAColor) {
        self.fillColor = createColor(color)
    }
    
    func setLineColor(color: RGBAColor) {
        self.lineColor = createColor(color)
    }
    
    func setLineThikness(thikness: Double) {
        self.lineThikness = thikness
    }
    
}

class Oval: NSView {
    private let oval: NSBezierPath
    private let lineColor: NSColor
    private let thikness: CGFloat
    
    init(center: PointD, width: Double, height: Double, lineColor: NSColor, frame: CGRect, thikness: CGFloat) {
        self.oval = NSBezierPath(ovalIn: NSRect(x: center.x, y: center.y, width: width, height: height))
        self.lineColor = lineColor
        self.thikness = thikness
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        oval.lineWidth = thikness
        lineColor.set()
        oval.stroke()
    }
}

class FillOval: NSView {
    private let oval: NSBezierPath
    private let fillColor: NSColor
    
    init(center: PointD, width: Double, height: Double, fillColor: NSColor, frame: CGRect) {
        self.oval = NSBezierPath(ovalIn: NSRect(x: center.x, y: center.y, width: width, height: height))
        self.fillColor = fillColor
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        fillColor.setFill()
        oval.fill()
    }
}

class Line: NSView {
    let figure = NSBezierPath()
    private let start: PointD
    private let end: PointD
    private let color: NSColor
    private let thikness: CGFloat
    
    init(start: PointD, end: PointD, frame: CGRect, color: NSColor, thikness: CGFloat) {
        self.end = end
        self.start = start
        self.color = color
        self.thikness = thikness
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        
        figure.move(to: NSPoint(x: start.x, y: start.y))
        figure.line(to: NSPoint(x: end.x, y: end.y))
        figure.lineWidth = thikness
        color.set()
        figure.stroke()
    }
}

class Polygon: NSView {
    let polygon = NSBezierPath()
    private let vertexes: [PointD]
    private let color: NSColor
    
    init(vertexes: [PointD], frame: CGRect, fillColor: NSColor) {
        self.vertexes = vertexes
        self.color = fillColor
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        
        var prevVertex = vertexes[0]
        polygon.move(to: CGPoint(x: prevVertex.x, y: prevVertex.y))
        for i in 1...vertexes.count - 1{
            let currentVertex = vertexes[i]
            polygon.line(to: CGPoint(x: currentVertex.x, y: currentVertex.y))
            prevVertex = currentVertex
        }
        polygon.line(to: CGPoint(x: vertexes[0].x, y: vertexes[0].y))
        polygon.windingRule = .evenOdd
        color.setFill()
        polygon.fill()
    }
    
}

fileprivate func createColor(_ hex: RGBAColor) -> NSColor {
    let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
    let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
    let blue = CGFloat((hex & 0xFF)) / 255.0
    return NSColor(red: red, green: green, blue: blue, alpha: 1)
}

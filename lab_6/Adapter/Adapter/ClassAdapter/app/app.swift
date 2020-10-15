//
//  app.swift
//  Adapter
//
//  Created by Dmitrii Voronin on 14.10.2020.
//

import Foundation

func paintPicture(painter: CanvasPainter) throws {
    let vertex1 = Point(x: 0, y: 0)
    let vertex2 = Point(x: 100, y: 100)
    let vertex3 = Point(x: 100, y: 0)
    let triangle = Triangle(vertex1: vertex1, vertex2: vertex2, vertex3: vertex3)
    
    let leftTop = Point(x: 140, y: 140)
    let rectangle = Retctangle(leftTop: leftTop, width: 100, hieght: 100)
    
    try painter.draw(drawable: triangle)
    try painter.draw(drawable: rectangle)
}

func paintPicturOnCanvas() throws {
    let simpleCanvas = CanvasImpl()
    let painter = CanvasPainter(canvas: simpleCanvas)
    try paintPicture(painter: painter)
}

func paintPictureOnModernGraphicsRenderer() throws {
    let modernCanvasRenderer = ModernGraphicsRenderer()
    let modernCanvasAdapter = ModernCanvasAdapter(modernCanvasRenderer: modernCanvasRenderer)
    let painter = CanvasPainter(canvas: modernCanvasAdapter)
    
    try modernCanvasAdapter.drawBegin()
    try paintPicture(painter: painter)
    try modernCanvasAdapter.drawEnd()
}

class ModernCanvasAdapter: Canvas {
    private var start = Point(x: 0, y: 0)
    private let modernCanvasRenderer: ModernGraphicsRenderer
    
    init(modernCanvasRenderer: ModernGraphicsRenderer) { // передевать поток
        self.modernCanvasRenderer = modernCanvasRenderer
    }
    
    func moveTo(x: Double, y: Double) {
        start = Point(x: x, y: y)
    }
    
    func lineTo(x: Double, y: Double) throws {
        let end = Point(x: x, y: y)
        try drawLine(end: end)
    }
    
    func drawBegin() throws  {
        try modernCanvasRenderer.beginDraw()
    }
    
    func drawEnd() throws {
        try modernCanvasRenderer.endDraw()
    }
    
    private func drawLine(end: Point) throws {
        try modernCanvasRenderer.drawLine(start: start, end: end)
    }
    
}

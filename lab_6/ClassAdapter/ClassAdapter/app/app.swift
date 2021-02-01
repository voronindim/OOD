//
//  app.swift
//  Adapter
//
//  Created by Dmitrii Voronin on 14.10.2020.
//

import Foundation

func paintPicture(painter: CanvasPainter) {
    let vertex1 = Point(x: 0, y: 0)
    let vertex2 = Point(x: 100, y: 100)
    let vertex3 = Point(x: 100, y: 0)
    let triangle = Triangle(vertex1: vertex1, vertex2: vertex2, vertex3: vertex3)
    
    let leftTop = Point(x: 140, y: 140)
    let rectangle = Retctangle(leftTop: leftTop, width: 100, hieght: 100)
    
    painter.draw(drawable: triangle)
    painter.draw(drawable: rectangle)
}

func paintPicturOnCanvas(stream: Stream) {
    let simpleCanvas = CanvasImpl(stream: stream)
    let painter = CanvasPainter(canvas: simpleCanvas)
    paintPicture(painter: painter)
}

func paintPictureOnModernGraphicsRenderer(stream: Stream) {
    let modernCanvasRenderer = ModernGraphicsRenderer(stream: stream)
    let modernCanvasAdapter = ModernCanvasAdapter(modernCanvasRenderer: modernCanvasRenderer, color: CRGBAColor(0, 0, 0, 1))
    let painter = CanvasPainter(canvas: modernCanvasAdapter)
    
    do {
        try modernCanvasRenderer.beginDraw()
    } catch {
        stream.write(string: "Возникла ошибка в BeginDraw")
    }
    paintPicture(painter: painter)
    do {
        try modernCanvasRenderer.endDraw()
    } catch {
        stream.write(string: "Возникла ошибка в EndBegin")
    }
    
    
}

class ModernCanvasAdapter: Canvas {
    private var start = Point(x: 0, y: 0)
    private let modernCanvasRenderer: ModernGraphicsRenderer
    private var color: CRGBAColor
    
    init(modernCanvasRenderer: ModernGraphicsRenderer, color: CRGBAColor = CRGBAColor(0, 0, 0, 1)) {
        self.modernCanvasRenderer = modernCanvasRenderer
        self.color = color
    }
    
    func moveTo(x: Double, y: Double) {
        start = Point(x: x, y: y)
    }
    
    func lineTo(x: Double, y: Double) {
        let end = Point(x: x, y: y)
        do {
            try modernCanvasRenderer.drawLine(start: start, end: end, color: color)
        }catch {
            
        }
        
    }
    
    func setColor(_ color: UInt32) {
        let red = Float(((color / 256) / 256) % 256) / 255.0
        let green = Float((color / 256) % 256) / 255.0
        let blue = Float(color % 256) / 255.0
        let appacity: Float = 1.0
        
        self.color = CRGBAColor(red, green, blue, appacity)
    }
    
}

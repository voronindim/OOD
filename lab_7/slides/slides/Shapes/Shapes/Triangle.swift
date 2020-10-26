//
//  Triangle.swift
//  slides
//
//  Created by Dmitrii Voronin on 24.10.2020.
//

import Foundation

class Triangle: SimpleShape {
    var frame: RectD? {
        let minX = min(vertex1.x, vertex2.x, vertex3.x)
        let minY = min(vertex1.y, vertex2.y, vertex3.y)
        
        let maxX = max(vertex1.x, vertex2.x, vertex3.x)
        let maxY = max(vertex1.y, vertex2.y, vertex3.y)
        
        return RectD(left: minX, top: minY, width: maxX - minX, height: maxY - minY)
    }
    var outlineStyle: OutlineStyle?
    var fillStyle: Style?
        
    private var vertex1: PointD
    private var vertex2: PointD
    private var vertex3: PointD
    
    init(vertex1: PointD, vertex2: PointD, vertex3: PointD) {
        self.vertex1 = vertex1
        self.vertex2 = vertex2
        self.vertex3 = vertex3
        
        self.outlineStyle = OutlineStyleImpl(color: Colors.black.rawValue, isEnabled: true, thickness: 1)
        self.fillStyle = FillStyle(color: Colors.white.rawValue, isEnabled: true)
    }
    
    func draw(canvas: Canvas) {
        let fillStyle = self.fillStyle
        if fillStyle!.isEnabled! {
            canvas.setFillColor(color: self.fillStyle!.color!)
        }

        let outlineStyle = self.outlineStyle
        if outlineStyle!.isEnabled! {
            canvas.setLineColor(color: outlineStyle!.color!)
            canvas.setLineThikness(thikness: outlineStyle!.thickness!)
        }

        drawBehavior(canvas: canvas)
    }
    
    func setFrame(rect: RectD) {
        let currentFrame = frame!
        
        func getNewValueToVertex(_ vertex: PointD) -> PointD {
            let scaleX = (vertex.x - currentFrame.left) / currentFrame.width
            let scaleY = (vertex.y - currentFrame.top) / currentFrame.height
            
            return PointD(x: rect.left + rect.width * scaleX, y: rect.top + rect.height * scaleY)
        }
        
        vertex1 = getNewValueToVertex(vertex1)
        vertex2 = getNewValueToVertex(vertex2)
        vertex3 = getNewValueToVertex(vertex3)
        
    }
    
    func drawBehavior(canvas: Canvas) {
        if outlineStyle!.isEnabled! {
            canvas.drawLine(start: vertex1, end: vertex2)
            canvas.drawLine(start: vertex2, end: vertex3)
            canvas.drawLine(start: vertex3, end: vertex1)
        }
        
        if fillStyle!.isEnabled! {
            canvas.fillPolygon(vertices: [vertex1, vertex2, vertex3])
        }
    }
    
}

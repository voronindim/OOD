//
//  Triangle.swift
//  slides
//
//  Created by Dmitrii Voronin on 24.10.2020.
//

import Foundation

class Triangle: SimpleShape {
    var frame: RectD?

    var outlineStile: OutlineStyle
    
    var fillStyle: Style
    
    var tryGroup: ShapeGroup?
        
    private let vertex1: PointD
    private let vertex2: PointD
    private let vertex3: PointD
    
    init(vertex1: PointD, vertex2: PointD, vertex3: PointD) {
        self.vertex1 = vertex1
        self.vertex2 = vertex2
        self.vertex3 = vertex3
    }
    
    func draw(canvas: Canvas) {
        let fillStyle = self.fillStyle
        if fillStyle.isEnabled! {
            canvas.setFillColor(color: self.outlineStile.color!)
        }

        let outlineStyle = self.outlineStile
        if outlineStyle.isEnabled! {
            canvas.setLineColor(color: outlineStyle.color!)
            canvas.setLineThikness(thikness: outlineStyle.thickness!)
        }

        drawBehavior(canvas: canvas)
    }
    
    func setFrame(rect: RectD) {
        // TODO
        
    }
    
    func drawBehavior(canvas: Canvas) {
        if outlineStile.isEnabled! {
            canvas.drawLine(start: vertex1, end: vertex2)
            canvas.drawLine(start: vertex2, end: vertex3)
            canvas.drawLine(start: vertex3, end: vertex1)
        }
        
        if fillStyle.isEnabled! {
            canvas.fillPolygon(vertices: [vertex1, vertex2, vertex3])
        }
    }
    
}

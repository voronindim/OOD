//
//  Rectangle.swift
//  slides
//
//  Created by Dmitrii Voronin on 24.10.2020.
//

import Foundation

class Rectangle: SimpleShape {

    var frame: RectD? {
        let width = abs(rightBottom.x - leftTop.x)
        let height = abs(rightBottom.y - leftTop.y)
        
        return RectD(left: leftTop.x, top: leftTop.y, width: width, height: height)
    }
    
    var outlineStyle: OutlineStyle?
    
    var fillStyle: Style?
    
    var tryGroup: ShapeGroup?
    
    private var leftTop: PointD
    private var rightBottom: PointD
    
    init(leftTop: PointD, rightButtom: PointD) {
        self.leftTop = leftTop
        self.rightBottom = rightButtom
        
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
    
    func drawBehavior(canvas: Canvas) {
        let rightTop = PointD(x: rightBottom.x, y: leftTop.y)
        let leftButtom = PointD(x: leftTop.x, y: rightBottom.y)
        
        if outlineStyle!.isEnabled! {
            canvas.drawLine(start: leftTop, end: leftButtom)
            canvas.drawLine(start: leftButtom, end: rightBottom)
            canvas.drawLine(start: rightBottom, end: rightTop)
            canvas.drawLine(start: rightTop, end: leftTop)
        }
        
        if fillStyle!.isEnabled! {
            canvas.fillPolygon(vertices: [leftTop, leftButtom, rightBottom, rightTop])
        }
    }
    
    func setFrame(rect: RectD) {
        leftTop = PointD(x: rect.left, y: rect.top)
        rightBottom = PointD(x: rect.left + rect.width, y: rect.top + rect.height)
    }
    
}

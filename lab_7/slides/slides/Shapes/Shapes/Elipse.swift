//
//  Elipse.swift
//  slides
//
//  Created by Dmitrii Voronin on 24.10.2020.
//

import Foundation

class Elipse: SimpleShape {
    var frame: RectD? {
        RectD(left: center.x - horizontalRadius, top: center.y - verticalRadius, width: 2 * horizontalRadius, height: 2 * verticalRadius)
    }
    
    var outlineStile: OutlineStyle
    
    var fillStyle: Style
    
    var tryGroup: ShapeGroup?
    
    private var center: PointD
    private var horizontalRadius: Double
    private var verticalRadius: Double
    
    init(center: PointD, horizontalRadius: Double, verticalRadius: Double) {
        self.center = center
        self.horizontalRadius = horizontalRadius
        self.verticalRadius = verticalRadius
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
        center = PointD(x: rect.left + rect.width / 2, y: rect.top + rect.height / 2)
        horizontalRadius = rect.width / 2
        verticalRadius = rect.height / 2
    }
    
    func drawBehavior(canvas: Canvas) {
        let leftTop = PointD(x: center.x - horizontalRadius, y: center.y - verticalRadius)
        let width = 2 * horizontalRadius
        let height = 2 * verticalRadius
        
        canvas.drawElipse(left: leftTop, width: width, height: height)
    }
    
    
}

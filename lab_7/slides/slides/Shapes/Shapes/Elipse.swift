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
    
    var outlineStyle: OutlineStyle?
    
    var fillStyle: Style?
    
    private var center: PointD
    private var horizontalRadius: Double
    private var verticalRadius: Double
    
    init(center: PointD, horizontalRadius: Double, verticalRadius: Double) {
        self.center = center
        self.horizontalRadius = horizontalRadius
        self.verticalRadius = verticalRadius
        
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
        center = PointD(x: rect.left + rect.width / 2, y: rect.top + rect.height / 2)
        horizontalRadius = rect.width / 2
        verticalRadius = rect.height / 2
    }
    
    func drawBehavior(canvas: Canvas) {
        let leftTop = PointD(x: center.x - horizontalRadius, y: center.y - verticalRadius)
        let width = 2 * horizontalRadius
        let height = 2 * verticalRadius
        
        if outlineStyle!.isEnabled! {
            canvas.drawElipse(left: leftTop, width: width, height: height)
        }
        
        if fillStyle!.isEnabled! {
            canvas.fillElipse(left: leftTop, width: width, height: height)
        }
    }
    
}

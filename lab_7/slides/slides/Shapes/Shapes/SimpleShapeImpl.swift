//
//  SimpleShapeImpl.swift
//  slides
//
//  Created by Dmitrii Voronin on 24.10.2020.
//

import Foundation

class SimpleShapeImpl: SimpleShape {
    
    var frame: RectD?
    
    var outlineStile: OutlineStyle
    
    var fillStyle: Style
    
    var tryGroup: ShapeGroup?
    
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
    
    func drawBehavior(canvas: Canvas) {
        <#code#>
    }
    
    func setFrame(rect: RectD) {
        <#code#>
    }
    
}

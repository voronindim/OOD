//
//  SingleShape.swift
//  slides
//
//  Created by Dmitrii Voronin on 24.10.2020.
//

import Foundation

protocol SimpleShape: Shape {
    func drawBehavior(canvas: Canvas)
}




//    var outlineStile: OutlineStyle
//
//    var fillStyle: Style
//
//    var tryGroup: ShapeGroup?
//
//    var frame: RectD?
//
//    init() {
//        fillStyle = FillStyle(color: Colors.white.rawValue, isEnabled: true)
//        outlineStile = OutlineStyleImpl(color: Colors.black.rawValue, isEnabled: true, thickness: 1)
//    }
//
//    func setFrame(rect: RectD) {
//        fatalError("Метод вызван у simpleShape.ERROR")
//    }
//
//    func draw(canvas: Canvas) {
//        let fillStyle = self.fillStyle
//        if fillStyle.isEnabled! {
//            canvas.setFillColor(color: self.outlineStile.color!)
//        }
//
//        let outlineStyle = self.outlineStile
//        if outlineStyle.isEnabled! {
//            canvas.setLineColor(color: outlineStyle.color!)
//            canvas.setLineThikness(thikness: outlineStyle.thickness!)
//        }
//
//        drawBehavior(canvas: canvas)
//    }
//
//    func drawBehavior(canvas: Canvas) {
//        fatalError("Метод вызван у simpleShape.ERROR")
//    }
    


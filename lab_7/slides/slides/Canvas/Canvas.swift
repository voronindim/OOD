//
//  Canvas.swift
//  slides
//
//  Created by Dmitrii Voronin on 23.10.2020.
//

import Foundation

protocol Canvas {
    func drawLine(start: PointD, end: PointD)
    func drawElipse(left: PointD, width: Double, height: Double)
    func fillPolygon(vertices: [PointD])
    
    func setFillColor(color: RGBAColor)
    func setLineColor(color: RGBAColor)
    func setLineThikness(thikness: Double)
}

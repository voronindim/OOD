//
//  Rectangle.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 02.11.2020.
//

import Foundation

class Rectangle: SimpleShape {
    
    // MARK: Public Properties
    
    var fillColor: RGBAColor
    var lineColor: RGBAColor
    var frame: RectD
    
    // MARK: Private Properties
    
    private var leftTop: PointD
    private var width: Double
    private var height: Double
    
    init(leftTop: PointD, width: Double, height: Double, fillColor: RGBAColor, lineColor: RGBAColor) {
        self.leftTop = leftTop
        self.width = width
        self.height = height
        self.fillColor = fillColor
        self.lineColor = lineColor
        self.frame = RectD(left: 100, top: 100, width: 50, height: 50)
    }
    
    func setFrame(rect: RectD) {
        
    }
    
    func draw() {
        
    }
    
    
    
}

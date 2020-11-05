//
//  Ellipse.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 02.11.2020.
//

import Foundation

class EllipseShape: MyShape {
    
    // MARK: Public Properties
    
    var fillColor: RGBAColor
    var lineColor: RGBAColor
    var frame: RectD
    
    // MARK: Private Properties
    
    private var center: PointD
    private var verticalRadius: Double
    private var horizontalRadius: Double
    
    init(center: PointD, verticalRadius: Double, horizontalRadius: Double, fillColor: RGBAColor = RGBAColors.red.rawValue, lineColor: RGBAColor = RGBAColors.black.rawValue) {
        self.center = center
        self.verticalRadius = verticalRadius
        self.horizontalRadius = horizontalRadius
        self.fillColor = fillColor
        self.lineColor = lineColor
        self.frame = RectD(left: 100, top: 100, width: 50, height: 50)
    }
    
    func setFrame(rect: RectD) {
        
    }
    
    func draw() {
        
    }
    
    
}

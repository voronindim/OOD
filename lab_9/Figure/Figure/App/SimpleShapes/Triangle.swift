//
//  Triangle.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 02.11.2020.
//

import Foundation

class Traingle: SimpleShape {
    
    // MARK: Public Properties
    
    var fillColor: RGBAColor
    var lineColor: RGBAColor
    var frame: RectD
    
    // MARK: Private Properties
    
    private var vertex1: PointD
    private var vertex2: PointD
    private var vertex3: PointD
    
    init(vertex1: PointD, vertex2: PointD, vertex3: PointD, fillColor: RGBAColor, lineColor: RGBAColor) {
        self.vertex1 = vertex1
        self.vertex2 = vertex2
        self.vertex3 = vertex3
        self.fillColor = fillColor
        self.lineColor = lineColor
        self.frame = RectD(left: 100, top: 100, width: 50, height: 50)
    }
    
    func setFrame(rect: RectD) {
        
    }
    
    func draw() {
        
    }
    
}

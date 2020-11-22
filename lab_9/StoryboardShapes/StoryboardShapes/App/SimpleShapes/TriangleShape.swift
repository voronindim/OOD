//
//  Triangle.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 02.11.2020.
//

import Foundation

class TraingleShape: MyShape {
    
    // MARK: Public Properties
    
    var fillColor: RGBAColor
    var lineColor: RGBAColor
    var frame: RectD
    
    // MARK: Private Properties
    
    private var vertex1: PointD
    private var vertex2: PointD
    private var vertex3: PointD
    
    public init(vertex1: PointD, vertex2: PointD, vertex3: PointD, fillColor: RGBAColor = RGBAColors.red.rawValue, lineColor: RGBAColor = RGBAColors.black.rawValue) {
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

//
//  Canvas.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 02.11.2020.
//

import Foundation


protocol Canvas {
    func createEllipse(left: PointD, width: Double, height: Double)
    func createRectangle(leftTop: PointD, width: Double, height: Double)
    func creareTriangle(vertex1: PointD, vertex2: PointD, vertex3: PointD)
    
    func resize()
}


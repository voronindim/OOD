//
//  Elipse.swift
//  ShapeFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Elipse: Shape {
    private let center: Point
    private let horizontalRadius: Double
    private let verticalRadius: Double
    
    init(color: Color, center: Point, horizontalRadius: Double, verticalRadius: Double) {
        self.center = center
        self.horizontalRadius = horizontalRadius
        self.verticalRadius = verticalRadius
        super.init()
        
        self.color = color
    }
    
    override func draw(_ canvas: ICanvas) {
        canvas.setColor(color: color)
        canvas.drawElipse(center: center, horRadius: horizontalRadius, verRadius: verticalRadius)
    }
}

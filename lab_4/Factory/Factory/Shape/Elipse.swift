//
//  Elipse.swift
//  Factory
//
//  Created by Dmitrii Voronin on 26.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Elipse: Shape {
    let center: Point
    let horizontalRadius: Double
    let verticalRadius: Double
    
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

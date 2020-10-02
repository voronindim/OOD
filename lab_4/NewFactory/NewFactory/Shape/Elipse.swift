//
//  Elipse.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 02.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Elipse: Shape {
    private let center: Point
    private let horizontalRadius: Double
    private let verticalRadius: Double
    
    init(color: Color, center: Point, horRadius: Double, verRadius: Double) {
        self.center = center
        self.horizontalRadius = horRadius
        self.verticalRadius = verRadius
        
        super.init()
        self.color = color
    }
    
    override func draw(canvas: ICanvas) throws {
        canvas.setColor(color: color)
        canvas.drawElipse(center: center, horRedius: horizontalRadius, verRadius: verticalRadius)
    }
}

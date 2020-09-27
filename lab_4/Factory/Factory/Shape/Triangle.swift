//
//  Triangle.swift
//  Factory
//
//  Created by Dmitrii Voronin on 26.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Triangle: Shape {
    let vertex1: Point
    let vertex2: Point
    let vertex3: Point
    
    init(color: Color, vertex1: Point, vertex2: Point, vertex3: Point) {
        self.vertex1 = vertex1
        self.vertex2 = vertex2
        self.vertex3 = vertex3
        
        super.init()
        self.color = color
    }
    
    override func draw(_ canvas: ICanvas) {
        canvas.setColor(color: color)
        
        canvas.drawLine(from: vertex1, to: vertex2)
        canvas.drawLine(from: vertex2, to: vertex3)
        canvas.drawLine(from: vertex3, to: vertex1)
    }
}

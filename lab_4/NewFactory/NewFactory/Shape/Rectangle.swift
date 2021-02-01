//
//  Rectangle.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 02.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Rectangle: Shape {
    let leftTop: Point
    let rightBottom: Point
    
    let leftBottom: Point
    let rightTop: Point
    
    init(color: Color, leftTop: Point, rightBottom: Point) {
        self.leftTop = leftTop
        self.rightBottom = rightBottom
        self.leftBottom = Point(x: leftTop.x, y: rightBottom.y)
        self.rightTop = Point(x: rightBottom.x, y: leftTop.y)
        
        super.init()
        self.color = color
    }
    
    override func draw(canvas: ICanvas) {
        canvas.setColor(color: color)
        
        canvas.drawLine(leftTop, leftBottom)
        canvas.drawLine(leftBottom, rightBottom)
        canvas.drawLine(rightBottom, rightTop)
        canvas.drawLine(rightTop, leftTop)
    }
}

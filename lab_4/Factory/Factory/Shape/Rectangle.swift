//
//  Rectangle.swift
//  Factory
//
//  Created by Dmitrii Voronin on 26.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Rectangle: Shape {
    var leftTopPoint: Point
    var rightBottomPoint: Point
    
    init(color: Color, leftTopPoint: Point, rightBottomPoint: Point) {
        self.leftTopPoint = leftTopPoint
        self.rightBottomPoint = rightBottomPoint
        
        super.init()
        self.color = color 
        
    }
    override func draw(_ canvas: ICanvas) {
        let width = rightBottomPoint.x - leftTopPoint.x
        let hieght = leftTopPoint.y - rightBottomPoint.y
        guard width >= 0 && hieght >= 0 else {
            fatalError("Нижняя граница выше чем верхняя! Error")
        }
        
        let rightTopPoint = Point(x: leftTopPoint.x + width, y: leftTopPoint.y)
        let leftBottomPoint = Point(x: leftTopPoint.x, y: leftTopPoint.y - hieght)
        
        canvas.setColor(color: color)
        canvas.drawLine(from: leftTopPoint, to: rightTopPoint)
        canvas.drawLine(from: leftTopPoint, to: leftBottomPoint)
        canvas.drawLine(from: leftBottomPoint, to: rightBottomPoint)
        canvas.drawLine(from: rightBottomPoint, to: rightTopPoint)
        
    }
}


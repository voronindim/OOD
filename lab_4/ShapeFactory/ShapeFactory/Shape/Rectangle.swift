//
//  Rectangle.swift
//  ShapeFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Rectangle: Shape {
    // TODO: Поля должны быть приватнфыми и немутабельнфми, проверить в другиз классах
    private let leftTop: Point
    private let rightBottom: Point
    
    init(color: Color, leftTopPoint: Point, rightBottomPoint: Point) {
        self.leftTop = leftTopPoint
        self.rightBottom = rightBottomPoint
        
        super.init()
        self.color = color
        
    }
    override func draw(_ canvas: ICanvas) {
        let width = rightBottom.x - leftTop.x
        let hieght = leftTop.y - rightBottom.y
        guard width >= 0 && hieght >= 0 else {
            fatalError("Нижняя граница выше чем верхняя! Error")
        }
        
        let rightTopPoint = Point(x: leftTop.x + width, y: leftTop.y)
        let leftBottomPoint = Point(x: leftTop.x, y: leftTop.y - hieght)
        
        canvas.setColor(color: color)
        canvas.drawLine(from: leftTop, to: rightTopPoint)
        canvas.drawLine(from: leftTop, to: leftBottomPoint)
        canvas.drawLine(from: leftBottomPoint, to: rightBottom)
        canvas.drawLine(from: rightBottom, to: rightTopPoint)
        
    }
}

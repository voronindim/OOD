//
//  Regularpolygon.swift
//  ShapeFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class RegularPolygon: Shape {
    private let vertexCount: Int
    private let center: Point
    private let radius: Double
    
    init(color: Color, center: Point, radius: Double, vertexCount: Int) {
        guard vertexCount > 2 else {
            fatalError("Для правильного многоугольнка стоит задать больше двух вершин")
        }
        self.center = center
        self.radius = radius
        self.vertexCount = vertexCount
        
        super.init()
        self.color = color
    }
    
    override func draw(_ canvas: ICanvas) {
        let arrayOfVertexes = getVertexes()
        
        let lastVertex = arrayOfVertexes[vertexCount - 1]
        let firstertex = arrayOfVertexes[0]

        canvas.setColor(color: color)
        
        canvas.drawLine(from: lastVertex, to: firstertex)
        var i = 0
        while i < vertexCount - 1 {
            canvas.drawLine(from: arrayOfVertexes[i], to: arrayOfVertexes[i + 1])
            i += 1
        }
    }
    
    private func getVertexes() -> [Point] {
        let offsetAngle = 2 * Double.pi / Double(vertexCount)
        var arrayOfVertex: [Point] = []
        
        var i = 0
        while i < vertexCount {
            let x = center.x + radius * cos(offsetAngle * Double(i))
            let y = center.y + radius * sin(offsetAngle * Double(i))
        
            let newVertex = Point(x: x, y: y)
            arrayOfVertex.append(newVertex)
            i += 1
        }
        
        return arrayOfVertex
    }
}

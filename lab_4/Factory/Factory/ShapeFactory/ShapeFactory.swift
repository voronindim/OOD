//
//  ShapeFactory.swift
//  Factory
//
//  Created by Dmitrii Voronin on 26.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

struct RectangleInfo {
    let color: Color
    let leftTopPoint: Point
    let rightBottomPoint: Point
}

struct TriangleInfo {
    let color: Color
    let vertex1: Point
    let vertex2: Point
    let vertex3: Point
}

struct ElipseInfo {
    let color: Color
    let center: Point
    let horizontalRadius: Double
    let verticalRadius: Double
}

struct RegularPolygonInfo {
    let color: Color
    let vertexCount: Int
    let center: Point
    let radius: Double
}

class ShapeFactory: IShapeFactory {
    
    func createShape(description: String) -> Shape {
        let params = description.components(separatedBy: " ")
        let shapeName = params[0].lowercased()
        let paramsCount = params.count
    
        if shapeName == "rectangle" && paramsCount == 6 {
            return createRectangle(getInfoFromParamsToRectangle(params))
        } else if shapeName == "triangle" && paramsCount == 8 {
            return createTriangle(getInfoPromParamsToTriangle(params))
        } else if shapeName == "elipse" && paramsCount == 6 {
            return createElise(getInfoFromParamsToElipse(params))
        } else if shapeName == "regularpolygon" && paramsCount == 6 {
            return createRegularPolygom(getInfoFromParamsToRegularPoligon(params))
        }
        
        fatalError("Задана неизвестная фигура, или количество параметров для фигуры!")
    }
}

extension ShapeFactory {
    private func createRectangle(_ info: RectangleInfo) -> Rectangle {
        Rectangle(color: info.color, leftTopPoint: info.leftTopPoint, rightBottomPoint: info.rightBottomPoint)
    }
    
    private func createTriangle(_ info: TriangleInfo) -> Triangle {
        Triangle(color: info.color, vertex1: info.vertex1, vertex2: info.vertex2, vertex3: info.vertex3)
    }
    
    private func createElise(_ info: ElipseInfo) -> Elipse {
        Elipse(color: info.color, center: info.center, horizontalRadius: info.horizontalRadius, verticalRadius: info.verticalRadius)
    }
    
    private func createRegularPolygom(_ info: RegularPolygonInfo) -> RegularPolygon {
        RegularPolygon(color: info.color, center: info.center, radius: info.radius, vertexCount: info.vertexCount)
    }
}


fileprivate func getInfoFromParamsToRectangle(_ params: [String]) -> RectangleInfo {
    let color = stringToColor(color: params[1])
    let leftTopPoint = createPoint(x: params[2], y: params[3])
    let rightBottomPoint = createPoint(x: params[4], y: params[5])
    
    return RectangleInfo(color: color,
                         leftTopPoint: leftTopPoint,
                         rightBottomPoint: rightBottomPoint)
}

fileprivate func getInfoPromParamsToTriangle(_ params: [String]) -> TriangleInfo {
    let color = stringToColor(color: params[1])
    let vertex1 = createPoint(x: params[2], y: params[3])
    let vertex2 = createPoint(x: params[4], y: params[5])
    let vertex3 = createPoint(x: params[6], y: params[7])
    
    return TriangleInfo(color: color,
                        vertex1: vertex1,
                        vertex2: vertex2,
                        vertex3: vertex3)
}

fileprivate func getInfoFromParamsToElipse(_ params: [String]) -> ElipseInfo {
    let color = stringToColor(color: params[1])
    let center = createPoint(x: params[2], y: params[3])
    let horRadius = stringToDouble(params[4])
    let verRadius = stringToDouble(params[5])
    
    return ElipseInfo(color: color,
                  center: center,
                  horizontalRadius: horRadius,
                  verticalRadius: verRadius)
}

fileprivate func getInfoFromParamsToRegularPoligon(_ params: [String]) -> RegularPolygonInfo {
    let color = stringToColor(color: params[1])
    let center = createPoint(x: params[2], y: params[3])
    let radius = stringToDouble(params[4])
    let vertexCount = abs(stringToInt(params[5]))
    guard vertexCount > 2 else {
        fatalError("Для создание правильного многоугольника требуется не менее трех вершин!")
    }
    
    return RegularPolygonInfo(color: color,
                              vertexCount: vertexCount,
                              center: center,
                              radius: radius)
}

fileprivate func stringToInt(_ number: String) -> Int {
    guard let result = Int(number) else {
        fatalError("Не удалось преобразовать строку в целое число")
    }
    return result
}

fileprivate func stringToDouble(_ number: String) -> Double {
    guard let result = Double(number) else {
        fatalError("Не удалось преобразовать строку в число")
    }
    return result
}

fileprivate func createPoint(x: String, y: String) -> Point {
    guard let x = Double(x) else {
        fatalError("Не удалось преобразовать строку в число")
    }
    guard let y = Double(y) else {
        fatalError("Не удалось преобразовать строку в число")
    }
    return Point(x: x, y: y)
}

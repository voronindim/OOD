//
//  ShapeFactory.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 02.10.2020.
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
    func createShape(_ description: String) throws -> Shape {
        var params = description.components(separatedBy: " ")
        params.removeAll{ $0 == ""}
        let shapeName = params[0].lowercased()
        
        switch shapeName {
        case "rectangle":
            return createRectangle(try getInfoFromParamsToRectangle(params))
        case "triangle":
            return createTriangle(try getInfoPromParamsToTriangle(params))
        case "elipse":
            return createElipse(try getInfoFromParamsToElipse(params))
        case "regularpolygon":
            return try createRegularPolygon(try getInfoFromParamsToRegularPoligon(params))
        default:
            throw Errors.unknownShape
        }
    }
    
}

extension ShapeFactory {
    private func createRectangle(_ info: RectangleInfo) -> Rectangle {
        Rectangle(color: info.color, leftTop: info.leftTopPoint, rightBottom: info.rightBottomPoint)
    }
    
    private func createTriangle(_ info: TriangleInfo) -> Triangle {
        Triangle(color: info.color, vertex1: info.vertex1, vertex2: info.vertex2, vertex3: info.vertex3)
    }
    
    private func createElipse(_ info: ElipseInfo) -> Elipse {
        Elipse(color: info.color, center: info.center, horRadius: info.horizontalRadius, verRadius: info.verticalRadius)
    }
    
    private func createRegularPolygon(_ info: RegularPolygonInfo) throws  -> RegularPolygon {
        try RegularPolygon(color: info.color, center: info.center, radius: info.radius, vertexCount: info.vertexCount)
    }
}

fileprivate func getInfoFromParamsToRectangle(_ params: [String]) throws -> RectangleInfo {
    guard params.count == 6 else {
        throw Errors.invalidArgument
    }
    
    let color = stringToColor(color: params[1])
    let leftTopPoint = try createPoint(x: params[2], y: params[3])
    let rightBottomPoint = try createPoint(x: params[4], y: params[5])
    
    return RectangleInfo(color: color,
                         leftTopPoint: leftTopPoint,
                         rightBottomPoint: rightBottomPoint)
}

fileprivate func getInfoPromParamsToTriangle(_ params: [String]) throws -> TriangleInfo {
    guard params.count == 8 else {
        throw Errors.invalidArgument
    }
    
    let color = stringToColor(color: params[1])
    let vertex1 = try createPoint(x: params[2], y: params[3])
    let vertex2 = try createPoint(x: params[4], y: params[5])
    let vertex3 = try createPoint(x: params[6], y: params[7])
    
    return TriangleInfo(color: color,
                        vertex1: vertex1,
                        vertex2: vertex2,
                        vertex3: vertex3)
}

fileprivate func getInfoFromParamsToElipse(_ params: [String]) throws -> ElipseInfo {
    guard params.count == 6 else {
        throw Errors.invalidArgument
    }
    
    let color = stringToColor(color: params[1])
    let center = try createPoint(x: params[2], y: params[3])
    let horRadius = try stringToDouble(params[4])
    let verRadius = try stringToDouble(params[5])
    
    return ElipseInfo(color: color,
                  center: center,
                  horizontalRadius: horRadius,
                  verticalRadius: verRadius)
}

fileprivate func getInfoFromParamsToRegularPoligon(_ params: [String]) throws -> RegularPolygonInfo {
    guard params.count == 6 else {
        throw Errors.invalidArgument
    }
    
    let color = stringToColor(color: params[1])
    let center = try createPoint(x: params[2], y: params[3])
    let radius = try stringToDouble(params[4])
    let vertexCount = abs(try stringToInt(params[5]))
    guard vertexCount > 2 else {
        throw Errors.parseError("Количество вершин должно больше двух")
    }
    
    return RegularPolygonInfo(color: color,
                              vertexCount: vertexCount,
                              center: center,
                              radius: radius)
}

fileprivate func stringToInt(_ number: String) throws -> Int {
    guard let result = Int(number) else {
        throw Errors.parseError("Не удалось преобразовать строку в целое число")
    }
    return result
}

fileprivate func stringToDouble(_ number: String) throws -> Double {
    guard let result = Double(number) else {
        throw Errors.parseError("Не удалось преобразовать строку в дробное число")
    }
    return result
}

fileprivate func createPoint(x: String, y: String) throws -> Point {
    guard let x = Double(x) else {
        throw Errors.parseError("Не удалось создать координату X у точки")
    }
    guard let y = Double(y) else {
        throw Errors.parseError("Не удалось создать координату Y у точки")
    }
    return Point(x: x, y: y)
}

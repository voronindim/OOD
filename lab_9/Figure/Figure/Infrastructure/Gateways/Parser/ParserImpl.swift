//
//  ParserImpl.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 31.10.2020.
//

import Foundation
import PromiseKit

class ParserImpl: Parser {
    
    func getListOfShapes(_ data: Data) -> [ShapeInfo]? {
        do {
            let update = try JSONDecoder().decode(ArrayOfShapesJson.self, from: data)
            let arrayOfShapes = try update.arrayOfShapes.compactMap {
                try ShapeInfo(json: $0)
            }
            return arrayOfShapes
        } catch {
            return nil
        }
    }
    
    private func getArrayOfShapes(_ data: Data) throws -> [ShapeInfo] {
        let update = try JSONDecoder().decode(ArrayOfShapesJson.self, from: data)
        let arrayOfShapes = update.arrayOfShapes.compactMap {
            try? ShapeInfo(json: $0)
        }
        return arrayOfShapes
    }
    
}

enum ParseErrors: Error {
    case invalidData
}

fileprivate extension ShapeInfo {
    init(json: ShapeJson) throws {
        guard
            let name = json.shapeName
        else {
            throw ParseErrors.invalidData
        }
        
        switch name {
        case .ellipse:
            guard let ellipseJson = json.ellipse else { throw ParseErrors.invalidData }
            self.init(name: name, ellipse: Ellipse(json: ellipseJson), triangle: nil, rectangle: nil)
        case .triangle:
            guard let triangleJson = json.triangle else { throw ParseErrors.invalidData }
            self.init(name: name, ellipse: nil, triangle: Triangle(json: triangleJson), rectangle: nil)
        case .rectangle:
            guard let rectangleJson = json.rectangle else { throw ParseErrors.invalidData }
            self.init(name: name, ellipse: nil, triangle: nil, rectangle: Rectangle(json: rectangleJson))
        }
    }
}

fileprivate extension ShapeInfo.Ellipse {
    init(json: EllipseJson) {
        self.init(
            center: ShapeInfo.Point(x: json.center.x, y: json.center.y),
            verticalRadius: json.verticalRadius,
            horizontalRadius: json.horizontalRadius
        )
    }
}

fileprivate extension ShapeInfo.Triangle {
    init(json: TriangleJson) {
        self.init(
            vertex1: ShapeInfo.Point(x: json.vertex1.x, y: json.vertex1.y),
            vertex2: ShapeInfo.Point(x: json.vertex2.x, y: json.vertex2.y),
            vertex3: ShapeInfo.Point(x: json.vertex3.x, y: json.vertex3.y)
        )
    }
}

fileprivate extension ShapeInfo.Rectangle {
    init(json: RectangleJson) {
        self.init(
            leftTop: ShapeInfo.Point(x: json.leftTop.x, y: json.leftTop.y),
            width: json.width,
            height: json.height
        )
    }
}

fileprivate struct PointJson: Decodable {
    let x: Double
    let y: Double
}

fileprivate struct EllipseJson: Decodable {
    let center: PointJson
    let verticalRadius: Double
    let horizontalRadius: Double
}

fileprivate struct TriangleJson: Decodable {
    let vertex1: PointJson
    let vertex2: PointJson
    let vertex3: PointJson
}

fileprivate struct RectangleJson: Decodable {
    let leftTop: PointJson
    let width: Double
    let height: Double
}

fileprivate struct ShapeJson: Decodable {
    let name: String
    let ellipse: EllipseJson?
    let triangle: TriangleJson?
    let rectangle: RectangleJson?
    
    var shapeName: ShapeInfo.ShapeName? {
        [
            "triangle": .triangle,
            "rectangle": .rectangle,
            "ellipse": .ellipse
        ][name, default: nil]
    }
    
}

fileprivate struct ArrayOfShapesJson: Decodable {
    let arrayOfShapes: [ShapeJson]
}

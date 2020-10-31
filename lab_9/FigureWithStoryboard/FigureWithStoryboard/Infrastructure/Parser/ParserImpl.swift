//
//  ParserImpl.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 31.10.2020.
//

import Foundation
import PromiseKit

class ParserImpl: Parser {
    func getListOfShapes(_ data: Data) -> Promise<[Shape]> {
        
        firstly {
            let update = JSONDecoder().decode(ArrayOfShapesJson.self, from: data)
        }.done {
            var arrayOfShapes = update.arrayOfShapes.compactMap{
                Shape(json: $0)
            }
            return Promise<[Shape]>.value(arrayOfShapes)
        }.
        
    }
    
}

fileprivate extension Shape {
    init(json: ShapeJson) throws {
        guard
            let name = json.shapeName
        else {
            throw ParseErrors.invalidData
        }
        
        var ellipse: Ellipse? = nil
        var rectangle: Rectangle? = nil
        var triangle: Triangle? = nil
        
        if let ellipseJson = json.ellipse,
           let rectangleJson = json.rectangle,
           let triangleJson = json.triangle
        {
            ellipse = Ellipse(json: ellipseJson)
            rectangle = Rectangle(json: rectangleJson)
            triangle = Triangle(json: triangleJson)
        }
        
        self.init(
            name: name,
            ellipse: ellipse,
            triangle: triangle,
            rectangle: rectangle
        )
    }
}

fileprivate extension Shape.Ellipse {
    init(json: EllipseJson) {
        self.init(
            center: Shape.Point(x: json.center.x, y: json.center.y),
            verticalRadius: json.verticalRadius,
            horizontalRadius: json.horizontalRadius
        )
    }
}

fileprivate extension Shape.Triangle {
    init(json: TriangleJson) {
        self.init(
            vertex1: Shape.Point(x: json.vertex1.x, y: json.vertex1.y),
            vertex2: Shape.Point(x: json.vertex2.x, y: json.vertex2.y),
            vertex3: Shape.Point(x: json.vertex3.x, y: json.vertex3.y)
        )
    }
}

fileprivate extension Shape.Rectangle {
    init(json: RectangleJson) {
        self.init(
            leftTop: Shape.Point(x: json.leftTop.x, y: json.leftTop.y),
            width: json.width,
            height: json.height
        )
    }
}

fileprivate enum ParseErrors: Error {
    case invalidData
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
    
    var shapeName: Shape.ShapeName? {
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

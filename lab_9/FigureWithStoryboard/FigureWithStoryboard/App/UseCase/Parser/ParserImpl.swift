//
//  ParserImpl.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 31.10.2020.
//

import Foundation

class ParserImpl: Parser {
    func getListOfShapes(_ data: Data) -> [Shape] {
        do {
            let update = try JSONDecoder().decode(ArrayOfShapesJson.self, from: data)
        } catch {
            
        }
    }
    
    
    private func getShape() -> Shape {
        
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
    let width: PointJson
    let height: PointJson
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

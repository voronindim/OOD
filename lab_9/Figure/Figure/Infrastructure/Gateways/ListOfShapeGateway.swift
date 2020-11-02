//
//  ListOfShapeGateway.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 02.11.2020.
//

import Foundation
import PromiseKit

enum GatewayError: Error {
    case fileNotFound
    case invalidParse
    case unknownError(Error)
}

protocol ListOfShapeGateway {
    func getListOfShape(filename: String) throws -> [SimpleShape]
}

class ListOfShapeGatewayImpl: ListOfShapeGateway {
    let parser: Parser
    
    init(parser: Parser) {
        self.parser = parser
    }
    
    func getListOfShape(filename: String) throws -> [SimpleShape] {
        guard let fileLocation = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw GatewayError.fileNotFound
        }
        let data = try Data(contentsOf: fileLocation)
        
        guard let shapes = try parser.getListOfShapes(data) else {
            throw GatewayError.invalidParse
        }
        
        let arrayOfSimpleShape = shapes.map { info in
            createShape(info)
        }
        return arrayOfSimpleShape
    }
}

fileprivate func createShape(_ info: Shape) -> SimpleShape {
    switch info.name {
    case .ellipse:
        return createEllipse(info)
    case .rectangle:
        return createRectangle(info)
    case .triangle:
        return createTriangle(info)
    }
}

fileprivate func createEllipse(_ info: Shape) -> Ellipse {
    try Ellipse(info)
}

fileprivate func createRectangle(_ info: Shape) -> Rectangle {
    try Rectangle(info)
}

fileprivate func createTriangle(_ info: Shape) -> Traingle {
    try Traingle(info)
}

fileprivate enum CreateShapeError: Error {
    case propertiesNotFound
}

fileprivate extension Ellipse {
    convenience init(_ info: Shape) throws  {
        guard
            let center = info.ellipse?.center,
            let verticalRadius = info.ellipse?.verticalRadius,
            let horizontalRadius = info.ellipse?.horizontalRadius
        else {
            throw CreateShapeError.propertiesNotFound
        }
        
        // TODO:: self.init() {}
        
    }
}

fileprivate extension Rectangle {
    convenience init(_ info: Shape) throws {
        guard
            let leftTop = info.rectangle?.leftTop,
            let width = info.rectangle?.width,
            let height = info.rectangle?.height
        else {
            throw CreateShapeError.propertiesNotFound
        }
        
        // TODO:: self.init() {}
        
    }
}

fileprivate extension Traingle {
    convenience init(_ info: Shape) throws {
        guard
            let vertex1 = info.triangle?.vertex1,
            let vertex2 = info.triangle?.vertex2,
            let vertex3 = info.triangle?.vertex3
        else {
            throw CreateShapeError.propertiesNotFound
        }
//         TODO:: self.init() {}
    
    }
}


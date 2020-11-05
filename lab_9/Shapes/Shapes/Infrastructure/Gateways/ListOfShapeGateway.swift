//
//  ListOfShapeGateway.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 02.11.2020.
//

import Foundation

protocol ListOfShapeGateway {
    func getListOfShape(filename: String) throws -> [MyShape]
}

enum GatewayError: Error {
    case fileNotFound
    case invalidParse
    case unknownError(Error)
}

class ListOfShapeGatewayImpl: ListOfShapeGateway {
    let parser: GatewayParser
    
    init(parser: GatewayParser) {
        self.parser = parser
    }
    
    func getListOfShape(filename: String) throws -> [MyShape] {
        guard let fileLocation = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw GatewayError.fileNotFound
        }
        let data = try Data(contentsOf: fileLocation)
        
        guard let shapes = parser.getListOfShapes(data) else {
            throw GatewayError.invalidParse
        }
        
        let arrayOfSimpleShape = shapes.compactMap { info in
            createShape(info)
        }
        return arrayOfSimpleShape
    }
}

fileprivate func createShape(_ info: ShapeInfo) -> MyShape? {
    switch info.name {
    case .ellipse:
        return try? EllipseShape(info)
    case .rectangle:
        return try? RectangleShape(info)
    case .triangle:
        return try? TraingleShape(info)
    }
}

fileprivate enum CreateShapeError: Error {
    case propertiesNotFound
}

fileprivate extension EllipseShape {
    convenience init(_ info: ShapeInfo) throws  {
        guard
            let center = info.ellipse?.center,
            let verticalRadius = info.ellipse?.verticalRadius,
            let horizontalRadius = info.ellipse?.horizontalRadius
        else {
            throw CreateShapeError.propertiesNotFound
        }
        
        self.init(
            center: PointD(x: center.x, y: center.y),
            verticalRadius: verticalRadius,
            horizontalRadius: horizontalRadius
        )
    }
}

fileprivate extension RectangleShape {
    convenience init(_ info: ShapeInfo) throws {
        guard
            let leftTop = info.rectangle?.leftTop,
            let width = info.rectangle?.width,
            let height = info.rectangle?.height
        else {
            throw CreateShapeError.propertiesNotFound
        }
        
        self.init(
            leftTop: PointD(x: leftTop.x, y: leftTop.y),
            width: width,
            height: height
        )
    }
}

fileprivate extension TraingleShape {
    convenience init(_ info: ShapeInfo) throws {
        guard
            let vertex1 = info.triangle?.vertex1,
            let vertex2 = info.triangle?.vertex2,
            let vertex3 = info.triangle?.vertex3
        else {
            throw CreateShapeError.propertiesNotFound
        }
        
        self.init(
            vertex1: PointD(x: vertex1.x, y: vertex1.y),
            vertex2: PointD(x: vertex2.x, y: vertex2.y),
            vertex3: PointD(x: vertex3.x, y: vertex3.y)
        )
        
    }
}


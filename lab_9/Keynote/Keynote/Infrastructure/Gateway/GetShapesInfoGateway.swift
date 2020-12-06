//
//  ListOfShapeGateway.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 02.11.2020.
//

import Foundation

protocol GetShapesInfoGateway {
    func getListOfShapes(data: Data) throws -> [Shape]
//    func getDataFromFile(filename: String) throws -> [Shape]
//    func save(filename: String, data: Data)
}

enum GatewayError: Error {
    case fileNotFound
    case invalidParse
    case unknownError(Error)
}

class GetShapesInfoGatewayImpl: GetShapesInfoGateway {
    let parser: GatewayParser
    
    init(parser: GatewayParser) {
        self.parser = parser
    }
    
    func getListOfShapes(data: Data) throws  -> [Shape] {
        guard let shapes = parser.getListOfShapes(data) else {
            throw GatewayError.invalidParse
        }
        
        let arrayOfShapeData = shapes.compactMap { info in
            setParams(info)
        }
        return arrayOfShapeData
    }
    
//    func getDataFromFile(filename: String) throws -> [Shape] {
//        guard let fileLocation = Bundle.main.url(forResource: filename, withExtension: "json") else {
//            throw GatewayError.fileNotFound
//        }
//        let data = try Data(contentsOf: fileLocation)
//
//        guard let shapes = parser.getListOfShapes(data) else {
//            throw GatewayError.invalidParse
//        }
//
//        let arrayOfShapeData = shapes.compactMap { info in
//            setParams(info)
//        }
//        return arrayOfShapeData
//    }
    
//    func save(filename: String, data: Data) {
//        do {
//            let filePath = try FileManager.default
//                .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
//                .appendingPathComponent("\(filename).json")
//            print(filePath)
//            try JSONEncoder().encode(data)
//                .write(to: filePath)
//        } catch {
//            print(error)
//        }
//    }
    
}

fileprivate func setParams(_ info: ShapeInfo) -> Shape? {
    switch info.name {
    case .ellipse:
        guard let ellipseInfo = try? EllipseInfo(info) else { return nil }
        return .Ellipse(ellipseInfo)
    case .rectangle:
        guard let rectangleInfo = try? RectangleInfo(info) else { return nil }
        return .Rectangle(rectangleInfo)
    case .triangle:
        guard let triangleInfo = try? TriangleInfo(info) else { return nil }
        return .Traingle(triangleInfo)
    }
}

fileprivate extension TriangleInfo {
    init(_ info: ShapeInfo) throws {
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

fileprivate extension EllipseInfo {
    init(_ info: ShapeInfo) throws {
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

fileprivate extension RectangleInfo {
    init(_ info: ShapeInfo) throws {
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

fileprivate enum CreateShapeError: Error {
    case propertiesNotFound
}


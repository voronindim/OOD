//
//  ViewModelImpl.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 04.12.2020.
//

import Foundation
import UIKit

class ViewModelImpl: ViewModel {
    
    private var filename: String?
    private let fileSystem = WorkFileSystem()
    private let gateway = GetShapesInfoGatewayImpl(parser: ParseImpl())
    private var shapes: [Shape] = []
    
    func saveAs(filename: String) {
        self.filename = filename
        DispatchQueue.global().async {
            guard let data = self.createJsonData() else {
                print("Ошибка при формировании json")
                return
            }
            self.fileSystem.createFileInDirectory(filename: filename, data: data)
        }
    }
    
    func save() {
        guard let filename = filename else {
            return
        }
        saveAs(filename: filename)
    }
    
    func openFile(filename: String) {
        guard let data = fileSystem.getDataFromFile(filename: filename) else {
            return
        }
        
        DispatchQueue.global().async {
            guard let shapes = try? self.gateway.getListOfShapes(data: data) else {
                print("Ошибка получения данных из файла")
                return
            }
            self.shapes = shapes
            self.filename = filename
        }
        
    }
    
    func redo() {
        print("REDO")
    }
    
    func undo() {
        print("UNDO")
    }
    
    func getFileNames() -> [String] {
        return self.fileSystem.getFIleNamesInCurrentDirectory() ?? []
    }
    
//    func fooBar(result: @escaping ([String]) -> Void) {
//
//    }
    
    
    // тестовое создание фигур и их сохранение
    private let defaultRect = CGRect(x: 50, y: 50, width: 150, height: 150)
    
    func createTriangle() {
        appendShape(.Traingle(.init(
            vertex1: PointD(x: Double(defaultRect.minX), y: Double(defaultRect.minY)),
            vertex2: PointD(x: Double(defaultRect.midX), y: Double(defaultRect.maxY)),
            vertex3: PointD(x: Double(defaultRect.maxX), y: Double(defaultRect.minY)))
        ))
    }
    
    func createRectangle() {
        appendShape(.Rectangle(.init(
                                leftTop: PointD(x: Double(defaultRect.minX), y: Double(defaultRect.maxY)),
                                width: Double(defaultRect.maxX - defaultRect.minX),
                                height: Double(defaultRect.maxY - defaultRect.minY))
        ))
    }
    
    func createEllipse() {
        appendShape(.Ellipse(.init(
                                center: PointD(x: Double(defaultRect.midX), y: Double(defaultRect.midY)),
                                verticalRadius: Double(defaultRect.maxY - defaultRect.midY),
                                horizontalRadius: Double(defaultRect.maxX - defaultRect.midX))
        ))
    }
    
    //
    
    private func appendShape(_ shape: Shape) {
        shapes.append(shape)
    }
    
    private func createJsonData() -> Data? {
        try? JSONEncoder().encode(createArrayOfShapes())
    }
    
    private func createArrayOfShapes() -> ArrayOfShapes {
        let shapesInfo = shapes.map{
            craeteInfoAboutCurrentShape(shape: $0)
        }
        return .init(arrayOfShapes: shapesInfo)
    }
    
}

fileprivate func craeteInfoAboutCurrentShape(shape: Shape) -> ShapeInfo {
    switch shape {
    case .Ellipse(let info):
        return .init(
            name: .ellipse,
            ellipse: .init(
                center: .init(x: info.center.x, y: info.center.y),
                verticalRadius: info.verticalRadius,
                horizontalRadius: info.horizontalRadius),
            triangle: nil,
            rectangle: nil
        )
    case .Traingle(let info):
        return .init(
            name: .triangle,
            ellipse: nil,
            triangle: .init(
                vertex1: .init(x: info.vertex1.x, y: info.vertex1.y),
                vertex2: .init(x: info.vertex2.x, y: info.vertex2.y),
                vertex3: .init(x: info.vertex3.x, y: info.vertex3.y)),
            rectangle: nil)
    case .Rectangle(let info):
        return .init(
            name: .rectangle,
            ellipse: nil,
            triangle: nil,
            rectangle: .init(
                leftTop: .init(x: info.leftTop.x, y: info.leftTop.y),
                width: info.width,
                height: info.height)
        )
    }
}



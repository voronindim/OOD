//
//  ShapeViewModel.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 18.11.2020.
//

import Foundation
import Combine
import SwiftUI

final class ShapeViewModel: ObservableObject, ViewModel {
    var filename: String?
    
    @Published var shapes: [Shapes]
    
    private let command: Command
    private let gateway: ListOfShapeParamsGateway
    private let workWithFileSystem: WorkWithFileSystem
    private let defaultRect = CGRect(x: 50, y: 50, width: 150, height: 150)
    
    init() {
        self.gateway = ListOfShapeGatewayImpl(parser: ParseImpl())
        self.command = CommandImpl()
        self.workWithFileSystem = WorkWithFileSystem()
        
        // TODO: Вытаскивать из БД последюю сессию
        self.shapes = []
    }

    func removeShape(_ shape: MyShape) {
        command.remove()
    }
    
    func undo() {
        command.undo()
    }
    
    func redo() {
        command.redo()
    }
    
    func saveAs(filename: String) {
        self.filename = filename
        workWithFileSystem.createFileInDirectory(filename: filename, data: createJsonData(arrayOfShapes: createArrayOfShapes())!)
    }
    
    func save() {
        guard let filename = self.filename else {
            return
        }
        saveAs(filename: filename)
    }
    
    func open(filename: String) {
        let str = workWithFileSystem.readFile(filename: self.filename!)
    }
    
    func createTrinagle() {
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
    
    // MARK: Private methods
    
    private func appendShape(_ shape: Shapes) {
        shapes.append(shape)
    }
    
    private func createJsonData(arrayOfShapes: ArrayOfShapes) -> Data? {
        try? JSONEncoder().encode(arrayOfShapes)
    }
    
    private func createArrayOfShapes() -> ArrayOfShapes {
        let shapesInfo = shapes.map{
            craeteInfoAboutCurrentShape(shape: $0)
        }
        return .init(arrayOfShapes: shapesInfo)
    }
        
    private func craeteInfoAboutCurrentShape(shape: Shapes) -> ShapeInfo {
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
    
}

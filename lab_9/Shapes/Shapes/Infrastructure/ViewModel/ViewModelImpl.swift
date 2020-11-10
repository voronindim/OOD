//
//  ViewModelImpl.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 06.11.2020.
//

import Foundation

class ViewModelImpl: ViewModel {
    var shapes: [Shapes] = []
    
    private let gateway: ListOfShapeParamsGateway
    private let command: Command
    
    init() {
        self.gateway = ListOfShapeGatewayImpl(parser: ParseImpl())
        self.command = CommandImpl()
    }
    // MARK: Public methods
    
    func removeShape(_ shape: MyShape) {
        command.remove()
    }
    
    func undo() {
        command.undo()
    }
    
    func redo() {
        command.redo()
    }
    
    func save() {
        
    }
    
    func open(filename: String) {
        guard let shapes = try? gateway.getListOfShapeParams(filename: filename) else {
            return
        }
        self.shapes = shapes
    }
    
    func createTrinagle(vertex1: PointD, vertex2: PointD, vertex3: PointD) {
        appendShape(.Traingle(TriangleInfo(vertex1: vertex1, vertex2: vertex2, vertex3: vertex3)))
    }
    
    func createRectangle(leftTop: PointD, width: Double, height: Double) {
        appendShape(.Rectangle(RectangleInfo(leftTop: leftTop, width: width, height: height)))
    }
    
    func createEllipse(center: PointD, verticalRadius: Double, horizontalRadius: Double) {
        appendShape(.Ellipse(EllipseInfo(center: center, verticalRadius: verticalRadius, horizontalRadius: horizontalRadius)))
    }
    
    // MARK: Private methods
    
    private func appendShape(_ shape: Shapes) {
        shapes.append(shape)
    }
    
}


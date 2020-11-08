//
//  ViewModelImpl.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 06.11.2020.
//

import Foundation

class ViewModelImpl: ViewModel {
    
    var shapes: [MyShape] = []
    
    func removeShape(_ shape: MyShape) {
        
    }
    
    func undo() {
        
    }
    
    func redo() {
        
    }
    
    func save() {
        
    }
    
    func open() {
        
    }
    
    func createTrinagle() {
        appendShape(TraingleShape(vertex1: PointD(x: 150, y: 150), vertex2: PointD(x: 175, y: 175), vertex3: PointD(x: 200, y: 150)))
    }
    
    func createRectangle() {
        appendShape(RectangleShape(leftTop: PointD(x: 150, y: 175), width: 50, height: 25))
    }
    
    func createEllipse() {
        appendShape(EllipseShape(center: PointD(x: 175, y: 175), verticalRadius: 10, horizontalRadius: 10))
    }
    
    private func appendShape(_ shape: MyShape) {
        shapes.append(shape)
    }
    
}

//
//  ViewModel.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 06.11.2020.
//

import Foundation

protocol ViewModel {
    var shapes: [Shapes] { get set }
    
    func removeShape(_ shape: MyShape)
    
    func undo()
    func redo()
    func save()
    func open(filename: String)
    
    func createTrinagle(vertex1: PointD, vertex2: PointD, vertex3: PointD)
    func createRectangle(leftTop: PointD, width: Double, height: Double)
    func createEllipse(center: PointD, verticalRadius: Double, horizontalRadius: Double)
}

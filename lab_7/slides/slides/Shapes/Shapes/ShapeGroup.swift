//
//  ShapeGroup.swift
//  slides
//
//  Created by Dmitrii Voronin on 24.10.2020.
//

import Foundation

protocol ShapeGroup: Shape {
    var shapesCount: Int { get }
    func insertShape(shape: Shape, position: Int) throws 
    func getShapeAtIndex(_ index: Int) -> Shape
    func removeShapeAdIndex(_ index: Int) throws
}

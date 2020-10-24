//
//  Slide.swift
//  slides
//
//  Created by Dmitrii Voronin on 23.10.2020.
//

import Foundation
protocol Slide: Drawable {
    var width: Double { get }
    var height: Double { get }
    var shapesCount: Int { get }
    
    func insertShape(shape: Shape, position: Int) throws 
    func getShapeAtIndex(_ index: Int) -> Shape
    func removeShapeAdIndex(_ index: Int) throws 
}

//
//  SlideImpl.swift
//  slides
//
//  Created by Dmitrii Voronin on 23.10.2020.
//

import Foundation

class SlideImpl: Slide {
    var width: Double
    var height: Double
    var shapesCount: Int {
        shapes.count
    }
    
    private var shapes: [Shape] = []
    
    init(height: Double, width: Double) {
        self.height = height
        self.width = width
    }
    
    func insertShape(shape: Shape, position: Int = Int.max) throws  {
        if position == Int.max {
            shapes.append(shape)
        } else if position > shapesCount {
            throw Errors.outOfRange(outOfRange)
        } else {
            shapes.insert(shape, at: position)
        }
    }
    
    func getShapeAtIndex(_ index: Int) -> Shape {
        shapes[index]
    }
    
    func removeShapeAdIndex(_ index: Int) throws {
        guard index < shapesCount else {
            throw Errors.outOfRange(outOfRange)
        }
        
        shapes.remove(at: index)
    }
    
    func draw(canvas: Canvas) {
        for shape in shapes {
            shape.draw(canvas: canvas)
        }
    }
        
}

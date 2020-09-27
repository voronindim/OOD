//
//  PictureDraft.swift
//  ShapeFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class PictureDraft {
    private var arrayOfShapes: [Shape] = []
    
    var shapeCount: Int {
        return arrayOfShapes.count
    }
    
    func getShape(index: Int) -> Shape {
        arrayOfShapes[index]
    }
    func addShapeToArray(shape: Shape) {
        arrayOfShapes.append(shape)
    }
}

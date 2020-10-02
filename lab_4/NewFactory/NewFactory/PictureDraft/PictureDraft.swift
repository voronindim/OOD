//
//  PictureDraft.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 02.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class PictureDraft {
    private var arrayOfShapes: [Shape] = []
    
    var shapeCount: Int {
        return arrayOfShapes.count
    }
    
    func addShape(_ shape: Shape) {
        arrayOfShapes.append(shape)
    }
    
    func getShape(_ index: Int) throws -> Shape {
        guard index < shapeCount else {
            throw Errors.invalidArgument
        }
        return arrayOfShapes[index]
    }
}

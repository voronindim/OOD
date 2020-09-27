//
//  Designer.swift
//  ShapeFactory
//
//  Created by Dmitrii Voronin on 27.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Designer: IDesigner {
    var pictureDraft = PictureDraft()
    var shapeFactory: IShapeFactory
    
    init(shapeFactory: IShapeFactory) {
        self.shapeFactory = shapeFactory
    }
    
    func createDraft(_ description: [String]) -> PictureDraft {
        for item in  description {
            pictureDraft.addShapeToArray(shape: shapeFactory.createShape(description: item))
        }
        
        return pictureDraft
    }
}

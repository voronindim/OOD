//
//  Designer.swift
//  ShapeFactory
//
//  Created by Dmitrii Voronin on 27.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Designer: IDesigner {
    private var pictureDraft = PictureDraft()
    private var shapeFactory: IShapeFactory
    
    init(shapeFactory: IShapeFactory) {
        self.shapeFactory = shapeFactory
    }
    
    func createDraft(_ description: [String]) throws -> PictureDraft {
        for item in  description {
            guard let shape = try? shapeFactory.createShape(description: item) else {
                throw ListOfErrors.unknownError
            }
            pictureDraft.addShapeToArray(shape: shape)
        }
        
        return pictureDraft
    }
}

//
//  Designer.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 02.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Designer: IDesigner {
    private let pictureDraft = PictureDraft()
    private let shapeFactory: IShapeFactory
    
    init(shapeFactory: IShapeFactory) {
        self.shapeFactory = shapeFactory
    }
    
    func createDraft(_ descriptions: [String]) throws -> PictureDraft {
        for item in descriptions {
            guard let shape = try? shapeFactory.createShape(item) else {
                throw Errors.parseError
            }
            pictureDraft.addShape(shape)
        }
        return pictureDraft
    }
    
}

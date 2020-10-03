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
    
    func createDraft() -> PictureDraft {
        var command = readLine()?.lowercased()
        
        while command != "exit" {
            do {
                let shape = try shapeFactory.createShape(command ?? "")
                pictureDraft.addShape(shape)
            } catch {
                print(error)
            }
            command = readLine()?.lowercased()
        }
        
        return pictureDraft
    }
    
}

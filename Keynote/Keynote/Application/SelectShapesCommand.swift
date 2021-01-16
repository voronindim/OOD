//
//  SelectShapesCommand.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 05.01.2021.
//

import Foundation

class SelectShapesCommand {
    private let shapes: [Shape]
    
    init(shapes: [Shape]) {
        self.shapes = shapes
    }
}

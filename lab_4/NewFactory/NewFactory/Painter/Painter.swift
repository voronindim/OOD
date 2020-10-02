//
//  Painter.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Painter {
    func drawPicture(draft: PictureDraft, canvas: ICanvas) throws -> Void {
        let count = draft.shapeCount
        var i = 0
        while i < count {
            let shape = try draft.getShape(i)
            try shape.draw(canvas: canvas)
            i += 1
        }
    }
}

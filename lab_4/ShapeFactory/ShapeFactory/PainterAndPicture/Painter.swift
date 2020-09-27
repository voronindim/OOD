//
//  Painter.swift
//  ShapeFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Painter {
    func drawPicture(draft: PictureDraft, canvas: ICanvas) {
        let count = draft.shapeCount
        var i = 0
        while i < count {
            let shape = draft.getShape(index: i)
            shape.draw(canvas)
            i += 1
        }
    }
}

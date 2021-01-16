//
//  ChangeFrameCommand.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 05.01.2021.
//

import Foundation

class ChangeFrameCommand {
    private let oldFrame: Rect
    private let newFrame: Rect
    private let shape: Shape
    
    init(oldFrame: Rect, newFrame: Rect, shape: Shape) {
        self.oldFrame = oldFrame
        self.newFrame = newFrame
        self.shape = shape
    }
    
}

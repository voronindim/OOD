//
//  ShapeGroupImpl.swift
//  slides
//
//  Created by Dmitrii Voronin on 24.10.2020.
//

import Foundation

class ShapeGroupImpl: ShapeGroup {
    var outlineStyle: OutlineStyle?
    
    var shapesCount: Int {
        shapes.count
    }
    
    var frame: RectD? {
        guard !shapes.isEmpty else {
            return nil
        }
        return createFrame(shapes[0].frame!)
    }
    
    var fillStyle: Style?
    var tryGroup: ShapeGroup?
    
    private var shapes: [Shape] = []
    
    init() {
        
        self.fillStyle = GroupFillStyle( {[weak self] (callback: StyleCallback) in
            for shape in self!.shapes {
                    callback(shape.fillStyle!)
                }
        })
        self.fillStyle = GroupOutlineStyle( {[weak self] (callback: OutlineStyleCallback) in
            for shape in self!.shapes {
                    callback(shape.outlineStyle!)
                }
        })
        
    }
    
    func append(shape: Shape) {
        shapes.append(shape)
    }
    
    func insertShape(shape: Shape, position: Int) throws {
        if position == Int.max || (shapesCount == 0 && position == 0) {
            shapes.append(shape)
        } else if position > shapesCount - 1 {
            throw Errors.outOfRange(outOfRange)
        } else {
            shapes.insert(shape, at: position)
        }
    }
    
    func getShapeAtIndex(_ index: Int) -> Shape {
        shapes[index]
    }
    
    func removeShapeAdIndex(_ index: Int) throws  {
        guard index < shapesCount else {
            throw Errors.outOfRange(outOfRange)
        }
        shapes.remove(at: index)
    }
    
    func setFrame(rect: RectD) {
        let currentGroupFrame = frame
        
        for shape in shapes {
            let shapeFrame = shape.frame
            
            let newShapeLeft = rect.left + (shapeFrame!.left - currentGroupFrame!.left) / currentGroupFrame!.width * rect.width
            let newShapeTop = rect.top + (shapeFrame!.top - currentGroupFrame!.top) / currentGroupFrame!.height * rect.height
            let newShapeWidth = shapeFrame!.width / currentGroupFrame!.width * rect.width
            let newShapeHeight = shapeFrame!.height / currentGroupFrame!.height * rect.height
            
            let newShapeFrame = RectD(left: newShapeLeft, top: newShapeTop, width: newShapeWidth, height: newShapeHeight)
            
            shape.setFrame(rect: newShapeFrame)
        }
    }
    
    func draw(canvas: Canvas) {
        for shape in shapes {
            shape.draw(canvas: canvas)
        }
    }

}

extension ShapeGroupImpl {
    private func createFrame(_ shapeFrame: RectD) -> RectD {
        var minX = shapeFrame.left
        var minY = shapeFrame.top
        var maxX = shapeFrame.left + shapeFrame.width
        var maxY = shapeFrame.top + shapeFrame.height
        
        for shape in shapes {
            let shapeFrame = shape.frame
            
            minX = min(minX, shapeFrame!.left)
            minY = min(minY, shapeFrame!.top)
            
            maxX = max(maxX, shapeFrame!.left + shapeFrame!.width)
            maxY = max(maxY, shapeFrame!.top + shapeFrame!.height)
        }
        return RectD(left: minX, top: minY, width: maxX - minX, height: maxY - minY)
    }
}

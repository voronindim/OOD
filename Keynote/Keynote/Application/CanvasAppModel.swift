//
//  CanvasAppModel.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 05.01.2021.
//

import Foundation
import RxSwift

enum CanvasAppModelError: Error {
    case outOfRange
    case shapeNotCretaed
}

class CanvasAppModel {
    
    var viewState: Observable<[ShapeAppModel]> {
        get {
            _viewState
        }
    }
    var shapesCount: Int {
        canvas.shapeCount
    }
    
    private let canvas: Canvas
    private let disposeBag = DisposeBag()
    private var shapes: [ShapeAppModel] = []
    private var _viewState = BehaviorSubject<[ShapeAppModel]>.init(value: [])
    
    init(canvas: Canvas) {
        self.canvas = canvas
        self.canvas.viewState.subscribe(
            onNext: { shapes in
                self.shapes = shapes.map({ shape in
                    ShapeAppModel.init(shape: shape)
                })
                self._viewState.onNext(self.shapes)
            }
        ).disposed(by: disposeBag)
    }
  
    func getShape(index: Int) throws -> ShapeAppModel {
        guard isIndexInRange(index) else {
            throw CanvasAppModelError.outOfRange
        }
        return shapes[index]
    }
    
    func appendShape(shape: ShapeAppModel) {
        let newLastShapeIndex = self.canvas.shapeCount
        insertShapeByIndex(shape: shape, index: newLastShapeIndex)
    }
    
    func insertShapeByIndex(shape: ShapeAppModel, index: Int) {
        canvas.insertShape(shape: .init(id: shape.id, frame: shape.getFrame(), shapeType: shape.type), index: index)
    }
    
    func deleteShapeByIndex(_ index: Int) throws {
        guard isIndexInRange(index) else {
            throw CanvasAppModelError.outOfRange
        }
        let _ = self.canvas.deleteShape(index: index)
    }
    
//    func getShape(index: Int) throws -> ShapeAppModel {
//        guard isIndexInRange(index) else {
//            throw CanvasAppModelError.outOfRange
//        }
//        return shapes[index]
//    }
//
//    func appendShape() throws {
//        let lastShapeIndex = self.canvas.shapeCount - 1
//        try insertShapeByIndex(index: lastShapeIndex)
//    }
//
//    func insertShapeByIndex(index: Int) throws {
//        guard isIndexInRange(index) else {
//            throw CanvasAppModelError.outOfRange
//        }
//        let shape = self.canvas.getShape(index: index)
//        shapes.insert(.init(shape: shape), at: index)
//    }
//
//    func deleteShapeByIndex(_ index: Int) throws {
//        guard isIndexInRange(index) else {
//            throw CanvasAppModelError.outOfRange
//        }
//        let _ = self.canvas.deleteShape(index: index)
//    }
    
    private func isIndexInRange(_ index: Int) -> Bool {
        return index < shapesCount && index >= 0 ? true : false
    }
    
}



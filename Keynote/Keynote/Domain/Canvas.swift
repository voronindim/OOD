//
//  Canvas.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 05.01.2021.
//

import Foundation
import RxSwift

class Canvas {
    var viewState: Observable<[Shape]> {
        get {
            _viewState
        }
    }
    
    var shapeCount: Int {
        return shapes.count
    }

    private var shapes: [Shape]
    private var _viewState = BehaviorSubject<[Shape]>(value: [])
    
    init(shapes: [Shape]) {
        self.shapes = shapes
        self._viewState = .init(value: shapes)
    }
    
    func getShape(index: Int) -> Shape {
        shapes[index]
    }
    
    func appendShape(shape: Shape) {
        shapes.append(shape)
        _viewState.onNext(shapes)
    }
    
    func insertShape(shape: Shape, index: Int) {
        shapes.insert(shape, at: index)
        _viewState.onNext(shapes)
    }

    func deleteShape(index: Int) -> Shape {
        let shape = shapes[index]
        shapes.remove(at: index)
        return shape
    }
    
}

//
//  Shape.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 05.01.2021.
//

import Foundation
import RxSwift

enum ShapeType {
    case rectangle
    case ellipse
    case triangle
}

class Shape {
    var viewStateFrame: Observable<Rect> {
        get {
            _viewStateFrame
        }
    }
    let id: String
    let type: ShapeType
    private var frame: Rect
    private var _viewStateFrame = PublishSubject<Rect>()
    private var oldFrame: Rect
    
    init(id: String, frame: Rect, shapeType: ShapeType) {
        self.id = id
        self.frame = frame
        self.oldFrame = self.frame
        self.type = shapeType
        self._viewStateFrame.onNext(self.frame)
    }
    
    func getFrame() -> Rect {
        self.frame
    }
    
    func doOnChangeFrame(newFrame: Rect) {
        guard oldFrame != newFrame else {
            return
        }
        self._viewStateFrame.onNext(newFrame)
        self.oldFrame = newFrame
    }
    
}

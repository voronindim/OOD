//
//  ShapeAppModel.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 05.01.2021.
//

import Foundation
import RxSwift

class ShapeAppModel {
    var viewStateFrame: Observable<Rect> {
        get {
            _viewStateFrame
        }
    }
    var changeFrame: ((_ frame: Rect) -> Void)?
    let id: String
    let type: ShapeType
    private var frame: Rect
    private var _viewStateFrame = PublishSubject<Rect>()
    private let shape: Shape
    private let disposeBag = DisposeBag()
    
    init(shape: Shape) {
        self.shape = shape
        self.id = shape.id
        self.type = shape.type
        self.frame = shape.getFrame()
        self.shape.viewStateFrame.subscribe(
            onNext: { newFrame in
                self._viewStateFrame.onNext(newFrame)
            }
        ).disposed(by: disposeBag)
    }
    
    func doOnChangeFrame(newFrame: Rect) {
        shape.doOnChangeFrame(newFrame: newFrame)
    }
    
    func getFrame() -> Rect {
        self.frame
    }
    
}

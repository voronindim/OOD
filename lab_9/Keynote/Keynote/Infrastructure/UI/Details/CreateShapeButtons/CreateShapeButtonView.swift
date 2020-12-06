//
//  CreateShapeButtonView.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 03.12.2020.
//

import Foundation
import UIKit

class CreateShapeButtonView: UIView {
    
    var createRectangleHandler: CreateRectangleHandler?
    var createTriangleHandler: CreateTriangleHandler?
    var createEllipseHandler: CreateEllipseHandler?
    
    @IBAction private func createRectangle(_ sender: Any) {
        createRectangleHandler?()
        print("Rectangle")
    }
    @IBAction private func createTriangle(_ sender: Any) {
        createTriangleHandler?()
        print("Triangle")
    }
    @IBAction private func createEllipse(_ sender: Any) {
        createEllipseHandler?()
        print("Ellipse")
    }
}

extension CreateShapeButtonView {
    static func instanceFromNib() -> Self {
        let nib = UINib(nibName: "CreateShapeButton", bundle: Bundle(for: self))
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }
}

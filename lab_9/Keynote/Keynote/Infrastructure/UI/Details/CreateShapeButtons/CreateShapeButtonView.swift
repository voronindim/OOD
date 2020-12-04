//
//  CreateShapeButtonView.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 03.12.2020.
//

import Foundation
import UIKit

class CreateShapeButtonView: UIView {
    
    var createRectangle: CreateRectangleHandler?
    var createTriangle: CreateTriangleHandler?
    var createEllipse: CreateEllipseHandler?
    
    @IBAction private func createRectangle(_ sender: Any) {
        createRectangle?()
        print("Rectangle")
    }
    @IBAction private func createTriangle(_ sender: Any) {
        createTriangle?()
        print("Triangle")
    }
    @IBAction private func createEllipse(_ sender: Any) {
        createEllipse?()
        print("Ellipse")
    }
}

extension CreateShapeButtonView {
    static func instanceFromNib() -> Self {
        let nib = UINib(nibName: "CreateShapeButton", bundle: Bundle(for: self))
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }
}

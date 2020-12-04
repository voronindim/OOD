//
//  CanvasView.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 04.12.2020.
//

import Foundation
import UIKit

class CanvasView: UIView {
}

extension CanvasView {
    static func instanceFromNib() -> Self {
        let nib = UINib(nibName: "Canvas", bundle: Bundle(for: self))
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }
}

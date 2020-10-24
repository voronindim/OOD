//
//  Shape.swift
//  slides
//
//  Created by Dmitrii Voronin on 23.10.2020.
//

import Foundation

protocol Shape: Drawable {
    var frame: RectD? { get }
    func setFrame(rect: RectD)
    
    var outlineStile: OutlineStyle { get }
    var fillStyle: Style { get }
    var tryGroup: ShapeGroup? { get }
}

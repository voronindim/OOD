//
//  ICanvas.swift
//  ShapeFactory
//
//  Created by Dmitrii Voronin on 27.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

struct Point {
    let x: Double
    let y: Double
}

protocol ICanvas {
    func setColor(color: Color)
    func drawLine(from: Point, to: Point)
    func drawElipse(center: Point, horRadius: Double, verRadius: Double)
}

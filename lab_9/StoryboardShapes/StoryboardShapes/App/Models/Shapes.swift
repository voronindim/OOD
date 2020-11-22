//
//  Shapes.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 10.11.2020.
//

import Foundation

enum Shapes {
    case Rectangle(RectangleInfo)
    case Traingle(TriangleInfo)
    case Ellipse(EllipseInfo)
}

struct RectangleInfo {
    let leftTop: PointD
    let width: Double
    let height: Double
}

struct TriangleInfo {
    let vertex1: PointD
    let vertex2: PointD
    let vertex3: PointD
}

struct EllipseInfo {
    let center: PointD
    let verticalRadius: Double
    let horizontalRadius: Double
}

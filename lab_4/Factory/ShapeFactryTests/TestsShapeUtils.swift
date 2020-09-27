//
//  TestsShapeUtils.swift
//  ShapeFactryTests
//
//  Created by Dmitrii Voronin on 27.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

func isPointEqual(_ a: Point, _ b: Point) -> Bool {
    guard abs(a.x) - abs(b.x) == 0 else {
        return false
    }
    guard abs(a.y) - abs(b.y) == 0 else {
        return false
    }
    return true
}

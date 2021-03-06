//
//  CommonTypes.swift
//  slides
//
//  Created by Dmitrii Voronin on 20.10.2020.
//

import Foundation

struct Rect<T> {
    let left: T
    let top: T
    let width: T
    let height: T
}

typealias RectD = Rect<Double>
typealias RGBAColor = UInt32

struct Point<T> {
    let x: T
    let y: T
}

typealias PointD = Point<Double>

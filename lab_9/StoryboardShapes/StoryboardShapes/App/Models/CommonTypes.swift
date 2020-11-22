//
//  CommonTypes.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 02.11.2020.
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

enum RGBAColors: RGBAColor {
    case yellow = 0xFFFF00
    case blue = 0x87CEEB
    case black = 0x000000
    case red = 0xFF0000
}

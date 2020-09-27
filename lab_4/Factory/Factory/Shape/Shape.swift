//
//  Shape.swift
//  Factory
//
//  Created by Dmitrii Voronin on 26.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Shape {
    func draw(_ canvas: ICanvas) {
        fatalError("Вызван метод у базового класса")
    }
    var color = Color.Black
}

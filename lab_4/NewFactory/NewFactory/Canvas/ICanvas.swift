//
//  ICanvas.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

protocol ICanvas {
    func setColor(color: Color)
    func drawLine(_ from: Point, _ to: Point)
    func drawElipse(center: Point, horRedius: Double, verRadius: Double)
}


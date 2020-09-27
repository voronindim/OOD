//
//  IShapeFactory.swift
//  ShapeFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

protocol IShapeFactory {
    func createShape(description: String) -> Shape
}

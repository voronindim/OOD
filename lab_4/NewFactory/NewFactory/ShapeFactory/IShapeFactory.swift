//
//  IShapeFactory.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 02.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

protocol IShapeFactory {
    func createShape(_ description: String) throws -> Shape
}

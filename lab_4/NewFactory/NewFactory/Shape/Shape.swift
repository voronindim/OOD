//
//  Shape.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 02.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Shape {
    var color: Color = .Black
    
    func draw(canvas: ICanvas) throws -> Void {
        fatalError("Вызван метод базового класса")
    }
    
}

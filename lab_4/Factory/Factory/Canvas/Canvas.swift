//
//  Canvas.swift
//  Factory
//
//  Created by Dmitrii Voronin on 26.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Canvas: ICanvas {
    
    var color: Color = Color.Black
    
    func setColor(color: Color) {
        self.color = color
    }
    
    func drawLine(from: Point, to: Point) {
        print("Рисуем Line (\(roundToTwo(from.x)), \(roundToTwo(from.y))) -> (\(roundToTwo(to.x)), \(round(to.y)))")
        print("\(color)\n")
        
    }
    
    func drawElipse(center: Point, horRadius: Double, verRadius: Double) {
        print("Рисуем Elepse с центом (\(roundToTwo(center.x)), \(roundToTwo(center.y))). Горизонтальный радиус \(horRadius), Вертикальный радиус\(verRadius)")
    }
}

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}

fileprivate func roundToTwo(_ number: Double) -> Double {
    number.roundToDecimal(2)
}

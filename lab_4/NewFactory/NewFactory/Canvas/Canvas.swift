//
//  Canvas.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Canvas: ICanvas {
    private var color: Color = .Black

    func setColor(color: Color) {
        self.color = color
    }
    
    func drawLine(_ from: Point, _ to: Point) {
        print("Рисуем Line (\(roundToTwo(from.x)), \(roundToTwo(from.y))) -> (\(roundToTwo(to.x)), \(round(to.y)))")
        print("\(color)\n")
    }
    
    func drawElipse(center: Point, horRedius: Double, verRadius: Double) {
        print("Рисуем Elepse с центом (\(roundToTwo(center.x)), \(roundToTwo(center.y))). Горизонтальный радиус \(horRedius), Вертикальный радиус \(verRadius)")
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

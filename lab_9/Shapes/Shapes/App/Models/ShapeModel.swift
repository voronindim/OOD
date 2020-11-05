//
//  ShapeModel.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 31.10.2020.
//

import Foundation

struct ArrayOfShapes {
    let arrayOfShapes: [ShapeInfo]
}

struct ShapeInfo: Equatable {
    static func == (lhs: ShapeInfo, rhs: ShapeInfo) -> Bool {
        lhs.name == rhs.name &&
        lhs.ellipse == rhs.ellipse &&
        lhs.rectangle == rhs.rectangle &&
        lhs.triangle == rhs.triangle
    }
    
    let name: ShapeName
//    let fillColor: Colors = .red
//    let borderColor: Colors = .black
    
    let ellipse: Ellipse?
    let triangle: Triangle?
    let rectangle: Rectangle?
    
    struct Point: Equatable {
        let x: Double
        let y: Double
    }
    
//    enum Colors: UInt32 {
//        case yellow = 0xFFFF00
//        case blue = 0x87CEEB
//        case black = 0x000000
//        case red = 0xFF0000
//    }
    
    enum ShapeName {
        case triangle
        case rectangle
        case ellipse
    }
    
    struct Ellipse: Equatable {
        static func == (lhs: ShapeInfo.Ellipse, rhs: ShapeInfo.Ellipse) -> Bool {
            lhs.center == rhs.center &&
            lhs.verticalRadius == rhs.verticalRadius &&
            lhs.horizontalRadius == rhs.horizontalRadius
        }
        
        let center: Point
        let verticalRadius: Double
        let horizontalRadius: Double
    }
    
    struct Triangle: Equatable {
        let vertex1: Point
        let vertex2: Point
        let vertex3: Point
    }
    
    struct Rectangle: Equatable {
        let leftTop: Point
        let width: Double
        let height: Double
    }

}


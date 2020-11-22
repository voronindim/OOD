//
//  ShapeModel.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 31.10.2020.
//

import Foundation

struct ArrayOfShapes: Codable {
    let arrayOfShapes: [ShapeInfo]
}

struct ShapeInfo: Equatable, Codable {
    static func == (lhs: ShapeInfo, rhs: ShapeInfo) -> Bool {
        lhs.name == rhs.name &&
        lhs.ellipse == rhs.ellipse &&
        lhs.rectangle == rhs.rectangle &&
        lhs.triangle == rhs.triangle
    }
    
    let name: ShapeName
    
    let ellipse: Ellipse?
    let triangle: Triangle?
    let rectangle: Rectangle?
    
    struct Point: Equatable, Codable {
        let x: Double
        let y: Double
    }
    
    enum ShapeName: String, Codable {
        case triangle
        case rectangle
        case ellipse
    }
    
    struct Ellipse: Equatable, Codable {
        static func == (lhs: ShapeInfo.Ellipse, rhs: ShapeInfo.Ellipse) -> Bool {
            lhs.center == rhs.center &&
            lhs.verticalRadius == rhs.verticalRadius &&
            lhs.horizontalRadius == rhs.horizontalRadius
        }
        
        let center: Point
        let verticalRadius: Double
        let horizontalRadius: Double
    }
    
    struct Triangle: Equatable, Codable {
        let vertex1: Point
        let vertex2: Point
        let vertex3: Point
    }
    
    struct Rectangle: Equatable, Codable {
        let leftTop: Point
        let width: Double
        let height: Double
    }

}


//
//  shape_drawing_lib.swift
//  Adapter
//
//  Created by Dmitrii Voronin on 14.10.2020.
//

import Foundation

protocol CanvasDrawable {
    func draw(canvas: Canvas) throws
}

class Triangle: CanvasDrawable {
    private let vertex1: Point
    private let vertex2: Point
    private let vertex3: Point
    
    init(vertex1: Point, vertex2: Point, vertex3: Point) {
        self.vertex1 = vertex1
        self.vertex2 = vertex2
        self.vertex3 = vertex3
    }
    
    func draw(canvas: Canvas) throws {
        canvas.moveTo(x: vertex1.x, y: vertex1.y)
        
        try canvas.lineTo(x: vertex2.x, y: vertex2.y)
        try canvas.lineTo(x: vertex3.x, y: vertex3.y)
        try canvas.lineTo(x: vertex1.x, y: vertex1.y)
    }
    
}

class Retctangle: CanvasDrawable {
    private let leftTop: Point
    private let width: Double
    private let height: Double
    
    init(leftTop: Point, width: Double, hieght: Double) {
        self.leftTop = leftTop
        self.width = width
        self.height = hieght
    }
    
    func draw(canvas: Canvas) throws {
        canvas.moveTo(x: leftTop.x, y: leftTop.y)
        
        try canvas.lineTo(x: leftTop.x + width, y: leftTop.y)
        try canvas.lineTo(x: leftTop.x + width, y: leftTop.y - height)
        try canvas.lineTo(x: leftTop.x, y: leftTop.y - height)
        try canvas.lineTo(x: leftTop.x, y: leftTop.y)
    }
    
}

class CanvasPainter {
    private let canvas: Canvas
    
    init(canvas: Canvas) {
        self.canvas = canvas
    }
    
    func draw(drawable: CanvasDrawable) throws {
        try drawable.draw(canvas: canvas)
    }
}

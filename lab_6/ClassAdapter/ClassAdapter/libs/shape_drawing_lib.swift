//
//  shape_drawing_lib.swift
//  Adapter
//
//  Created by Dmitrii Voronin on 14.10.2020.
//

import Foundation

protocol CanvasDrawable {
    func draw(canvas: Canvas)
}

class Triangle: CanvasDrawable {
    private let vertex1: Point
    private let vertex2: Point
    private let vertex3: Point
    private let color: UInt32
    
    init(vertex1: Point, vertex2: Point, vertex3: Point, color: UInt32 = 0x000000) {
        self.vertex1 = vertex1
        self.vertex2 = vertex2
        self.vertex3 = vertex3
        self.color = color
    }
    
    func draw(canvas: Canvas) {
        canvas.setColor(color)
        canvas.moveTo(x: vertex1.x, y: vertex1.y)
        
        canvas.lineTo(x: vertex2.x, y: vertex2.y)
        canvas.lineTo(x: vertex3.x, y: vertex3.y)
        canvas.lineTo(x: vertex1.x, y: vertex1.y)
    }
    
}

class Retctangle: CanvasDrawable {
    private let leftTop: Point
    private let width: Double
    private let height: Double
    private let color: UInt32
    
    init(leftTop: Point, width: Double, hieght: Double, color: UInt32 = 0x000000) {
        self.leftTop = leftTop
        self.width = width
        self.height = hieght
        self.color = color
    }
    
    func draw(canvas: Canvas) {
        canvas.setColor(color)
        canvas.moveTo(x: leftTop.x, y: leftTop.y)
        
        canvas.lineTo(x: leftTop.x + width, y: leftTop.y)
        canvas.lineTo(x: leftTop.x + width, y: leftTop.y - height)
        canvas.lineTo(x: leftTop.x, y: leftTop.y - height)
        canvas.lineTo(x: leftTop.x, y: leftTop.y)
    }
    
}

class CanvasPainter {
    private let canvas: Canvas
    
    init(canvas: Canvas) {
        self.canvas = canvas
    }
    
    func draw(drawable: CanvasDrawable) {
        drawable.draw(canvas: canvas)
    }
}

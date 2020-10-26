//
//  ViewController.swift
//  slides
//
//  Created by Dmitrii Voronin on 20.10.2020.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let slide = SlideImpl(height: 2000, width: 2500)
        let canvas = DrawCanvas(view: view)
        
        let worldGroup = createWorld()
        try! slide.insertShape(shape: worldGroup)
        
        let fence = createFence()
        try! slide.insertShape(shape: fence)
        
        let houseGroup = createHouse()
        try! slide.insertShape(shape: houseGroup)
        
        houseGroup.fillStyle?.setColor(color: Colors.gray.rawValue)
        houseGroup.outlineStyle?.setColor(color: Colors.black.rawValue)
        
        slide.draw(canvas: canvas)
    }
    
}

fileprivate func createHouse() -> ShapeGroup {
    let roof = Triangle(vertex1: PointD(x: 600, y: 600), vertex2: PointD(x: 700, y: 700), vertex3: PointD(x: 800, y: 600))
    roof.fillStyle?.setColor(color: Colors.yellow.rawValue)
    roof.outlineStyle?.setColor(color: Colors.red.rawValue)
    roof.outlineStyle?.setThickness(thickness: 3)
    
    let circle = Elipse(center: PointD(x: 700, y: 640), horizontalRadius: 25, verticalRadius: 25)
    circle.fillStyle?.setColor(color: Colors.black.rawValue)
    circle.outlineStyle?.setThickness(thickness: 3)
    
    let facade = Rectangle(leftTop: PointD(x: 600, y: 600), rightButtom: PointD(x: 800, y: 400))
    facade.fillStyle?.setColor(color: Colors.gray.rawValue)
    facade.outlineStyle?.setColor(color: Colors.red.rawValue)
    facade.outlineStyle?.setThickness(thickness: 3)
    
    let leftWindow = Rectangle(leftTop: PointD(x: 620, y: 550), rightButtom: PointD(x: 680, y: 500))
    leftWindow.fillStyle?.setColor(color: Colors.white.rawValue)
    leftWindow.outlineStyle?.setColor(color: Colors.white.rawValue)
    leftWindow.outlineStyle?.setThickness(thickness: 3)
    
    let door = Rectangle(leftTop: PointD(x: 700, y: 550), rightButtom: PointD(x: 780, y: 400))
    door.fillStyle?.setColor(color: Colors.black.rawValue)
    door.outlineStyle?.setColor(color: Colors.red.rawValue)
    door.outlineStyle?.setThickness(thickness: 5)
    
    let house = ShapeGroupImpl()
    house.append(shape: roof)
    house.append(shape: circle)
    house.append(shape: facade)
    house.append(shape: leftWindow)
    house.append(shape: door)
    
    
    return house
}

fileprivate func createWorld() -> ShapeGroup {
    let sky = Rectangle(leftTop: PointD(x: 0, y: 2500), rightButtom: PointD(x: 3000, y: 0))
    sky.fillStyle?.setColor(color: Colors.blueSky.rawValue)
    sky.outlineStyle?.setColor(color: Colors.blueSky.rawValue)
    
    let greenGrass = Rectangle(leftTop: PointD(x: 0, y: 400), rightButtom: PointD(x: 3000, y: 0))
    greenGrass.fillStyle?.setColor(color: Colors.green.rawValue)
    greenGrass.outlineStyle?.setColor(color: Colors.green.rawValue)
    
    let world = ShapeGroupImpl()
    world.append(shape: sky)
    world.append(shape: greenGrass)
    
    return world
}

fileprivate func createFence() -> ShapeGroup {
    let leftFence = Rectangle(leftTop: PointD(x: 0, y: 550), rightButtom: PointD(x: 600, y: 400))
    leftFence.fillStyle?.setColor(color: Colors.brown.rawValue)
    leftFence.outlineStyle?.setColor(color: Colors.brown.rawValue)
    
    let rightFence = Rectangle(leftTop: PointD(x: 800, y: 550), rightButtom: PointD(x: 3000, y: 400))
    rightFence.fillStyle?.setColor(color: Colors.brown.rawValue)
    rightFence.outlineStyle?.setColor(color: Colors.brown.rawValue)
    
    let firstTriangle = Triangle(vertex1: PointD(x: 600, y: 550), vertex2: PointD(x: 500, y: 550), vertex3: PointD(x: 550, y: 580))
    firstTriangle.fillStyle?.setColor(color: Colors.brown.rawValue)
    firstTriangle.outlineStyle?.setColor(color: Colors.black.rawValue)
    
    let secondTriangle = Triangle(vertex1: PointD(x: 800, y: 550), vertex2: PointD(x: 850, y: 580), vertex3: PointD(x: 900, y: 550))
    secondTriangle.fillStyle?.setColor(color: Colors.brown.rawValue)
    secondTriangle.outlineStyle?.setColor(color: Colors.black.rawValue)
    
    let fenceTriangle = ShapeGroupImpl()
    fenceTriangle.append(shape: firstTriangle)
    fenceTriangle.append(shape: secondTriangle)
    
    let fence = ShapeGroupImpl()
    fence.append(shape: leftFence)
    fence.append(shape: rightFence)
    fence.append(shape: fenceTriangle)
    
    return fence
}


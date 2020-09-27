//
//  main.swift
//  Factory
//
//  Created by Dmitrii Voronin on 26.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

let programInfo =
    "1) To create rectangle: rectangle <color> <Left Top Vertex> <Right Bottom Vertex>\n" +
    "2) To create triangle: triangle <color> <vertex1> <vertex2> <vertex3>\n" +
    "3) To create elipse: elipse <color> <center point> <horizonral radius> <vertical radius>\n" +
    "4) To create regular polygon: regularpolygon <color> <center point> <radius> <vertex count> \n\n"

print(programInfo)

let shapeFactory = ShapeFactory()

let designer = Designer(shapeFactory: shapeFactory)

let descriptions = ["rectangle blue 4 4 5 3",
                    "regularpolygon green 2 2 3 5",
                    "triangle red 2 2 3 3 4 4",
                    "elipse pink 2 2 4 6"]
//let descriptions = readFromFile()
let draft = designer.createDraft(descriptions)

let painter = Painter()

let canvas = Canvas()

painter.drawPicture(draft: draft, canvas: canvas)

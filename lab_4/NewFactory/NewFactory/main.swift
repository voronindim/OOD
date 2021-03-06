//
//  main.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
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


let draft = designer.createDraft(stream: ConsoleSream())
let painter = Painter()
let canvas = Canvas()
try painter.drawPicture(draft: draft, canvas: canvas)



//
//  main.swift
//  Adapter
//
//  Created by Dmitrii Voronin on 14.10.2020.
//

import Foundation

print("Should we use new API (y)?")
var stream = ConsoleStream()
var input = stream.getLine().lowercased()
while input != "exit" {
    if input.lowercased() == "y" {
        try paintPictureOnModernGraphicsRenderer(stream: stream)
    } else {
        try paintPicturOnCanvas()
    }
    input = stream.getLine()
}

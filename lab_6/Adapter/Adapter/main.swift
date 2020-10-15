//
//  main.swift
//  Adapter
//
//  Created by Dmitrii Voronin on 14.10.2020.
//

import Foundation

protocol Stream{
    func getLine() -> String
}

class ConsoleSream: Stream {
    func getLine() -> String {
        readLine() ?? ""
    }
}

print("Should we use new API (y)?")
var stream = ConsoleSream()
var input = stream.getLine().lowercased()
while input != "exit" {
    if input.lowercased() == "y" {
        try paintPictureOnModernGraphicsRenderer()
    } else {
        try paintPicturOnCanvas()
    }
    input = stream.getLine()
}

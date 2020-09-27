//
//  Color.swift
//  ShapeFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

enum Color {
    case Green
    case Red
    case Blue
    case Yellow
    case Pink
    case Black
}

func stringToColor(color: String) -> Color {
    switch color.lowercased() {
    case "green":
        return .Green
    case "red":
        return .Red
    case "blue":
        return .Blue
    case "yellow":
        return .Yellow
    case "pink":
        return .Pink
    default:
        return .Black
    }
}

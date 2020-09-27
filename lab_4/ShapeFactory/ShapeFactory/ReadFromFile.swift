//
//  ReadFromFile.swift
//  ShapeFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

func readFromFile() -> [String] {
    guard let path = Bundle.main.path(forResource: "input", ofType: "txt") else {
        fatalError("Файл не найден!")
    }
    guard let text = try? String(contentsOfFile: path) else {
        fatalError("Файл пуст!")
        
    }
    return text.components(separatedBy: "\n")
}

//
//  Image.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

protocol Image {
    func resize(width: Int, hieght: Int)
    func getPath() -> String
}

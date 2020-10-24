//
//  OutlineStyle.swift
//  slides
//
//  Created by Dmitrii Voronin on 20.10.2020.
//

import Foundation

protocol OutlineStyle: Style {
    var thickness: Double? { get }
    func setThickness(thickness: Double)
}

typealias OutlineStyleCallback = (OutlineStyle) -> Void


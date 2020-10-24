//
//  Errors.swift
//  slides
//
//  Created by Dmitrii Voronin on 23.10.2020.
//

import Foundation

let outOfRange = "request index is out of range"

enum Errors: Error {
    case outOfRange(String)
}

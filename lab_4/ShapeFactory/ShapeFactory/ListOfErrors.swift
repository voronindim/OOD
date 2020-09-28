//
//  ListOfErrors.swift
//  ShapeFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

enum ListOfErrors: Error {
    case argumentError(String)
    case fileNotFound
    case fileIsEmpty
    case unknownError
}

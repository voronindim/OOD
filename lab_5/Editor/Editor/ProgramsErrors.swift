//
//  ProgramsErrors.swift
//  Editor
//
//  Created by Dmitrii Voronin on 11.10.2020.
//

import Foundation

enum ProgramsErrors: Error {
    case outOfRange
    case logicError
    case itemIsNotImage
    case invalidArgument(String)
}

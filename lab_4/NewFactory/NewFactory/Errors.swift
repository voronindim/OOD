//
//  Errors.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 02.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

enum Errors: Error {
    case invalidArgument
    case parseError
    case unknownShape
    case logicError
    case unknownError(Error)
}

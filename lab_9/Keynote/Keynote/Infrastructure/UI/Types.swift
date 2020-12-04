//
//  Types.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 03.12.2020.
//

import Foundation

typealias CommandHandler = () -> Void

typealias CreateTriangleHandler = () -> Void
typealias CreateRectangleHandler = () -> Void
typealias CreateEllipseHandler = () -> Void
typealias SaveAsHandler = (String) -> Void
typealias OpenFileHandler = (String) -> Void


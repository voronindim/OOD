//
//  CommandHandler.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 19.11.2020.
//

import Foundation

typealias CommandHandler = () -> Void
typealias GeneratorShapesCommand = () -> Void
typealias CommandHandlerToSaveAs = (String) -> Void

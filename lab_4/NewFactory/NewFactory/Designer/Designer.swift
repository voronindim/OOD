//
//  Designer.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 02.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class Designer: IDesigner {
    private let pictureDraft = PictureDraft()
    private let shapeFactory: IShapeFactory
    
    init(shapeFactory: IShapeFactory) {
        self.shapeFactory = shapeFactory
    }
    
    func createDraft() -> PictureDraft {
        var command = readLine()?.lowercased()
        
        while command != "exit" {
            do {
                let shape = try shapeFactory.createShape(command ?? "")
                pictureDraft.addShape(shape)
            } catch {
                print(recoverError(error: error))
            }
            command = readLine()?.lowercased()
        }
        
        return pictureDraft
    }
    
}

fileprivate func mappingError(error: Errors) -> Errors {
    switch error {
    case .invalidArgument:
        return .invalidArgument
    case .logicError:
        return .logicError
    case .parseError:
        return .parseError
    case .unknownShape:
        return .unknownShape
    default:
        return error
    }
}

fileprivate func recoverError(error: Error) -> Errors {
    if error is Errors {
        return mappingError(error: error as! Errors)
    } else {
        return Errors.unknownError(error)
    }
}

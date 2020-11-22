//
//  Command.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 11.11.2020.
//

import Foundation

protocol Command {
    var canUndo: Bool { get }
    var canRedo: Bool { get }
    
    func undo()
    func redo()
    func remove()
    func open()
}

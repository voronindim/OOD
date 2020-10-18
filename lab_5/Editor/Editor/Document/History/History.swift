//
//  History.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

class History {
    private var commands: [Command] = []
    private var nextCommandindex = 0
    
    func canUndo() -> Bool {
        nextCommandindex != 0
    }
    
    func canRedo() -> Bool {
        nextCommandindex != commands.count
    }
    
    func undo() throws {
        if canUndo() {
            try commands[nextCommandindex - 1].unexecute() // MB Error
            nextCommandindex -= 1
        }
    }
    
    func redo() throws {
        if canRedo() {
            try commands[nextCommandindex].execute() // MB Error
            nextCommandindex += 1
        }
    }
    
    func addAndExecuteCommand(command: Command) throws {
        if nextCommandindex < commands.count {
            try command.execute()
            nextCommandindex += 1
            commands.append(command)
        } else {
            try command.execute()
            commands.append(command)
            nextCommandindex += 1
        }
    }
    
}

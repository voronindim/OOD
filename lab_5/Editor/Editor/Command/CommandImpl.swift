//
//  AbsractCommandImpl.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

class CommandImpl: Command {
    private var executed = false
    
    func execute() throws {
        if !executed {
            try doExecute()
            executed = true
        }
    }
    
    func unexecute() throws {
        if executed {
            try doUnexeute()
            executed = false
        }
    }
    
    func doExecute() throws {
        fatalError()
    }
    
    func doUnexeute() throws {
        fatalError()
    }
    
}


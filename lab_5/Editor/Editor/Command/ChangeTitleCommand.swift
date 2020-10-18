//
//  ChangeTitleCommand.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

class ChangeTitleCommand: CommandImpl {
    private var target: String
    private var newValue: String
    
    init(target: String, newValue: String) {
        self.target = target
        self.newValue = newValue
    }
    
    override func doExecute() {
        swapVelues()
    }
    
    override func doUnexeute() {
        swapVelues()
    }

    func swapVelues() {
        swap(&target, &newValue)
    }
    
}

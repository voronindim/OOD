//
//  GumballMachineControll.swift
//  Task_2-3-4_MultuGumballMachine
//
//  Created by Dmitrii Voronin on 15.11.2020.
//

import Foundation

class GumballMachineControl {
    private let menu: Menu
    private let machine: GumballMachineImpl
    
    init() {
        self.menu = Menu(stream: ConsoleStream())
        self.machine = GumballMachineImpl(numBalls: 0)
        
        menu.addItem(shortcut: "help", description: "Help", command: showInstructor(str:))
        menu.addItem(shortcut: "exit", description: "Exit", command: exit(str:))
        menu.addItem(shortcut: "insertQuarter", description: "inserting quarter", command: insertQuarter(str:))
        menu.addItem(shortcut: "ejectQuarter", description: "eject quarters", command: ejectQuarter(str:))
        menu.addItem(shortcut: "turnCrank", description: "turn crunk", command: turnCrank(str:))
        menu.addItem(shortcut: "toString", description: "print machine info", command: toString(str:))
        menu.addItem(shortcut: "refill", description: "refill machine", command: refill(str:))
        
    }
    func run() {
        menu.run()
    }
    
    private func insertQuarter(str: String) {
        machine.insertQuarter()
    }
    
    private func ejectQuarter(str: String) {
        machine.ejectQuarter()
    }
    
    private func turnCrank(str: String) {
        machine.TurnCrank()
    }
    
    private func toString(str: String) {
        print("\(machine.toString())")
    }
    
    private func refill(str: String) {
        machine.refiil(count: Int(str) ?? 0)
    }
    
    private func showInstructor(str: String ) {
        menu.showInstructor()
    }
    
    private func exit(str: String) {
        menu.exit()
    }
}

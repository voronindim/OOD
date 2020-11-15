//
//  Menu.swift
//  Task_2-3-4_MultuGumballMachine
//
//  Created by Dmitrii Voronin on 15.11.2020.
//

import Foundation

protocol Stream {
    func getLine() -> String
    func writeLine(string: String)
}

class ConsoleStream: Stream {
    func getLine() -> String {
        readLine() ?? ""
    }
    
    func writeLine(string: String) {
        print(string)
    }
}

class Menu {
    typealias Command = (String) -> Void
    
    
    private var items: [Item] = []
    private var m_exit = false
    private let stream: Stream
    
    init(stream: Stream) {
        self.stream = stream
    }
    
    private class Item {
        let shortcut: String
        let description: String
        let command: Command
        
        init(shortcut: String, description: String, command: @escaping Command) {
            self.shortcut = shortcut
            self.description = description
            self.command = command
        }
    }
    
    func addItem(shortcut: String, description: String, command: @escaping Command) {
        items.append(Item(shortcut: shortcut, description: description, command: command))
    }
    
    func run() {
        showInstructor()
        
        stream.writeLine(string: ">")
        while executeCommand(command: stream.getLine()) {
            stream.writeLine(string: ">")
        }
    }
    
    func showInstructor( ) {
        stream.writeLine(string: "Commands list:")
        
        for item in items {
            stream.writeLine(string: " \(item.shortcut): \(item.description)")
        }
    }
    
    func exit() {
        m_exit = true
    }
    
    
    func executeCommand(command: String) -> Bool {
        var array = command.split(separator: " ")
        array.removeAll(where: {$0 == " "})
        m_exit = false
        
        for item in items {
            if array.isEmpty {
                break
            }
            if item.shortcut == array[0] {
                var str = ""
                array.remove(at: 0)
                for ar in array {
                    str += ar
                }
                item.command(str)
                return !m_exit
            }

        }
        stream.writeLine(string: "Unknown command")
        
        return !m_exit
    }
    
}


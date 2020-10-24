//
//  Stream.swift
//  slides
//
//  Created by Dmitrii Voronin on 23.10.2020.
//

import Foundation

protocol Stream {
    func getline() -> String
    func writeLine(string: String)
}

class ConsoleStream: Stream {
    func getline() -> String {
        readLine() ?? "" 
    }
    
    func writeLine(string: String) {
        print(string)
    }
}

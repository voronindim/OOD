//
//  Stream.swift
//  Adapter
//
//  Created by Dmitrii Voronin on 15.10.2020.
//

import Foundation

protocol Stream{
    func getLine() -> String
    func write(string: String)
}

class ConsoleStream: Stream {
    func getLine() -> String {
        readLine() ?? ""
    }
    
    func write(string: String) {
        print(string)
    }
}

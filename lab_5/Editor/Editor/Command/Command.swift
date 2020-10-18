//
//  AbstractCommand.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

protocol Command {
    func execute() throws
    func unexecute() throws 
}

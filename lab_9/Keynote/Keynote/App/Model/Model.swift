//
//  Model.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 04.12.2020.
//

import Foundation

protocol Model {
    func saveAs(filename: String)
    func save()
    func openFile(filename: String)
    func redo()
    func undo()
}

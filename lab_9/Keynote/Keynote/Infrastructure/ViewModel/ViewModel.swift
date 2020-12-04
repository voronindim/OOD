//
//  ViewModel.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 04.12.2020.
//

import Foundation

protocol ViewModel {
    func saveAs(filename: String)
    
    func save()
    
    func openFile(filename: String)
    
    func redo()
    
    func undo()
    
    func createTriangle()
    
    func createEllipse()
    
    func createRectangle()
}

//
//  ViewModel.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 06.11.2020.
//

import Foundation

protocol ViewModel {
    var shapes: [Shapes] { get set }
    var filename: String? { set get }
    
    func removeShape(_ shape: MyShape)
    
    func undo()
    func redo()
    func save() 
    func saveAs(filename: String)
    func open(filename: String)
    
    func createTrinagle()
    func createRectangle()
    func createEllipse()
}

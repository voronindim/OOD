//
//  ViewModel.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 06.11.2020.
//

import Foundation

protocol ViewModel {
    var shapes: [MyShape] { get set }
    
    func removeShape(_ shape: MyShape)
    
    func undo()
    func redo()
    func save()
    func open()
    
    func createTrinagle()
    func createRectangle()
    func createEllipse()
}

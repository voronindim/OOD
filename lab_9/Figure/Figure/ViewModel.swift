//
//  ViewModel.swift
//  Figure
//
//  Created by Dmitrii Voronin on 28.10.2020.
//

import Foundation
import SwiftUI


protocol ViewModel {
    func save()
    func remove()
    func undo()
    func redo()
    
    func createRectangle() -> Rectangle
    func createTriangle()
    func createElipse() -> Ellipse
}

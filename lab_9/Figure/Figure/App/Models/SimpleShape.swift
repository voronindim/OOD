//
//  RealShape.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 02.11.2020.
//

import Foundation

protocol SimpleShape {
    var fillColor: RGBAColor { get }
    var lineColor: RGBAColor { get }
    var frame: RectD { get }
    
    func setFrame(rect: RectD)
    func draw()
    
}

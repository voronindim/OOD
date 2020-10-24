//
//  OutlineStyleImpl.swift
//  slides
//
//  Created by Dmitrii Voronin on 20.10.2020.
//

import Foundation

class OutlineStyleImpl: OutlineStyle {
    var color: RGBAColor?
    var isEnabled: Bool?
    var thickness: Double?
    
    init() {
        self.color = Colors.black.rawValue
        self.thickness = 1.0
        self.isEnabled = true
    }
        
    init(color: RGBAColor, isEnabled: Bool, thickness: Double) {
        self.color = color
        self.thickness = thickness
        self.isEnabled = isEnabled
    }
    
    func setThickness(thickness: Double) {
        self.thickness = thickness
    }
    
    func setColor(color: RGBAColor) {
        self.color = color
    }
    
    func setEnabled(enabled: Bool) {
        self.isEnabled = enabled
    }
    
}

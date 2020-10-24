//
//  FillStyle.swift
//  slides
//
//  Created by Dmitrii Voronin on 20.10.2020.
//

import Foundation

final class FillStyle: Style {
    var color: RGBAColor?
    var isEnabled: Bool?
    
    init() {
        self.color = Colors.white.rawValue
        self.isEnabled = false
    }
    
    init(color: RGBAColor, isEnabled: Bool) {
        self.color = color
        self.isEnabled = isEnabled
    }
    
    func setColor(color: RGBAColor) {
        self.color = color
    }
    
    func setEnabled(enabled: Bool) {
        self.isEnabled = enabled
    }
    
}

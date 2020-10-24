//
//  GroupFillStyle.swift
//  slides
//
//  Created by Dmitrii Voronin on 20.10.2020.
//

import Foundation

typealias FillStyleEnumerator = (StyleCallback) -> Void

class GroupFillStyle: Style {
    var color: RGBAColor? {
        var color: RGBAColor? = nil
        var isInit = false
        
        func callback(style: Style) {
            if !isInit {
                color = style.color
                isInit = true
            } else if color != style.color {
                color = nil
            }
        }
        
        enumerator(callback)
        
        return color
    }
    
    var isEnabled: Bool? {
        var isEnabled: Bool? = nil
        var isInit = false
        
        func callback(style: Style) {
            if !isInit {
                isEnabled = style.isEnabled
                isInit = true
            } else if isEnabled != style.isEnabled {
                isEnabled = nil
            }
        }
        
        enumerator(callback)
        
        return isEnabled
    }
    
    init(_ enumerator: @escaping FillStyleEnumerator) {
        self.enumerator = enumerator
    }
    
    private let enumerator: FillStyleEnumerator
        
    func setColor(color: RGBAColor) {
        enumerator( {(style: Style) -> Void in
            style.setColor(color: color)
        })
    }
    
    func setEnabled(enabled: Bool) {
        enumerator( {(style: Style) -> Void in
            style.setEnabled(enabled: enabled)
        })
    }
    
}



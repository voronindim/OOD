//
//  GroupOutlineStyle.swift
//  slides
//
//  Created by Dmitrii Voronin on 23.10.2020.
//

import Foundation

typealias OutlineStyleEnumerator = (OutlineStyleCallback) -> Void

class GroupOutlineStyle: OutlineStyle {
    var thickness: Double? {
        var thickness: Double? = nil
        var isInit = false
        
        func callback(style: OutlineStyle) {
            if !isInit {
                thickness = style.thickness
                isInit = true
            } else if thickness != style.thickness {
                thickness = nil
            }
        }
        
        enumerator(callback)
        
        return thickness
    }
    
    var color: RGBAColor? {
        var color: RGBAColor? = nil
        var isInit = false
        
        func callback(style: OutlineStyle) {
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
        
        func callback(style: OutlineStyle) {
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
    
    private let enumerator: OutlineStyleEnumerator
    
    init(_ enumerator: @escaping OutlineStyleEnumerator) {
        self.enumerator = enumerator
    }
    
    func setThickness(thickness: Double) {
        enumerator( {(style: OutlineStyle) -> Void in
            style.setThickness(thickness: thickness)
        })
    }
        
    func setColor(color: RGBAColor) {
        enumerator( {(style: OutlineStyle) -> Void in
            style.setColor(color: color)
        })
    }
    
    func setEnabled(enabled: Bool) {
        enumerator( {(style: OutlineStyle) -> Void in
            style.setEnabled(enabled: enabled)
        })
    }
    
    
}

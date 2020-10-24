//
//  Style.swift
//  slides
//
//  Created by Dmitrii Voronin on 20.10.2020.
//

import Foundation

protocol Style {
    var color: RGBAColor? { get }
    var isEnabled: Bool? { get }
    
    func setColor(color: RGBAColor)
    func setEnabled(enabled: Bool)
}

typealias StyleCallback = (Style) -> Void

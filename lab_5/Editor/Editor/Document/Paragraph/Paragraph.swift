//
//  Paragraph.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

protocol Paragraph {
    func setText(text: String)
    func getText() -> String
}

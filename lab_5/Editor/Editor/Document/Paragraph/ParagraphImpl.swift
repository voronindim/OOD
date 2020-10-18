//
//  ParagraphImpl.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

class ParagraphImpl: Paragraph {
    private var text: String
    
    init(text: String) {
        self.text = text
    }
    
    func setText(text: String) {
        self.text = text
    }
    
    func getText() -> String {
        text
    }
    
}

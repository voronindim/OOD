//
//  ReplaceParagraphTextCommand.swift
//  Editor
//
//  Created by Dmitrii Voronin on 14.10.2020.
//

import Foundation

class ReplaceParagraphTextCommand: CommandImpl {
    private let paragraph: Paragraph
    private let text: String
    private let newText: String
    
    init(paragraph: Paragraph, text: String) {
        self.paragraph = paragraph
        self.newText = text
        self.text = paragraph.getText()
    }
}

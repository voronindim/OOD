//
//  InsertParagraphTextCommand.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

class InsertParagraphCommand: CommandImpl {
    private let text: String
    private var items: [ConstDocumentItem]
    private var position: Int
    
    init(text: String, items: [ConstDocumentItem], position: Int) throws  {
        self.items = items
        self.position = position
        self.text = text
        
        guard position < items.count else {
            throw ProgramsErrors.logicError
        }
    }
    
    override func doExecute() {
        let paragraph = ParagraphImpl(text: text)
        let documentItem = ConstDocumentItem(item: ConstDocumentItem.Item.paragraph(paragraph))
        
        items.insert(documentItem, at: position)
    }
    
    override func doUnexeute() {
        items.remove(at: position)
    }
}

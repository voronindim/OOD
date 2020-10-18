//
//  DocumentImpl.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

class DocumentImpl: Document {
    
    let imagesDir = "Images"
    
    private let title: String = ""
    private let histiry = History()
    private var items: [ConstDocumentItem] = []
    
    func insertParagraph(text: String, position: Int) throws -> Paragraph {
        try histiry.addAndExecuteCommand(command: InsertParagraphCommand(text: text, items: items, position: position))
        return items[position].getParagraph()!
    }
    
    func insertImage(path: String, width: Int, hieght: Int, position: Int) throws -> Image {
        try histiry.addAndExecuteCommand(command: InsertImageComand(path: path, width: width, hieght: hieght, dirPath: imagesDir, position: position, items: items))
        return items[position].getImage()!
    }
    
    func getItem(index: Int) -> ConstDocumentItem {
        items[index]
    }
    
    func getTitle() -> String {
        title
    }
    
    func setTitle() throws {
        try histiry.addAndExecuteCommand(command: ChangeTitleCommand(target: title, newValue: "12312312312")) // GetHtmlString(title)
    }
    
    func deleteItem(index: Int) throws {
        guard index < items.count else {
            throw ProgramsErrors.outOfRange
        }
        try histiry.addAndExecuteCommand(command: try DeleteItemCommand(items: items, index: index))
    }
    
    func replaceParagraphText(index: Int, text: String) throws {
        guard index < items.count else {
            throw ProgramsErrors.invalidArgument("requested paragraph position is out of range")
        }
        let paragraph = getItem(index: index).getParagraph()
        
        guard paragraph != nil else {
            throw ProgramsErrors.invalidArgument("requested item is not a paragraph")
        }
        try histiry.addAndExecuteCommand(command: ReplaceParagraphTextCommand(paragraph: paragraph!, text: text))
        
    }
    
    func resizeImage(index: Int, width: Int, hieght: Int) throws {
        guard index < items.count else {
            throw ProgramsErrors.outOfRange
        }
        
        let image = getItem(index: index).getImage()
        
        guard image != nil else {
            throw ProgramsErrors.itemIsNotImage
        }
        
        
        try histiry.addAndExecuteCommand(command: ResizeImageCommand(image: image!, width: width, hieght: hieght))
        
    }
    
    func canUndo() -> Bool {
        histiry.canUndo()
    }
    
    func undo() throws {
        try histiry.undo()
    }
    
    func canRedo() throws -> Bool {
        histiry.canRedo()
    }
    
    func redo() throws {
        try histiry.redo()
    }
    
    func save(path: String) {
        
    }
    
}

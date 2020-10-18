//
//  Document.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

protocol Document {
    func insertParagraph(text: String, position: Int) throws -> Paragraph
    func insertImage(path: String, width: Int, hieght: Int, position: Int) throws -> Image
    func getItem(index: Int) -> ConstDocumentItem
    func deleteItem(index: Int) throws
    func getTitle() -> String
    func setTitle()throws
    func replaceParagraphText(index: Int, text: String) throws 
    func resizeImage(index: Int, width: Int, hieght: Int) throws 
    func canUndo() -> Bool
    func undo() throws 
    func canRedo() throws  -> Bool
    func redo() throws
    func save(path: String)
}

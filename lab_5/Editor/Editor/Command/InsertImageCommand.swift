//
//  InsertImageCommand.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

class InsertImageComand: CommandImpl {
    private let path: String
//    private let width: Int
//    private let hieght: Int
//    private let dirPath: String
    private let position: Int
    private let items: [ConstDocumentItem]
//    private let image: Image
    
    
    
    
    
    init(path: String, width: Int, hieght: Int, dirPath: String, position: Int, items: [ConstDocumentItem]) {
        self.path = path
//        self.width = width
//        self.hieght = hieght
//        self.dirPath = dirPath
        self.position = position
        self.items = items
        
        
    }
    
    override func doExecute() throws {
        guard position < items.count else {
            throw ProgramsErrors.logicError
        }
        
//        let image = ConstDocumentItem(i
    }
    
    
    private func getRandomName(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}

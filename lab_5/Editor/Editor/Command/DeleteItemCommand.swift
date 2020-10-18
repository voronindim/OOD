
//  DeleteItemCommand.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

class DeleteItemCommand: CommandImpl {
    private let imagePath: String?
    private var items: [ConstDocumentItem]
    private let index: Int

    init(items: [ConstDocumentItem], index: Int) throws {
        self.index = index
        self.items = items

        guard index < items.count else {
            throw ProgramsErrors.logicError
        }

        let image = items[index].getImage()
        
        if image != nil {
            imagePath = image?.getPath()
        } else {
            imagePath = nil
        }
    }


    override func doExecute() {
        items.remove(at: index)
    }

    override func doUnexeute() {
        let item = items[index]
        items.append(item)
    }

}

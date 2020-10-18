//
//  ConstDocumentItem.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//
//

import Foundation

class ConstDocumentItem {
    enum Item {
        case image(Image)
        case paragraph(Paragraph)
    }
    
    private let item: Item

    init(item: Item) {
        self.item = item
    }
    
    func getImage() -> Image? {
        switch item {
        case .image(let image):
            return image
        default:
            return nil
        }
    }
    
    func getParagraph() -> Paragraph? {
        switch item {
        case .paragraph(let paragraph):
            return paragraph
        default:
            return nil
        }
    }
    
}

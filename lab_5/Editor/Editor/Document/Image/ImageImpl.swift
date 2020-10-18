//
//  ImageImpl.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

class ImageImpl: Image {
    private let jpg = ".jpg"
    private let png = ".png"
    private let gif = ".gif"
    
    private var width: Int
    private var hieght: Int
    private let path: String
    
    init(width: Int, hieght: Int, path: String) {
        self.width = width
        self.hieght = hieght
        self.path = path
    }
    
    func getPath() -> String {
        path
    }
    
    func resize(width: Int, hieght: Int) {
        self.width = width
        self.hieght = hieght
    }
    
    private func isExtensionValid(path: String) -> Bool {
        let ext = path
        return ext == jpg || ext == png || ext == gif
    }
    
}

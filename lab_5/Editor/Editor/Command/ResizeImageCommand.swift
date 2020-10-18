//
//  ResizeImageCommand.swift
//  Editor
//
//  Created by Dmitrii Voronin on 10.10.2020.
//

import Foundation

class ResizeImageCommand: CommandImpl {
    private let newWidth: Int
    private let newHieght: Int
    private let image: Image
    
    init(image: Image, width: Int, hieght: Int) {
        self.newWidth = width
        self.newHieght = hieght
        self.image = image
    }
    
    override func doExecute() {
        
    }
    
    override func doUnexeute() {
        
    }
}

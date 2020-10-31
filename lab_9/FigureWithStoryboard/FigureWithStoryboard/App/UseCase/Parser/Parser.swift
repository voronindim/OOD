//
//  Parser.swift
//  FigureWithStoryboard
//
//  Created by Dmitrii Voronin on 31.10.2020.
//

import Foundation
import PromiseKit

protocol Parser {
    func getListOfShapes(_ data: Data) -> Promise<[Shape]>
}

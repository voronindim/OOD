//
//  IDesigner.swift
//  ShapeFactory
//
//  Created by Dmitrii Voronin on 28.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

protocol IDesigner {
    func createDraft(_ description: [String]) throws -> PictureDraft
}

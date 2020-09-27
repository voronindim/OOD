//
//  IDesigner.swift
//  Factory
//
//  Created by Dmitrii Voronin on 26.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

protocol IDesigner {
    func createDraft(_ description: [String]) -> PictureDraft
}
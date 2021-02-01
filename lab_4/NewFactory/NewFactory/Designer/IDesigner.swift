//
//  IDesigner.swift
//  NewFactory
//
//  Created by Dmitrii Voronin on 02.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

protocol IDesigner {
    func createDraft(stream: Stream) -> PictureDraft 
}

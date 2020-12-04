//
//  FileNamesCell.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 04.12.2020.
//

import Foundation
import UIKit

class FileNamesCell: UITableViewCell {
    @IBOutlet private var fileName: UILabel!
    
    func setFileName(filename: String) {
        self.fileName.text = filename
    }
    
}

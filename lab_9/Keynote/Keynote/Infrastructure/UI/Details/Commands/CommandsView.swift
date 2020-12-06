//
//  CommandsView.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 03.12.2020.
//

import Foundation
import UIKit

class CommandsView: UIView {
    
    var redo: CommandHandler?
    var undo: CommandHandler?
    var save: CommandHandler?
    var saveAs: SaveAsHandler?
    var open: CommandHandler?
    
    @IBAction private func saveAs(_ sender: Any) {
        askFileNameForSaveAs()
    }
    
    @IBAction private func save(_ sender: Any) {
        save?()
    }
    
    @IBAction private func open(_ sender: Any) {
        open?()
    }
    
    @IBAction private func undo(_ sender: Any) {
        undo?()
    }
    
    @IBAction private func redo(_ sender: Any) {
        redo?()
    }
    
}

extension CommandsView {
    static func instanceFromNib() -> Self {
        let nib = UINib(nibName: "Commands", bundle: Bundle(for: self))
        return nib.instantiate(withOwner: nil, options: nil).first as! Self
    }
}

extension CommandsView {
    private func askFileNameForSaveAs() {
        let alert = UIAlertController(title: "Введите название файла для сохранения", message: nil, preferredStyle: .alert)
        alert.addTextField {filename in
            filename.placeholder = "File name"
        }
        
        let saveAction = UIAlertAction(title: "Сохранить", style: .default, handler: { _ in
            guard let filename = alert.textFields![0].text, !filename.isEmpty else {
                self.askFileNameForSaveAs()
                return
            }
            self.saveAs?(filename)
        })
        
        let cancelAction = UIAlertAction(title: "Закрыть", style: .destructive)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true)
    }
}





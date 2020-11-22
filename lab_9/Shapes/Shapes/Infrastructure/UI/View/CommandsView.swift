//
//  CommandsView.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 19.11.2020.
//

import Foundation
import SwiftUI

struct CommandsView: View {

    var saveAs: CommandHandlerToSaveAs?
    var save: CommandHandler?
    var open: CommandHandler?
    var remove: CommandHandler?
    var undo: CommandHandler?
    var redo: CommandHandler?

    
//    private var filename: String?
    
    var body: some View {
        HStack {
            Button(action: {
                confirmSaveAs()
            }) {
                Text("SaveAs")
            }
            .padding(7)
            
            Button(action: {
                save?()
            }) {
                Text("Save")
            }
            .padding(7)
            
            Button(action: {
                open?()
            }) {
                Text("Open")
            }
            .padding(7)
            
            Button(action: {
                remove?()
            }) {
                Text("Remove")
            }
            .padding(7)
            
            Button(action: {
                undo?()
            }) {
                Text("Undo")
            }
            .padding(7)
            
            Button(action: {
                redo?()
            }) {
                Text("Redo")
            }
            .padding(7)
        }
    }
    
    private func confirmSave() {
        save?()
    }
    
    private func confirmSaveAs() {
        let alert = UIAlertController(title: "Введите название файла для сохранения", message: nil, preferredStyle: .alert)
        alert.addTextField { filename in
            filename.placeholder = "File Name"
        }
        
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: {_ in
            guard let filename = alert.textFields![0].text, filename != "" else {
                confirmSaveAs()
                return
            }
            saveAs?(filename)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: {})
    }
    
}

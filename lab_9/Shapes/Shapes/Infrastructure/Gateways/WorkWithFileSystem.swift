//
//  WorkWithFileSystem.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 22.11.2020.
//

import Foundation

class WorkWithFileSystem {
    private let fileManager = FileManager()
    private let tempDirectory = NSTemporaryDirectory()
    
    
    func createFileInDirectory(filename: String, data: Data) {
        let path = (tempDirectory as NSString).appendingPathComponent("\(filename).json")
        print(path)
        
        do {
            try data.write(to: URL(fileURLWithPath: path), options: .atomic)
        } catch let error as NSError {
            print("con not create file! Error is - \(error)")
        }
    }
    
    func readFile(filename: String) -> NSString? {
            
        guard let directoryWithFiles = checkDirectory(filename: filename) else {
            return nil
        }
            
        let path = (tempDirectory as NSString).appendingPathComponent(directoryWithFiles)
            
            do {
                let str = try NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue)
                print(str)
                return str
            } catch let error as NSError {
                print("there is an file reading error: \(error)")
                return nil
            }
        }
        
    func deleteFile(filename: String) {
        guard let directoryWithFiles = checkDirectory(filename: filename) else {
            return
        }
        do {
            let path = (tempDirectory as NSString).appendingPathComponent(directoryWithFiles)
            try fileManager.removeItem(atPath: path)
            print("file deleted")
        } catch let error as NSError {
            print("error occured while deleting file: \(error.localizedDescription)")
        }
    }
    
    private func checkDirectory(filename: String) -> String? {
        do {
            let filesInDirectory = try fileManager.contentsOfDirectory(atPath: tempDirectory)
            let files = filesInDirectory
            guard files.count > 0, files.first == filename else {
                return nil
            }
            return files.first
        } catch let error as NSError {
            print(error)
            return nil
        }
        
    }
    
}

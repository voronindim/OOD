//
//  WorkWithFileSystem.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 06.12.2020.
//

import Foundation

class WorkFileSystem {
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
    
    func getDataFromFile(filename: String) -> Data? {
        let fileURL = (tempDirectory as NSString).appendingPathComponent("\(filename).json")
        return try? Data(contentsOf: URL(fileURLWithPath: fileURL))
    }
    
    func getFIleNamesInCurrentDirectory() -> [String]? {
        guard let directoryContents = try? FileManager.default.contentsOfDirectory(at: URL(string: tempDirectory)!, includingPropertiesForKeys: nil) else { return nil }
        return directoryContents.filter({ $0.pathExtension == "json" }).map({$0.deletingPathExtension()}).map({$0.lastPathComponent}) as [String]
    }
}


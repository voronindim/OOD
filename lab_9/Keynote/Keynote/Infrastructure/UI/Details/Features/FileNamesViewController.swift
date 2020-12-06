//
//  FileNamesViewController.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 04.12.2020.
//

import UIKit

class FileNamesViewController: UIViewController {

    @IBOutlet private var mainTitle: UILabel!
    @IBOutlet private var fileNameslist: UITableView!
    
    var openFile: OpenFileHandler?
    
    private var fileNames: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setFileNames(fileNames: [String]) {
        self.fileNames = fileNames
    }
}

extension FileNamesViewController: UITableViewDataSource, UITableViewDelegate {
    
    private struct Storyboard {
        static let row = "ListRow"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fileNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = tableView.dequeueReusableCell(withIdentifier: Storyboard.row, for: indexPath) as! FileNamesCell
        row.setFileName(filename: fileNames[indexPath.row])
        return row
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(fileNames[indexPath.row])")
        openFile?(fileNames[indexPath.row])
        self.dismiss(animated: true)
    }
}


extension FileNamesViewController {
    static func initFromStoryboard() -> FileNamesViewController? {
        let storyboard = UIStoryboard(name: "FileNames", bundle: Bundle(for: self))
        return storyboard.instantiateInitialViewController() as? FileNamesViewController
    }
}


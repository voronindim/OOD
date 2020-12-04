//
//  FileNamesViewController.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 04.12.2020.
//

import UIKit

class FileNamesViewController: UIViewController {

    @IBOutlet var mainTitle: UILabel!
    @IBOutlet private var fileNameslist: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FileNamesViewController: UITableViewDataSource {
    
    private struct Storyboard {
        static let row = "ListRow"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = tableView.dequeueReusableCell(withIdentifier: Storyboard.row, for: indexPath) as! FileNamesCell
        row.setFileName(filename: "13213123")
        return row
    }
    
    
}

extension FileNamesViewController {
    static func initFromStoryboard() -> FileNamesViewController? {
        let storyboard = UIStoryboard(name: "FileNames", bundle: Bundle(for: self))
        return storyboard.instantiateInitialViewController() as? FileNamesViewController
    }
}


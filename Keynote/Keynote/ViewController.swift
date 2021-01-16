//
//  ViewController.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 05.01.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var canvas: UIView!
    
    var viewModel: CanvasAppModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func createRectangle(_ sender: Any) {
        
    }
    
    @IBAction func createEllipse(_ sender: Any) {
        
    }
    
    @IBAction func createTriangle(_ sender: Any) {
        viewModel.appendShape(shape: <#T##ShapeAppModel#>)
    }
    
}


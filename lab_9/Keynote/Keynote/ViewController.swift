//
//  ViewController.swift
//  Keynote
//
//  Created by Dmitrii Voronin on 03.12.2020.
//

import UIKit

class ViewController: UIViewController {
    let kDefaultHeight: CGFloat = 42
    private let viewModel = ViewModelImpl()
    
    let commandsView: CommandsView = {
        let view = CommandsView.instanceFromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let canvasView: CanvasView = {
        let view = CanvasView.instanceFromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let createShapeView: CreateShapeButtonView = {
        let view = CreateShapeButtonView.instanceFromNib()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(commandsView)
        self.view.addSubview(canvasView)
        self.view.addSubview(createShapeView)
        
        setupCommandsView()
        setupCreateShapeView()
        setupCanvasView()
        
        setCommandsAction()
        setCreateShapeCommands()
    }
    
    private func setupCommandsView() {
        commandsView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        commandsView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        commandsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        commandsView.heightAnchor.constraint(equalToConstant: kDefaultHeight).isActive = true
    }
    
    private func setupCanvasView() {
        canvasView.topAnchor.constraint(equalTo: commandsView.bottomAnchor).isActive = true
        canvasView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        canvasView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        canvasView.bottomAnchor.constraint(equalTo: createShapeView.topAnchor).isActive = true
    }
    
    private func setupCreateShapeView() {
        createShapeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        createShapeView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        createShapeView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        createShapeView.heightAnchor.constraint(equalToConstant: kDefaultHeight).isActive = true
    }
    
    private func setCreateShapeCommands() {
        createShapeView.createEllipseHandler = {[weak viewModel] in
            viewModel?.createEllipse()
        }
        
        createShapeView.createTriangleHandler = {[weak viewModel] in
            viewModel?.createTriangle()
        }
        
        createShapeView.createRectangleHandler = {[weak viewModel] in
            viewModel?.createRectangle()
        }
    }
    
    private func setCommandsAction() {
        commandsView.redo = {[weak viewModel] in
            viewModel?.redo()
        }
        
        commandsView.undo = {[weak viewModel] in
            viewModel?.undo()
        }
        
        commandsView.save = {[weak viewModel] in
            viewModel?.save()
            
        }
        
        commandsView.saveAs = {[weak viewModel] filename in
            viewModel?.saveAs(filename: filename)
        }
        
        commandsView.open = {[weak self] in
            self!.openFileNamesList()
        }
    }
    
    private func openFileNamesList() {
        guard let vc = FileNamesViewController.initFromStoryboard() else {
            return
        }
        vc.setFileNames(fileNames: viewModel.getFileNames())
        vc.openFile = {[weak viewModel] filename in
            viewModel?.openFile(filename: filename)
        }
        present(vc, animated: true)
    }
    
}


//
//  ContentView.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 05.11.2020.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = ShapeViewModel()
    
    var body: some View {
        VStack {
            createCommandsView()
            Canvas(viewModel: viewModel)
            createGeneratorShapesView()
        }
    }
    
    private func createCommandsView() -> CommandsView {
        var commandsView = CommandsView()
        
        commandsView.saveAs = {[weak viewModel] (filename) in
            viewModel?.saveAs(filename: filename)
        }
        
        commandsView.save = {[weak viewModel] in
            viewModel?.save()
        }
        
        commandsView.open = {[weak viewModel] in
            viewModel?.open(filename: "!")
        }
        
        commandsView.redo = {[weak viewModel] in
            viewModel?.redo()
        }
        
        commandsView.undo = {[weak viewModel] in
            viewModel?.undo()
        }
        
        return commandsView
    }

    private func createGeneratorShapesView() -> GeneratorShapesView {
        var generatorShapesView = GeneratorShapesView()
        
        generatorShapesView.createEllipse = {[weak viewModel] in
            viewModel?.createEllipse()
        }
        
        generatorShapesView.createTraingle = {[weak viewModel] in
            viewModel?.createTrinagle()
        }
        
        generatorShapesView.createRectangle = {[weak viewModel] in
            viewModel?.createRectangle()
        }
        
        return generatorShapesView
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro Max")
            .preferredColorScheme(.light)
    }
}
















//            GeometryReader { gp in
//            ZStack {
//                let scaleGesture = MagnificationGesture()
//                    .onChanged { value in
//                        self.rectangleScale = value
//                    }
//                let rotationGesture = RotationGesture()
//                    .onChanged { value in
//                        self.rectangleRotation = value
//                    }
//
//                let maginificationGesture = scaleGesture.simultaneously(with: rotationGesture)
//                Rectangle()
//                    .gesture(maginificationGesture)
//                    .rotationEffect(rectangleRotation)
//                    .scaleEffect(rectangleScale)
//                    .animation(.default)
//                    .frame(width: 100, height: 100, alignment: .center)
//                    .position(self.dragAmount == nil ?
//                            CGPoint(x: gp.size.width / 2, y: gp.size.height / 2) :
//                            self.dragAmount!)
//                    .highPriorityGesture(
//                        DragGesture()
//                            .onChanged { self.dragAmount = $0.location})
//                    Rectangle()
//                        .rotation(/*@START_MENU_TOKEN@*/.zero/*@END_MENU_TOKEN@*/)
//                        .scale(/*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
//                        .frame(width: 100, height: 100, alignment: .center)
//                        .animation(.default)
//                        .scaleEffect(rectangleScale)
//                        .gesture(scaleGesture)
//                        .rotationEffect(rectangleRotation)
//                        .gesture(rotationGesture)
//                        .position(self.dragAmount == nil ?
//                                CGPoint(x: gp.size.width / 2, y: gp.size.height / 2) :
//                                self.dragAmount!)
//                        .highPriorityGesture(
//                            DragGesture()
//                                .onChanged { self.dragAmount = $0.location})
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
            
//            }
//            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

//            ZStack {
//                let scaleGesture = MagnificationGesture()
//                    .onChanged { value in
//                        self.rectangleScale = value
//                    }
//                let rotationGesture = RotationGesture()
//                    .onChanged { value in
//                        self.rectangleRotation = value
//                    }
//                let maginificationGesture = scaleGesture.simultaneously(with: rotationGesture)
//
//                Rectangle()
//                    .gesture(maginificationGesture)
//                    .rotationEffect(rectangleRotation)
//                    .scaleEffect(rectangleScale)
//                    .animation(.default)
//                    .frame(width: 100, height: 100, alignment: .center)
//                RectangleShape()
//                    .gesture(maginificationGesture)
//                    .rotationEffect(rectangleRotation)
//                    .scaleEffect(rectangleScale)
//                    .animation(.default)
//                    .frame(width: 100, height: 100, alignment: .center)
////                    .position(self.dragAmount == nil ?
////                            CGPoint(x: gp.size.width / 2, y: gp.size.height / 2) :
////                            self.dragAmount!)
//                    .highPriorityGesture(
//                        DragGesture()
//                            .onChanged { self.dragAmount = $0.location})
            
//            .frame(maxWidth: .infinity, maxHeight: .infinity)

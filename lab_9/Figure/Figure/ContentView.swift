//
//  ContentView.swift
//  Figure
//
//  Created by Dmitrii Voronin on 28.10.2020.
//

import SwiftUI

struct ContentView: View {
//    private let viewModel = ViewModelImpl()
    @State private var dragAmount: CGPoint? = nil
    @State private var rectangleScale: CGFloat = CGFloat(1)
    @State private var rectangleRotation: Angle = .zero
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(spacing: 15.0) {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Save")
                }
                .padding(10)
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Open")
                }
                .padding(10)
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Delete")
                }
                .padding(10)
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Undo")
                }
                .padding(10)
                
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Redo")
                }
                .padding(10)
            }
            .frame(maxWidth: .infinity)
            
            ZStack {
                let scaleGesture = MagnificationGesture()
                    .onChanged { value in
                        self.rectangleScale = value
                    }
                let rotationGesture = RotationGesture()
                    .onChanged { value in
                        self.rectangleRotation = value
                    }
                let maginificationGesture = scaleGesture.simultaneously(with: rotationGesture)

                Rectangle()
                    .gesture(maginificationGesture)
                    .rotationEffect(rectangleRotation)
                    .scaleEffect(rectangleScale)
                    .animation(.default)
                    .frame(width: 100, height: 100, alignment: .center)
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
            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .frame(maxWidth: 300, maxHeight: 300)
            .background(Color.green)
            
            HStack(spacing: 20.0) {
                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Rectangle")
                        .foregroundColor(.white)
                }
                .padding(20)
                .background(Color.green)
                .cornerRadius(5)


                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Triangle")
                        .foregroundColor(.white)
                }
                .padding(20)
                .background(Color.green)
                .cornerRadius(5)

                Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                    Text("Elipse")
                        .foregroundColor(.white)
                }
                .padding(20)
                .background(Color.green)
                .cornerRadius(5)
            }
            .frame(maxWidth: .infinity)

        }
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

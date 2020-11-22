//
//  CreateShapesView.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 19.11.2020.
//

import SwiftUI

struct GeneratorShapesView: View {
    var createRectangle: GeneratorShapesCommand?
    var createTraingle: GeneratorShapesCommand?
    var createEllipse: GeneratorShapesCommand?
    
    var body: some View {
        HStack {
            Button(action: {
                createEllipse?()
            }) {
                Text("Ellipse")
                    .foregroundColor(.white)
            }
            .modifier(CustomViewModifire(color: .green))
            
            Button(action: {
                createTraingle?()
            }) {
                Text("Triangle")
                    .foregroundColor(.white)
            }
            .modifier(CustomViewModifire(color: .green))
            
            Button(action: {
                createRectangle?()
            }) {
                Text("Rectangle")
                    .foregroundColor(.white)
            }
            .modifier(CustomViewModifire(color: .green))
        }
    }
}

fileprivate struct CustomViewModifire: ViewModifier {
    @State var color = Color.blue
    func body(content: Content) -> some View {
        content
            .padding(15)
            .background(color)
            .cornerRadius(10)
    }
}

//
//  Canvas.swift
//  Shapes
//
//  Created by Dmitrii Voronin on 19.11.2020.
//

import SwiftUI

struct Canvas: View {
    
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                    RectangleShapeView()
                        .frame(width: 100, height: 200, alignment: .center)
//                ForEach(viewModel.shapes, id: \.self, content: {
                    
//                })
                // TODO: Перебирать значения viewModel.shapes
                // TODO: Вызывать метод для создания CanvasItem нцжной с фигурой внутри
            }
            .background(Color.red)
            
        }
        .background(Color.gray)
    }
}

struct CanvasItem: View {
    var body: some View {
        ZStack {
            
        }
    }
}

struct CanvasView: View {
    var body: some View {
        Rectangle()
    }
}
